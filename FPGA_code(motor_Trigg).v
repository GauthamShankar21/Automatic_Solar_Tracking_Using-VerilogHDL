module Digital_Clock(
Clk_1sec, //Clock with 1 Hz frequency
reset, //active high reset
seconds,
minutes);
//What are the Inputs?
input Clk_1sec;
input reset;
//What are the Outputs?
output [5:0] seconds;
output [5:0] minutes;
//Internal variables.
reg [5:0] seconds;
reg [5:0] minutes;
integer count=0;
//Execute the always blocks when the Clock or reset inputs are
//changing from 0 to 1(positive edge of the signal)
always @(posedge(Clk_1sec) or posedge(reset))
begin
if(reset == 1'b1) begin //check for active high reset.
//reset the time.
seconds = 0;
minutes = 0; end
else if(Clk_1sec == 1'b1) begin //at the beginning of each second
seconds = seconds + 1; //increment sec
if(seconds == 60) begin //check for max value of sec
seconds = 0; //reset seconds
minutes = minutes + 1; //increment minutes
if(minutes == 60) begin //check for max value of min
minutes = 0;//reset minutes

VISVESWARAYA TECHNOLOGICAL UNIVERSITY

Dept.of EC, VCET, Puttur Page 14
$display($time,"time=%d",count);
if(minutes==0&&count<12) begin
motor a1(clk,hours,count);
$display($time,"rotate=%d",count);
end
if(count==12) begin
$display($time,"intial position");
end
count=count+1;
if(count==24)
count=0;
end
end
end
end
endmodule

module motor(clk,count,d_out);
input clk,count;
output[3:0]d_out;
reg[3:0]d_out;
reg[3:0]register=4’b1001;
integer n=8;
integer i=0;
always @posedge(clk)
begin
if(count==12)
begin
if(i<(n*12))
begin
register<={register[0],register[3:1]};
d_out=register;
i=i+1;
end

VISVESWARAYA TECHNOLOGICAL UNIVERSITY

Dept.of EC, VCET, Puttur Page 15
else
begin
if(i<n)
begin
register<={register[2:0],register[3]};
d_out=register;
i=i+1;
end end
assign d_out=register;
endmodule
