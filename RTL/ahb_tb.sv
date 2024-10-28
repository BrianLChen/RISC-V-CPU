module ahb_tb ();
timeunit 1ns;
timeprecision 100ps;

parameter ADDR_WIDTH=16;

logic HCLK, HRESETn;

logic [ADDR_WIDTH-1:0] HADDR_M1, HADDR_M2;
logic [31:0] HWDATA_M1, HWDATA_M2;
logic [31:0] HRDATA_M1, HRDATA_M2;
logic HBUSREQ1, HBUSREQ2;
logic HWRITE_M1, HWRITE_M2;
logic HLOCK1, HLOCK2;
logic HGRANT1, HGRANT2;
logic [3:0] HMASTER;
logic HMASTOCK;

logic HSEL1, HSEL2, HSEL3;
logic [ADDR_WIDTH-1:0] HADDR_S1, HADDR_S2, HADDR_S3;
logic HWRITE_S1, HWRITE_S2, HWRITE_S3;
logic [31:0] HRDATA_S1, HRDATA_S2, HRDATA_S3;
logic [31:0] HWDATA_S1, HWDATA_S2, HWDATA_S3;

logic HREADY, HREADYOUT;
logic PSEL1;
logic PREADY;
logic PWRITE;
logic [31:0] PWDATA;
logic [31:0] PRDATA;

ahb_bus ahb_bus1 (.HCLK, .HRESETn, .HADDR_M1, .HADDR_M2, .HWDATA_M1, .HWDATA_M2,
                    .HRDATA_M1, .HRDATA_M2, .HBUSREQ1, .HBUSREQ2, .HWRITE_M1, .HWRITE_M2,
                    .HLOCK1, .HLOCK2, .HGRANT1, .HGRANT2, .HMASTER, .HMASTOCK, .HSEL1, .HSEL2,
                    .HSEL3, .HADDR_S1, .HADDR_S2, .HADDR_S3, .HWRITE_S1, .HWRITE_S2, .HWRITE_S3,
                    .HRDATA_S1, .HRDATA_S2, .HRDATA_S3, .HWDATA_S1, 
                    .HWDATA_S2, .HWDATA_S3);

SRAM sram1 (.HCLK, .HRESETn, .HSEL(HSEL1),
            .HWDATA(HWDATA_S1), .HADDR(HADDR_S1), .HWRITE(HWRITE_S1),
            .HRDATA(HRDATA_S1));

apb_bus apb_bus1 (.PCLK(HCLK), .PRESETn(HRESETn), .HSEL(HSEL3), .HADDR(HADDR_S3),
                    .HWRITE(HWRITE_S3), .HWDATA(HWDATA_S3), .HRDATA(HRDATA_S3),
                    .HREADY, .HREADYOUT, .PSEL1, .PREADY, .PWRITE, .PWDATA, .PRDATA);

cv32e40p_top core_top (.clk_i(HCLK), .rst_ni(HRESETn), .instr_req_o(HBUSREQ1), .instr_gnt_i(HGRANT1));

mm_ram #() ram1 (.clk_i(HCLK), .rst_ni(HRESETn), 
            .instr_req_i(HBUSREQ1), .instr_addr_i(HADDR_S1), .instr_rdata_o(HRDATA_S2));

initial begin
    HCLK = 0;
    forever
    begin
        #21 HCLK = ~HCLK;
    end
end

initial begin
    HRESETn = 0;
    // HBUSREQ1 = 0;
    // HBUSREQ2 = 0;

    #42 HRESETn = 1;

    #21 
    // HBUSREQ1 = 1;
        HADDR_M1 = 32'h4000d000;
        HWRITE_M1 = 1;
        HWDATA_M1 = 32'h00001000;

    // #41 HBUSREQ1 = 0;
end
    
endmodule