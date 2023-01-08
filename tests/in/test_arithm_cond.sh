echo "début test_arithm_cond\n";

a = 15;
# pour montrer que c'est à l'exec qu'on a un pbme
b = "abc"; 

# if test ${a} -lt ${b} then
#     echo "erreur d'exécution (crash)\n";
#     echo "à commenter pour voir la suite\n"
# fi;


a = "-14";
b = 14;

echo ${a} "et" ${b} " : ";
if test ${a} -eq ${b} then
    echo "eq "
fi;
if test ${a} -ne ${b} then
    echo "ne "
fi;
if test ${a} -gt ${b} then
    echo "gt "
fi;
if test ${a} -ge ${b} then
    echo "ge "
fi;
if test ${a} -lt ${b} then
    echo "lt "
fi;
if test ${a} -le ${b} then
    echo "le "
fi;

echo "\n----------------\n";

if test 0 -le ${a} -a ${a} -le 10 then
    echo "0 <= a <= 10"
else
    echo "a pas entre 0 et 10"
fi;


echo "\nfin\n";

exit