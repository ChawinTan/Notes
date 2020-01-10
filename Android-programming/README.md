# Android

Notes for android programming

## Auto import

Windows:
- Alt+Enter
Mac:
- Option+Return

## ToolBar symbol
Enable Autoconnection to Parent  

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