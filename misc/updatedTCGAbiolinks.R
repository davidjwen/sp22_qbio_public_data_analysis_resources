# Before running code, make sure TCGAbiolinks is not loaded into your R


# this line of code might not run, just ignore it if it doesn't
BiocManager::install(version='devel')

BiocManager::install("BioinformaticsFMRP/TCGAbiolinksGUI.data")
BiocManager::install("BioinformaticsFMRP/TCGAbiolinks")
library(TCGAbiolinks)


# Transcriptomics
query <- GDCquery(project = "TCGA-COAD", 
                  data.category = "Transcriptome Profiling", # get the RNA-seq transcriptome
                  data.type = "Gene Expression Quantification", # gets the counts
                  workflow.type = "STAR - Counts",
                  barcode = c("TCGA-AA-3562", "TCGA-G4-6625")) # just to test it works, delete for analysis

GDCdownload(query, method="api")
sum_exp = GDCprepare(query)


# Clinical
query_clin <- GDCquery(project = "TCGA-BRCA", 
                       data.category = "Clinical",
                       file.type = "xml")
GDCdownload(query_clin)
clinic <- GDCprepare_clinic(query_clin, clinical.info = "patient")
colnames(clinic)[colnames(clinic) == "bcr_patient_barcode"] <- "Tumor_Sample_Barcode"


# MAF
query_maf <- GDCquery(project = "TCGA-BRCA",
                      data.category = "Simple Nucleotide Variation",
                      data.type = "Masked Somatic Mutation",
                      legacy = F)
GDCdownload(query_maf)

maf_prep <- GDCprepare(query_maf)
maf_object <- read.maf(maf = maf_prep,
                       clinicalData = clinic,
                       isTCGA = TRUE)