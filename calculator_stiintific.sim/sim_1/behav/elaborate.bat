@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 378ece587b2c4162bf9e7712f00d0ae7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot signed_magnitude_adder_behav xil_defaultlib.signed_magnitude_adder -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
