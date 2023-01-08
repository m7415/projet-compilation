echo "debut test_tab_3\n";

declare tab[5];

i = 0;
while test ${i} -lt 4 do
    echo ${i} "\n";
    tab[${i}] = ${i};

    i = $(expr ${i} +1)
done;

tab[4] = 0;

echo ${tab[*]};
echo "\n";



echo "fin\n";
exit