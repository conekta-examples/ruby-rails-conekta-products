json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :is_subscription
  json.url product_url(product, format: :json)
end
