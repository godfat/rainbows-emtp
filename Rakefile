
begin
  require "#{dir = File.dirname(__FILE__)}/task/gemgem"
rescue LoadError
  sh 'git submodule update --init'
  exec Gem.ruby, '-S', $PROGRAM_NAME, *ARGV
end

Gemgem.init(dir) do |s|
  s.name    = 'rainbows-emtp'
  s.version = '0.5.2'
  %w[rainbows eventmachine].each{ |g| s.add_runtime_dependency(g) }
end
