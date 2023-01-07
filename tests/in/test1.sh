echo "entiers de 1 à 10\n";
i = 1;
while test ${i} -le 10 do
    echo ${i};
    i = $( expr ${i} + 1 )
done;
echo "fin ! :):):):):)\n";
exit