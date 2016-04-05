task :default => ["yard"]

desc "Generate_yard_documentation"
task :yard do
  require 'yard'
  require_relative '../../lib/constants.rb'

  YARD::Rake::YardocTask.new do |t|
    # Files to include in yard documentation. Ruby files before the -, Other files after the dash
    t.files   = ["#{ROOT_DIR}/lib/**/*.rb",
                 "#{ROOT_DIR}/tests/**/*.rb",
                 '-',
                 "#{ROOT_DIR}/config/scenario.xml",
                 "#{ROOT_DIR}/xml/bases.xml",
                 "#{ROOT_DIR}/xml/networks.xml",
                 "#{ROOT_DIR}/xml/services.xml"
                ]   # optional

    t.options = [
        "--title=SecGen #{VERSION_NUMBER} Documentation",
        "--output-dir #{DOCUMENTATION_PATH}",
        "--readme=#{ROOT_DIR}/README.md"
    ] # optional
    t.stats_options = ['--list-undoc']         # optional
  end
end

task :yard_clean do
  require_relative '../../lib/constants.rb'

  # NEED TO FIND A BETTER WAY TO CLEAN FILES AS VULNERABILITIES IN 'rm_rf'

  # Remove the documentation directory and all files in it
  rm_rf(DOCUMENTATION_PATH)
end