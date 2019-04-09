safeLibrary <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = T)
  sapply(pkg, library, character.only = T)
}

pkgs <- c('utf8',
          'beepr',
          'tuneR',
          'seewave',
          'varhandle',
          'tidyverse')

safeLibrary(pkgs)
remove(safeLibrary, pkgs)

source('01_quiz.R')
source('02_you_win.R')
