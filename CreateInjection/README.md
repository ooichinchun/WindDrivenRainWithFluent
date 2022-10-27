## Script to create a journal to automate creation of injection conditions under the DPM model in FLUENT for WDR

This section is comprised of 5 files, of which 1 contains template commands for the final journal file to create the appropriate injections, and the remaining [four scripts](https://github.com/ooichinchun/WindDrivenRainWithFluent/blob/master/CreateInjection/injection_d1mm_loop.csh) can be used to create the FLUENT journal file for the 4 different raindrop sizes to be used. 
The template jou file need to be downloaded and kept in the same folder as the script files when run. The four script files are for raindrop sizes of 5 mm, 2 mm, 1 mm and 0.5 mm and has appropriate values specified.

The script has the following lines at the beginning that define the injections that will be created via the journal file. 

> set grid_x_count = 3
> set grid_y_count = 3
> set max_count=`expr $grid_x_count \* $grid_y_count`

The journal will create max_count number of injections. This was computed by multiplying the number of points in the grid as specified by grid_x_count and grid_y_count in this case, but can be directly set as such:

> set max_count = 9


> set surface_counter = 735

This sets the surface ID to be used for the injection. The surface IDs will be incremented by one up to the number specified above. The surface ID should be found by looking at the actual FLUENT mesh and case file. Note that one needs to be subtracted from the first surface ID as the increment in the .csh script increments the surface_counter variable by 1 to start.

