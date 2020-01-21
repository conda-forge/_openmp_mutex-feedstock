
rm -f $PREFIX/lib/libgomp${SHLIB_EXT}.1
if [ -f $PREFIX/lib/libgomp${SHLIB_EXT}.1 ]; then
    echo "could not remove \$PREFIX/lib/libgomp${SHLIB_EXT}.1"
    exit 1
fi

mkdir -p $PREFIX/lib
pushd $PREFIX/lib/

if [[ ${target_platform} != "osx-64" ]]; then

    echo "Linking 'libgomp${SHLIB_EXT}.1' to 'libomp${SHLIB_EXT}'"
    ln -s libomp${SHLIB_EXT} libgomp${SHLIB_EXT}.1

    echo "Checking link"
    ls -lah libgomp*
fi

ln -s $PREFIX/lib/libomp$SHLIB_EXT $PREFIX/lib/libiomp5$SHLIB_EXT

popd
