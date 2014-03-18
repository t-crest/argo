# How to use the hierarchical flow #
This folder contains a hierarchical p&r flow for the asynchronous noc. There are slight differences in the way a hierarchical flow works which, in this case, consists of three steps:

## Partitioning ##
The design is loaded into encounter as usual within the working directory intial, but afterwards the methodology differs: The design is split up into several partitions which are supposed to be implemented independently of each other. Note that there might be multiple instances of a partition which allows the designer to break down the complexity. During the partitioning all partitions are written into a new subdirectory partitions and encounter is closed. This directory is no longer used in the following design stages, all the following work is done WITHIN the partitions subdirectory.

## Partition implementation ##
Each of the designs partitions is placed within the folder initial/partitions. All the subdesigns are implemented here as usual for their own.

## Design assembly ## 
One of the folders within the partitions folder is created for the top design. after all other designs are implemented these are imported back here using the assembleDesign command.
