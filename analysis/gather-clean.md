gather-clean
================
Rick Gilmore
2017-10-05 11:15:04

Purpose
-------

This file

1.  Gathers the infant MOCO EEG files from the lab Box drive
2.  Integrates them with the relevant metadata from the Databrary spreadsheet
3.  Creates a data file for analysis that can also be shared on GitHub because birthdate has been stripped.

Gathering
---------

RLS.txt and associated data files in which a 200 *μ*V blink threshold was applied can be found on `~/Box Sync/b-gilmore-lab-group Shared/gilmore-lab/projects/optic-flow/optic-flow-eeg/moco/moco-eeg-lamrad-infant/analysis/data/moco-inf-2pat-thresh200/`. The files are organized in a series of folders by subject ID. ROG downloaded the directory as a .zip file from Box and saved it in `analysis/data/zip`. These files contain identifiable information, however, so they are not version-controlled or pushed to the GitHub repo. The unzipped version is called `inf-2pat-lamrad/analysis/data/zip/moco-inf-2pat-thresh200/`.

The list of participant IDs is as follows:

``` r
(particip_dirs <- list.dirs("data/zip/moco-inf-2pat-thresh200"))
```

    ##  [1] "data/zip/moco-inf-2pat-thresh200"     
    ##  [2] "data/zip/moco-inf-2pat-thresh200/1003"
    ##  [3] "data/zip/moco-inf-2pat-thresh200/1015"
    ##  [4] "data/zip/moco-inf-2pat-thresh200/1019"
    ##  [5] "data/zip/moco-inf-2pat-thresh200/1023"
    ##  [6] "data/zip/moco-inf-2pat-thresh200/1038"
    ##  [7] "data/zip/moco-inf-2pat-thresh200/1044"
    ##  [8] "data/zip/moco-inf-2pat-thresh200/1047"
    ##  [9] "data/zip/moco-inf-2pat-thresh200/1049"
    ## [10] "data/zip/moco-inf-2pat-thresh200/1051"
    ## [11] "data/zip/moco-inf-2pat-thresh200/1052"
    ## [12] "data/zip/moco-inf-2pat-thresh200/1061"
    ## [13] "data/zip/moco-inf-2pat-thresh200/1064"
    ## [14] "data/zip/moco-inf-2pat-thresh200/1068"
    ## [15] "data/zip/moco-inf-2pat-thresh200/1069"
    ## [16] "data/zip/moco-inf-2pat-thresh200/1070"
    ## [17] "data/zip/moco-inf-2pat-thresh200/1071"
    ## [18] "data/zip/moco-inf-2pat-thresh200/1072"
    ## [19] "data/zip/moco-inf-2pat-thresh200/1092"

There are 18 participant directories.

The SSVEP data are contained in the `RLS.txt` files for each participant. Let's first make copies of the `RLS.txt` files, rename them using the participant ID, and copy them to the `analysis/data/rls_txt/` directory.

Make sure there is a target directory.

``` r
if(!(dir.exists("data/rls_txt"))) {
  dir.create("data/rls_txt")
  message("Created data/rls_txt")
} else {
  message("data/rls_txt exists")
}
```

    ## data/rls_txt exists

Create the rename function.

``` r
Copy_rename_RLS <- function(fdir) {
  # If RLS.txt exists, creates a copy with the participant ID from the fdir
  old_fn <- paste0(fdir, "/", "RLS.txt")
  if(file.exists(old_fn)) {
    new_fn <- paste0(fdir, "/", basename(fdir), ".txt")
    file.copy(from = old_fn, new_fn)
  }
}

# # test
# Copy_rename_RLS("data/zip/moco-inf-2pat-thresh200/1003")
# 
# # test with particip_dirs
# Copy_rename_RLS(particip_dirs[2]) # skip 1
```

Now, rename all of the `RLS.txt` files.

``` r
particip_dirs <- particip_dirs[-1] # Drop parent directory
sapply(particip_dirs, Copy_rename_RLS)
```

    ## data/zip/moco-inf-2pat-thresh200/1003 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1015 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1019 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1023 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1038 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1044 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1047 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1049 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1051 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1052 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1061 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1064 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1068 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1069 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1070 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1071 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1072 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1092 
    ##                                 FALSE

And move them to `data/rls_txt/`

``` r
Move_RLS <- function(fdir) {
  target_fn <- paste0(fdir, "/", basename(fdir), ".txt")
  if(file.exists(target_fn)) {
    new_fn <- paste0("data/rls_txt/", basename(target_fn))
    file.copy(from = target_fn, new_fn)
  }
}

# # test Move_RLS
# Move_RLS(particip_dirs[1])

sapply(particip_dirs, Move_RLS)
```

    ## data/zip/moco-inf-2pat-thresh200/1003 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1015 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1019 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1023 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1038 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1044 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1047 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1049 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1051 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1052 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1061 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1064 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1068 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1069 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1070 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1071 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1072 
    ##                                 FALSE 
    ## data/zip/moco-inf-2pat-thresh200/1092 
    ##                                 FALSE

Cleaning
--------

Next, we change the `iSess` variable to the participant\_id since the current iSess includes the testing date. We'll export these as CSVs since they now lack the (identifiable) testing date.

``` r
Change_iSess <- function(fn) {
  new_iSess <- str_extract(fn, pattern = '[0-9]+')
  df <- read.delim(fn, header = TRUE)
  df$iSess <- new_iSess
  write.csv(df, file = paste0("data/csv_indiv/", new_iSess, "-rls.csv"), row.names = FALSE)
}

# Test Change_iSess()
fl <- list.files("data/rls_txt", full.names = TRUE)
# Change_iSess(fl[1])

sapply(fl, Change_iSess)
```

    ## $`data/rls_txt/1003.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1015.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1019.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1023.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1038.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1044.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1047.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1049.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1051.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1052.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1061.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1064.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1068.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1069.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1070.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1071.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1072.txt`
    ## NULL
    ## 
    ## $`data/rls_txt/1092.txt`
    ## NULL

We can now work on the following:

-   Adding age in days, tester/experimenter, and gender to the data files based on the Databrary spreadsheet. Alternatively, these variables are in the `SsnHeader.txt` file for each participant.

``` r
Create_session_metadata <- function(fdir) {
  session_fn <- paste0(fdir, "/", "SsnHeader.txt")
  if(file.exists(session_fn)) {
    df <- read.delim(session_fn)
    out_fn <- paste0("data/csv_indiv/", basename(fdir), "-session.csv")
    df_out <- df[,c('Operator','DayAge', 'Sex')]
    df_out$iSess <- basename(fdir)
    write.csv(df_out, file = out_fn, row.names = FALSE)
  }
}

# Test
#Create_session_metadata("data/zip/moco-inf-2pat-thresh200/1003/")
#Create_session_metadata(particip_dirs[2])
sapply(particip_dirs, Create_session_metadata)
```

    ## $`data/zip/moco-inf-2pat-thresh200/1003`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1015`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1019`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1023`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1038`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1044`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1047`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1049`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1051`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1052`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1061`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1064`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1068`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1069`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1070`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1071`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1072`
    ## NULL
    ## 
    ## $`data/zip/moco-inf-2pat-thresh200/1092`
    ## NULL

This exercise is an excellent example of why writing small, simple functions is such a good idea. I wish I'd learned that lesson a long time ago.

Now, it should be pretty easy to merge the session and SSVEP data files.

``` r
Merge_VEP_session_data <- function(sess_id) {
  rls_fn <- paste0("data/csv_indiv/", sess_id, "-rls.csv")
  session_fn <- paste0("data/csv_indiv/", sess_id, "-session.csv")
  if ((file.exists(rls_fn)) & (file.exists(session_fn))) {
    df_rls <- read.csv(rls_fn)
    df_session <- read.csv(session_fn)
    df_merged <- left_join(df_rls, df_session, by = "iSess")
    write.csv(df_merged, paste0("data/csv_indiv/", sess_id, 
                                "-merged.csv"), row.names = FALSE)
  } else {
    message("Can't merge files for this session.")
  }
}

# Test Merge_VEP_session_data
#Merge_VEP_session_data("1003")

session_ids <- unique(str_extract(list.files("data/csv_indiv"), "[0-9]+"))
sapply(session_ids, Merge_VEP_session_data)
```

    ## $`1003`
    ## NULL
    ## 
    ## $`1015`
    ## NULL
    ## 
    ## $`1019`
    ## NULL
    ## 
    ## $`1023`
    ## NULL
    ## 
    ## $`1038`
    ## NULL
    ## 
    ## $`1044`
    ## NULL
    ## 
    ## $`1047`
    ## NULL
    ## 
    ## $`1049`
    ## NULL
    ## 
    ## $`1051`
    ## NULL
    ## 
    ## $`1052`
    ## NULL
    ## 
    ## $`1061`
    ## NULL
    ## 
    ## $`1064`
    ## NULL
    ## 
    ## $`1068`
    ## NULL
    ## 
    ## $`1069`
    ## NULL
    ## 
    ## $`1070`
    ## NULL
    ## 
    ## $`1071`
    ## NULL
    ## 
    ## $`1072`
    ## NULL
    ## 
    ## $`1092`
    ## NULL

We are now ready to "drop" variables that we don't need for the analysis, but we can do that when we import the CSVs as data frames.
