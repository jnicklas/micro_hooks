# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{micro_hooks}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jonas Nicklas"]
  s.date = %q{2009-02-13}
  s.description = %q{A tiny, tiny hooks framework}
  s.email = %q{jonas.nicklas@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["LICENSE", "README", "Rakefile", "lib/micro_hooks.rb", "spec/micro_hooks_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.example.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{micro_hooks}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A tiny, tiny hooks framework}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
