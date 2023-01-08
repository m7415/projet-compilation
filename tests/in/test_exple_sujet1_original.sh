# Exemple 1 de programme en SoS
declare valeurs[4] ;
lecture_valeurs() # Saisie des valeurs entières
{
 i=0 ;  nombre = $1 ;
echo "Il faut saisir " $1 "valeurs entieres\n" ;
while test ${i} -lt ${nombre} do
echo "Entrez la valeur " $( expr ${i} + 1 ) " : \n" ;
read valeurs[${i}] ;
if test ! ${valeurs[${i}]} -gt 0 then
echo "Les valeurs doivent etre strictement positives !\n" ;
return 1
fi ;
i = $( expr ${i} + 1 )
done ;
return 0
} ;
moyenne() { # Calcul de la moyenne des valeurs
 i = 0 ;
 somme = 0 ;
while test ${i} -lt $1 do
somme = $( expr ${somme} + ${valeurs[${i}]} ) ;
i = $( expr ${i} + 1 )
done ;
echo $( expr ${somme} / $1 )
} ;
echo "Nombre de valeurs : " ;
read nombre ;
lecture_valeurs ${nombre} ;
if test $? = 0 then
echo "Moyenne = " $(moyenne ${nombre} ) "\n"
else
echo "Erreur\n"
fi ;
exit