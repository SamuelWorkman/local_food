#### Creating the Table for Mixtures
library(gt) # the grammar of tables

### Create Table of BICs with `gt`

```{r bic_gt, eval=TRUE, echo=TRUE, include=TRUE, fig.showtext=TRUE}
bic_tib %>%
  gt(.) %>%
  tab_stubhead("Factors") %>%
  tab_header(title = "Iterative BIC Values for Factor & Cluster") %>%
  tab_spanner(label = "Clusters", columns = vars(One, Two, Three, Four, Five)) %>%
  fmt_number(columns = vars(One, Two, Three, Four, Five), decimals = 2, use_seps = FALSE) %>%
  tab_style(style = cell_text(color = "#BF616A"),
            locations = cells_body(columns = vars(Four), rows = Four < 1200)) %>%
  tab_style(style = cell_fill(color = "#ebe3d7"),
            locations = cells_body(columns = vars(Four), rows = Four < 1200)) %>%
  tab_style(style = cell_borders(sides = c("left", "right", "top", "bottom"), color = NULL),
            locations = cells_body(columns = everything(), rows = everything())) %>%
  tab_footnote(footnote = "Bayesian Information Criterion (BIC): lower is better; models with > 5 below others are preferred.", locations = cells_body(columns = vars(Four), rows = Four < 1200)) %>%
  cols_align(., align = "center")
```

ggplot(mix_means, aes(
  x = cluster,
  y = means,
  fill = means
)) +
  facet_wrap(~dim_order, nrow = 1) +
  geom_bar(stat = "identity", width = 0.5, fill = "#434C5E") +
  geom_hline(
    yintercept = 0, linetype = "dashed",
    color = "#BF616A", size = .5
  ) +
  coord_flip() +
  ylab("Mixture Means") +
  xlab("Cluster") +
  nord_fira +
  ggsave("../results/figs/mixture_means.pdf", width = 6, height = 4.5)

class_table %>%
  gt(.) %>%
  tab_stubhead("Mixture") %>%
  tab_header(title = "Organizations within Mixtures") %>%
  tab_style(style = cell_borders(sides = c("left", "right", "top", "bottom"), color = NULL),
            locations = cells_body(columns = everything(), rows = everything()))



kable(class_table,
      align = c("r", "l"), booktabs = TRUE,
      caption = "Education Policy Cluster Membership"
) %>%
  kable_styling("striped", position = "center") %>%
  column_spec(1, bold = TRUE) %>%
  #save_kable("../results/tabs/mixture_tab.pdf")