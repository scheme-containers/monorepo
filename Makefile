# User arguments begin
SCHEME=chibi
VERSION=head             # head, N or latest
LINUX=                   # empty or alpine
ARCH=$(shell uname --machine)
OS=linux
# User arguments end

DOCKERFILE=Dockerfile
VERSION_TAG=head
PLATFORM=${OS}/amd64
DOCKER_ARGS=

ifeq "${VERSION}" "latest"
VERSION_PATH=$(shell find "implementations/${SCHEME}/" -maxdepth 1 -name "*" -not -name "head" -not -name "*-*" | sort -V | tail -n 1)
VERSION_NUMBER=$(shell basename ${VERSION_PATH})
else
VERSION_PATH=implementations/${SCHEME}/${VERSION}
VERSION_NUMBER=${VERSION}
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
VERSION_NUMBER_TAG=${LINUX_REAL}${VERSION_NUMBER}-arm
PLATFORM=${OS}/arm64
endif

ifeq "${ARCH}" "x86_64"
TAG=${LINUX_REAL}${VERSION}
VERSION_NUMBER_TAG=${LINUX_REAL}${VERSION_NUMBER}
PLATFORM=${OS}/amd64
endif

ifeq "${ARCH}" "x86"
TAG=${LINUX_REAL}${VERSION}
VERSION_NUMBER_TAG=${LINUX_REAL}${VERSION_NUMBER}
PLATFORM=${OS}/386
endif

BUILD_CMD=docker build . ${DOCKER_ARGS} --platform ${PLATFORM} -f ${DOCKERFILE} --tag=schemers/${SCHEME}:${TAG} --tag=schemers/${SCHEME}:${VERSION_NUMBER_TAG}
PUSH_CMD=docker push schemers/${SCHEME}:${TAG} && docker push schemers/${SCHEME}:${VERSION_NUMBER_TAG}
IMAGE_CLEAN_CMD=docker image rm schemers/${SCHEME}:${TAG}

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

clean-image:
	@echo "CLEAN_CMD : ${CLEAN_CMD}"
	${IMAGE_CLEAN_CMD}

workflow:
	sed 's/\$${SCHEME}/${SCHEME}/g' workflow-template.yml > .github/workflows/${SCHEME}-push-action.yml

