module ProductsHelper

  def buy_or_subscription(product)
    if product.is_subscription
      link_to "Subscription", subscription_product_path(product)
    else
      link_to "Buy", buy_product_path(product)
    end
  end
end
