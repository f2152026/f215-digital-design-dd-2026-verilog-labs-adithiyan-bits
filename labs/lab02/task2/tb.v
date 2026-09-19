// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs

  // TODO: instantiate DUT here
  reg  [2:0] t_sel;
  wire [7:0] t_dout;
  integer i;
  integer errors;

  lut #(.WIDTH(8), .DEPTH(8)) DUT (
    .sel  (t_sel),
    .dout (t_dout)
  );
  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
    errors = 0;

    for (i = 0; i < 8; i = i + 1) begin
      t_sel = i;
      #1;

      if (t_dout !== (i * i)) begin
        $display("FAIL: sel=%0d got=%0d expected=%0d", i, t_dout, i * i);
        errors = errors + 1;
      end
    end

    if (errors == 0)
      $display("PASS: all %0d ROM values matched expected squares", 8);
    else
      $display("FAIL: %0d mismatch(es) detected", errors);

    $finish;
  end

  initial
    $monitor($time, " I0=%b I1=%b S=%b | Y=%b", t_i0, t_i1, t_s, t_y); // change as required

endmodule
