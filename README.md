<h1 align="center">Monero Pool Search</h1>
<div align="center">
  
**[Pools that it supports](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#pools-that-it-currently-supports) • 
[About](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#About) • 
[Installing gems](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#Installing-gems) • 
[Installation](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#Installation) • 
[Build gem](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#Build-gem) •
[Help](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#Help-Menu) •
[License](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#License)**
</div>

# Pools that it currently supports
* supportxmr.com
* minexmr.com
* hashvault.pro
* nanopool.org
* 2miners.com
* MoneroHash.com
* xmrpool.eu

# About
This tool purpose is to allow the user to search a buncn of different Monero mining pools for a certain address. The script will then add up Monero that was mined and display the results. When I dig into files that were dropped on my honey pot, I often run into malware that tries to mine Monero on my VPS. This script could be used to get a better idea on how much profit the malicious miner has mined using its victims machines.


# Installing gems manually 
```ruby
gem install gruff
gem install terminal-table
gem install httparty
```
# Installation

Add this line to your application's Gemfile:

```ruby
gem 'xmrpoolsearch'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install xmrpoolsearch

# Build Gem

# Help Menu
```ruby
ruby search.rb --h
```

# Print Table
```ruby
ruby search.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --pt
```

# Save Results in Bar Graph
```ruby
ruby search.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --gruff
```

# Get Total
```ruby
ruby search.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --total
```
# List Results
```ruby
ruby search.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --list
```

# Print table & get total
```ruby
ruby search.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --pt --total
```

# License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

<div align="center">
  
**[Pools that it supports](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#pools-that-it-currently-supports) • 
[About](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#About) • 
[Installing gems](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#Installing-gems) • 
[Help](https://github.com/Michael-Meade/xmr_pools/blob/main/README.md#Help-Menu)**

</div>

# Pools that it currently supports
* supportxmr.com
* minexmr.com
* hashvault.pro
* nanopool.org
* 2miners.com
* MoneroHash.com
* xmrpool.eu

# About
This tool purpose is to allow the user to search a buncn of different Monero mining pools for a certain address. The script will then add up Monero that was mined and display the results. When I dig into files that were dropped on my honey pot, I often run into malware that tries to mine Monero on my VPS. This script could be used to get a better idea on how much profit the malicious miner has mined using its victims machines.


# Installing gems
```ruby
gem install gruff
gem install terminal-table
gem install httparty
```

# Help Menu
```ruby
ruby xmr.rb --h
```

# Print Table
```ruby
ruby xmr.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --pt
```

# Save Results in Bar Graph
```ruby
ruby xmr.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --gruff
```

# Get Total
```ruby
ruby xmr.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --total
```
# List Results
```ruby
ruby xmr.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --list
```

# Print table & get total
```ruby
ruby xmr.rb --addr 4A3UaV5a2kZLd8dNBPDMA7BBhJGyCxcFVip3rJCgnhcciSzempVCwB4AZGf3KNWVeEihAGoF4ZYhhU6bePeEP3eh9ke26P7 --pt --total
```
