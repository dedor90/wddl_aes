//$Id: comb.genpp,v 1.5 2006/06/13 06:01:59 smd Exp $
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
module OR2X2TS (Y, A, B);
output Y;
input A, B;

  or (Y, A, B);
 /* specify
    // delay parameters
    specparam
      tplh$A$Y = 1.0,
      tphl$A$Y = 1.0,
      tplh$B$Y = 1.0,
      tphl$B$Y = 1.0;

    // path delays
    (A *> Y) = (tplh$A$Y, tphl$A$Y);
    (B *> Y) = (tplh$B$Y, tphl$B$Y);
  endspecify  */
endmodule // OR2X2TS
`endcelldefine
