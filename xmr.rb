require 'optparse'
require_relative 'lib'
require "colorize"

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
  parser.on("--addr ADDR", "input Monero address.") do |a|
    options[:addr] = a
  end
  parser.on("--pt", "print table") do |b|
    options[:pt] = true
  end
  parser.on("--gruff", "create graph.") do |b|
    options[:gruff] = b
  end
  parser.on("--total", "Get total") do |b|
    options[:total] = true
  end
  parser.on("--list", "list pools & amount") do |b|
    options[:list] = true
  end
end.parse!
if options[:pt]
    print_table(options[:addr])
end
if options[:gruff]
    gruff(options[:addr])
end
if options[:list]
    get_pools(options[:addr])
end
if options[:total]
    t = get_total(options[:addr])
    puts "TOTAL MINED: " + t.to_s.green
end