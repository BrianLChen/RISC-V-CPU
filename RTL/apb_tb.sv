module tb_apb_bus;
timeunit 1ns;
timeprecision 100ps;
    // Parameters
    localparam ADDR_WIDTH = 32;

    // Testbench signals
    logic PCLK;
    logic PRESETn;

    logic HSEL;
    logic [ADDR_WIDTH-1:0] HADDR;
    logic HWRITE;
    logic [3:0] HBE;
    logic [31:0] HWDATA;
    logic [31:0] HRDATA;

    logic HREADY;

    logic PSEL1;
    logic PENABLE_S1;
    logic PREADY_S1;
    logic [ADDR_WIDTH-1:0] PADDR_S1;
    logic PWRITE_S1;
    logic [3:0] PBE_S1;

    logic [31:0] PWDATA_S1;
    logic [31:0] PRDATA_S1;

    // Clock generation
    initial begin
        PCLK = 0;
        forever #10 PCLK = ~PCLK; // 100MHz clock
    end

    // Reset generation
    initial begin
        PRESETn = 0;
        #40 PRESETn = 1; // Release reset after some delay
    end

    // DUT (Device Under Test) instantiation
    apb_bus #(.ADDR_WIDTH(ADDR_WIDTH)) uut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .HSEL(HSEL),
        .HADDR(HADDR),
        .HWRITE(HWRITE),
        .HBE(HBE),
        .HWDATA(HWDATA),
        .HRDATA(HRDATA),
        .HREADY(HREADY),
        .PSEL1(PSEL1),
        .PENABLE_S1(PENABLE_S1),
        .PREADY_S1(PREADY_S1),
        .PADDR_S1(PADDR_S1),
        .PWRITE_S1(PWRITE_S1),
        .PBE_S1(PBE_S1),
        .PWDATA_S1(PWDATA_S1),
        .PRDATA_S1(PRDATA_S1)
    );

    // Test sequence
    initial begin
        // Initialize inputs
        HSEL = 0;
        HADDR = 32'h0;
        HWRITE = 0;
        HBE = 4'b1111;
        HWDATA = 32'h0;
        HREADY = 1;
        PREADY_S1 = 1;
        PRDATA_S1 = 32'h0;

        // Wait for reset deassertion

        // Test case: Write operation
        #20
        HSEL = 1;
        HADDR = 32'h4000d004;
        HWRITE = 1;
        HBE = 4'b1111;
        HWDATA = 32'hA5A5A5A5;


        #100 $finish;
    end

endmodule
