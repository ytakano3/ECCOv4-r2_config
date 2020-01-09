# ECCO_v4_r2_config
Instance of ECCOv4-r2 used for adjoint sensitivity studies

This repository contains the specific setup files used for adjoint sensitivity studies. It is an instance of ECCOv4 release 2:

https://github.com/gaelforget/ECCOv4

which is an instance of MITgcm (checkpiont 66h):

https://github.com/MITgcm/MITgcm/releases/tag/checkpoint66h

The directory structure of this repository is as follows:

* build_ad : makefile and genmake log used during a typical build on ARCHER (UK National HPC, deactivated Feb 2020)
* code_ad : changes made to the MITgcm source code for this instance of the ECCOv4 setup
* input : run-time data files for a typical numerical experiment
* masks : sample mask that defines the recently ventilated volume 
* sample_results : example kinematic and dynamic sensitivity fields, and also a standard output file

The masks and sample results can be read using the ECCOv4-r2 grid and the gcmfaces tool:

https://github.com/gaelforget/gcmfaces

This setup is a typical instance of the code used for the results in the following paper:

Jones, D. C., Boland, E. J., Meijers, A. J. S., Forget, G., Josey, S. A., Sallee, J.‐B., & Shuckburgh, E. ( 2019). Heat distribution in the Southeast Pacific is only weakly sensitive to high‐latitude heat flux and wind stress. Journal of Geophysical Research: Oceans, 124. https://doi.org/10.1029/2019JC015460


