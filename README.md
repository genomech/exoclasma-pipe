# exoclasma-pipe

## Description

exoclasma-pipe is a tool for reads quality control, adapters removing, mapping, and variant calling, a part of upcoming ExoClasma Suite.

Features:

- Pool FastQ quality control via FastQC
- Mapping pipeline: cutadapt + BWA + GATK MarkDuplicates
- Variant calling pipeline: GATK BQSR + GATK HaplotypeCaller

**This is a pre-release. Use it at your own risk!**

## Installation

```bash
python3 -m pip install exoclasma-pipe
```

## Command-line dependencies

- [SAMtools](https://github.com/samtools/samtools)
- [BWA](https://github.com/lh3/bwa)
- [BEDtools](https://github.com/arq5x/bedtools2)
- [FastQC](https://github.com/s-andrews/FastQC)
- [cutadapt](https://github.com/marcelm/cutadapt)
- [GATK](https://github.com/broadinstitute/gatk)

First five are available at Ubuntu repos:

```bash
apt install samtools samtools bwa bedtools fastqc cutadapt
```

GATK should be installed into Miniconda environment [as described by the developer](https://github.com/broadinstitute/gatk#requirements).

## Usage

### FastQC

```bash
exoclasma-pipe FastQC -f ${file_1} ${mask_1} ${file_2} -d ${output_folder}
```

### Align

```bash
exoclasma-pipe Align -u ${unit_json_file}
```

Unit JSON describes a job for pipeline.
It must have the following format:

```json
{
	"ID": "Scc3-WXS",
	"Description": "Extensive sampling of Saccharomyces cerevisiae in Taiwan reveals ecology and evolution of predomesticated lineages (SRX11913458)",
	"ParentDir": "testoutput",
	"Input": [
		{
			"Files": {
				"R1": "testdata/test_scc3_R1.fastq.gz",
				"R2": "testdata/test_scc3_R2.fastq.gz",
				"Unpaired": null
			},
			"RG": {
				"Sample": "Scc3",
				"Library": "LY0200-I",
				"Platform": "ILLUMINA",
				"Instrument": "IlluminaHiSeq2500",
				"Lane": "1",
				"Barcode": "ACGTAT"
			},
			"Adapter": "illumina"
		}
	],
	"Reference": {
		"GenomeInfo": "testdata/testReference/testReference.info.json",
		"Capture": "testCapture"
	},
	"Config": {
		"Threads": 4,
		"RemoveTempFiles": true
	}
}
```

Reference with GenomeInfo file and Captures can be prepared with [exoclasma-index](https://github.com/genomech/exoclasma-index).

### Call

```bash
exoclasma-pipe Call -u ${unit_json_file} -d ${dbSNP_vcf_gz}
```

Here you will need a Unit JSON file which was created with `exoclasma-pipe Align`.
dbSNP will be used for BQSR stage.
