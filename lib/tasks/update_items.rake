namespace :db do
    desc "Updates prices of all items."
    task :update_prices => :environment do
        require 'httparty'
        require 'json'
        response = HTTParty.get("https://rsbuddy.com/exchange/summary.json")
        if response.code == 200
            data = JSON.parse(response.body)
            data.each do |item|
                if Item.where(name: item.second['name']).exists? 
                    Item.where(name: item.second['name']).first.update_attributes(
                        rs_id: item.second['id'],
                        members: item.second['members'],
                        shop_price: item.second['sp'],
                        buy_price: item.second['buy_average'],
                        buy_quantity: item.second['buy_quantity'],
                        sell_price: item.second['sell_average'],
                        sell_quantity: item.second['sell_quantity'],
                        average_price: item.second['overall_average'],
                        overall_quantity: item.second['overall_quantity']
                    )
                else
                    Item.create(
                        rs_id: item.second['id'],
                        name: item.second['name'],
                        members: item.second['members'],
                        shop_price: item.second['sp'],
                        buy_price: item.second['buy_average'],
                        buy_quantity: item.second['buy_quantity'],
                        sell_price: item.second['sell_average'],
                        sell_quantity: item.second['sell_quantity'],
                        average_price: item.second['overall_average'],
                        overall_quantity: item.second['overall_quantity']
                    )
                end
            end
        end
    end
end
