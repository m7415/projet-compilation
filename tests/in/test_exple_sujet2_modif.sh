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
echo "\n";
new_phrase = "";

for mot in ${mots[*]} do
    if test ${mot} = Anne
         -o ${mot} = Corinne
         -o ${mot} = Sabine
         -o ${mot} = Emilie
    then
        new_phrase = ${new_phrase}" "elle
    elif test ${mot} = Pierre
           -o ${mot} = Paul
           -o ${mot} = Jacques
           -o ${mot} = Albert
    then
        new_phrase = ${new_phrase}" "lui
    else
        new_phrase = ${new_phrase}" "${mot}
    fi
done;
echo "Nouvelle phrase :" ${new_phrase} "\n";


exit