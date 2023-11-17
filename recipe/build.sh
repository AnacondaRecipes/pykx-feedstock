# avoid distributing unnecessary shared objects depending on the platform
if [[ ${target_platform} == linux-* || ${target_platform} == osx-64 ]]
then
    if [ -d $SRC_DIR/src/$PKG_NAME/lib/m64arm ]
    then
        rm -rv $SRC_DIR/src/$PKG_NAME/lib/m64arm
    fi
fi

if [[ ${target_platform} == linux-* || ${target_platform} == osx-arm64 ]]
then
    if [ -d $SRC_DIR/src/$PKG_NAME/lib/m64 ]
    then
        rm -rv $SRC_DIR/src/$PKG_NAME/lib/m64
    fi
fi

if [[ ${target_platform} == osx-* || ${target_platform} == linux-64 ]]
then
    if [ -d $SRC_DIR/src/$PKG_NAME/lib/l64arm ]
    then
        rm -rv $SRC_DIR/src/$PKG_NAME/lib/l64arm
    fi
fi

if [[ ${target_platform} == osx-* || ${target_platform} == linux-aarch64 ]]
then
    if [ -d $SRC_DIR/src/$PKG_NAME/lib/l64 ]
    then
        rm -rv $SRC_DIR/src/$PKG_NAME/lib/l64
    fi
fi

if [ -d $SRC_DIR/src/$PKG_NAME/lib/w64 ]
then
    rm -rv $SRC_DIR/src/$PKG_NAME/lib/w64
fi

$PYTHON -m pip install . --no-deps --no-build-isolation -vv

# fixing needed SO path on pre-built libobjstor delivered from upstream for linux
if [[ ${target_platform} == linux-64 ]]
then
    patchelf --replace-needed '$ORIGIN/libkurl.so' python$PY_VER/site-packages/$PKG_NAME/lib/l64/libkurl.so $SP_DIR/$PKG_NAME/lib/l64/libobjstor.so
fi
