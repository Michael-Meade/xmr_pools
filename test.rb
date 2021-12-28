require 'httparty'
require 'json'
require 'bigdecimal'
require 'gruff'
require 'terminal-table'
module Pools
    class NanoPool
        def initialize(address)
            @address = address
        end
        def address
            @address
        end
        def url
            "https://api.nanopool.org/v1/xmr/user/#{address}"
        end
        def get
            rsp     = HTTParty.get(url).response.body
            main    = JSON.parse(rsp)
            results = {}
            if main["status"] != false || main["error"] != "Account not found"
                results["balance"]             = main["data"]["balance"]
                results["paid"]                = main["data"]["paid"]
                results["hashrate"]            = main["data"]["hashrate"]
                results["total"]               = main["data"]["balance"].to_f + main["data"]["paid"].to_f
                results["name"]                = "nanopool"
            end
        return results if !results.empty?
        end

    end
    class TwoMiners
        def initialize(address)
            @address = address
        end
        def address
            @address
        end
        def url
            "https://xmr.2miners.com/api/accounts/#{address}"
        end
        def get
            rsp      = HTTParty.get(url).response
            body     = rsp.body
            if rsp.code.to_i != 404                
                main     = JSON.parse(body)
                stats    =  main["stats"]
                results  = {}
                paid     = stats["paid"].to_f / 1000000000000
                bal      = stats["balance"].to_f / 1000000000000
                results["paid"]     =  paid
                # un paid
                results["balance"]  = bal
                results["total"]    = bal.to_f + paid.to_f
                results["hashrate"] = main["hashrate"]
                results["name"]     = "TwoMiners"
            return results
            end
        end
    end
    
    class HashVaultPro
        def initialize(address)
            @address = address
        end
        def address
            @address
        end
        def url
            "https://api.hashvault.pro/v3/monero/wallet/#{address}/stats?chart=total&inactivityThreshold=10"
        end
        def get
            rsp      = HTTParty.get(url).response.body                
            main     = JSON.parse(rsp)
            if !main.has_key?("error")
                    paid     = main["revenue"]["totalPaid"].to_f / 1000000000000
                    bal      = main["revenue"]["confirmedBalance"].to_f / 10000000000000
                    hashrate = main["collective"]["hashRate"]
                    results  = {}
                    results["paid"]     = paid
                    # balance that is unconfirmed
                    results["balance"]  = bal
                    results["hashrate"] =  hashrate
                    results["name"]     = "HashVaultPro"
                    # paid + balance 
                    results["total"]    = bal.to_f + paid.to_f
                return results if !results.empty?
            end
        end
    end
    class MineXmr
        def initialize(address)
            @address = address
        end
        def address
            @address
        end
        def url
            "https://minexmr.com/api/pool/get_wid_stats?address=#{address}"
        end
        def get
            rsp     = HTTParty.get(url).response.body
            main    = JSON.parse(rsp)
            if main.kind_of?(Array)
                main = main.shift
            end
            if main["error"].to_s != "no workers found"
                results = {}
                balance = main["balance"].to_f / 1000000000000
                # 1000000000
                paid    = main["paid"].to_f / 1000000000000
                results["balance"]  = balance
                results["paid"]     = 
                results["hashrate"] = main["hashrate"]
                results["name"]     = "xmrmine.com"
                results["total"]    = balance.to_f + paid.to_f
            return results
            end
        end
    end
    class XMRPoolEU
        def initialize(address)
            @address = address
        end
        def address
            @address
        end
        def url
            "https://web.xmrpool.eu:8119/stats_address?address=#{address}&longpoll=false"
        end
        def get
            rsp     = HTTParty.get(url).response.body
            if !rsp.include?("error")
                main    = JSON.parse(rsp)["stats"]
                results = {}
                bal     = main["balance"].to_f / 1000000000000
                
                results["balance"]  = bal
                if !main.has_key?("paid")
                    results["paid"] = 0
                    paid            = 0
                else
                    paid    = main["paid"].to_f / 1000000000000
                    results["paid"] = paid
                end
                results["hashrate"] = main["hash"]
                results["total"]    = bal + paid
                results["name"]     = "xmrpool.eu"
            end
        return results
        end
    end
    class SupportXmr
        def initialize(address)
            @address = address
        end
        def address
            @address
        end
        def url
            "https://supportxmr.com/api/miner/#{address}/stats"
        end
        def get
            rsp     = HTTParty.get(url).response.body
            main    = JSON.parse(rsp)
            results = {}
            bal     = main["amtDue"].to_f / 1000000000000
            paid    = main["amtPaid"].to_f / 1000000000000
            results["balance"]  = bal
            results["paid"]     = paid
            results["hashrate"] = main["hash"]
            results["total"]    = bal + paid
            results["name"]     = "supportxmr.com"
        return results
        end
    end
    class MoneroHash
        def initialize(address)
            @address = address
        end
        def address
            @address
        end
        def url
            "https://monerohash.com/api/stats_address?address=#{address}"
        end
        def get
            rsp     = HTTParty.get(url).response.body
            main    = JSON.parse(rsp)
            if not main.has_key?("error")
                results = {}
                results["name"] = "MoneroHash"
                if main["payments"].empty?
                    results["total"] = 0
                end
            return results
            end
        end
    end

end
def get_all(addr)
    t = 0
    Pools.constants.select do |c|
        k = Pools.const_get(c).new(addr).get
        if !k.nil?
           t += k["total"]
        end
    end
puts "Address: #{addr}"

puts "Balance: #{t}"
end
def get_total(addr)
    t = 0
    Pools.constants.select do |c|
        k = Pools.const_get(c).new(addr).get
        if !k.nil?
           t += k["total"]
        end
    end
return t
end
def get_pools(addr)
    Pools.constants.select do |c|
        k = Pools.const_get(c).new(addr).get
        if !k.nil?
           puts k["name"].to_s + " - " + k["total"].to_s
        end
    end
end
def array(addr)
    out = []
    Pools.constants.select do |c|
        k = Pools.const_get(c).new(addr).get
        if !k.nil?
            out << [k["name"], k["total"]]
        end
    end
return out
end
def color(num)
    ii = []
    t  = num.times.map { "%06x" % (rand * 0xffffff) }.to_a
    t.each {|i| ii << "##{i}" }
    return ii
  end
def gruff(addr)
    out = array(addr)
    g = Gruff::Bar.new(1000)
    g.title  = @title
    g.colors = color(out.count)
    g.hide_line_numbers = true
    g.show_labels_for_bar_values = true
    #@g.group_spacing = 15
    out.each do |data|
      g.data(data[0], data[1])
    end
    g.write("pools.png")
end
def print_table(addr)
    out   = array(addr)
    table = Terminal::Table.new
    table.title = addr
    table.headings = ["POOL", "Amount"]
    table.rows  = out
    table.style = {:width => @width, :border => :unicode_round, :alignment => :center }
    puts table
end


    #"49ubSTdDp9hPmYE7paRM6PZFLmqvsedZ56MXLUT8mvYnTzjVCKGDbpuW4RVdvZon228uWnkjoJN8S6w5S4LdgeK8UBMMEhJ")
    #47vcMwEwosJRc4bCAcRRw7WwezTRn8dCHBjTnYXsZG3UR3Eya88PN3rZKexzwJojRMGVexryHmy47NXmNuDyZirWSexaEYv
#4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7