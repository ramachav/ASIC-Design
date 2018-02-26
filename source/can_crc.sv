// $Id: $
// File name:   can_crc.sv
// Created:     11/30/2017
// Author:      Sang Hun Kim
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: can_crc
 
module can_crc
  (
   input wire	     data,
   input wire	     crc_en,
   input wire	     clk,
   input wire 	     n_rst,
   output reg [14:0] crc_out
   );

   wire 	 crc_next;
   wire [14:0] 	 crc_temp;

   assign crc_temp = {crc_out[13:0],data};

	//CALCULATION FOR CAN-Cyclic Redundancy Check value (15bit)
	//CRC polynomial = 0x4599.
   always_ff @ (posedge clk, negedge n_rst)
     begin
	if (n_rst == 1'b0)
	  begin
	     crc_out <= '0;
	  end
	else if (crc_en)
	  begin	 
	       crc_out <= crc_temp ^ 15'b0100010110011001;
	  end
     end // always_ff @
endmodule // can_crc
