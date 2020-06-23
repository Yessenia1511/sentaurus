File {
   * input files:
   Grid=   "n1_fps.tdr"
   * output files:
   Plot=   "n10_des.tdr"
   Current="n10_des.plt"
   Output= "n10_des.log"
}

Electrode {
   { Name="source"    Voltage= 0.0 }
   { Name="drain"     Voltage= 10 }
   { Name="gate"      Voltage= 3 }
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
   Digits=5
   ErrRef(Electron) =1e8
   ErrRef(Hole) =1e8
   Extrapolate
   Iterations= 100
   ExitOnFailure
}



