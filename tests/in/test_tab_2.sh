echo "début test_tab_2 (simple)\n";

declare tab[3];


tab[0] = "0";
tab[1] = "1";
# tab[2] = "2";

echo ${tab[0]} "|" ${tab[1]} "|" ${tab[2]} "\n";

echo ${tab[*]};
echo "\n";

tmp = ${tab[0]};
tab[0] = ${tab[1]};
tab[1] = ${tmp};

echo ${tab[*]};
echo "\n";

echo "--------------\n";

tmp = ${tab[${tab[0]}]};
tmp2 = ${tab[${tab[1]}]};
tab[ 0 ] = ${tmp};
tab[ 1 ] = ${tmp2};
echo ${tab[*]};
echo "\n";

a = 1;
tab[${a}] = $(expr ${a}*5);
echo ${tab[*]};
echo "\n";

echo "fin\n";
exit