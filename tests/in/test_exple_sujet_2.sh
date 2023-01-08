declare mots[100] ;
echo "Entrez le nombre de mots de la phrase : " ;
read nombre ;
i=0 ;
while test ${i} -lt ${nombre} do
    echo "Entrez le mot numero " $(expr${i}+1) " : " ;
    read mots[${i}] ;
    i = $( expr ${i} + 1 )
done ;
echo ${mots[*]} ; # exemple : C'est Sabine qui gagne le concours (6 mots)


exit