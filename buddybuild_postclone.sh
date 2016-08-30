#!/usr/bin/env bash

suffix=$BUDDYBUILD_BRANCH
finalsuffix=${suffix//-/_}
export finalsuffix

#
sed -i.original '/android {/i\
def final appId = "com.arthlimchiu.buddybuildapp"\
' app/build.gradle

#
sed -i.original 's#applicationId "com.arthlimchiu.buddybuildapp"#applicationId = appId#g' app/build.gradle

#
sed -i.original "s#applicationIdSuffix \".debug\"#applicationIdSuffix \"${finalsuffix}\"#g" app/build.gradle

#
sed -i.original '/applicationIdSuffix/ a\
resValue "string", "app_name", "BuddyBuildApp-sampleapp"\
' app/build.gradle

sed -i '/<string name="app_name">/d' app/src/main/res/values/strings.xml
