require "ethereum"

client = Ethereum::HttpClient.new('https://polygon-rpc.com/')
mana_contract_address = '0xA1c57f48F0Deb89f569dFbE6E2B7f46D33606fD4'
mana_contract_abi = [
  {
    "constant": true,
    "inputs": [],
    "name": "totalSupply",
    "outputs": [
      {
        "name": "",
        "type": "uint256"
      }
    ],
    "payable": false,
    "stateMutability": "view",
    "type": "function"
  }
]

mana_contract = Ethereum::Contract.create(name: 'MANA', address: mana_contract_address, abi: mana_contract_abi, client: client)
mana_contract.gas_price = 240_000_000_000
total_supply = mana_contract.call.total_supply

puts "Total Supply of MANA token: #{total_supply.to_s.insert(-19, '.')}"