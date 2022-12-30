echo "début";

if test !(a = b -a c = d)
then
    echo "wow un and insane";
    echo "enfin bon"
elif test g=h -o ! i = j
then
    echo "un elif avec un or ??"
fi;


echo "-----------------";


if test a!=b -a c=d -o e=f
then
    echo "cond complexe 1"
elif test a=b -a (c=d -o e=f -a g=h)
then
    echo "cond complexe 2"
fi;


echo "fin"
exit