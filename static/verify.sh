#!/bin/sh

curl \
  --silent \
  --data compilation_level=ADVANCED_OPTIMIZATIONS \
  --data output_format=json \
  --data output_info=errors \
  --data output_info=warnings \
  --data language=ECMASCRIPT5 \
  --data warning_level=verbose \
  --data externs_url=https://www.cosmopolite.org/externs/cosmopolite.js \
  --data externs_url=https://www.cosmopolite.org/externs/hogfather.js \
  --data externs_url=https://raw.githubusercontent.com/google/closure-compiler/master/contrib/externs/google_visualization_api.js \
  --data-urlencode "js_externs@externs.js" \
  --data-urlencode "js_code@babystats.js" \
  http://closure-compiler.appspot.com/compile | ./prettyprint.py

gjslint --strict babystats.js
