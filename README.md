# Pipe Cleaner Robot
This project envolves create a simulated robot to "clean" a pipe using the DE2-115 FPGA. As part of this project we expect implement a VGA as video interface and a megadrive controller to change the map in real time.
## SETUP

1. if PLL files don't work (and probably won't), try to create your own PLL from IP catalog;

## Issues
1. if modelsim don't simulate the IP PLL module cause "altpll module was not found" or something like that try to copy and paste this command on the modelsim terminal:  ```vsim -L altera_mf_ver -t ps work.<toplevel>```
