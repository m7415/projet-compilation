echo "début";

while test a = b do
    echo "intérieur while";
    
    while test c=d do 
        echo "while dans while";
        if test e=f then
            echo "if dans while dans while";
            echo "2e instr"
        fi;
        echo "fin while dans while"
    done

done;

echo "fin";

exit