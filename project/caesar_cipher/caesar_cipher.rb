# Le Chiffre de César est une technique de chiffrement simple qui peut être implémentée en Ruby. Voici les points clés pour développer un Chiffre de César en Ruby :
# Principe de base :
# Chaque lettre du message est décalée d'un certain nombre de positions dans l'alphabet.
# Par exemple, avec un décalage de 3, 'A' devient 'D', 'B' devient 'E', etc.
###############################################################################################
#
#Version noobs - projet individuel - entrainement :
# 1 => Convertir la chaîne de carractére string en nombre ASCII => def alphabet_to_num; end :
#   a) Récupérer chaque lettre de la chaîne string dans un tableau; Méthode => .split("")
#   b) Convertir chaque lettre en nombre ASCII correspondants => .ord
#      Stocker dans un tableau arr_num_org;
#      Ajouter le nombre shift à chaque lettre convertie de arr_num_org & stocker dans arr_num_shift
#   c) Reconvertir en alphabet décalé de shift donc! les nombres de arr_num_shift dans arr_encrypt => .chr
#      Joindre le tableau arr_encrypt et le retourner => .join()
##!!!!! *les caractéres spéciaux (asccii) doit être laisser intact (!,., ,...)
################################################################################################
#
# Version pro : Organigramme pour le chiffrement César
#
# 1. Conversion de la chaîne de caractères string en nombres ASCII
# 1.1. Découper la chaîne string en un tableau de lettres

#     Méthode : Utiliser .split("") pour créer un tableau arr_letters où chaque élément est une lettre de string.

# 1.2. Convertir chaque lettre en son code ASCII

#     Méthode : Utiliser .ord pour convertir chaque lettre en son code ASCII.
#     Stockage : Stocker les valeurs converties dans un tableau arr_ascii.

# 2. Application du décalage shift
# 2.1. Décaler chaque valeur de arr_ascii avec la valeur shift

#     Action : Ajouter shift à chaque valeur numérique du tableau arr_ascii.
#              Ne pas modifier les cractéres spéciaux
#     Stockage : Stocker les nouvelles valeurs décalées dans un tableau arr_shifted.

# 2.2. Conserver les espaces intactes (en option)

#     Condition spéciale : Si une lettre est un espace (" "), son code ASCII (32) doit être ignoré lors du décalage.
#     Action : Ne pas modifier les valeurs correspondant aux espaces.
#
# 2. Aprés RSpect avancées :
#
#    1- ascii - 65 :

# Le code ASCII pour les majuscules commence à 65 ('A'). En soustrayant 65, on aligne 'A' à 0, 'B' à 1, et ainsi de suite, jusqu'à 'Z' (qui devient 25).

# 2- + shift :

#     Ajoute la valeur de décalage (shift) à la position de la lettre. Si shift est 3, cela déplace la lettre de trois positions vers l'avant.

# 3- % 26 :

#     Cette opération permet de « boucler » le décalage lorsqu'on dépasse 'Z'. Par exemple, avec un décalage de 3, 'Z' deviendrait 'C' (position 25 + 3 = 28, et 28 % 26 = 2 qui correspond à 'C').

# 4 + 65 :

#     Après avoir recalculé la position dans l'alphabet (de 0 à 25), on ajoute à nouveau 65 pour revenir aux codes ASCII des majuscules. Cela permet de récupérer le code ASCII de la nouvelle lettre.

# 5 .chr :

#     Convertit le code ASCII final en un caractère.

# 3. Conversion inverse : ASCII à caractères décalés
# 3.1. Convertir les valeurs de arr_shifted en lettres

#     Méthode : Utiliser .chr pour convertir chaque nombre en lettre décalée.
#     Stockage : Stocker les lettres converties dans un tableau arr_encrypt.

# 3.2. Joindre les lettres décalées en une chaîne

#     Méthode : Utiliser .join pour combiner les éléments de arr_encrypt en une chaîne de caractères.

# 4. Retourner le résultat final

#     Action : Retourner la chaîne de caractères chiffrée obtenue à partir de arr_encrypt.

# Notes additionnelles :

#     Gestion des exceptions : Prendre en compte les caractères spéciaux et les majuscules, si nécessaire.
#     Performance : Si le décalage implique de nombreux calculs, envisager de limiter les itérations.
#     Tests (Rspec): Ajouter des tests unitaires pour vérifier le comportement du chiffrement pour divers cas, y compris des espaces, majuscules et caractères non alphabétiques.

#     Aprés l'ajout des tests RSpec plus avancés j'ai obtenu et découvert plusieurs fails non envisagées => En résolvant c'est fail mon code c'est grandement amélioré.
#
#
# 1 - convert_to_ascii
def convert_to_ascii(string)
  arr_ascii = string.split("").map(&:ord)
  arr_ascii
end

# 2 - Décalage de shift pour les lettres de l'aphabet(code ascii = 65-90 et 97-122).
# Avant RSspec

# def left_shift(arr_ascii, shift)
#   arr_shifted = arr_ascii.map do |ascii|
#     if ascii.between?(65, 90) || ascii.between?(97, 122)
#       ascii + shift
#     else
#       ascii
#     end
#   end
#   arr_shifted
# end

# 2 - Aprés RSpect - lefth_shit qui recouvre tous les cas de figures.

def left_shift(arr_ascii, shift)
  arr_shifted = arr_ascii.map do |ascii|
    if ascii.between?(65, 90) # A-Z
      ((ascii - 65 + shift) % 26 + 65)
    elsif ascii.between?(97, 122) # a-z
      ((ascii - 97 + shift) % 26 + 97)
    else
      ascii # Conserver les cractéres spéciaux
    end
  end
  arr_shifted
end

# 3 - Reconvertir en lettre avec décalage ou encryptage
def convert_to_letter(arr_shifted)
  arr_encrypt = arr_shifted.map(&:chr).join("")
  arr_encrypt
end

# 4 - Caesar_cipher => modularité & séparation des tâches (separation of concerns)

def caesar_cipher(string, shift)
  shift = shift % 26 # Le modulo 26 garantit que les décalages bouclent correctement
  arr_ascii = convert_to_ascii(string)
  arr_shifted = left_shift(arr_ascii, shift)
  arr_encrypt = convert_to_letter(arr_shifted)
  arr_encrypt
end

# puts caesar_cipher("abc bcd!", 1)
# ou
# Interaction avec un utilisateur..
puts ">> Write the word(s) you want to encrypt ?"
string = gets.chomp
puts "How many left_shift do you want ?"
shift = gets.chomp.to_i
puts caesar_cipher(string, shift)
