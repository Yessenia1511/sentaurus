math coord.ucs
math numThreads=8

line x location= 3.0<um>	 spacing= 0.5<um>	tag= Top
line x location= 6.0<um>	 spacing= 0.5<um>	tag= OxTop	
line x location= 9.0<um> 	 spacing= 0.8<um> 	tag= Bottom
line y location= 0.0<um>	 spacing= 0.1<um>		tag= Left	
line y location= 10.0<um>	 spacing= 0.1<um>		tag= Right


region Oxide	xlo= OxTop	xhi= Bottom 	ylo= Left	yhi= Right
region Silicon	xlo= Top	xhi= OxTop	ylo= Left	yhi= Right field= Boron concentration=1e12<cm-3>
	
init wafer.orient=100 !DelayFullD

struct tdr=n1_1_BOX


diffuse temperature =500 time= 30<min> LTE epi.doping.final= {Boron= 1e15} epi.thickness= 3.0<um>

struct tdr=n1_2_Epi


mask name= DTI_mask1 left= 1.0 right= 9
etch material= {Silicon} type= anisotropic thickness= 6.0<um> mask=  DTI_mask1
deposit material= {Oxide} type= fill coord=0 


struct tdr=n1_3_DTI



mask name=NWell_mask left=5.2 right=9.0
photo mask=NWell_mask thickness= 3.0<um>
implant Phosphorus dose= 9.5e11<cm-2> energy= 650<keV> tilt= 0 rotation= 0 sentaurus.mc
implant Phosphorus dose= 1e11<cm-2> energy= 300<keV>  tilt= 0 rotation= 0 sentaurus.mc
implant Phosphorus dose= 3e11<cm-2> energy= 50<keV>  tilt= 0 rotation= 0 sentaurus.mc
strip photoresist
diffuse temp= 1150<C> time=10<s> Adaptive
struct tdr=n1_4_NWell


mask name=5VPWell_mask left=1 right=2.4

photo mask=5VPWell_mask thickness= 3.0<um>
implant Boron dose=1e11<cm-2> energy=600<keV> tilt= 0 rotation= 0 sentaurus.mc
strip photoresist


struct tdr=n1_5_5VPWell


mask name=STI_mask1 negative left=5.4 right=8
deposit material= {Oxide} type=anisotropic thickness=0.1<um>
etch material= {Oxide} type=anisotropic thickness=0.1<um> mask=STI_mask1
etch material= {Silicon} type=trapezoidal thickness=0.5 angle=85
mask name=STI_mask2 left=5.4 right=8
etch material= {Oxide} type=anisotropic thickness=0.1<um> mask=STI_mask2
deposit material= {Oxide} type=fill coord=0<um>  


struct tdr=n1_6_STI

deposit material= {Oxide} type=anisotropic thickness=0.03<um>
mask name=gate_mask left=3.4<um> right=5.5<um>
deposit material= {PolySilicon} type= anisotropic thickness=0.3
etch material= {PolySilicon} type=anisotropic thickness= 0.4<um> mask= gate_mask

diffuse temp= 900<C> time= 10<min> O2 Adaptive

struct tdr=n1_7_Polygate

mask name= Bulk_mask left= 1<um> right= 2.2<um>
etch material= {Oxide} type=anisotropic thickness= 0.04
photo mask= Bulk_mask thickness=3.0<um>
implant Boron dose= 8e12<cm-2> energy=100 tilt=0 rotation=0 sentaurus.mc
implant Boron dose= 2e12<cm-2> energy=50 tilt=7 rotation=22 sentaurus.mc
strip photoresist

struct tdr=n1_8_Bulk

mask name= Drain_mask left= 8.0<um> right= 9<um>
photo mask= Drain_mask thickness=3.0<um>
##implant Arsenic dose= 8e14<cm-2> energy=100 tilt=0 rotation=0 sentaurus.mc
implant Arsenic dose= 1e12<cm-2> energy=25 tilt=0 rotation=0 sentaurus.mc
strip photoresist

mask name= Source_mask left= 2.5<um> right= 5.5<um>
photo mask= Source_mask thickness=3.0<um>
##implant Arsenic dose= 1e15<cm-2> energy=100 tilt=0 rotation=0 sentaurus.mc
implant Arsenic dose= 1e12<cm-2> energy=25 tilt=0 rotation=0 sentaurus.mc
strip photoresist
diffuse temperature= 1050 time= 5<s>

refinebox Silicon min= {-0.4 1} max= {0.4 9} xrefine= {0.01 0.01 0.01}	yrefine= {0.05 0.05 0.05} add
refinebox Silicon min= {0.5 5.0} max= {3 9} xrefine= {0.01 0.01 0.01}	yrefine= {0.05 0.05 0.05} add
refinebox remesh

struct tdr=n1_9_SD




contact box Silicon name= source xlo= 0.02  ylo= 1.0 xhi= -0.02 yhi= 3.4
contact box Silicon name= drain xlo= 0.02 ylo= 8.0 xhi= -0.02 yhi= 9
contact box PolySilicon name= gate xlo= -0.3  ylo= 3.4 xhi= -0.4  yhi=5.5


struct tdr=n1








