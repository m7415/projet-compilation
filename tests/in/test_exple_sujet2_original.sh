# Exemple 2 de programme en SoS
declare mots[100] ;
echo "Entrez le nombre de mots de la phrase : " ;
read nombre ;
i=1 ;
while test ${i} -le ${nombre} do
echo "Entrez le mot numero " ${i} " : " ;
read mots[${i}] ;
i = $( expr ${i} + 1 )
done ;
new_phrase="" ;
echo ${mots[*]} ; # exemple : C'est Sabine qui gagne le concours (6 mots)
for mot in ${mots[*]} do
case ${mot} in
Anne|Corinne|Sabine|Emilie) new_phrase = ${new_phrase}" "elle ;;
Pierre|Paul|Jacques|Albert) new_phrase = ${new_phrase}" "lui ;;
*) new_phrase = ${new_phrase}" "${mot} ;;
esac
done ;
echo "Nouvelle phrase : " ${new_phrase} ; # exemple : C'est elle qui gagne le concours
exit