# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ember-magic-table/version"

Gem::Specification.new do |s|
  s.name        = "ember-magic-table"
  s.version     = Ember::Magic::Table::VERSION
  s.authors     = ["Chris Nelson", "Wesley Workman"]
  s.email       = ["chris@gaslightsoftware.com"]
  s.homepage    = ""
  s.summary     = %q{An ember component that produces an editable table given an Ember Data Model}
  s.description = %q{Uses ember-table. Makes all the properties editable. Is awesome(ish)}

  s.rubyforge_project = "ember-magic-table"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
