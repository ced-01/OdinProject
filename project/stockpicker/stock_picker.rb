# Localiser la différence_max soit prix_max_vente - prix_min_vente
# Vérifier les conditions prix_max ne peut pas être le premier jour prices[0]
# Si oui re-localiser prix_max et stocker son index
# prix_min ne peut pas être aprés prix_max (faut acheter avant de vendre pardis)
# ou prix max ne peut pas etre avant prix_min
# 
#
# Trouver la valeur/prix minimum si l'index/jour est inférieur 
# à l'index/jour du prix/valeur maximum
# et inversement !

def valid_sell_days()
end

prices = [3, 6, 9, 1, 5]
# [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(prices)
  hash_days_prices = Hash.new(0)
  prices.each_with_index do |price, day|
    hash_days_prices[day] = price
  end

  arr_buy_sell = Array.new(0)
  index_price_min = prices.find_index(prices.min)
  index_price_max = prices.find_index(prices.max)

  if  index_price_min < index_price_max
    arr_buy_sell << index_price_min
  else
    # supprimer l'index min du tableau
    # rechercher de nouveau la valeur min
    # fair eune boucle while ou loop do
  end

    
  arr_buy_sell << 
  p arr_buy_sell
  p gain_max = prices.max - prices.min
end

stock_picker(prices)
