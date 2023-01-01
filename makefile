ENV ?= dev

setup-env:
	cp ./environments/$(ENV)/google-services.json ./android/app/google-services.json
	cp ./environments/$(ENV)/GoogleService-Info.plist ./ios/Runner/GoogleService-Info.plist
	cp ./environments/$(ENV)/.env .env

run:
	make setup-env
	flutter run --dart-define env=$$(echo $$(cat .env | tr '\n' '|')) --flavor $(ENV)

run-release:
	make setup-env
	flutter run --dart-define env=$$(echo $$(cat .env | tr '\n' '|')) --flavor $(ENV) --release --bundle-sksl-path flutter.sksl.json

build-apk:
	flutter build apk --dart-define env=$$(echo $$(cat .env | tr '\n' '|')) --flavor $(ENV) --release --bundle-sksl-path flutter.sksl.json

build-appbundle:
	flutter build appbundle --dart-define env=$$(echo $$(cat .env | tr '\n' '|')) --flavor $(ENV) --release --bundle-sksl-path flutter.sksl.json

build-ios:
	flutter build ios --dart-define env=$$(echo $$(cat .env | tr '\n' '|')) --flavor $(ENV) 
