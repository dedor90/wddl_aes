//$Id: buf.genpp,v 1.3 2006/01/20 11:16:19 kvaz Exp $
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
module INVX2TS (Y, A);
output Y;
input A;

  not I0(Y, A);
/*  specify
    // delay parameters
    specparam
      tplh$A$Y = 1.0,
      tphl$A$Y = 1.0;

    // path delays
    (A *> Y) = (tplh$A$Y, tphl$A$Y);
  endspecify  */

endmodule // INVX2TS
`endcelldefine
