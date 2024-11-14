`timescale 1ns/10ps
module arbitro_tb;
  logic [3:0] req, grant;
  logic [1:0] grant_num;
  logic available;
  
  // instantiating the module to map connections
  arbitro abt(.req(req), .grant(grant), .grant_num(grant_num), .available(available));
  
 initial begin
  integer i;
   for (i = 0; i < 16; i = i + 1) begin
    req = i;  
    #5;                    
  end
end
  
   initial
    begin
      $display("                        Entrada             Saídas");
      $display("                        =======   ===========================");
      $display("                 Tempo    req      grant  grant_num  available");
      $display("                 =====  =======   ===========================");
      $monitor($time,"      %b     %b       %d         %b  ",req, grant, grant_num, available);
    end
  
endmodule
