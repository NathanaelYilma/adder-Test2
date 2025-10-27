# Adder results

Ok so this is the info i got from running synthesis in vivado. I tested the rca, cla, and the prefix adders for 8, 16, 32, and 64 bits.

## Numbers

Here's the data i wrote down:

| Adder   | Width | LUTs | Delay (ns) | Fmax (MHz)       |
| ------- | ----- | ---- | ---------- |  --------------- |
| RCA     | 8     | 8    | 7.108      | 140.7            |
| RCA     | 16    | 16   | 9.472      | 105.6            |
| RCA     | 32    | 32   | 14.200     | 70.4             |
| RCA     | 64    | 64   | 23.856     | 41.9             |
| CLA     | 8     | 8    | 7.126      | 140.3            |
| CLA     | 16    | 16   | 9.472      | 105.6            |
| CLA     | 32    | 32   | 14.114     | 70.9             |
| CLA     | 64    | 64   | 23.442     | 42.7             |
| Prefix  | 8     | 13   | 7.134      | 140.2            |
| Prefix  | 16    | 29   | 9.498      | 105.3            | 
| Prefix  | 32    | 138  | 8.190      | 122.1            |
| Prefix  | 64    | 365  | 9.178      | 109.0            |


## What i think it means

### The Speed and Delay

* **RCA:** Gets slower the bigger it gets which makes sense cause the carry has to go all the way down the line and it looks like it just keeps adding delay for more bits.

* **CLA:** Kinda the same as rca for the small ones and its supposed to be faster but maybe the way i built it with ripple between blocks makes it not that much better until its really big? The 32 and 64 bit ones are a slighty a bit faster than rca but barely.

* **Prefix:** This one is weird its slowish for 8 and 16 bits but then gets way faster for 32 and 64 bits compared to the others and that parallel thing it does seems to really work when the adder is big.
 


### Size (LUTs)

* **RCA:** its super simple basically it uses exactly N LUTs for N bits.

* **CLA:** Used the same number of LUTs as the RCA (N LUTs).

* **Prefix:** Uses a lot more LUTs for the 32 and the 64 bits.




### Which one is the best?

* **RCA:** Use if you need something small and simple and dont really care much about speed (like for maybe 8 bits or 16 bits).

* **CLA:** probably the best overall becasue faster than rca for big sizes and kinda the same size so its not bad.

* **Prefix:** this is def the fastest for 32 and 64 bits but uses way more space so I would say only use this if you realy need the speed.