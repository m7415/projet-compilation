echo "début test_read\n";

echo "première valeur : ";
read a;

echo "deuxième valeur : ";
read b;
echo "somme =" $(expr ${a} + ${b}) "\n";


echo "fin\n";
exit