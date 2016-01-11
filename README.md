# Convert VCF to Hapmap

## Directions
Use the GATK tool, [VariantsToTable](https://www.broadinstitute.org/gatk/gatkdocs/org_broadinstitute_gatk_tools_walkers_variantutils_VariantsToTable.php), to first select only genotype information from the vcf file.
```
	java -Xmx8g -jar GenomeAnalysisTK.jar \
     	-R REFERENCE_GENOME.fa \
     	-T VariantsToTable \
    	 -V INPUT_VCF.vcf \
    	 -F CHROM -F POS -F ID -F QUAL -F REF -F ALT -F QUAL -F FILTER -F INFO -F FORMAT \
    	 -o OUTPUT.txt \
    	 -AMD \
    	 -GF GT 
```
Note: you need to specify `REFERENCE_GENOME.fa`, `INPUT_VCF`, and `OUTPUT.vcf`.

Then use the R script called from the command line to convert the variant table to hapmap. Note, this is only tested for haploid, biallelic SNP data.

```
 	Rscript --vanilla vcf2hapmap.R OUTPUT.vcf HAPMAP.txt
```
`OUTPUT.txt` is the output table from the VariantsToTable tool, and `HAPMAP.txt` is the output file name.

You may need to change the first line of the `vcf2hapmap.r` script depending on where R is installed.

