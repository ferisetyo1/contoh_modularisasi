# Flutter SDK

Flutter SDK 3.13.0

Dart SDK 3.1.0

## Build Runner
```
flutter pub add freezed_annotation
flutter pub add --dev build_runner
flutter pub add --dev freezed

flutter pub run build_runner build --delete-conflicting-outputs
```
## Signing Android
```cd android
keytool -genkey -v -keystore upload-keystore.jks -storetype JKS -alias 12345678 -keyalg RSA -keysize 2048 -validity 10000 -deststoretype pkcs12```
```
create key.properties at /android with this :
```
storePassword=12345678
keyPassword=12345678
keyAlias=12345678
storeFile=/Users/ferisetyo/project/contoh_modularisasi/android/upload-keystore.jks
```

add this code to android/app/build.gradle :

root file

```
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

in android 

```
    signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
    }

    buildTypes {
        debug{
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release

            minifyEnabled false 
            shrinkResources false
        }

        profile {
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            minifyEnabled true 
            shrinkResources true
        }
    }

    flavorDimensions "app"

    productFlavors {
        dev {
            dimension "app"
            resValue "string", "app_name", "Contoh Modularisasi Dev"
            versionNameSuffix "-dev"
            applicationIdSuffix ".dev"
        }
        prod {
            dimension "app"
            resValue "string", "app_name", "Contoh Modularisasi Mobile"
        }
    }
```

## Module
create module

```
cd features
flutter create -t module --org com.example.contoh_modularisasi cart
```

add this at pubspec.yaml module

```
publish_to: none
```

rename lib/main.dart to lib/cart.dart, and add it

```
library cart;
```

example load module to root pubspec.yaml

```
dependencies:

  flutter:
    sdk: flutter
    
   ---------------------- MODULE -------------------
   
  core:
    path: core

   ----------------- FEATURE MODULE ----------------
   
  produk:
    path: features/produk
    
  cart:
    path: features/cart
```
