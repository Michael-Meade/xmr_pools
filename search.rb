
require  'xmrpoolsearch'
#require_relative 'test'
require 'optparse'

options = {}
OptionParser.new do |parser|
  parser.on("--addr [addr]", "input Monero address.") do |a|
    options[:addr] = a
  end
  parser.on("--pt [PT]", "Print table") do |b|
    options[:pt] = true
  end
  parser.on("--gruff [GRUFF]", "create bar graph.") do |b|
    options[:gruff] = true
  end
end.parse!
if options[:addr]
    if options[:pt]
        Pools::print_table(options[:addr])
    else    
        Pools::get_pools(options[:addr])
    end
end
if options[:gruff]
    Pools::gruff(options[:addr])
end