module floating_pint_multi_div_tb( );
reg  [31:0] a;
reg  [31:0] b;
reg  mode;          
wire [31:0] result;

floating_point_multi_div fpmuldiv (
    .a(a),
    .b(b),
    .mode(mode),
    .result(result)
);

initial begin

    a = 32'h40B00000;
    b = 32'h40100000;
    mode = 0; 
    #20;


    mode = 1;   
    #20;


    a = 32'h40100000;
    b = 32'h40B00000;
    mode = 1;
    #20;


    a = 32'h40600000;
    b = 32'h40600000;
    mode = 0;
    #20;


    a = 32'h41000000;
    b = 32'h40000000;
    mode = 1;
    #20;

   mode = 0; 

    a = 32'h40B00000;   
    b = 32'h40100000;   
    #20;

    a = 32'h40600000;  
    b = 32'h40600000;   
    #20;

    $finish;

end

endmodule
