
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name VGA -dir "/home/student/VGA/planAhead_run_2" -part xc3s700afg484-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/student/VGA/TOP.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/student/VGA} }
set_property target_constrs_file "TOP.ucf" [current_fileset -constrset]
add_files [list {TOP.ucf}] -fileset [get_property constrset [current_run]]
link_design
