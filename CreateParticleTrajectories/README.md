## Script to create a journal to automate creation of particle trajectories in FLUENT for WDR

This section is comprised of 5 files, of which 1 contains the template commands for the final journal file, and the [next four](https://github.com/ooichinchun/WindDrivenRainWithFluent/blob/master/CreateParticleTrajectories/particle_track_d1mm_loop.csh) are script files to create the FLUENT journal file corresponding to the four raindrop sizes of 5 mm, 2 mm, 1 mm and 0.5 mm. The files need to be downloaded and kept in the same folder as the script files when run. 

The script has the following lines at the beginning that define the particle trajectories that will be created. 

> set filename=d1mm_surface

The journal will create particle trajectory files of the form <i>d1mm_surfaceX.his</i> where X represents the injection number (counter) for the surfaces created.

> set max_count=9

This sets the number of injections from which the raindrops are to be released for creation of the particle trajectory files. This count can be adjusted accordingly to the number of release surfaces and injections created in earlier steps.

> set surface_counter = -1

This sets the injection ID for the particle trajectories to be created. The injection ID is sequential starting from 0 in the list of injections available under the Particle Tracking tab in FLUENT. The ID of the first injection to be tracked should be inserted here less 1. 

Note that the surface_counters will need to be updated according to their respective match to the injection IDs for the different particle sizes. This automation is only useful if the surfaces and injection IDs are numbered according to their respective sizes as set out in these scripts.
