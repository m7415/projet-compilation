echo "début";

until test a = b do
    echo "intérieur until";
    
    until test c=d do 
        echo "until dans until";
        if test e=f then
            echo "if dans until dans until";
            echo "2e instr"
        fi;
        echo "fin until dans until"
    done

done;

echo "fin";

exit