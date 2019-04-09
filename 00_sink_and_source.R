safeLibrary <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = T)
  sapply(pkg, library, character.only = T)
}

pkgs <- c('beepr',
          'tuneR',
          'seewave',
          'varhandle',
          'tidyverse'
)
safeLibrary(pkgs)
remove(safeLibrary, pkgs)

source('quiz.R')
