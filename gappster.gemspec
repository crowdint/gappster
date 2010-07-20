# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gappster}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Padilla"]
  s.date = %q{2010-07-19}
  s.description = %q{Google Apps authentication}
  s.email = %q{david@crowdint.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "Manifest", "gappster.gemspec"]
  s.homepage = %q{http://github.com/crowdint/gappster}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gappster", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gappster}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Google Apps authentication}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
