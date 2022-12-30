echo "début test_arithm_cond\n";

a = 15;
# pour montrer que c'est à l'exec qu'on a un pbme
b = "abc"; 

if test ${a} -lt ${b} then
    echo "erreur d'exécution (crash)\n";
    echo "à commenter pour voir la suite\n"
fi;

if test 14 -eq '12' then
    echo "eq"
elif test "14" -ne "12" then
    echo "ne"
elif test "14" -gt '12' then
    echo "gt"
elif test '14' -ge 12 then
    echo "ge"
elif test 14 -lt 12 then
    echo "lt"
elif test 14 -le 12 then
    echo "le"
else
    echo "non"
fi;

echo "\n----------------\n";

if test 0 -le ${a} -a ${a} -le 10 then
    echo "0 <= a <= 10"
else
    echo "a pas entre 0 et 10"
fi;


echo "\nfin\n";

exit