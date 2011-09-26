require 'erb'
require 'json'
require './boot/mochiscript'

SRC_DIR = %|./src|
BOOT   = %W| class |
PARSER = %W| tokens parsers |

task :test => :compile do
  require "./platforms/gem/lib/mochiscript"

  Dir['./tests/*.ms'].each do |f|
    puts "Testing: " + f
    ctx = MochiScript::Context.new
    begin
      ctx.eval_ms(File.read(f))
    rescue Exception => e
      puts "Error: " + ctx.parse(File.read(f))
      puts e.to_s
    end
  end
end

task :compile do
  @boot   = BOOT.collect { |f| parse("#{SRC_DIR}/#{f}.ms") }.join("\n")
  @parser = PARSER.collect { |f| parse("#{SRC_DIR}/#{f}.ms") }.join("\n")

  { 
    'ruby.rb.erb' => './platforms/gem/lib/mochiscript.rb',
    'node.js.erb' => './platforms/npm/lib/mochiscript.js' 
  }.each_pair do |target, destination|
    target = "./src/platforms/#{target}"
    puts "Writing #{destination} to #{target}"
    File.open(destination, "w") { |t| t << ERB.new(File.read(target)).result(binding) }
  end
end

def parse(file)
  `js2 render #{file}`
end
