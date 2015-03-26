# 覚書

## Lua VM

ただひとつのLua VMがシングルスレッドで動作するとする。また、なるべく他のアプリケーションが動いていないことが望ましい。

## Mac OS X

Xcode 6.2では、Instruments Preferencesで有効なコア数を調整できる。有効なコア数をひとつにすることで、マルチコアによる影響をなくす。

![Instruments Preferences](instruments_preferences.png)

