module divisorDeFrequencia_TB;
    reg clk;
    wire clkDiv;
    
    divisorDeFrequencia divisorDeFrequencia(
        .clk(clk),
        .clkDiv(clkDiv)
    );

    initial begin
        clk = 0;
        #5;
        forever #5 clk = ~clk;
    end

endmodule


module segDisplayControl_TB;
    reg [3:0] number;
    wire [6:0] segment;

    segDisplayControl segDisplayControl(
        .number(number),
        .segment(segment)
    );

    initial begin
        number = 0;
        #10;
        number = 1;
        #10;
        number = 2;
        #10;
        number = 3;
        #10;
        number = 4;
        #10;
        number = 5;
        #10;
        number = 6;
        #10;
        number = 7;
        #10;
        number = 8;
        #10;
        number = 9;
        #10;
        number = 10; // Valor inválido, deve exibir OFF
        #10;
        number = 15; // Valor inválido, deve exibir OFF
        #10;
        number = 14; // Valor inválido, deve exibir OFF
        #10;
        number = 11; // Valor inválido, deve exibir OFF
        #10;
        number = 12; // Valor inválido, deve exibir OFF
        #10;
        number = 13; // Valor inválido, deve exibir OFF
        #10;
        number = 0;
        #10;
        number = 9;
        #10;
        number = 5;
        #10;
        number = 2;
        #10;
        number = 7;
        #10;
        number = 4;
        #10;
        number = 1;
        #10;
        number = 3;
        #10;
        number = 6;
        #10;
        number = 8;
        #10;
        number = 10; // Valor inválido, deve exibir OFF
        #10;
        number = 15; // Valor inválido, deve exibir OFF
        #10;
        number = 14; // Valor inválido, deve exibir OFF
        #10;
        number = 11; // Valor inválido, deve exibir OFF
        #10;
        number = 12; // Valor inválido, deve exibir OFF
        #10;
        number = 13; // Valor inválido, deve exibir OFF
        #10;
        number = 0;
        #10;
        number = 9;
        #10;
        number = 5;
        #10;
        number = 2;
        #10;
        number = 7;
        #10;
        number = 4;
        #10;
        number = 1;
        #10;
        number = 3;
        #10;
        number = 6;
        #10;
        number = 8;
        #10;
        number = 10; // Valor inválido, deve exibir OFF
        #10;
        number = 15; // Valor inválido, deve exibir OFF
        #10;
        number = 14; // Valor inválido, deve exibir OFF
        #10;
        number = 11; // Valor inválido, deve exibir OFF
        #10;
        number = 12; // Valor inválido, deve exibir OFF
        #10;
        number = 13; // Valor inválido, deve exibir OFF
        #10;
        number = 0;
        #10;
        number = 9;
        #10;
        number = 5;
        #10;
        number = 2;
        #10;
        number = 7;
        #10;
        number = 4;
        #10;
        number = 1;
        #10;
        number = 3;
        #10;
        number = 6;
        #10;
        number = 8;
        #10;
        number = 10; // Valor inválido, deve exibir OFF
        #10;
        number = 15; // Valor inválido, deve exibir OFF
        #10;
        number = 14; // Valor inválido, deve exibir OFF
        #10;
        number = 11; // Valor inválido, deve exibir OFF
        #10;
        number = 12; // Valor inválido, deve exibir OFF
        #10;
        number = 13; // Valor inválido, deve exibir OFF
        #10;
        $finish;
    end
endmodule


module moduleSeveSegmentDisplay_TB;
    reg [3:0] number;
    reg [3:0] number2;
    reg clk;
    wire [6:0] segment;

    moduleSeveSegmentDisplay moduleSeveSegmentDisplay(
        .clk(clk),
        .number(number),
        .number2(number2),
        .segment(segment)
    );

    initial begin
        clk = 0;
        number = 0;
        number2 = 0;
        #5;
        number = 1;
        number2 = 2;
        #10;
        number = 3;
        number2 = 4;
        #10;
        number = 5;
        number2 = 6;
        #10;
        number = 7;
        number2 = 8;
        #10;
        number = 9;
        number2 = 10; // Deve exibir OFF
        #10;
        number = 11; // Deve exibir OFF
        number2 = 12; // Deve exibir OFF
        #10;
        number = 13; // Deve exibir OFF
        number2 = 14; // Deve exibir OFF
        #10;
        number = 15; // Deve exibir OFF
        number2 = 0;
        #10;
        number = 0;
        number2 = 9;
        #10;
        number = 5;
        number2 = 2;
        #10;
        number = 7;
        number2 = 4;
        #10;
        number = 1;
        number2 = 3;
        #10;
        number = 6;
        number2 = 8;
        #10;
        number = 10; // Deve exibir OFF
        number2 = 11; // Deve exibir OFF
        #10;
        number = 12; // Deve exibir OFF
        number2 = 13; // Deve exibir OFF
        #10;
        number = 14; // Deve exibir OFF
        number2 = 15; // Deve exibir OFF
        #10;
        $finish;
    end
endmodule


module countSecondFirstDigit_TB;
    reg clk;
    reg rst;
    wire [3:0] second;

    countSecondFirstDigit countSecondFirstDigit(
        .clk(clk),
        .rst(rst),
        .second(second)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5;
        rst = 1;
        #10;
        rst = 0;
        #20;
        rst = 1;
        #5;
        rst = 0;
        #30;
        $finish;
    end
endmodule


module countSecondSecondDigit_TB;
    reg clk;
    reg rst;
    wire [3:0] second;

    countSecondSecondDigit countSecondSecondDigit(
        .clk(clk),
        .rst(rst),
        .second(second)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5;
        rst = 1;
        #10;
        rst = 0;
        #20;
        rst = 1;
        #5;
        rst = 0;
        #30;
        $finish;
    end
endmodule


module countMinuteFirstDigit_TB;
    reg clk;
    reg rst;
    wire [3:0] minute;

    countMinuteFirstDigit countMinuteFirstDigit(
        .clk(clk),
        .rst(rst),
        .minute(minute)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5;
        rst = 1;
        #10;
        rst = 0;
        #60;
        rst = 1;
        #5;
        rst = 0;
        #70;
        $finish;
    end
endmodule


module countMinuteSecondDigit_TB;
    reg clk;
    reg rst;
    wire [3:0] minute;

    countMinuteSecondDigit countMinuteSecondDigit(
        .clk(clk),
        .rst(rst),
        .minute(minute)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5;
        rst = 1;
        #10;
        rst = 0;
        #60;
        rst = 1;
        #5;
        rst = 0;
        #70;
        $finish;
    end
endmodule


module countHourFirstDigit_TB;
    reg clk;
    reg rst;
    wire [3:0] hour;

    countHourFirstDigit countHourFirstDigit(
        .clk(clk),
        .rst(rst),
        .hour(hour)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5;
        rst = 1;
        #10;
        rst = 0;
        #3600;
        rst = 1;
        #5;
        rst = 0;
        #3700;
        $finish;
    end
endmodule


module countHourSecondDigit_TB;
    reg clk;
    reg rst;
    wire [3:0] hour;

    countHourSecondDigit countHourSecondDigit(
        .clk(clk),
        .rst(rst),
        .hour(hour)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5;
        rst = 1;
        #10;
        rst = 0;
        #3600;
        rst = 1;
        #5;
        rst = 0;
        #3700;
        $finish;
    end
endmodule


module relogio_TB;
    reg clk;
    reg rst;
    wire led;
    wire [6:0] f1;
    wire [6:0] f2;
    wire [6:0] f3;
    wire [6:0] f4;

    relogio relogio(
        .clk(clk),
        .rst(rst),
        .led(led),
        .f1(f1),
        .f2(f2),
        .f3(f3),
        .f4(f4)
    );

    initial begin
        clk = 0;
        rst = 0;
        #5;
        rst = 1;
        #10;
        rst = 0;
        #200;
        rst = 1;
        #5;
        rst = 0;
        #210;
        $finish;
    end
endmodule


module top_TB;
    reg clk;
    wire clkDiv;
    wire [3:0] countSecondFirstDigitWire;
    wire [3:0] countSecondSecondDigitWire;
    wire [3:0] countMinuteFirstDigitWire;
    wire [3:0] countMinuteSecondDigitWire;
    wire [3:0] countHourFirstDigitWire;
    wire [3:0] countHourSecondDigitWire;
    wire [6:0] segment;

    divisorDeFrequencia divisorDeFrequencia(
        .clk(clk),
        .clkDiv(clkDiv)
    );

    countSecondFirstDigit countSecondFirstDigit(
        .clk(clkDiv),
        .rst(~clkDiv),
        .second(countSecondFirstDigitWire)
    );

    countSecondSecondDigit countSecondSecondDigit(
        .clk(clkDiv),
        .rst(~clkDiv),
        .second(countSecondSecondDigitWire)
    );

    countMinuteFirstDigit countMinuteFirstDigit(
        .clk(clkDiv),
        .rst(~clkDiv),
        .minute(countMinuteFirstDigitWire)
    );

    countMinuteSecondDigit countMinuteSecondDigit(
        .clk(clkDiv),
        .rst(~clkDiv),
        .minute(countMinuteSecondDigitWire)
    );

    countHourFirstDigit countHourFirstDigit(
        .clk(clkDiv),
        .rst(~clkDiv),
        .hour(countHourFirstDigitWire)
    );

    countHourSecondDigit countHourSecondDigit(
        .clk(clkDiv),
        .rst(~clkDiv),
        .hour(countHourSecondDigitWire)
    );

    moduleSeveSegmentDisplay moduleSeveSegmentDisplay(
        .clk(clkDiv),
        .number(countHourFirstDigitWire),
        .number2(countMinuteFirstDigitWire),
        .segment(segment)
    );

    initial begin
        clk = 0;
        #5;
        forever #5 clk = ~clk;
    end

endmodule


module testbench;
    divisorDeFrequencia_TB divisorDeFrequencia_TB();
    segDisplayControl_TB segDisplayControl_TB();
    moduleSeveSegmentDisplay_TB moduleSeveSegmentDisplay_TB();
    countSecondFirstDigit_TB countSecondFirstDigit_TB();
    countSecondSecondDigit_TB countSecondSecondDigit_TB();
    countMinuteFirstDigit_TB countMinuteFirstDigit_TB();
    countMinuteSecondDigit_TB countMinuteSecondDigit_TB();
    countHourFirstDigit_TB countHourFirstDigit_TB();
    countHourSecondDigit_TB countHourSecondDigit_TB();
    relogio_TB relogio_TB();
    top_TB top_TB();
endmodule
