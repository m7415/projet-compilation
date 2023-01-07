echo "début test 4\n";
a = a;
b = b;
c = c;
d = ${a} ${b} ${c} ${b} ${a};

if test ${a} = ${b} then
    # echo ${a};
    # echo " est différent de ";
    # echo ${b}
    echo ${a} est égal à ${b} "(1)"
elif test ${a} = ${c} then
    echo ${a} est égal à ${c} "(2)"
elif test ${a} = ${d} then
    echo ${a} est égal à ${d} "(3)"
else
    echo ${a} est différent de ${b} 
         et ${c} et ${d} "(4)"
fi;

echo "\nfin\n";
exit