echo "début test_for\n";


for v in a b c d e do
    echo "> " ${v} "\n"
done;
echo "----------\n";

for v in a b c d e do
    for v2 in 1 2 3 do
        echo ${v} ${v2} "\n"
    done
    # ;echo "fin ligne\n"
done;
echo "-----------\n";

for v in a b c do
    for v2 in 1 2 3 do
        for v3 in "+" "-" "*" do
            a = ${v} ${v2} ${v3};
            echo ${a} "\n"
        done
    done
done;
echo "-------------\n";


sum = 0;
while test ${sum} -lt 100 do
    for v in 1 2 3 do
        sum = $(expr ${sum} + ${v});
        for v2 in 10 15 do
            sum = $(expr ${sum} + ${v2});
            echo "sum =" ${sum} "\n"
        done
        # sum = $(expr ${sum} + ${v})
    done;
    echo "sum =" ${sum} "\n"
done;
echo "final sum =" ${sum} "\n";
echo "----------\n";

for v in mot1 mot2 mot3 do
    echo "> "${v} "\n"
done;
echo "-------\n";

a = 2;
declare b[3];
# b[2] = "coucou";
for v in mot1 ${a} $(expr ${a} + 2 - 1) ${b[${a}]} do
    echo ">" ${v} "\n"
done;
echo "----------\n";

declare tab[5];
for i in 0 1 2 3 4 do
    tab[${i}] = "a" ${i};
    echo "set> " ${tab[${i}]} "\n"
done;
for v in ${tab[*]} do
    echo "get> " ${v} "\n"
done;

echo "fin\n";
exit