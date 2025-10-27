# script to remember how i got the synthesis numbers


# 1. open the vivado and open the project up
# 2. right click the adder file (like rca.sv) and do "Set as Top"
# 3. go to Settings -> General -> Generics/Parameters and change N to the size (8, 16, etc) and keep doing it for all the bits.
# 4. click the "Run Synthesis" and then wait for it
# 5. after it finishes open the "Report Utilization" and find the "Slice LUTs Used" number then write it down anywhere
# 6. then open the "Report Timing Summary" and go find Unconstrained Paths -> Setup and write down the "Total Delay" for the first path.
# 7. put all the numbers in results.md

echo "Hello just follow these steps inside this script file in vivado to get the LUTs and delay for each adder."
echo "Then put the numbers in results.md"