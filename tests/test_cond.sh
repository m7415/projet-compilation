echo "début test_cond\n";

# modifier les valeurs ici pour tester les cas de figure
a=a;
b=a;
c=c;
d=d;
e=e;
f=e;
g=h;
h=h;
i=i;
j=j;

if test (${a} = ${b} -a ${c} = ${d})
then
    echo "wow un and insane ";
    echo "enfin bon\n"
elif test ${g}=${h} -o ! ${i} = ${j}
then
    echo "un elif avec un or ??\n"
else
    echo "pff juste le else\n"
fi;


echo "\n-----------------\n";


if test (${a}!=${b} -a ${c}=${d} -o ${e}=${f}) -a 0 = 1
then
    echo "cond complexe 1\n"
elif test ${a}=${b} -a (${c}=${d} -o ${e}=${f} -a ${g}=${h})
then
    echo "cond complexe 2\n"
fi;


echo "\nfin\n";
exit