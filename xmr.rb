require 'optparse'
require_relative 'test'
options = {}
OptionParser.new do |parser|
  parser.on("--addr [addr]", "input Monero address.") do |a|
    options[:addr] = a
  end
  parser.on("--pt [PT]", "change PATH") do |b|
    options[:pt] = true
  end
  parser.on("--gruff [GRUFF]", "create graph.") do |b|
    options[:gruff] = b
  end
end.parse!
if options[:addr]
    if options[:pt]
        print_table(options[:addr])
    else    
        get_pools(options[:addr])
    end
end
if options[:gruff]
    gruff(options[:gruff])
end