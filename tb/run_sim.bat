@echo off
setlocal

REM this basically just adds the Vivado tools to the path
set VIVADO_BIN=C:\Xilinx\Vivado\2018.2\bin
set PATH=%VIVADO_BIN%;%PATH%

echo.
REM this compilies all the verilog files
echo --- Verilog Files ---
call xvlog.bat -sv ^
  "C:/Users/yilm2330/OneDrive - University of St. Thomas/Desktop/adder-Test2/adder_rtl/cla.sv" ^
  "C:/Users/yilm2330/OneDrive - University of St. Thomas/Desktop/adder-Test2/adder_rtl/cla_4bit.sv" ^
  "C:/Users/yilm2330/OneDrive - University of St. Thomas/Desktop/adder-Test2/adder_rtl/fulladder.sv" ^
  "C:/Users/yilm2330/OneDrive - University of St. Thomas/Desktop/adder-Test2/adder_rtl/pg_combine.sv" ^
  "C:/Users/yilm2330/OneDrive - University of St. Thomas/Desktop/adder-Test2/adder_rtl/prefix.sv" ^
  "C:/Users/yilm2330/OneDrive - University of St. Thomas/Desktop/adder-Test2/adder_rtl/rca.sv" ^
  "C:/Users/yilm2330/OneDrive - University of St. Thomas/Desktop/adder-Test2/tb/tb_adders.sv"

echo.
echo --- Getting the design ---
call xelab.bat tb_adders -debug typical -s sim_tb

echo.
echo --- Running the simulation ---
call xsim.bat sim_tb -runall
REM so this just runs the testbench until it reaches $finish or simulation end

echo.
echo Done Running
pause
