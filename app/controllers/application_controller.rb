class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    #send them back as a JSON array
    bakeries.to_json
   
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods_prices = BakedGood.by_price
    baked_goods_prices.to_json
  end


  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.most_expensive
    most_expensive.to_json

  end


end
