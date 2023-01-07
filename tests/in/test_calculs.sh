echo "début test_calculs\n";

# a = $(expr -4);
# a = "-7";
a = 7;

echo "a =" ${a} "\n";
echo "-a =" $(expr -${a}) "\n";
echo "a + 2 =" $(expr ${a} + 2) "\n";
echo "a - 2 =" $(expr ${a} - 2) "\n";
echo "3 * a =" $(expr 3 * ${a}) "\n";
echo "a / 3 =" $(expr ${a} / 3) "\n";
echo "a % 3 =" $(expr ${a} % 3) "\n";

echo "--------------\n";

echo "(a + -2) * -a =" $(expr (${a} + -2) * -${a}) "\n";

echo "--------------\n";
b = $(expr (3 + 2) * ((4/2) * (-5)) % 15);
echo "(3+2)*((4/2)*(-5)) % 15 =" ${b} "\n";

echo "fin\n";
exit