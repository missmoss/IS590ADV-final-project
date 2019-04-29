library("tidyverse")

tree <- readr::read_csv("trees.csv")

tree %>%
  group_by(health) %>%
  summarize(n=n())

tree %>%
  group_by(status) %>%
  summarize(n=n())

tree %>%
  group_by(curb_loc) %>%
  summarize(n=n())

tree %>%
  group_by(curb_loc, health) %>%
  summarize(n=n())

tree %>%
  group_by(spc_common) %>%
  summarize(n=n())

tree %>%
  drop_na(health) %>%
  ggplot(aes(tree_dbh, stat(density), colour = health)) +
  geom_freqpoly(binwidth=5) +
  xlim(c(0,100))

t4vega <- tree %>%
  drop_na(tree_dbh) %>%
  filter(borocode == 1) %>%
  select(curb_loc, tree_dbh, status, health, spc_common)

write_csv(t4vega, "t4vega.csv")

t4leaf <- tree %>%
  filter(borocode == 1) %>%
  select(Latitude, longitude, tree_dbh, status, health, spc_common, boroname)

write_csv(t4leaf, "t4leaf.csv")
