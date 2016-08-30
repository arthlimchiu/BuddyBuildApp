#!/usr/bin/env bash

#
sed -i.original '/android {/i\
def debugsuffix = System.getProperty("debugsuffix", project.getProperties().get("debugsuffix", null))\
def final appId = "com.arthlimchiu.buddybuildapp"\
' app/build.gradle

#
sed -i.original 's#applicationId "com.arthlimchiu.buddybuildapp"#applicationId = appId#g' app/build.gradle

#
sed -i.original 's#applicationIdSuffix ".debug"#applicationIdSuffix ".$debugsuffix"#g' app/build.gradle

#
sed -i.original '/applicationIdSuffix/ a\
resValue "string", "app_name", "BuddyBuildApp-$debugsuffix"\
' app/build.gradle

sed -i '/<string name="app_name">/d' app/src/main/res/values/strings.xml

./gradlew -Pdebugsuffix=bug50 assembleDebug