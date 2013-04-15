//$Id: mux.genpp,v 1.10 2006/06/19 10:38:25 smd Exp $
//CONFIDENTIAL  AND  PROPRIETARY SOFTWARE OF ARM Physical IP, INC.
//
//Copyright (c) 1993-2006  ARM Physical IP, Inc.  All  Rights Reserved.
//
//Use of this Software is subject to the terms and conditions  of the
//applicable license agreement with ARM Physical IP, Inc.  In addition,
//this Software is protected by patents, copyright law and international
//treaties.
//
//The copyright notice(s) in this Software does not indicate actual or
//intended publication of this Software.
//

`timescale 1ns/1ps
`celldefine
module MXI2X1TS (Y, A, B, S0);
output Y;
input A, B, S0;

  udp_mux2 u0(YN, A, B, S0);
  not      u1(Y, YN);
/*  specify
    // delay parameters
    specparam
      tplh$A$Y = 1.0,
      tphl$A$Y = 1.0,
      tplh$B$Y = 1.0,
      tphl$B$Y = 1.0,
      tplh$S0$Y = 1.0,
      tphl$S0$Y = 1.0;
    // path delays
     if ((A == 1'b1) && (B == 1'b0))
	(S0 *> Y) = (tplh$S0$Y, tphl$S0$Y);
     if ((A == 1'b0) && (B == 1'b1))
	(S0 *> Y) = (tplh$S0$Y, tphl$S0$Y);
    if (B == 1'b0 && S0 == 1'b0 )
       (A *> Y) = (tplh$A$Y, tphl$A$Y); 
    if (B == 1'b1 && S0 == 1'b0 )
       (A *> Y) = (tplh$A$Y, tphl$A$Y); 
    if (A == 1'b0 && S0 == 1'b1 )
       (B *> Y) = (tplh$B$Y, tphl$B$Y); 
    if (A == 1'b1 && S0 == 1'b1 )
       (B *> Y) = (tplh$B$Y, tphl$B$Y);
  endspecify  */

endmodule // MXI2X1TS
`endcelldefine
