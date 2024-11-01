# Organigramme de l'algorithme Bubble Sort

#     Initialisation : Créer une méthode bubble_sort qui prend un tableau arr_num en argument.

#     Début de la boucle :
#         Définir une variable swapped qui indiquera si un échange a eu lieu, initialisée à true pour entrer dans la boucle-loop do ;end.

#     Boucle principale :
#         Tant que swapped est true (c'est-à-dire qu'il y a eu des échanges dans le dernier passage) :
#             Fixer swapped à false au début de chaque passage pour détecter si un échange a lieu.

#     Boucle interne :
#         Pour chaque élément du tableau jusqu'à l'avant-dernier :
#             Comparer l'élément courant avec le suivant.
#             Si l'élément courant est plus grand que le suivant, échanger leurs places.
#             Mettre swapped à true pour indiquer qu'un échange a eu lieu.

#     Vérification :
#         À la fin de chaque passage complet du tableau, vérifier si swapped est toujours false.
#         Si swapped est false, cela signifie que le tableau est trié et la boucle principale peut être interrompue.

#     Retourner le tableau trié : La méthode bubble_sort retourne le tableau trié.

def bubble_sort(arr_num)
  n = arr_num.length

  loop do
    swapped = false

    (n - 1).times do |i|
      if arr_num[i + 1] < arr_num[i]
        # Swap/Echange des éléments
        arr_num[i], arr_num[i + 1] = arr_num[i + 1], arr_num[i]
        swapped = true
      end
    end
    break unless swapped
  end
  arr_num
end

arr_num = [4, 3, 78, 2, 0, 2]
bubble_sort(arr_num)
