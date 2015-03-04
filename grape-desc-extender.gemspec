Gem::Specification.new do |s|
  s.name = "grape-desc-extender"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kohei MATSUSHITA"]
  s.date = "2015-03-04"
  s.description = "Grape Description Extender"
  s.email = "ma2shita+git@ma2shita.jp"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "lib/grape/desc-extender.rb"
  ]
  s.homepage = "http://github.com/ma2shita/grape-desc-extender"
  s.require_paths = ["lib"]
  s.summary = "Extend description block in the Grape API"
end
