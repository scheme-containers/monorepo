# User arguments begin
SCHEME=chibi
VERSION=head             # head, N or latest
LINUX=                   # empty or alpine
ARCH=x86_64
OS=linux
# User arguments end

DOCKERFILE=Dockerfile
VERSION_TAG=head
PLATFORM=${OS}/amd64

ifeq "${VERSION}" "latest"
VERSION_PATH=$(shell find "implementations/${SCHEME}/" -maxdepth 1 -name "*" -not -name "head" -not -name "*-wine" | sort | tail -n 1)
else
VERSION_PATH=implementations/${SCHEME}/${VERSION}
endif

ifeq "${LINUX}" "alpine"
DOCKERFILE=Dockerfile.alpine
LINUX_REAL=alpine-
endif

ifeq "${LINUX}" "debian"
DOCKERFILE=Dockerfile
LINUX_REAL=
endif

ifeq "${ARCH}" "aarch64"
TAG=${LINUX_REAL}${VERSION}-arm
PLATFORM=${OS}/arm64
endif

ifeq "${ARCH}" "x86_64"
TAG=${LINUX_REAL}${VERSION}
PLATFORM=${OS}/amd64
endif

ifeq "${ARCH}" "x86"
TAG=${LINUX_REAL}${VERSION}
PLATFORM=${OS}/386
endif


BUILD_CMD=docker build . --platform ${PLATFORM} -f ${DOCKERFILE} --tag=schemers/${SCHEME}:${TAG}
PUSH_CMD=docker push schemers/${SCHEME}:${TAG}

debug:
	@echo "DIR      : ${VERSION_PATH}"
	@echo "BUILD_CMD: ${BUILD_CMD}"
	@echo "PUSH_CMD : ${PUSH_CMD}"

build:
	@echo "DIR      : ${VERSION_PATH}"
	@echo "BUILD_CMD: ${BUILD_CMD}"
	cd ${VERSION_PATH} && ${BUILD_CMD}

push:
	@echo "DIR      : ${VERSION_PATH}"
	@echo "PUSH_CMD : ${PUSH_CMD}"
	cd ${VERSION_PATH} && ${PUSH_CMD}

