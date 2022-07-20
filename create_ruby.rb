# Va créer un dossier RUBY

def check_if_input
  abort("mkdir missing input") if ARGV empty?
end

def get_folder_name
  return folder_name = ARGV.first
end

def create_directory(folder_name)
  Dir.mkdir(folder_name)
end

def create__sub_directories(folder_name)
  Dir.mkdir("#{folder_name}/lib")
  Dir.mkdir("#{folder_name}/spec")
end

def create_gemfile
  file = File.open("Gemfile", "w")
  file.puts("source 'https://rubygems.org'")
  file.puts("ruby '2.7.4'")
  file.puts("gem 'rspec'")
  file.puts("gem 'pry'")
  file.puts("gem 'rubocop'")
  file.puts("gem 'dotenv'")
  file.close
end

def create_app
  file = File.open("app.rb", "w")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts("")
  file.puts("$:.unshift File.expand_path('./../lib', __FILE__)")
  file.close
end

def create_env
  file = File.open(".env", "w")
  file.close
end

def create_readme
  file = File.open("README.md", "w")
  file.close
end

def init_git_rspec(folder_name)
  Dir.chdir("#{folder_name}")
  system("rspec --init")
  system("git init")
end

def perform
  folder_name = get_folder_name
  create_directory(folder_name)
  create__sub_directories(folder_name)
  init_git_rspec(folder_name)
  create_gemfile
  create_env
  create_readme
  create_app
end

perform