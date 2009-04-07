# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twitter_cache}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dermot Brennan"]
  s.date = %q{2009-04-07}
  s.description = %q{FIX (describe your package)}
  s.email = ["dbrennan@lucidity.ie"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/twitter_cache.rb", "tasks/twitter.rake"]
  s.has_rdoc = true
  s.homepage = %q{FIX (url)}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twitter_cache}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{FIX (describe your package)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.1.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.1.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.1.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
