dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def substrings(string, dictionary)
  hash = Hash.new(0)

  dictionary.each do |word|
    hash[word] = string.scan(/#{word}/i).size
  end
  hash_filtered = hash.select { |key, value| value > 0 }
  hash_filtered
end

substrings("Howdy partner, sit down! How's it going?", dictionary)

# Ajout des clés pour le "hash" hash[word] =
# Regex ".scan" dans "string" le nombre de fois que l'instance "word" se répéte
# insensible aux majuscules "/i"
# Ajout des valeurs de hash[word]= avec .size sur le tableau représentant le nombre d'itération de word
