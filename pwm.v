
module Variable_PWM(
    input [7:0] Dutycycle,
    input clk,
    output reg [7:0] counter,
    output pwmout
);

initial begin
    counter = 0;
end

always @(posedge clk)
begin
    if(counter < 99)
        counter <= counter + 1;
    else
        counter <= 0;
end

assign pwmout = (counter < Dutycycle);

endmodule
