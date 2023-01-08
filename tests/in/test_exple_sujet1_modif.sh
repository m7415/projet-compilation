# Exemple 1 de programme en SoS
# modifié pour fonctionner avec ce qu'on a implémenté

# différences : pas de fonction, on fait tout en impératif
# par contre, on demande en argument global le nombre de valeur à saisir
# et non plus avec un read

declare valeurs[100]; # 100 valeurs maximum

nombre = $1;
echo "Il faut saisir" $1 "valeurs entières\n";

i=0;
while test ${i} -lt ${nombre} -a ${i} -lt 100 do
    echo "Entre la valeur" $(expr ${i} +1) ": ";
    read valeurs[${i}];
    if test ! ${valeurs[${i}]} -gt 0 then
        echo "Les valeurs doivent etre strictement positives\n";
        exit
    fi;
    i = $(expr ${i} +1)
done;

somme = 0;
i = 0;
while test ${i} -lt $1 do
    somme = $(expr ${somme} + ${valeurs[${i}]} );
    i = $(expr ${i} +1)
done;
res = $(expr ${somme} / $1);

echo "Moyenne (tronquée) =" ${res} "\n";
exit