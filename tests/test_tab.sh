echo "début test_tab\n";

declare tableau[15];
taille_tab = 12;

i = $(expr ${taille_tab} -1);

while test ${i} -ge 0 do
    # tableau[(11-${i})] = ${i};
    tableau[(${taille_tab}-1-${i})] = $(expr 2*${i});
    i = $(expr ${i} -1)
done;

echo "tableau : \n";

i = 0;
while test ${i} -lt ${taille_tab} do
    echo ${i} " : " ${tableau[${i}]} "\n"
done;

echo "-----------\n";
echo "et en une ligne : ";
echo ${tableau[*]};

echo "------------\n";
elem_du_milieu = ${tableau[(${taille_tab}/2)]};
echo "element du milieu : " ${elem_du_milieu} "\n";
echo "\nfin\n";
exit