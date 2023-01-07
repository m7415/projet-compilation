echo "début test_str_cond\n";

a = "abcdef";
if test -n ${a} then
    echo "-n"
elif test -z ${a} then
    echo "-z"
elif test -n "abc" ghi "jkl" then
    echo "-n concat"
fi;

echo "milieu\n";

if test -n ${a} -o -z ${a} then
    echo "-n -o -z\n"
fi;


echo "fin\n";
exit