echo "début test_tab\n";

declare tableau[5];
taille_tab = 5;

i = $(expr ${taille_tab} -1);

# pour i de taille_tab-1 à 0
#   tab[taille_tab-1-i] <- 2*i
while test ${i} -ge 0 do
    a = $(expr ${taille_tab}-1-${i} );
    # echo ${a} $(expr 2*${i}) "\n";
    tableau[${a}] = $(expr 2*${i});
    i = $(expr ${i} -1)
done;

# affichage éléments par éléments
echo "tableau : \n";
i = 0;
while test ${i} -lt ${taille_tab} do
    echo ${i} " : " ${tableau[${i}]} "\n";
    i = $(expr ${i} +1)
done;

echo "-----------\n";
echo "et en une ligne : ";
echo ${tableau[*]};
echo "\n";

echo "------------\n";

# calculs dans l'indexe du tableau
# TODO vérifier si c'est vraiment autorisé
# > non c'est pas autorisé, cf I.11.5 dans projet.pdf
echo "element du milieu : " ${tableau[(${taille_tab}/2)]} "\n";

echo "\nfin\n";
exit