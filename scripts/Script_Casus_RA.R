#=================================================================================================
# 1. Instellen working directory PC 
# =================================================================================================

setwd("D:/OneDrive - NHL Stenden/Leerjaar 2/Periode 4/Transcriptoomanalyse/Casus RA")
# Check of juiste working directory is ingesteld
getwd()

#Instellen working directory Laptop
setwd("C:/Users/RomyK/OneDrive - NHL Stenden/Leerjaar 2/Periode 4/Transcriptoomanalyse/Casus RA")
getwd

# =================================================================================================
# 2. Packages installeren en laden
# =================================================================================================
install.packages('BiocManager')
BiocManager::install('Rsubread')
BiocManager::install('Rsamtools')
BiocManager::install("DESeq2")
BiocManager::install("KEGGREST")
BiocManager::install("EnhancedVolcano")
BiocManager::install("pathview")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db") #Mens
BiocManager::install("enrichplot")
BiocManager::install("viridis")


library(Rsubread)
library(Rsamtools)
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
library(viridis)

# =================================================================================================
# 3. Bouwen van een index
# =================================================================================================
buildindex(
  basename = 'Casus_RA',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

# =================================================================================================
# 4. Mapping
# =================================================================================================
align.Fem_31.1_norm <- align(index = "Casus_RA", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "Fem_31.1_norm.BAM")
align.Fem_15_norm <- align(index = "Casus_RA", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 = "SRR4785820_2_subset40k.fastq", output_file = "Fem_15_norm.BAM")
align.Fem_31.2_norm <- align(index = "Casus_RA", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 = "SRR4785828_2_subset40k.fastq", output_file = "Fem_31.2_norm.BAM")
align.Fem_42_norm <- align(index = "Casus_RA", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 = "SRR4785831_2_subset40k.fastq",  output_file = "Fem_42_norm.BAM")
align.Fem_54_RA <- align(index = "Casus_RA", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq", output_file = "Fem_54_RA.BAM")
align.Fem_66_RA <- align(index = "Casus_RA", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "Fem_66_RA.BAM")
align.Fem_60_RA <- align(index = "Casus_RA", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "Fem_60_RA.BAM")
align.Fem_59_RA <- align(index = "Casus_RA", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "Fem_59_RA.BAM")

# =================================================================================================
# 5. Gemapte reads visualiseren
# =================================================================================================
# Bestandsnamen van de monsters
samplesRA <- c('Fem_31.1_norm', 'Fem_15_norm', 'Fem_31.2_norm', 
               'Fem_42_norm', 'Fem_54_RA', 'Fem_66_RA', 'Fem_60_RA',
                'Fem_59_RA')

# Voor elk monster: sorteer en indexeer de BAM-file
# Sorteer BAM-bestanden
lapply(samplesRA, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})
# Indexeer de gesorteerde BAM-file
lapply(samplesRA, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})
# =================================================================================================
# 6. Count matrix voor alle samples 
# =================================================================================================
AllsamplesRA <- c('Fem_31.1_norm.BAM', 'Fem_15_norm.BAM',  'Fem_31.2_norm.BAM', 
               'Fem_42_norm.BAM', 'Fem_54_RA.BAM',  'Fem_66_RA.BAM',  'Fem_60_RA.BAM',
              'Fem_59_RA.BAM')

count_matrix <- featureCounts(
  files = AllsamplesRA,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

# Wat staat er in de matrix? 
str(count_matrix)
counts <- count_matrix$counts
head(counts)
colnames(counts) <- c('Fem_31.1_norm', 'Fem_15_norm', 'Fem_31.2_norm', 'Fem_42_norm', 'Fem_54_RA', 'Fem_66_RA', 'Fem_60_RA', 'Fem_59_RA')
head(counts)

# Countmatrix opslaan
write.csv(counts, "CasusRA_countmatrix.csv")

# Metadata
treatment <- c("Normal", "Normal", "Normal", "Normal", "RA", "RA", "RA", "RA") 
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c('Fem_31.1_norm', 'Fem_15_norm', 'Fem_31.2_norm',
'Fem_42_norm', 'Fem_54_RA', 'Fem_66_RA', 'Fem_60_RA', 'Fem_59_RA')
head(treatment_table, n=16)

# Maak DESeqDataSet aan
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = treatment_table,
                              design = ~ treatment)

# =================================================================================================
# 7. Countmatrix laden (BB)  
# =================================================================================================
count_matrixBB <- read.table("count_matrix_RA.txt",
header = TRUE,
row.names = 1,
check.names = FALSE)
colnames(count_matrixBB) <- c('Fem_31.1_norm', 'Fem_15_norm', 'Fem_31.2_norm', 'Fem_42_norm', 'Fem_54_RA', 'Fem_66_RA', 'Fem_60_RA', 'Fem_59_RA')
all_genes <- rownames(count_matrixBB)
# =================================================================================================
# 8. MetaData
# =================================================================================================
treatment <- c("Normal", "Normal", "Normal", "Normal", "RA", "RA", "RA", "RA") 
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c('Fem_31.1_norm', 'Fem_15_norm', 'Fem_31.2_norm',
                               'Fem_42_norm', 'Fem_54_RA', 'Fem_66_RA', 'Fem_60_RA', 'Fem_59_RA')
# =================================================================================================
# 9. Filtering
# =================================================================================================
low_filter <- rowSums(count_matrixBB >= 10) < 2
low_genes <- rownames(count_matrixBB)[low_filter]
count_filtered <- count_matrixBB[!low_filter, ]
expressed_genes <- rownames(count_filtered)

# controle
length(all_genes)
length(low_genes)
length(expressed_genes)
# =================================================================================================
# 10. DESEQ2 analyse
# =================================================================================================
dds <- DESeqDataSetFromMatrix(countData = count_matrixBB,
                              colData = treatment_table,
                              design = ~ treatment)

dds <- DESeq(dds)
res <- results(dds)

# Resultaten uit de test opslaan
write.table(res, file = 'ResultatenCasusRA.csv', row.names = TRUE, col.names = TRUE)
head(res)
# =================================================================================================
# 11. Deg lijsten
# =================================================================================================
deg_genes <- res[!is.na(res$padj) & res$padj < 0.05 & abs(res$log2FoldChange) > 1,
]
# Upregulated in RA
up_genes <- deg_genes[deg_genes$log2FoldChange > 1,]
# Downregulated in RA
down_genes <- deg_genes[deg_genes$log2FoldChange < -1,]

# Controle
nrow(deg_genes)
nrow(up_genes)
nrow(down_genes)
# =================================================================================================
# 12. PCA
# =================================================================================================
vsd <- vst(dds, blind = FALSE)
plotPCA(vsd, intgroup = "treatment")

# opslaan PCA
png("PCA_RA.png", width = 8, height = 6, units = "in", res = 300)
plotPCA(vsd, intgroup = "treatment")
dev.off()
# =================================================================================================
# 13. Volcano plot
# =================================================================================================
EnhancedVolcano(
  res,
  lab = rownames(res),
  x = "log2FoldChange",
  y = "padj",
  pCutoff = 0.05,
  FCcutoff = 1,
  title = "RA versus Normal",
  drawConnectors = TRUE
)
# =================================================================================================
# 14. Go-analyse
# =================================================================================================
deg_ids <- sub("\\..*", "", rownames(deg_genes))

background_ids <- sub("\\..*", "", expressed_genes)

deg_conversion <- bitr(
  deg_ids,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

bg_conversion <- bitr(
  background_ids,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

# Go enrichment
go_bp <- enrichGO(
  gene = deg_conversion$ENTREZID,
  universe = bg_conversion$ENTREZID,
  OrgDb = org.Hs.eg.db,
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05,
  readable = TRUE
)

# Redundante termen verwijderen
go_bp <- simplify(
  go_bp,
  cutoff = 0.7,
  by = "p.adjust",
  select_fun = min
)
# =================================================================================================
# 15. Dotplot/barplot
# =================================================================================================
dotplot(go_bp, showCategory = 10, color = "p.adjust") +
  scale_color_viridis_c(option = "D", direction = -1) +
  theme_minimal() +
  labs(
    title = "GO Enrichment Analysis of Differentially Expressed Genes",
    size = "Gene count",
  ) +
  theme(plot.title = element_text(hjust = 0.5))
# =================================================================================================
# 16. Kegg
# =================================================================================================
kegg <- enrichKEGG(
  gene = deg_conversion$ENTREZID,
  organism = "hsa",
  universe = bg_conversion$ENTREZID,
  pvalueCutoff = 0.05
)
# =================================================================================================
# 17. Pathview
# =================================================================================================
# Foldchange vector
gene_fc <- deg_genes$log2FoldChange

names(gene_fc) <- deg_conversion$ENTREZID

# Pathview
pathview(
  gene.data = gene_fc,
  pathway.id = "hsa05323",
  species = "hsa"
)

