require 'rdiscount'
require 'liquid'

module Webpage
  def self.generate(project, version)
    screenshots = RDiscount.new(File.read("src/#{project}.screenshots")).to_html
    readme = File.expand_path("src/#{project}.README.markdown", File.dirname(__FILE__))
    raise "No README at #{readme}" unless File.size?(readme)
    md = File.read(readme).sub(/^\[screenshots\]/, screenshots)
    content = RDiscount.new(md).to_html
    template = File.read("template.html")
    out = Liquid::Template.parse(template).render 'content' => content, 'timestamp' => Time.now.to_i, 'project' => project, 'version' => version
  end
end

if __FILE__ == $0
  project, version = *ARGV
  out = Webpage.generate(project, version)
  outfile = "out/#{project}.html"
  File.open(outfile, 'w') {|f| f.puts out}
  puts "Created #{outfile}"
end
