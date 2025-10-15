if [[ "$target_platform" == "osx-"* ]]; then
  newlink=libgomp.1.dylib
else
  newlink=libgomp.so.1
fi

rm -f $PREFIX/lib/${newlink}
if [ -f $PREFIX/lib/${newlink} ]; then
    echo "could not remove \$PREFIX/lib/libgomp${newlink}"
    exit 1
fi

mkdir -p $PREFIX/lib
pushd $PREFIX/lib/

echo "Linking '${newlink}' to 'libomp${SHLIB_EXT}'"
ln -s libomp${SHLIB_EXT} ${newlink}

echo "Checking link"
ls -lah libgomp*

popd
