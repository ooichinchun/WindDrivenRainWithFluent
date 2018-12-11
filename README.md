## WindDrivenRainWithFluent
Scripts for running Wind-Driven Rain simulations with FLUENT

This is a repo of scripts that help with running wind-driven rain simulations as per the Lagrangian method specified in Singapore's Building and Construction Authority's Green Mark Guidelines [Annex A](https://www.bca.gov.sg/greenmark/others/GM_NRB2015_Technical_Guide_Requirements.pdf). 

There are 3 main components to the Wind-Driven Rain (WDR) simulation:

1) Completion of Natural Ventilation Simulation (with 2nd order discretization)  
2) Simulation with the FLUENT Discrete Phase Model:  
   a) Surface Creation Journal  
   b) Injection Creation Journal  
   c) Particle Tracking Journal  
3) Analysis of Particle Tracks from Lagrangian FLUENT DPM

### FLUENT Discrete Phase Model

#### Setup of FLUENT Discrete Phase Model

A sample FLUENT [UDF](https://github.com/ooichinchun/WindDrivenRainWithFluent/UDF_wdr.c) is provided with the appropriate drag coefficients for the raindrops.

#### Running Discrete Phase Model

