#get the current path
DUMP_DIR=$( pwd )
RIB_DUMP=$( basename $1 )
EXECUTION_DIR=`dirname "$BASH_SOURCE"`
cd ${EXECUTION_DIR}
RELATIVE_PATH=$( pwd )

# the lpfst implementation of the RTRlib
LD_PRELOAD=$RELATIVE_PATH/../libs/librtr-lpfst/librtr.so ../bin/rtr-validator ../tmp/$RIB_DUMP.formatted lpfst-result.txt $2 $3

# the trie implementation of the RTRlib
LD_PRELOAD=$RELATIVE_PATH/../libs/librtr-trie/librtr.so ../bin/rtr-validator ../tmp/$RIB_DUMP.formatted trie-result.txt $2 $3

# the spfst implementation of the RTRlib
LD_PRELOAD=$RELATIVE_PATH/../libs/librtr-spfst/librtr.so ../bin/rtr-validator ../tmp/$RIB_DUMP.formatted spfst-result.txt $2 $3
