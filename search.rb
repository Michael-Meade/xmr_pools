require  'xmrpoolsearch'
require 'optparse'

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
        Pools::print_table(options[:addr])
    else    
        Pools::get_pools(options[:addr])
    end
end
if options[:gruff]
    Pools::gruff(options[:gruff])
end