function decimalValue = DecimalTohexChar(Decimal)
    if isstr(Decimal)
        switch Decimal
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
            case '10'
                decimalValue = 'A';
            case '11'
                decimalValue = 'B';
            case '12'
                decimalValue = 'C';
            case '13'
                decimalValue = 'D';
            case '14'
                decimalValue = 'E';
            case '15'
                decimalValue = 'F';
        end
    end
end