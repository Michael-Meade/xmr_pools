
require  'xmrpoolsearch'
#require_relative 'test'
require 'optparse'
b1=%q{
 __       __                                                          __                             __                         
|  \     /  \                                                        |  \                           |  \                        
| $$\   /  $$  ______   _______    ______    ______    ______        | $$____   __    __  _______  _| $$_     ______    ______  
| $$$\ /  $$$ /      \ |       \  /      \  /      \  /      \       | $$    \ |  \  |  \|       \|   $$ \   /      \  /      \ 
| $$$$\  $$$$|  $$$$$$\| $$$$$$$\|  $$$$$$\|  $$$$$$\|  $$$$$$\      | $$$$$$$\| $$  | $$| $$$$$$$\\$$$$$$  |  $$$$$$\|  $$$$$$\
| $$\$$ $$ $$| $$  | $$| $$  | $$| $$    $$| $$   \$$| $$  | $$      | $$  | $$| $$  | $$| $$  | $$ | $$ __ | $$    $$| $$   \$$
| $$ \$$$| $$| $$__/ $$| $$  | $$| $$$$$$$$| $$      | $$__/ $$      | $$  | $$| $$__/ $$| $$  | $$ | $$|  \| $$$$$$$$| $$      
| $$  \$ | $$ \$$    $$| $$  | $$ \$$     \| $$       \$$    $$      | $$  | $$ \$$    $$| $$  | $$  \$$  $$ \$$     \| $$      
 \$$      \$$  \$$$$$$  \$$   \$$  \$$$$$$$ \$$        \$$$$$$        \$$   \$$  \$$$$$$  \$$   \$$   \$$$$   \$$$$$$$ \$$      
                                                                                                                                
                                                                                                                                                                                                                                                           
}

b2=%q{
███    ███  ██████  ███    ██ ███████ ██████   ██████      ██   ██ ██    ██ ███    ██ ████████ ███████ ██████  
████  ████ ██    ██ ████   ██ ██      ██   ██ ██    ██     ██   ██ ██    ██ ████   ██    ██    ██      ██   ██ 
██ ████ ██ ██    ██ ██ ██  ██ █████   ██████  ██    ██     ███████ ██    ██ ██ ██  ██    ██    █████   ██████  
██  ██  ██ ██    ██ ██  ██ ██ ██      ██   ██ ██    ██     ██   ██ ██    ██ ██  ██ ██    ██    ██      ██   ██ 
██      ██  ██████  ██   ████ ███████ ██   ██  ██████      ██   ██  ██████  ██   ████    ██    ███████ ██   ██ 
                                                                                                               
                                                                                                               
}
def menu(b1, b2)
    banners = []
    banners << b1
    banners << b2

    ban = banners.sample
    r   = rand(0..5)
    if r.even?
        puts ban.to_s.red
    else
        puts ban.to_s.green
    end
end
menu(b1, b2)
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
  parser.on("--total", "Get total") do |b|
    options[:total] = true
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
if options[:total]
    t = Pools::get_total(options[:addr])
    puts "Total: #{t}"
end