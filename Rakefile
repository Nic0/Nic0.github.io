require 'rubygems'
require 'rake'
require 'fileutils'

if RUBY_VERSION =~ /1.9/
    Encoding.default_external = Encoding::UTF_8
    Encoding.default_internal = Encoding::UTF_8
end

desc "Draft a new post"
task :new do
  puts "What should we call this post for now?"
  name = STDIN.gets.chomp
  FileUtils.touch("drafts/#{name}.md")

  open("drafts/#{name}.md", 'a') do |f|
    f.puts "---"
    f.puts "layout: post"
    f.puts "title: \"DRAFT: #{name}\""
    f.puts "---"
  end
end

desc "Startup Jekyll"
task :start do
  sh "jekyll --server --auto"
end

task :default => :start

desc "Build site"
task :build do
  system "jekyll build --trace"
end

namespace :juicer do
  desc 'Merges stylesheets'
    task :css => :"juicer:js" do
      sh 'juicer merge --force _site/css/master.css'
    end
  desc 'Merges JavaScripts'
    task :js do
      sh  'juicer merge javascript/application.js javascript/jquery.boastful.js javascript/jquery.min.js javascript/plax.js  -i --force javascript/master.js'
    end
end
