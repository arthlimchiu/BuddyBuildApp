#!/usr/bin/env bash

branch_name=$BUDDYBUILD_BRANCH
branch_name_withouth_desc=${branch_name%/*}
SUFFIX=${branch_name_withouth_desc////_}
export SUFFIX

#
sed -i.original '/android {/i\
def final appId = "com.arthlimchiu.buddybuildapp"\
' app/build.gradle

#
sed -i.original 's#applicationId "com.arthlimchiu.buddybuildapp"#applicationId = appId#g' app/build.gradle

#
sed -i.original "s#applicationIdSuffix \".debug\"#applicationIdSuffix \"${SUFFIX}\"#g" app/build.gradle

#
sed -i.original '/applicationIdSuffix/ a\
resValue "string", "app_name", "BuddyBuildApp '"${SUFFIX}"'"\
' app/build.gradle

sed -i '/<string name="app_name">/d' app/src/main/res/values/strings.xml
