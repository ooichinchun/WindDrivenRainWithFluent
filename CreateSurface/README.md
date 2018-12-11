## Script to create a journal to automate creation of surfaces in FLUENT for WDR

This section is comprised of 3 files, of which 2 are template commands for the final journal file, and the [last](https://github.com/ooichinchun/WindDrivenRainWithFluent/blob/master/CreateSurface/surface_loop.csh) is a script file to create the FLUENT journal file. The first two files only need to be downloaded and kept in the same folder as the script file when run. 

The script has the following lines at the beginning that define the surfaces that will be created. 

> set filename = wdr_surface  

The journal will create surfaces of the name <i>wdr_surfaceX</i> where X represents the surface number (counter) for the surfaces created.

> set height = 100

This sets the z-height value for the surfaces from which the raindrops are to be released.

> set x_extent_min = 50  
> set x_extent_max = 200  
> set y_extent_min = -100  
> set y_extent_max = 50

This sets the x and y extents of the surfaces to be created. The maximum values are not actually used, but are retained for user book-keeping purposes. 

> set x_step_size = 50  
> set y_step_size = 50  
> set num_pts_x=`expr $x_step_size + 1`  
> set num_pts_y=`expr $y_step_size + 1`

The step sizes specify the size of each surface. Setting x_step_size and y_step_size sets the size of each surface. In this instance, each surface is 50 units long in the x and y direction respectively.

> set grid_x_count = 3  
> set grid_y_count = 3

This sets the number of different surfaces to be created within the x and y extents listed prior. In this instance, a set of 9 surfaces will be created, ranging from (x,y) = (50,-100) to (x,y) = (200,50). The 9 surfaces are distributed across 3 columns and 3 rows. The x and y extents are calculated by adding the specified step size dimension to the x_min and y_min values specified in the earlier two subsections. For example, in this instance, the x_extent_min is 50, while the x_step_size is 50 and the grid_x_count is 3, hence, the surfaces will have 3 ranges comprising (x<sub>min</sub>,x<sub>max</sub>) values of (50,100), (100,150), and (150,200). 
