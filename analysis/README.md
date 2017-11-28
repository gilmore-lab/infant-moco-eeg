# Analysis, Motion Coherence (MOCO) Infant EEG Study

## To regenerate analyses

1. From project root, run `source("analysis/R/Render_all_harmonics.R")`
    - This calls `by-channel-across-participants.Rmd` on each of the target harmonics of interest (1F1, 2F1, 3F1, 4F1, 5F1, and 1F2).
    - Files will be written to harmonic-specific folders under `analysis/results`