# TAREA3VLSI
GRUPO PARA LA TAREA 3 DE VLSI

NETLIST NAND

** Generated for: hspiceD
** Generated on: May 30 20:46:47 2025
** Design library name: tarea_3
** Design cell name: NANDX0_tb
** Design view name: schematic
.GLOBAL vss! vdd!


.TEMP 25
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    HIER_DELIM=0

** Library name: tarea_3
** Cell name: NANDX0
** View name: schematic
.subckt NANDX0 a b y
xm1 y b vdd! vdd! pe w=440e-9 l=180e-9 as=211.2e-15 ad=211.2e-15 ps=1.84e-6 pd=1.84e-6 nrs=613.636e-3 nrd=613.636e-3 m=1 par1=1
xm0 y a vdd! vdd! pe w=440e-9 l=180e-9 as=211.2e-15 ad=211.2e-15 ps=1.84e-6 pd=1.84e-6 nrs=613.636e-3 nrd=613.636e-3 m=1 par1=1
xm3 net12 b vss! vss! ne w=220e-9 l=180e-9 as=105.6e-15 ad=105.6e-15 ps=1.4e-6 pd=1.4e-6 nrs=1.22727 nrd=1.22727 m=1 par1=1 xf_subext=0
xm2 y a net12 vss! ne w=220e-9 l=180e-9 as=105.6e-15 ad=105.6e-15 ps=1.4e-6 pd=1.4e-6 nrs=1.22727 nrd=1.22727 m=1 par1=1 xf_subext=0
.ends NANDX0
** End of subcircuit definition.

** Library name: tarea_3
** Cell name: NANDX0_tb
** View name: schematic
xi0 net2 net1 net3 NANDX0
.END


