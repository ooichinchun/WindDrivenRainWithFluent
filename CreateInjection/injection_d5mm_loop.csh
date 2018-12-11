#i/bin/csh

set filename=d5mm_surface

set grid_x_count = 3
set grid_y_count = 3

set max_count=`expr $grid_x_count \* $grid_y_count`

set vel = 9.0
set diameter = 0.005
set mass = 0.5

set surface_counter = 735

set x = 1
set surf_count_start = 0

cp create_injection_template_backbone.jou temp.jou

while ($x <= $max_count)

  cat create_injection_template.jou >> temp.jou

  echo $x

  set cur_file=`expr $surf_count_start + $x`
  set a = `echo "$cur_file" | sed -e :a -e 's/^.\{1,2\}$/0&/;ta'`
  echo $a
  set new_file = "$filename$a"
  echo $new_file

  set num_surf=`expr $surface_counter + $x`


  sed -e 's/MASS/'"$mass"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/DIAMETER/'"$diameter"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/TERM_VEL/'"$vel"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/SURFACE_COUNT/'"$num_surf"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/INJ_NAME/'"$new_file"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou

  @ x += 1
end

mv temp.jou create_d5mm_injection.jou
#EOF

