echo "début test_for\n";

# sum = 0;
# while test ${sum} -lt 100 do
#     for v in 1 2 3 4 5 do
#         for v2 in 10 15 do
#             sum = $(expr ${sum} + ${v} + ${v2})
#         done
#     done
# done;
# echo ${sum} "\n";

a = 5;
declare b[20];
for v in mot1 ${a} $(expr ${a} + 2 - 1) ${b[${a}]} do
    echo ${v} "\n"
done;

echo "----------\n";
declare tab[5];
for v in ${tab[*]} do
    echo ${v} "\n"
done;

echo "\nfin\n";
exit