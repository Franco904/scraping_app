SHELL := /bin/bash
.PHONY: build-apk

# Run app in debug mode
run-debug:
	flutter run --debug --no-sound-null-safety

# Run app in release mode
run-release:
	flutter run --release --no-sound-null-safety

# Build the apk and put it at <app dir>/build/app/outputs/flutter-apk/*-release.apk
build-apk:
	flutter build apk --split-per-abi --no-sound-null-safety

# Build the aab and put it at <app dir>/build/app/outputs/bundle/release/*-release.aab
build-aab:
	flutter build appbundle --no-sound-null-safety

# Restart adb service
adb-restart:
	adb kill-server
	adb start-server

# Format code:
format-code:
	flutter pub run import_sorter:main
	flutter format . -l 150

# Clean project
clean:
	flutter clean
	flutter pub get

# Restart cache
cache-repair:
	flutter pub cache repair
	make clean
