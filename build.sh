ADT="/Applications/Adobe Flash Builder 4.6/sdks/4.6.0/bin/adt"
rm -rf build.tmp
mkdir build.tmp
mkdir build.tmp/as
mkdir build.tmp/ios
mkdir build.tmp/android
mkdir build.tmp/default

cp as/bin/ProximitySensorANE.swc build.tmp/as/ProximitySensorANE.zip
unzip -d build.tmp/as/ build.tmp/as/ProximitySensorANE.zip

cp build.tmp/as/library.swf build.tmp/ios
cp ios/build/Debug-iphoneos/libProximitySensorANE.a build.tmp/ios

cp build.tmp/as/library.swf build.tmp/android

cp default/bin/ProximitySensorANEDefault.swc build.tmp/default/ProximitySensorANEDefault.zip
unzip -d build.tmp/default/ build.tmp/default/ProximitySensorANEDefault.zip

jar cf build.tmp/android/proximitysensor.jar -C android/bin .

cp as/bin/ProximitySensorANE.swc bin/ProximitySensorANE.swc

"$ADT" -package \
    -target ane bin/ProximitySensor.ane extension.xml \
    -swc bin/ProximitySensorANE.swc \
    -platform iPhone-ARM -C build.tmp/ios/ . \
    -platform Android-ARM -C build.tmp/android/ . \
    -platform default -C build.tmp/default/ .
