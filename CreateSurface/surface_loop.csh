#i/bin/csh

set filename = wdr_surface
set height = 100

set x_extent_min = 50
set x_extent_max = 200
set y_extent_min = -100
set y_extent_max = 50

set grid_x_count = 3
set grid_y_count = 3

set x_step_size = 50
set y_step_size = 50
set num_pts_x=`expr $x_step_size + 1`
set num_pts_y=`expr $y_step_size + 1`

set max_count=`expr $grid_x_count \* $grid_y_count`

cp create_surface_template_backbone.jou temp.jou

set x_val = 0
set y_val = 0

set x = 1
set file_count_start = 0

while ($x <= $max_count)

  cat create_surface_template.jou >> temp.jou

  echo $x

  set cur_file=`expr $file_count_start + $x`
  set a = `echo "$cur_file" | sed -e :a -e 's/^.\{1,3\}$/0&/;ta'`
  echo $a
  set new_file = "$filename$a"
  echo $new_file

  set x_min=`expr $x_extent_min + $x_val \* $x_step_size`
  set x_max=`expr $x_min + $x_step_size`
  set y_min=`expr $y_extent_min + $y_val \* $y_step_size`
  set y_max=`expr $y_min + $y_step_size`

  sed -e 's/x_min/'"$x_min"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/x_max/'"$x_max"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/y_min/'"$y_min"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/y_max/'"$y_max"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/height/'"$height"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/NUM_POINTS_X/'"$num_pts_x"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/NUM_POINTS_Y/'"$num_pts_y"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/FILENAME/'"$new_file"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou

  set x_val=`expr $x / $grid_y_count`
  set y_val=`expr $x % $grid_y_count`
  @ x += 1
end

mv temp.jou create_surface.jou
#EOF

