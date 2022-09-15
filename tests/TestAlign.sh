SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd; )

rm -r ${SCRIPT_DIR}/testoutput/Scc3-WXS
exoclasma-pipe Align -u ${SCRIPT_DIR}/testdata/test_unit.json
