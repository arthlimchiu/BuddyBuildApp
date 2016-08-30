#!/usr/bin/env bash

sed -i '/<string="app_name">/d' app/src/main/res/values/strings.xml

#
sed -i.original '/android {/i\
def debugsuffix = System.getProperty("debugsuffix", project.getProperties().get("debugsuffix", "pokemon"))\
def final appId = "com.arthlimchiu.buddybuildapp"\
' app/build.gradle

#
sed -i.original 's#applicationId "com.arthlimchiu.buddybuildapp"#applicationId = appId#g' app/build.gradle

#
sed -i.original 's#applicationIdSuffix ".debug"#applicationIdSuffix ".$debugsuffix"#g' app/build.gradle

#
sed -i.original '/applicationIdSuffix/ a\
resValue "string", "app_name", "JenkinsCI-$debugsuffix"\
' app/build.gradle