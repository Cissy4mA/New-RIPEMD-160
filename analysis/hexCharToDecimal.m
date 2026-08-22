function decimalValue = hexCharToDecimal(hexChar)
    if isstr(hexChar)
        switch hexChar
            case '0'
                decimalValue = 0;
            case '1'
                decimalValue = 1;
            case '2'
                decimalValue = 2;
            case '3'
                decimalValue = 3;
            case '4'
                decimalValue = 4;
            case '5'
                decimalValue = 5;
            case '6'
                decimalValue = 6;
            case '7'
                decimalValue = 7;
            case '8'
                decimalValue = 8;
            case '9'
                decimalValue = 9;
            case 'a'
                decimalValue = 10;
            case 'b'
                decimalValue = 11;
            case 'c'
                decimalValue = 12;
            case 'd'
                decimalValue = 13;
            case 'e'
                decimalValue = 14;
            case 'f'
                decimalValue = 15;
            case 'A'
                decimalValue = 10;
            case 'B'
                decimalValue = 11;
            case 'C'
                decimalValue = 12;
            case 'D'
                decimalValue = 13;
            case 'E'
                decimalValue = 14;
            case 'F'
                decimalValue = 15;
        end
    end
end