SCHEME=chibi
VERSION=head
VERSION_TAG=head
LINUX=
DOCKERFILE=Dockerfile

ifeq "${VERSION}" "latest"
VERSION_PATH=$(shell find "implementations/${SCHEME}/" -maxdepth 1 -name "*" -not -name "head" | sort | tail -n 1)
else
VERSION_PATH=implementations/${SCHEME}/${VERSION}
endif

ifeq "${LINUX}" "alpine"
DOCKERFILE=Dockerfile.alpine
LINUX_REAL=alpine-
else
LINUX_REAL=
endif

ifeq "${ARCH}" "aarch64"
TAG=${LINUX_REAL}${VERSION}-arm
else
TAG=${LINUX_REAL}${VERSION}
endif

BUILD_CMD=docker build . -f ${DOCKERFILE} --tag=schemers/${SCHEME}:${TAG}
PUSH_CMD=docker push schemers/${SCHEME}:${TAG}

debug:
	@echo "DIR      : ${VERSION_PATH}"
	@echo "BUILD_CMD: ${BUILD_CMD}"
	@echo "PUSH_CMD : ${PUSH_CMD}"

build:
	cd ${VERSION_PATH} && ${BUILD_CMD}

push:
	cd ${VERSION_PATH} && ${PUSH_CMD}

