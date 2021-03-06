Gem::Specification.new do |s|
  s.name            = 'logstash-output-slack'
  s.version         = '0.1.5'
  s.licenses        = ['MIT','Apache-2.0']
  s.summary         = "Write events to Slack"
  s.description     = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Seung-gi Lim"]
  s.email           = 'sglim@wisefour.com'
  s.homepage        = "https://github.com/w4-sglim/logstash-output-slack"
  s.require_paths   = ["lib"]

  # Files
  s.files = Dir['lib/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  # Gem dependencies

  s.platform = "java"
  s.add_runtime_dependency "logstash-core", '= 5.0.0'
  s.add_runtime_dependency "logstash-codec-plain", '~> 3.0', '>= 3.0.2'
  s.add_runtime_dependency "rest-client", "< 2.0", ">= 1.8.0"
  s.add_runtime_dependency "public_suffix", "< 2.0"
  s.add_development_dependency "logstash-devutils", '~> 1.1'
  s.add_development_dependency 'logstash-core-plugin-api', '~> 2.1', '>= 2.1.17'
  s.add_development_dependency "logstash-filter-json", '~> 3.0', '>= 3.0.2'
  s.add_development_dependency "logstash-input-generator", '~> 3.0', '>= 3.0.2'
  # s.add_development_dependency "webmock", "= 1.21.0"
end
