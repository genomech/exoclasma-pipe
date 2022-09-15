SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd; )

rm -r ${SCRIPT_DIR}/testoutput/fastqc
exoclasma-pipe FastQC -f ${SCRIPT_DIR}/testdata/test_scc3_R*.fastq.gz -d ${SCRIPT_DIR}/testoutput/fastqc
