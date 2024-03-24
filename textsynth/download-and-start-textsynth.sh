#!/bin/sh
# Note: this is not race free :)
# Note: redistribution of textsynth is forbidden, so we download it
# (instead of including it in the image). Hopefully that's OK.
set -e
if ! [ -f mistral_7B_q4.bin ]; then
  echo "Downloading mistral_7B_q4.bin..."
  curl -fsSL https://huggingface.co/fbellard/ts_server/resolve/main/mistral_7B_q4.bin -O
  echo "Done."
fi
if ! [ -x ts_server ]; then
  echo "Downloading ts_server..."
  curl -fsSL https://bellard.org/ts_server/ts_server_free-2024-01-20.tar.gz | tar zx --strip-components=1
  echo "Done."
fi
echo "Starting ts_server..."
exec ./ts_server /ts_server.cfg 
