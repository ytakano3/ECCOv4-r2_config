# ECCOv4-r2_config (since 2023)
Instance of the ECCOv4r2 (ECCOv4 release 2) used for adjoint sensitivity studies (Jones et al., 2019).
This repository contains the specific setup files used for adjoint sensitivity studies, originally from
Dani Jones and Gael Forget's setup (based on MITgcm checkpoint 66h).
https://github.com/gaelforget/ECCOv4  
https://github.com/MITgcm/MITgcm/releases/tag/checkpoint66h  

Now I have start updating the setup based on more recent release (ver 1.9 of Gael's setup and based on
MITgcm checkpoint 67z) and tested on Archer2 (as of Oct 11th, 2024). Planning to add more information
and Python codes for preparation and post-processing.  

The directory structure of this repository is as follows:

* build_ad : makefile and genmake log used during a typical build on ARCHER (UK National HPC, deactivated Feb 2020)
* code_ad : changes made to the MITgcm source code for this instance of the ECCOv4 setup
* input : run-time data files for a typical numerical experiment
* masks : sample mask that defines the recently ventilated volume 
* sample_results : example kinematic and dynamic sensitivity fields, and also a standard output file

The masks and sample results can be read using the ECCOv4-r2 grid and the gcmfaces tool (MATLAB):
https://github.com/gaelforget/gcmfaces

# Reference
[1] Jones, D. C., Boland, E. J., Meijers, A. J. S., Forget, G., Josey, S. A., Sallee, J.‐B., & Shuckburgh, E. (2019). Heat distribution in the Southeast Pacific is only weakly sensitive to high‐latitude heat flux and wind stress. Journal of Geophysical Research: Oceans, 124. https://doi.org/10.1029/2019JC015460


