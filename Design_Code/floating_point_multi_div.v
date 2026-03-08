module floating_point_multi_div(
    input  [31:0] a,
    input  [31:0] b,
    input  mode,   
    output [31:0] result

    );
        wire s_a = a[31];
    wire s_b = b[31];
    wire [7:0] exp_a = a[30:23];
    wire [7:0] exp_b = b[30:23];
    wire [23:0] man_a = {1'b1, a[22:0]};  
    wire [23:0] man_b = {1'b1, b[22:0]};  
    
    wire sign_result = s_a ^ s_b;
    reg  [7:0] exp_result;
    reg  [22:0] man_result;
    wire [47:0] mult_result;
    reg  [47:0] div_result;
    
    
assign mult_result = man_a * man_b;
    
    always @(*) begin
        exp_result = 0;
        man_result = 0;  
        if (a == 32'b0 || b == 32'b0) begin
            exp_result = 0;
            man_result = 0;
        end   
    
        else if (mode == 1'b0) begin
             exp_result = exp_a + exp_b - 8'd127;
            if (mult_result[47]) begin
                man_result = mult_result[46:24];
                exp_result = exp_result + 1;
            end 
            else begin
                man_result = mult_result[45:23];
            end
    
        end 
        else begin
               exp_result = exp_a - exp_b + 8'd127;
               div_result = (man_a << 23) / man_b;
                if (div_result[23]) begin
                    man_result = div_result[22:0];
                end 
                else begin
                    man_result = div_result[22: 0]<<1;
                    exp_result = exp_result - 1;
                end
            end
        end  
        assign result = {sign_result, exp_result, man_result};

endmodule
