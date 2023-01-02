ENV ?= dev

setup-env:
	cp ./environments/$(ENV)/google-services.json ./android/app/google-services.json
	cp ./environments/$(ENV)/GoogleService-Info.plist ./ios/Runner/GoogleService-Info.plist
	cp ./environments/$(ENV)/.env .env

run:
	make setup-env
	flutter run -t lib/main.dart --flavor $(ENV) --dart-define env=$$(echo $$(cat .env | tr '\n' '|'))

run-release:
	make setup-env
	flutter run --flavor $(ENV) --release --dart-define env=$$(echo $$(cat .env | tr '\n' '|'))

build-apk:
	flutter build apk --flavor $(ENV) --release --dart-define env=$$(echo $$(cat .env | tr '\n' '|'))

build-appbundle:
	flutter build appbundle --flavor $(ENV) --release --dart-define env=$$(echo $$(cat .env | tr '\n' '|'))

build-ios:
	flutter build ios --flavor $(ENV) --dart-define env=$$(echo $$(cat .env | tr '\n' '|'))

	build-ipa:
	flutter build ipa --release --export-options-plist=ios/ExportOptions.plist --dart-define env=$$(echo $$(cat .env | tr '\n' '|')) --flavor $(ENV)
