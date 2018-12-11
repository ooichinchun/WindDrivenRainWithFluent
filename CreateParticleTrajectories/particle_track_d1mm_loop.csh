#i/bin/csh

set filename=d1mm_surface

set max_count=9

set surface_counter = -1

set x = 1
set surf_count_start = 0

cp create_particle_tracks_template_backbone.jou temp.jou

while ($x <= $max_count)

  cat create_particle_tracks_template.jou >> temp.jou

  echo $x

  set cur_file=`expr $surf_count_start + $x`
  set a = `echo "$cur_file" | sed -e :a -e 's/^.\{1,2\}$/0&/;ta'`
  echo $a
  set new_file = "$filename$a"
  echo $new_file

  set num_surf=`expr $surface_counter + $x`

  sed -e 's/INJ_NUM/'"$num_surf"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou
  sed -e 's/FILENAME/'"$new_file"'/' temp.jou > temp.jou.tmp && mv temp.jou.tmp temp.jou

  @ x += 1
end

mv temp.jou create_d1mm_particle_tracks.jou
#EOF

