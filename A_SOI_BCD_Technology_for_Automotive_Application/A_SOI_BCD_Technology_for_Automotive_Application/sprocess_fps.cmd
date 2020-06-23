##SOI Wafer
math coord.ucs
math numThreads=8

line x location= 0.0		 spacing= 0.5<nm>	tag= Top
line x location= 0.1<um>	 spacing= 0.5<um>	tag= OxTop	
line x location= 0.2<um>	 spacing= 0.5<um>	tag= SiTop
line x location= 0.4<um> 	 spacing= 0.8<um> 	tag= Bottom

line y location= 0.0		spacing= 50.0<nm>	tag= Left	
line y location= 0.86<um>	spacing= 50.0<nm>	tag= Right

region Silicon	xlo= SiTop	xhi= Bottom	ylo= Left	yhi= Right
region Oxide	xlo= OxTop	xhi= SiTop	ylo= Left	yhi= Right
region Silicon	xlo= Top	xhi= OxTop	ylo= Left	yhi= Right	field=Phosphorus concentration=1e15

init wafer.orient=100 !DelayFullD

struct tdr=n@node@_1_BOX

##Epitaxy

diffuse temperature =500 time= 30<min> LTE epi.doping.final= {Boron= 1e15} epi.thickness= 0.5<um>

struct tdr=n@node@_2_Epi

##DTI

mask name= DTI_mask left=0.06 right=0.8
etch material= {Silicon} type=anisotropic thickness= 0.75<um> mask= DTI_mask 

deposit material= {Oxide} type= anisotropic thickness=0.75 mask= DTI_mask

struct tdr=n@node@_3_DTI
