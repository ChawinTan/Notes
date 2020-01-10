# Android

Notes for android programming

## Auto import

Windows:
- Alt+Enter<br/>
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
It takes in a context and a class (activity).<br/>
- You need to create the `Child activity class`.
Activity class is a child of context.<br/>
`putExtra()` method takes in a public constant, packagename.const_name and the value mapped to the constant.

## Child Activity
Get the intent via `getIntent` method<br/>
Get message input from intent<br/>
Find view via `findViewById` method<br/>
set text

## Important things to remember
- event methods must be compatible to what is defined, eg: android:onClick

