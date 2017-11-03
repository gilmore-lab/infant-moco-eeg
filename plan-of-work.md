plan-of-work
================
A. Pandos & R. Gilmore
2017-11-03 11:45:51

Purpose
-------

1.  Plan work for Infant MOCO poster for [ICIS 2018](https://infantstudies.org/congress-2018/) (due 12/1/2017).
    -   Poster Submission
        -   Include an abstract (max 3500 characters – 500 words)
        -   Prepare an abstract title (max 130 character limit)

2.  Plan work for Infant MOCO manuscript for submission late 2017.

Gathering
---------

-   Get data from Box
    -   Currently 18 Participants on Box, there should be 24

Cleaning & export
-----------------

-   ~~Examine data~~
    -   ~~Data under projects &gt; optic flow &gt; optic flow eeg &gt; moco &gt; moco eeg lamrad infant &gt; analysis &gt; data &gt; raw sessions~~
    -   ~~no data under csv or csv-thresh 200~~
-   ~~Clean and export from the `inf_2pat_lamrad_YYYMMDD` files.~~
    -   ~~These are "buried" or nested under a subject-id folder.~~
-   ~~Combine subject-ids with metadata from [Databrary](https://databrary.org/volume/146).~~
-   ~~Remove identifiers~~
-   ~~Save de-identified data~~
-   ~~Upload de-identified data to GitHub~~
    -   ~~Make sure data are in format similar to [GTF 2016 on GitHub](https://github.com/gilmore-lab/gilmore-thomas-fesi-2015), see especially the README [here](https://github.com/gilmore-lab/gilmore-thomas-fesi-2015/tree/master/csv)~~

Visualization
-------------

-   ~~Summary of participant characteristics~~
    -   ~~Sex, age range, etc.~~
-   Look at plots and graphs in [Gilmore, Thomas & Fesi, 2016](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0157911)
-   Individual-level
    -   T2Circ (like Gilmore, Thomas & Fesi, 2016; [Figure 3](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g003))
    -   Map of all electrodes (like Gilmore, Thomas & Fesi, 2016; [Figure 4](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g004)) for 1F1, 2F1, 3F1, 4F1
    -   Plots of channels that meet threshold (like Gilmore, Thomas & Fesi, 2016; [Figure 5](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g005) & [Figure 6](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g006))
    -   N.B. -- The GTF 2016 paper had 3 speeds and 3 patterns, so our code will have to be changed for 2 speeds and 2 patterns.
-   Group-level
    -   T2Circ (like Gilmore, Thomas & Fesi, 2016; [Figure 3](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g003))
    -   Map of all electrodes (like Gilmore, Thomas & Fesi, 2016; [Figure 4](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g004)) for 1F1, 2F1, 3F1, 4F1
    -   Plots of channels that meet threshold like (like Gilmore, Thomas & Fesi, 2016; [Figure 5](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g005) & [Figure 6](http://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0157911.g006))

Analysis
--------

-   Hypothesis: Infants should show larger amplitude EEG to fast motion.

    -   Sample [video](https://nyu.databrary.org/slot/11442/32561,42614/asset/38756/download?inline=true) of linear motion, 8 deg/s

    -   Sample [video](https://nyu.databrary.org/slot/11442/10642,20695/asset/38752/download?inline=true) of radial motion, 8 deg/s

-   Hypothesis: Infants should show larger amplitude EEG to linear motion.

Write-up
--------

-   Confirm GTF 2016 references are in PaperPile
    -   Enter missing into PaperPile [(**Completed**)](https://paperpile.com/app/label/96331605-5b62-0cd2-a201-73b1c6dd5a96)
    -   Copy refs to [infant-moco-refs.md](https://github.com/gilmore-lab/moco/blob/master/infant-moco-refs.md) (**Completed**)
        -   There is a reference from GTF2016 that is listed twice (\#56 and \#77)
-   Sample displays are on Databrary: <https://nyu.databrary.org/volume/75>
-   Draft methods section can be found [here](moco-inf-2pat-lamrad-manuscript2016.md).

<!-- | Column 1 | Column 2 | -->
<!-- |----------|----------| -->
<!-- | value 1  | value 2  | -->
<!-- | value 3  | "hey"    | -->
<!-- || not blank          | -->
