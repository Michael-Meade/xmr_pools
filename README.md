### Pools that it currently supports
* supportxmr.com
* minexmr.com
* hashvault.pro
* nanopool.org
* 2miners.com
* MoneroHash.com
* xmrpool.eu


### Purpose
This tool purpose is to allow the user to search a buncn of different Monero mining pools for a certain address. The script will then add up Monero that was mined and display the results. When I dig into files that were dropped on my honey pot, I often run into malware that tries to mine Monero on my VPS. This script could be used to get a better idea on how much profit the malicious miner has mined using its victims machines.


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
# Installing gems
```ruby
gem install gruff
gem install terminal-table
gem install httparty
```