module divisorDeFrequencia(
    input clk,
    output reg clkDiv
);
    // Divisor de frequencia de 50MHz para 1Hz
    reg [25:0] count;
    always @(posedge clk) begin
        if (count == 14999999) begin
            count <= 0;
            clkDiv <= ~clkDiv;
        end
        else begin
            count <= count + 1;
        end
    end
endmodule


module moduleSeveSegmentDisplay(
    input [3:0] number,
    input [3:0] number2,
    input clk,
    output reg [6:0] segment
);

    reg selectionSegment = 0;
    reg [3:0] counter = 0;

    // 7 segment display switch Case

    always @(posedge clk) begin
        if(counter == 4'b1111) begin
            counter <= 0;
            selectionSegment <= ~selectionSegment;
        end else begin
            counter <= counter + 1;
        end
    end

    always @(*) begin
        if(selectionSegment) begin
            if (number == 4'b0000) segment = 7'b1000000; // 0
            else if (number == 4'b0001) segment = 7'b1111001; // 1
            else if (number == 4'b0010) segment = 7'b0100100; // 2
            else if (number == 4'b0011) segment = 7'b0110000; // 3
            else if (number == 4'b0100) segment = 7'b0011001; // 4
            else if (number == 4'b0101) segment = 7'b0010010; // 5
            else if (number == 4'b0110) segment = 7'b0000010; // 6
            else if (number == 4'b0111) segment = 7'b1111000; // 7
            else if (number == 4'b1000) segment = 7'b0000000; // 8
            else if (number == 4'b1001) segment = 7'b0010000; // 9
            else segment = 7'b1111111; // OFF
        end else begin
            if (number2 == 4'b0000) segment = 7'b1000000; // 0
            else if (number2 == 4'b0001) segment = 7'b1111001; // 1
            else if (number2 == 4'b0010) segment = 7'b0100100; // 2
            else if (number2 == 4'b0011) segment = 7'b0110000; // 3
            else if (number2 == 4'b0100) segment = 7'b0011001; // 4
            else if (number2 == 4'b0101) segment = 7'b0010010; // 5
            else if (number2 == 4'b0110) segment = 7'b0000010; // 6
            else if (number2 == 4'b0111) segment = 7'b1111000; // 7
            else if (number2 == 4'b1000) segment = 7'b0000000; // 8
            else if (number2 == 4'b1001) segment = 7'b0010000; // 9
            else segment = 7'b1111111; // OFF
        end
    end
endmodule


module countSecondFirstDigit(
    input clk,
    input rst,
    output [3:0] second
);

    // Contador de segundos
    reg [3:0] countSecond;

    always @(posedge clk) begin
        if (rst == 1) begin
            countSecond <= 0;
        end
        else begin
            if (countSecond == 9) begin
                countSecond <= 0;
            end
            else begin
                countSecond <= countSecond + 1;
            end
        end
    end

    assign second = countSecond;
endmodule

module countSecondSecondDigit(
    input clk,
    input rst,
    output [3:0] second
);

    reg [3:0] countSecond;
    reg [3:0] countSecondFirstDigit;

    always @(posedge clk) begin
        if (rst) begin
            countSecondFirstDigit <= 0;
            countSecond <= 0;
        end
        else if (countSecondFirstDigit == 4'b1001) begin
            countSecondFirstDigit <= 0;
            if(countSecond == 4'd5) begin
                countSecond <= 0;
            end
            else begin
                countSecond <= countSecond + 1'b1;
            end
        end
        else begin
            countSecondFirstDigit <= countSecondFirstDigit + 1'b1;
        end
    end

    assign second = countSecond;
endmodule

module countMinuteFirstDigit(
    input clk, //segundos
    input rst,
    output [3:0] minute
);

    // Contador de minutos

    reg [7:0] countSecond;
    reg [3:0] countMinute;

    always @(posedge clk) begin
        if (rst == 1) begin
            countMinute <= 0;
            countSecond <= 0;
        end
        else begin
            if(countMinute == 9) begin
                countMinute <= 0;
            end
            else if (countSecond == 59) begin
                countMinute <= countMinute + 1;
                countSecond <= 0;
            end
            else begin
                countSecond <= countSecond + 1;
            end
        end
    end

    assign minute = countMinute;
endmodule

module countMinuteSecondDigit(
    input clk,
    input rst,
    output [3:0] minute
);
    reg [7:0]countSecond;
    reg [3:0] countMinute;
    reg [3:0] countMinuteFirstDigit;

    always @(posedge clk) begin
        if (rst == 1) begin
            countMinuteFirstDigit <= 0;
            countMinute <= 0;
            countSecond <= 0;
        end
        else begin
            if(countMinute == 5) begin
                countMinute <= 0;
            end
            if(countMinuteFirstDigit == 9) begin
                countMinuteFirstDigit <= 0;
                countMinute <= countMinute + 1;
            end else if (countSecond == 59) begin
                countMinuteFirstDigit <= countMinuteFirstDigit + 1;
                countSecond <= 0;
            end
            else begin
                countSecond <= countSecond + 1;
            end
        end
    end

    assign minute = countMinute;
endmodule


module countHourFirstDigit(
    input clk,
    input rst,
    output [3:0] hour
);

    // Contador de horas
    reg [12:0] countSecond;
    reg [3:0] countHour;
    reg filterFirstHourPass = 0;
    always @(posedge clk) begin
        if (rst == 1) begin
            countHour <= 0;
            countSecond <= 0;
            filterFirstHourPass <= 0;
        end
        else begin
            if(countHour == 9 && ~filterFirstHourPass)begin
                countHour <= 0;
                filterFirstHourPass <= 1;
            end
            else if(countHour == 2 && filterFirstHourPass)begin
                countHour <= 0;
                filterFirstHourPass <= 0;
            end
            if (countHour == 3599) begin
                countHour <= countHour + 1;
                countSecond <= 0;
            end
            else begin
                countSecond <= countSecond + 1;
            end
        end
    end
    

    assign hour = countHour;

endmodule

module countHourSecondDigit(
    input clk,
    input rst,
    output [3:0] hour
);

    reg [12:0] countSecond;
    reg [3:0] countHourFirstDigit;
    reg [3:0] countHour;

    reg filterFirstHourPass = 0;

    always @(posedge clk) begin
        if (rst == 1) begin
            countHourFirstDigit <= 0;
            filterFirstHourPass <= 0;
            countHour <= 0;
            countSecond <= 0;
        end
        else begin
            if(countHour == 1)begin
                countHour <= 0;
            end 
            else if(countHourFirstDigit == 9 && ~filterFirstHourPass)begin
                countHourFirstDigit <= 0;
                filterFirstHourPass <= 1;
                countHour <= countHour + 1;
            end
            else if(countHourFirstDigit == 2 && filterFirstHourPass)begin
                countHourFirstDigit <= 0;
                filterFirstHourPass <= 0;
            end
            if (countHourFirstDigit == 3599) begin
                countHourFirstDigit <= countHourFirstDigit + 1;
                countSecond <= 0;
            end
            else begin
                countSecond <= countSecond + 1;
            end
        end
    end
endmodule

module relogio(
    input clk,
    input rst,
    output  led,
    output [6:0] f1,
    output [6:0] f2,
    output [6:0] f3,
    output [6:0] f4
);

    
    wire [3:0] countSecondFirstDigitWire;
    wire [3:0] countSecondSecondDigitWire;
    wire [3:0] countMinuteFirstDigitWire;
    wire [3:0] countMinuteSecondDigitWire;
    wire [3:0] countHourFirstDigitWire;
    wire [3:0] countHourSecondDigitWire;

    wire clkDiv;

    //pulse led on every second
    
    assign led = clkDiv;

    //divisor de frequencia
    divisorDeFrequencia divisorDeFrequencia(
        .clk(clk),
        .clkDiv(clkDiv)
    );

    //Second
    countSecondFirstDigit countSecondFirstDigitModule(
        .clk(clkDiv),
        .rst(~rst),
        .second(countSecondFirstDigitWire)
    );
    
    countSecondSecondDigit countSecondSecondDigitModule(
        .clk(clkDiv),
        .rst(~rst),
        .second(countSecondSecondDigitWire)
    );

    //Minute
    countMinuteFirstDigit countMinuteFirstDigiteModule(
        .clk(clkDiv),
        .rst(~rst),
        .minute(countMinuteFirstDigitWire)
    );

    countMinuteSecondDigit countMinuteSecondDigitModule(
        .clk(clkDiv),
        .rst(~rst),
        .minute(countMinuteSecondDigitWire)
    );

    //Hour

    countHourFirstDigit countHourFirstDigitModule(
        .clk(clkDiv),
        .rst(~rst),
        .hour(countHourFirstDigitWire)
    );

    countHourSecondDigit countHourSecondDigitModule(
        .clk(clkDiv),
        .rst(~rst),
        .hour(countHourSecondDigitWire)
    );
   
    // 7 segment display
    moduleSeveSegmentDisplay moduleSeveSegmentDisplay1(
        .clk(clkDiv),
        .number(countHourFirstDigitWire),
        .number2(countMinuteFirstDigitWire),
        .segment(f1)
    );

    moduleSeveSegmentDisplay moduleSeveSegmentDisplay2(
        .clk(clkDiv),
        .number(countHourSecondDigitWire),
        .number2(countMinuteSecondDigitWire),
        .segment(f2)
    );

    moduleSeveSegmentDisplay moduleSeveSegmentDispla3(
        .clk(clkDiv),
        .number(countMinuteFirstDigitWire),
        .number2(countSecondFirstDigitWire),
        .segment(f3)
    );

    moduleSeveSegmentDisplay moduleSeveSegmentDisplay4(
        .clk(clkDiv),
        .number(countMinuteSecondDigitWire),
        .number2(countSecondSecondDigitWire),
        .segment(f4)
    );

endmodule