# Android

Notes for android programming

## Auto import

Windows:
- Alt+Enter

Mac:
- Option+Return

## ToolBar symbol
Enable Autoconnection to Parent - the U shape symbol<br/>
Default Margins - to the right of Enable Autoconnection<br/>
Right click -> show baseline -> baseline (text) anchor <br/>

## String resource
App > res > values > strings.xml

## Android upward navigation button

Inside `app` > `manifests` > `AndroidManifest.xml`, locate the `<activity>` tag for the child activity and replace with

```
<activity android:name=".Activity"
          android:parentActivityName=".MainActivity (parent activity)">
    <!-- The meta-data tag is required if you support API level 15 and lower -->
    <meta-data
        android:name="android.support.PARENT_ACTIVITY"
        android:value=".MainActivity" />
</activity>
```

## An Intent
An intent can be thought of as a glue between activities, when launching them. Essentially a passive data structure.

It takes in a context and a class (activity).<br/>
- You need to create the `Child activity class`.
Activity class is a child of context.<br/>
`putExtra()` method takes in a public constant, packagename.const_name and the value mapped to the constant.

## Inflator
Used to convert xml files into view objects. Used when you need to customize each view in a (eg:, list)

## Child Activity
Get the intent via `getIntent` method<br/>
Get message input from intent<br/>
Find view via `findViewById` method<br/>
set text

## Http requests
1. Add in `implementation 'com.android.volley:volley:1.1.1'` in build.gradle file under dependencies
2. Add `<uses-permission android:name="android.permission.INTERNET" />` in `AndroidManifest.xml`

## Important things to remember
- event methods must be compatible to what is defined, eg: android:onClick

