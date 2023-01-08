echo "debut test_arg_glob\n";


a = $3;
echo "arg séparés :" $1 $2 $3 ${a} "\n";
a = ppppppp;
echo "arg après modif :" $1 $2 $3 ${a} "\n";

echo "tout les args :" $* "\n";

echo $(expr ($1 + 11)/$2) "\n";


echo "fin\n";
exit