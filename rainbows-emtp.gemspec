# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rainbows-emtp"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2013-08-24"
  s.description = "EventMachineThreadPool model for Rainbows!"
  s.email = ["godfat (XD) godfat.org"]
  s.files = [
  ".gitignore",
  ".gitmodules",
  "CHANGES.md",
  "LICENSE",
  "README.md",
  "Rakefile",
  "lib/rainbows-emtp.rb",
  "lib/rainbows/event_machine_thread_pool.rb",
  "lib/rainbows/event_machine_thread_pool/client.rb",
  "rainbows-emtp.gemspec",
  "task/.gitignore",
  "task/gemgem.rb"]
  s.homepage = "https://github.com/godfat/rainbows-emtp"
  s.licenses = ["Apache License 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "EventMachineThreadPool model for Rainbows!"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rainbows>, [">= 0"])
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
    else
      s.add_dependency(%q<rainbows>, [">= 0"])
      s.add_dependency(%q<eventmachine>, [">= 0"])
    end
  else
    s.add_dependency(%q<rainbows>, [">= 0"])
    s.add_dependency(%q<eventmachine>, [">= 0"])
  end
end
