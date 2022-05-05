VERSION = 1.0
PRODUCT = homedir-for-user

BINARY = home-directory-for-user
SWIFT_OUT = .build/apple/Products/Release/${PRODUCT}

CODESIGN_IDENTITY = "Developer ID Application: University of Michigan (D9GZK3CLYY)"
PKG_CODESIGN_IDENTITY = "Developer ID Installer: University of Michigan (D9GZK3CLYY)"
BUNDLE_ID = edu.umich.its.${PRODUCT}
USERNAME = jamesez@umich.edu
PASSWORD_ID = jamesez-altool
ASC_PROVIDER = D9GZK3CLYY

${BINARY}:
	-swift build -c release --product ${PRODUCT}  --arch arm64 --arch x86_64
	xcrun codesign -s ${CODESIGN_IDENTITY} \
               --options=runtime \
               --timestamp \
               ${SWIFT_OUT}
	rm -rf out || true
	mkdir -p Binaries
	cp ${SWIFT_OUT} Binaries/${BINARY}

.PHONY: build
build: ${BINARY}

.PHONY: clean
clean:
	rm -rf Packages Binaries .build
