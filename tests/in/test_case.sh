echo "debut test_case\n";



# read a;

a = 2;
echo "a =" ${a} "\n";

case ${a} in 
    1)
        echo "1\n" ;;
    2 | 3) 
        echo "2 ou 3\n" ;;
    4 | 5 | 6)
        echo "4 5 ou 6\n" ;;
    *)
        echo "default\n" ;;
esac;
    




echo "fin\n";
exit