#! /bin/sh

CONFIGURE_SCRIPTDIR=`dirname $0`
ROOT=$(pwd)
SOURCEDIR="`cd ${CONFIGURE_SCRIPTDIR}/../USD;pwd`"
cd ${ROOT}
BUILDDIR=${ROOT}/local

echo "build from USD sources at ${SOURCEDIR}/pxr"
echo "local dir for prerequisites is ${BUILDDIR}"

if [ $# > 1 ]; then
  if [[ "$1" = "Xcode" ]]; then
    echo "Configuring for Xcode"
    cmake ${SOURCEDIR} \
      -DCMAKE_INSTALL_PREFIX=${BUILDDIR} \
      -DCMAKE_PREFIX_PATH=${BUILDDIR} \
      -DALEMBIC_DIR=${BUILDDIR} \
      -DDOUBLE_CONVERSION_DIR=${BUILDDIR} \
      -DGLEW_LOCATION=${BUILDDIR} \
      -DOIIO_LOCATION=${BUILDDIR} \
      -DOPENEXR_ROOT_DIR=${BUILDDIR} \
      -DOPENSUBDIV_ROOT_DIR=${BUILDDIR} \
      -DQT_USE_FRAMEWORKS=0 \
      -DQT_ROOT_DIR=${BUILDDIR} \
      -DPTEX_LOCATION=${BUILDDIR} \
      -DTBB_ROOT_DIR=${BUILDDIR} \
      -DBoost_INCLUDE_DIR=${BUILDDIR}/include -DBoost_LIBRARY_DIR=${BUILDDIR}/lib \
      -G Xcode
  else
    echo "Configuring for make"
    cmake ${SOURCEDIR} \
      -DCMAKE_INSTALL_PREFIX=${BUILDDIR} \
      -DCMAKE_PREFIX_PATH=${BUILDDIR} \
      -DALEMBIC_DIR=${BUILDDIR} \
      -DDOUBLE_CONVERSION_DIR=${BUILDDIR} \
      -DGLEW_LOCATION=${BUILDDIR} \
      -DOIIO_LOCATION=${BUILDDIR} \
      -DOPENEXR_ROOT_DIR=${BUILDDIR} \
      -DOPENSUBDIV_ROOT_DIR=${BUILDDIR} \
      -DQT_USE_FRAMEWORKS=0 \
      -DQT_ROOT_DIR=${BUILDDIR} \
      -DPTEX_LOCATION=${BUILDDIR} \
      -DTBB_ROOT_DIR=${BUILDDIR} \
      -DBoost_INCLUDE_DIR=${BUILDDIR}/include -DBoost_LIBRARY_DIR=${BUILDDIR}/lib
  fi
fi

