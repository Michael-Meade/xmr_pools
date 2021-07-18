require 'httparty'
require 'json'
require 'bigdecimal'
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
                results["balance"]             = main["data"]["balance"],
                results["paid"]                = main["data"]["paid"]
                results["hashrate"]            = main["data"]["hashrate"]
                results["name"]                = "nanopool"
            end
        return results if !results.empty?
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
            paid     = main["revenue"]["totalPaid"].to_f / 1000000000000
            bal      = main["revenue"]["confirmedBalance"].to_f / 1000000000000
            hashrate = main["collective"]["hashRate"]
            results  = {}
            results["paid"]     = paid
            # balance that is unconfirmed
            results["balance"]  = bal
            results["hashrate"] =  hashrate
            results["name"]     = "HashVaultPro"
            # paid + balance 
            results["total"]    = paid += bal
        return results if !results.empty?
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
            main    = JSON.parse(rsp).shift
            results = {}
            results["balance"]  = main["balance"].to_f / 1000000000
            results["paid"]     = main["paid"].to_f / 1000000000000
            results["hashrate"] = main["hashrate"]
            results["name"]     = "xmrmine.com"
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
            results["balance"]  = main["amtDue"].to_f / 100000
            results["paid"]     = main["amtPaid"].to_f / 1000000000000
            results["hashrate"] = main["hash"]
            results["name"]     = "supportxmr.com"
        return results
        end
    end
end
def get_all
    t = 0
    Pools.constants.select do |c|
        k = Pools.const_get(c).new("49ubSTdDp9hPmYE7paRM6PZFLmqvsedZ56MXLUT8mvYnTzjVCKGDbpuW4RVdvZon228uWnkjoJN8S6w5S4LdgeK8UBMMEhJ").get
        if !k.nil?
           bal = k["balance"].to_f
           t += bal
        end
    end
puts t
end

get_all