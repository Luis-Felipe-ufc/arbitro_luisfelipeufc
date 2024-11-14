`timescale 1ns/10ps
module arbitro (req, grant, grant_num, available);
  input logic [3:0] req;
  output logic [3:0] grant;
  output logic [1:0] grant_num;
  output logic available;

always_comb begin
  
  available = 1'b0;
  
  if (req[3]) begin
    grant = 4'b1000;
    grant_num = 2'b11;
  
  end else if (req[2]) begin
  grant = 4'b0100;
    grant_num = 2'b10;

  end else if (req[1]) begin
  grant = 4'b0010;
    grant_num = 2'b01;

  end else if (req[0]) begin
  grant = 4'b0001;
    grant_num = 2'b00;

    end else begin
      grant = 4'b0000;
      grant_num = 2'bxx;
      available = 1'b1;
      
    end
end
endmodule
