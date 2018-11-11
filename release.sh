#!/bin/sh
cd release/
releasedir=ResourcenKopierer
releasefile=${releasedir}.zip

if [ -d "$releasedir" ]; then
  echo "Release folder already exists. Make sure it doesn't exists, as it will be deleted after zipping" >&2
  exit 99
fi

mkdir $releasedir
cp ../data/* $releasedir
cp ../build/*.exe $releasedir
tar -acf $releasefile $releasedir
rm -r $releasedir

cd ..

echo "Created $releasefile"
