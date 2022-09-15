SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd; )

exoclasma-pipe Call -u ${SCRIPT_DIR}/testoutput/Scc3-WXS/unit.json -d ${SCRIPT_DIR}/testdata/bqsr_table.vcf.gz
