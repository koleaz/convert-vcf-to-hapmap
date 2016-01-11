#! /Library/Frameworks/R.framework/
args <- commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  args[2] <- "vcf_converted_to_hapmap.txt"
}

vcf <- read.table(args[1], header=TRUE, stringsAsFactors = FALSE)

rs <- NA
alleles <- paste(vcf$REF, vcf$ALT, sep = "/")
chrom <- vcf$CHROM
pos <- vcf$POS
strand <- "+"
assembly <- NA
center <- NA
protLSID <- NA
Qcode <- NA
genotype_df <- vcf[c(-1:-10)]

hapmap <- cbind(rs, alleles, chrom, pos, strand, assembly, center, protLSID, Qcode, genotype_df)
colnames(hapmap)[[1]]<-"rs#"
colnames(hapmap)[[6]]<-"assembly#"

write.table(hapmap, file=args[2], row.names=FALSE, quote=FALSE, sep="\t")

