require 'rdiscount'
require 'liquid'

module Webpage
  def self.generate(project, version)

    screenshots = if File.exist? "src/#{project}.screenshots" 
                    RDiscount.new(File.read("src/#{project}.screenshots")).to_html 
                  else
                    '' 
                  end
    readme = File.expand_path("src/#{project}.README.markdown", File.dirname(__FILE__))
    raise "No README at #{readme}" unless File.size?(readme)
    # don't really need to do this? Github can display images
    md = File.read(readme).sub(/^\[screenshots\]/, screenshots)

    coverage = if File.exist? "src/#{project}.coverage.markdown" 
                 "<h4>coverage</h4>" + RDiscount.new(File.read("src/#{project}.coverage.markdown")).to_html 
               else
                 '' 
               end
    content = RDiscount.new(md).to_html
    template = File.read("template.html")
    title = md[/^#\s+(.*)$/, 1] || project
    out = Liquid::Template.parse(template).render 'content' => content, 'timestamp' => Time.now.to_i, 'title' => title, 'project' => project, 'version' => version, 'coverage' => coverage, 'gem' => (md[/gem install (\S+)/,1] || project)

  end
end

if __FILE__ == $0
  project, version = *ARGV
  out = Webpage.generate(project, version)
  outfile = "out/#{project}.html"
  File.open(outfile, 'w') {|f| f.puts out}
  puts "Created #{outfile}"
end
