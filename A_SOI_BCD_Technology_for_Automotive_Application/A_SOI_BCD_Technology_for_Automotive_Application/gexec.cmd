# project name
name A_SOI_BCD_Technology_for_Automotive_Application
# execution graph
job 1   -post {  extract_vars "$wdir" n1_fps.out 1; catch {os_cp "$wdir/n1_mdr.cmd" "$wdir/n1_msh.cmd"}; catch {os_cp "$wdir/n1_mdr.bnd" "$wdir/n1_msh.bnd"} }  -o n1_fps "sprocess -u n1_fps.cmd"
check sprocess_fps.cmd 1585668784
check global_tooldb 1567671479
check gtree.dat 1585662734
# included files
