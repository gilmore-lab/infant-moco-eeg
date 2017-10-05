# Make directories on target location (/Users/ars17/InfantThresh200) 
# containing only the needed files from the source location 
# (Box: /Users/ars17/Box Sync/b-gilmore-lab-group Shared/gilmore-lab/projects/optic-flow/optic-flow-eeg/moco/moco-inf-2pat-lamrad/raw-sessions).
#
# Created: 1/26/2016
# Author: Andrea Seisler

# Notes: to clear the workspace use > rm(list = ls())

# Lists just the folder names in the source directory (Box)

source.dir = "~/Box Sync/b-gilmore-lab-group Shared/gilmore-lab/projects/optic-flow/optic-flow-eeg/moco/moco-inf-2pat-lamrad/raw-sessions"
folder.names = list.dirs(source.dir, full.names = FALSE, recursive=FALSE)


# Create a new directory for each of the folder names above in the target directory (GitHub)

targ.dir = "~/InfantThresh200"

for (i in 1:length(folder.names))  { 
  dir.create(file.path(targ.dir,folder.names[i]))
} 


# Copy all .INI and .txt files from the source directory to their respective 
# folders at the target directory location

# create a vector of source file paths

source.dir <- rep(source.dir,length(folder.names)) 
sourcepath <- file.path(source.dir,folder.names, "ThreshBlink200")


# create a vector of target file paths

targetpath <- rep(targ.dir,length(folder.names))
targetpath <- file.path(targetpath,folder.names)


# select only the files that need to be copied

files2copy <- list.files(sourcepath[1], pattern = ".txt|.INI", full.names = FALSE)


# copy the necessary files from the source directories to the target directories

lapply(files2copy, function(x) file.copy(paste (sourcepath, x , sep = "/"),  
                                         paste (targetpath, x, sep = "/"), recursive = FALSE,  copy.mode = TRUE))