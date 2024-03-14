require 'ethereum'

block_number = 26444465
hex_block_number = '0x' + block_number.to_s(16)
client = Ethereum::HttpClient.new('https://polygon-rpc.com/')
event = '0xd78ad95fa46c994b6551d0da85fc275fe613ce37657fb8d5e3d130840159d822'

filter_options = {
  topics: [event],
  fromBlock: hex_block_number,
  toBlock: hex_block_number
}
logs = client.eth_get_logs(filter_options)
puts logs["result"]
