= hurl

http://hurl.rubyforge.org

== DESCRIPTION:

Hurl is an Applescript wrapper built to assist in scripting terminal events.  By defining some actions in a config file (hurls.rb) you can open terminal tabs & launch applications with one command (hurl).  ITerm and Terminal.app are supported and adding new apps is fairly straight forward.

== FEATURES/PROBLEMS:

When hurl is called from the command line with a directory path it will search for a hurls.rb file in the root and the lib directory.  Actions in this file will be executed in the order they are defined.  

iTerm is the default, but you can specify other applications by placing this in your hurls file:

using Terminal

In order to execute a command in the tab that hurl was called from:

this_tab do |t|
  t.exec "ls"
end

Command line executables can be called directly:

this_tab do |t|
  t.cd "~/"
  t.ls
end

The project_dir method returns the path passed into hurl:

this_tab do |t|
  t.cd project_dir
  t.exec "script/server run"
end

You can create a new tab using create_tab:

create_tab do |t|
  t.cd project_dir
  t.autotest
end

== SYNOPSIS:

# Here is an example hurl.rb placed in ~/your_project/lib
# run hurl ~/your_project to watch awesome happen.

# Uncomment to use Terminal instead of iTerm
# using Terminal

# This will launch Textmate from the project directory.
this_tab do |t|
  t.cd project_dir
  t.mate "." 
end

# Then open a new tab, cd to the proj dir, and launch autotest.
create_tab do |t|
  t.cd project_dir
  t.exec "autotest --rails"
end

# Then open another new tab, cd to the proj dir, and start the server.
create_tab do |t|
  t.cd project_dir
  t.exec "script/server run"
end

== REQUIREMENTS:

appscript

== INSTALL:

sudo gem install hurl

== LICENSE:

Copyright (c) 2008 Justin Marney

This work is licensed under the Creative Commons Attribution 3.0 United States License. To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/us/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.