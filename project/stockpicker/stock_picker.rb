# 1. Comprendre l'objectif

#     But : Créer une méthode qui identifie les jours optimaux pour acheter et vendre des actions afin de maximiser le profit.
#     Exigences : Travailler avec un tableau de prix et retourner un tableau d'indices pour les jours d'achat et de vente.

# 2. Analyser les données d'entrée

#     Input : Un tableau de prix des actions, où chaque index représente un jour.
#     Exemple de données : prices = [17, 3, 6, 9, 15, 8, 6, 1, 10].

# 3. Initialiser les variables

#     Créer un tableau ou un hash pour stocker les jours et les prix associés.
#     Créer un tableau pour stocker les indices de jours d'achat et de vente.

# 4. Remplir le hash des jours et des prix

#     Itérer sur le tableau de prix avec des index.
#     Remplir le hash avec des paires jour-prix.

# 5. Trouver les jours d'achat et de vente

#     Utiliser une boucle pour :
#         Identifier le jour avec le prix minimum.
#         Identifier le jour avec le prix maximum.
#     Vérifier si le jour d'achat est avant le jour de vente.
#     Si c'est le cas, stocker ces indices dans le tableau de résultats.
#     Sinon, supprimer le jour avec le prix minimum et continuer la recherche.

def stock_picker(prices)
  hash_days_prices = Hash.new(0)
  prices.each_with_index do |price, day|
    hash_days_prices[day] = price
  end

  # ou  hash_days_prices = prices.each_with_index.to_h

  arr_buy_sell = Array.new(0)
  hash_days_prices.reject! { |day, price| day == 0 && price == hash_days_prices.values.max }

  loop do
    day_buy_min = hash_days_prices.key(hash_days_prices.values.min)
    day_sell_max = hash_days_prices.key(hash_days_prices.values.max)

    if day_buy_min < day_sell_max
      arr_buy_sell << day_buy_min << day_sell_max
      break
    else
      # supprimer la valeur min du tableau
      hash_days_prices.delete(day_buy_min)
      # Empêche itération infinie ou no method nil si toute les valeurs sont supprimées
      break if hash_days_prices.empty?
      # rechercher de nouveau la valeur min avec loop do; end
    end
  end

  # Renvoie [0, 0] si pas de profit possible
  gain = hash_days_prices[arr_buy_sell[1]] - hash_days_prices[arr_buy_sell[0]]
  p gain
  arr_buy_sell = [0, 0] if gain <= 0

  p arr_buy_sell
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
