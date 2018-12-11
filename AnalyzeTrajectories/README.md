## Script to parse particle trajectory files from FLUENT's DPM model for WDR

This section is comprised of 2 files, of which [extract_file.py](https://github.com/ooichinchun/WindDrivenRainWithFluent/blob/master/AnalyzeTrajectories/extract_file.py) contains a function to parse the particle trajectory files (.his) from FLUENT's DPM model for the individual particles' initial and final position. The final position can then be analyzed to better understand where the raindrops landed. 

It should be noted that this function assumes the particle ID is in the 2nd column, while the (x,y,z) coordinates are in the 3rd, 4th and 5th column respectively.

The function can then be invoked via the following commands, as per the [sample script](https://github.com/ooichinchun/WindDrivenRainWithFluent/blob/master/AnalyzeTrajectories/analyze_particle_track.py):

> from extract_file import extract_file

This imports the function from the 1st python file.

> read_filename = 'd5mm_zoom.his'
> write_filename = 'd5mm_zoom.csv'
> extract_file(read_filename,write_filename)

The above commands will read the input particle trajectory file d5mm_zoom.his and output the particles with their final positions at 'd5mm_zoom.csv'.
