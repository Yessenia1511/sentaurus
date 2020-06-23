File {
   * input files:
   Grid=   "@tdr@"
   * output files:
   Plot=   "@tdrdat@"
   Current="@plot@"
   Output= "@log@"
}

Electrode {
   { Name="source"    Voltage= 0.0 }
   { Name="drain"     Voltage= 0.0 }
   { Name="gate"      Voltage= @Vg@ }
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

Solve {
*- Creating initial guess:
   Coupled(Iterations= 100){ Poisson } 
   Coupled {Poisson Electron Hole}

*- Ramp to gate
   NewCurrentFile="IdVds_" 
   Quasistationary( 
      InitialStep= 1 Increment= 1.6 
      MinStep= 1e-10 MaxStep= 2.5 
      Goal { Name="drain" Voltage=100} 
   ){ Coupled {Poisson Electron Hole} } 
}