# 1F1
rmarkdown::render("analysis/by-channel-across-participants.Rmd",
                  output_format = "github_document",
                  output_file = "1F1-by-channel-across-participants.md",
                  output_dir = "analysis/results/1F1",
                  params = list(harmonic = "1F1", p_thresh = .01))

# 2F1
rmarkdown::render("analysis/by-channel-across-participants.Rmd",
                  output_format = "github_document",
                  output_file = "2F1-by-channel-across-participants.md",
                  output_dir = "analysis/results/2F1",
                  params = list(harmonic = "2F1", p_thresh = .01))

# 3F1
rmarkdown::render("analysis/by-channel-across-participants.Rmd",
                  output_format = "github_document",
                  output_dir = "analysis/results/3F1",
                  output_file = "3F1-by-channel-across-participants.md",
                  params = list(harmonic = "3F1", p_thresh = .01))

# 4F1
rmarkdown::render("analysis/by-channel-across-participants.Rmd",
                  output_format = "github_document",
                  output_dir = "analysis/results/4F1",
                  output_file = "4F1-by-channel-across-participants.md",
                  params = list(harmonic = "4F1", p_thresh = .01))

# 5F1
rmarkdown::render("analysis/by-channel-across-participants.Rmd",
                  output_format = "github_document",
                  output_dir = "analysis/results/5F1",
                  output_file = "5F1-by-channel-across-participants.md",
                  params = list(harmonic = "5F1", p_thresh = .01))

# 1F2
rmarkdown::render("analysis/by-channel-across-participants.Rmd",
                  output_format = "github_document",
                  output_dir = "analysis/results/1F2",
                  output_file = "1F2-by-channel-across-participants.md",
                  params = list(harmonic = "1F2", p_thresh = .01))
