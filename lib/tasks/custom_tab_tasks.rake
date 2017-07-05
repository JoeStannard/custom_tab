require 'rake/testtask'

# Tasks
namespace :custom_tab do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test CustomTab'
  Rake::TestTask.new(:custom_tab) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
    t.warning = false
  end
end

namespace :custom_tab do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_custom_tab) do |task|
        task.patterns = ["#{CustomTab::Engine.root}/app/**/*.rb",
                         "#{CustomTab::Engine.root}/lib/**/*.rb",
                         "#{CustomTab::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_custom_tab'].invoke
  end
end

Rake::Task[:test].enhance ['test:custom_tab']

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance ['test:custom_tab', 'custom_tab:rubocop']
end
