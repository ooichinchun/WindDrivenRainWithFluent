## WindDrivenRainWithFluent

This is a repo of scripts that help with running wind-driven rain simulations as per the Lagrangian method specified in Singapore's Building and Construction Authority's Green Mark Guidelines [Annex A](https://www.bca.gov.sg/greenmark/others/GM_NRB2015_Technical_Guide_Requirements.pdf). 

There are 3 main components to the Wind-Driven Rain (WDR) simulation:

1) Completion of Natural Ventilation Simulation (with 2nd order discretization)  
2) Simulation with the FLUENT Discrete Phase Model:  
   a) Surface Creation Journal  
   b) Injection Creation Journal  
   c) Particle Tracking Journal  
3) Analysis of Particle Tracks from Lagrangian FLUENT DPM

Completion of these 3 steps allow for the generation and tracking of raindrops from a pre-specified surface to their final location within the simulation domain. The scripts and code described below will help with the scripting of certain steps to reduce the need for user input when conducting these simulations.
___

## FLUENT Discrete Phase Model

#### A. Setup of FLUENT Discrete Phase Model

A sample FLUENT [UDF](https://github.com/ooichinchun/WindDrivenRainWithFluent/blob/master/UDF_wdr.c) is provided with the appropriate drag coefficients for the raindrops.

#### B. Running Discrete Phase Model

In the Lagrangian formulation for tracking wind-driven rain penetration, raindrops of specified sizes are released from a defined elevated surface, and a particle tracking algorithm that takes into account their physical properties and drag cofficient will trace their trajectories through the simulation domain till the individual raindrops reach an absorbing surface (the equivalent of a TRAP boundary condition in FLUENT).  

Hence, there are 3 major parts to the simulation process:  
1) Creation of a Release Surface in FLUENT
2) Creation of an Injection in FLUENT
3) Creation of a Particle Trajectory file in FLUENT

Three sets of bash scripts to automate the creation of FLUENT journal files that will help with partial automation of Steps 1-3 are presented in:  
1) [Create Surface](https://github.com/ooichinchun/WindDrivenRainWithFluent/CreateSurface/README.md)  
2) [Create Injection](https://github.com/ooichinchun/WindDrivenRainWithFluent/CreateInjection/README.md)  
3) [Create Particle Trajectories](https://github.com/ooichinchun/WindDrivenRainWithFluent/CreateParticleTrajectories/README.md)  

#### C. Analysis of Particle Trajectory Files

After the particle trajectories are recorded in a .his ascii file, they should be parsed for their starting and final location to identify regions where the raindrops are landing. 

The following python [script](https://github.com/ooichinchun/WindDrivenRainWithFluent/AnalyzeTrajectories/README.md) will parse the input file for the initial and file location of each particle tracked. 

***
Note: This is not an official IHPC product, but please credit this work if this is helpful to you.

This is the work of [Ooi Chin Chun](mailto:ooicc@ihpc.a-star.edu.sg) from the Institute of High Performance Computing, A* Singapore.
