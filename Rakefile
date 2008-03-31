# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'hurl'

task :default => 'test'

PROJ.name = 'hurl'
PROJ.authors = 'Justin Marney'
PROJ.email = 'gotascii@gmail.com'
PROJ.url = 'http://hurl.rubyforge.org'
PROJ.description = "rb-appscript wrapper built to assist in scripting terminal events."
PROJ.rubyforge_name = 'hurl'
PROJ.version = Hurl::VERSION
PROJ.tests = FileList['test/**/*_test.rb']
PROJ.exclude << '\.git'
PROJ.exclude << '^_.*'
depend_on 'rb-appscript'

# EOF
