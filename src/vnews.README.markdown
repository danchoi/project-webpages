# Vnews

Vnews is a news feed reader build on top of Vim and MySQL.

[screenshots]

## Prerequisites

* a recent version of Vim (Vnews is developed against Vim 7.2)
* a recent version of Ruby: Ruby 1.9.2 is recommended
* MySQL

Vnews assumes a Unix environment. 

To install Ruby 1.9.2, I recommend using the [RVM Version Manager][rvm].

[rvm]:http://rvm.beginrescueend.com

## Installation

    gem install vnews

Test your installation by typing `vnews -h`. You should see Vnews's help.

If you run into any PATH errors, try the following: Install the RVM
Version Manager, then install Ruby 1.9.2 through RVM, and then run `gem
install soywiki`.  This should solve any installation issues.

If you ever want to uninstall Vnews from your system, execute this command:

    gem uninstall vnews

... and all traces of Vnews will removed.

New and improved versions of Vnews will be released over time. To install the
latest version, just type `gem install soywiki` again.





