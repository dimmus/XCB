#!/bin/bash

# (Re)generate xcb protocol files
echo -n "[proto] Gererating protocol files ... "
cd proto
find src -type f -name "*.xml" | while read -r PROTO_FILE; do
  python3 xcbgen.py -c xcb-proto -l proto -s proto -p proto --server-side $PROTO_FILE
done
echo "Done"
echo -n "[proto] Moving {c,h} files to lib/proto folder ... "
mv *.{c,h} ../lib/proto
echo "Done"
echo -n "[proto] Moving man files to lib/proto folder ... "
mv man proto
rm -rf ../doc/man/proto
mv proto ../doc/man/
echo "Done"
cd ../

# (Re)generate ERRORS util files
echo -n "[utils] Gererating ERRORS util files ... "
cd utils/errors
python3 extensions.py extensions.c ../../proto/src/*.xml
echo "Done"
cd ../../

# (Re)generate WM util files
echo -n "[utils] Gererating WM util files ... "
cd utils/wm
m4 ewmh.c.m4 > ewmh.c
m4 xcb_ewmh.h.m4 > xcb_ewmh.h
echo "Done"
cd ../../