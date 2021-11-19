# graphic of bacterial ethanol tolerance
# some data from:
# Ingram 1990 Crit Rev Biotechnol https://pubmed.ncbi.nlm.nih.gov/2178781/

library(ggplot2)

ingram_data_file = "~/git/microbe-ethanol/data/ingram1990_fig4_bacterial_etoh_OD.tab"
ingram_data = read.table(ingram_data_file, header=TRUE, sep="\t")

ingram_data

gp = ggplot(data=ingram_data , aes(x=EtOH_pct, y=OD_550, group=species) ) +
  theme(legend.position="none",
        axis.text=element_text(size=16),
        axis.title=element_text(size=18),
        plot.title = element_text(size=23) ) +
  labs(x="Percentage of Ethanol", y="Growth (OD 550)",
       title="Growth of bacteria at varied EtOH concentrations") +
  scale_y_log10(limits=c(0.03,3)) +
  scale_color_manual(values=c("#006d2c", "#08519c", "#810f7c")) +
  geom_line( aes(color=species), size=4) + 
  geom_point( aes(color=species), size=6) +
  geom_vline(xintercept=5, color="#fec44f", size=3, alpha=0.5) +
  geom_vline(xintercept=12, color="#67001f", size=3, alpha=0.5) +
  annotate(geom="text", x=5.5, y=3, label="beer strength", color="#df9601", size=5, hjust=0) + 
  annotate(geom="text", x=12.5, y=3, label="wine strength", color="#67001f", size=5, hjust=0) +
  annotate(geom="text", x=16, y=0.04, label="Escherichia", color="#006d2c", size=6, fontface="italic") +
  annotate(geom="text", x=16, y=0.13, label="Zymomonas", color="#810f7c", size=6, fontface="italic") +
  annotate(geom="text", x=19, y=1, label="Fructilactobacillus", color="#08519c", size=6, fontface="italic")

gp

ggsave("~/git/microbe-ethanol/images/bacterial_growth_by_etoh_conc.pdf", gp, device="pdf", height=6, width=8)










#