#library(usethis)
#usethis::edit_r_environ("project")

#User needs to put the path where their python 3.7 is installed
#Sys.setenv(RETICULATE_PYTHON = "/usr/bin/python3")
library(reticulate)

#Requires Anaconda/Miniconda installation
reticulate::conda_create(
  envname = "NewsSentiment",
  packages = "python=3.7"
)

py_discover_config(use_environment= "NewsSentiment")


#Wenn ich Pandas installiere, läd das python 3.10 runter?
#ERROR: No matching distribution found for torch==1.7.1
conda_install("NewsSentiment", packages="NewsSentiment==1.1.5", pip = T)

py_NewsSentiment <- import("NewsSentiment")
