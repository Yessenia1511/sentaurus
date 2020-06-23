# project name
name Test2_Copy_Copy
# execution graph
job 2 -d "1"  -post { extract_vars "$wdir" n2_des.out 2 }  -o n2_des "sdevice pp2_des.cmd"
job 6 -d "1"  -post { extract_vars "$wdir" n6_des.out 6 }  -o n6_des "sdevice pp6_des.cmd"
job 7 -d "1"  -post { extract_vars "$wdir" n7_des.out 7 }  -o n7_des "sdevice pp7_des.cmd"
job 1   -post {  extract_vars "$wdir" n1_fps.out 1; catch {os_cp "$wdir/n1_mdr.cmd" "$wdir/n1_msh.cmd"}; catch {os_cp "$wdir/n1_mdr.bnd" "$wdir/n1_msh.bnd"} }  -o n1_fps "sprocess -u n1_fps.cmd"
job 8 -d "1"  -post { extract_vars "$wdir" n8_des.out 8 }  -o n8_des "sdevice pp8_des.cmd"
job 4 -d "1"  -post { extract_vars "$wdir" n4_des.out 4 }  -o n4_des "sdevice pp4_des.cmd"
job 5 -d "1"  -post { extract_vars "$wdir" n5_des.out 5 }  -o n5_des "sdevice pp5_des.cmd"
job 9 -d "1"  -post { extract_vars "$wdir" n9_des.out 9 }  -o n9_des "sdevice pp9_des.cmd"
job 10 -d "1"  -post { extract_vars "$wdir" n10_des.out 10 }  -o n10_des "sdevice pp10_des.cmd"
check sprocess_fps.cmd 1592739241
check sdevice_des.cmd 1592228216
check sdevice1_des.cmd 1592146603
check global_tooldb 1567671479
check gtree.dat 1591794696
check sdevice2_des.cmd 1591792614
# included files
