# Basic configs
# set grid
# set isosamples 50
# set hidden3d
# Draw a background
set object rectangle from screen 0,0 to screen 1,1 behind fillcolor rgb '#1d2021' fillstyle solid noborder
# Color some lines
set linetype 1 lw 2 lc rgb '#8ec07c' pointtype 6
set linetype 2 lw 2 lc rgb '#d5c4a1' pointtype 6
set linetype 3 lw 2 lc rgb '#fabd2f' pointtype 6
# Key and border colors
set border lw 3 lc rgb '#83a598'
set key textcolor rgb '#b8bb26'
set xlabel "X" textcolor rgb '#fabd2f'
set ylabel "Y" textcolor rgb '#fabd2f'
