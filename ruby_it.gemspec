require 'rake/gempackagetask'

NAME = "ruby_it"

Dir.chdir( './lib/')
puts Dir.getwd

require "ruby_it"

Dir.chdir( './../')
puts Dir.getwd

spec = Gem::Specification.new do |s|
  s.name         = NAME
  s.version      = RubyIt::VERSION
  s.platform     = Gem::Platform::RUBY
  s.summary      = 'Executable and Object class to evaluate erb templates'
  s.homepage     = 'http://amaras-tech.co.uk/software/RubyIt'
  s.authors      = "Morgan Prior"
  s.email        = NAME + "_gem@amaras-tech.co.uk"
  s.description  = <<-eos
    Comand Line Interface (CLI) and Object class can be used to evaluate erb template files
    file.rtxt will be turnealuated and written as file.txt
  eos
   s.files        =  ["bin/#{NAME}"]
   s.files        += Dir.glob("LICENSE.rtf")
   s.files        += Dir.glob("examples/*")
   s.files        += Dir.glob("lib/**/*")
   s.files        += Dir.glob("spec/*")
   s.bindir       = 'bin'

   s.executables  = [NAME]
   s.has_rdoc     = false

   s.post_install_message = "To use '#{NAME}' as a executable application the gems folder must be on your path"


  end
  Rake::GemPackageTask.new(spec).define
