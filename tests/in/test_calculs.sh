echo "début test_calculs\n";

echo $(expr -3 + 2);
echo $(expr 3 - 2);
echo $(expr 3 * 2);
echo $(expr 3 / 2);
echo $(expr 3 % 2);

echo "\n--------------\n";

a = $(expr (3 + 2) * ((4/2) * (-5)));

echo ${a};

echo "\n--------------\n";

# a = 5;

echo $(expr (${a} + -2) * -${a});

echo "\nfin\n";
exit