File {
   * input files:
   Grid=   "n1_fps.tdr"
   * output files:
   Plot=   "n2_des.tdr"
   Current="n2_des.plt"
   Output= "n2_des.log"
}

Electrode {
   { Name="source"    Voltage= 0.0 }
   { Name="drain"     Voltage= 0.0 }
   { Name="gate"      Voltage= 0.0 }

}

Physics{
   EffectiveIntrinsicDensity( OldSlotboom )     
}

Physics(Material="Silicon"){
   Mobility(
      PhuMob
      HighFieldSaturation
      Enormal
   )
   Recombination(
      SRH( DopingDependence )
   )           
}
Plot {
   eDensity hDensity eCurrent hCurrent
   SpaceCharge
}

Math { 
   Extrapolate
   Iterations= 100
   ExitOnFailure
}

Solve {
*- Creating initial guess:
   Coupled(Iterations= 100){ Poisson } 
   Coupled {Poisson Electron Hole}

*- Ramp to drain to Vd
   Quasistationary( 
      InitialStep= 0.1 Increment= 1.5 
      MinStep= 1e-10 MaxStep= 1 
      Goal { Name="drain" Voltage=1.0 } 
   ){ Coupled {Poisson Electron Hole} } 

*- Vg sweep 
   NewCurrentFile="IdVg_" 
   Quasistationary( 
      DoZero 
      InitialStep= 0.01 Increment= 1.5 
      MinStep= 1e-3 MaxStep= 0.05 
      Goal { Name="gate" Voltage= 2.5 } 
   ){ Coupled {Poisson Electron Hole} }
}

