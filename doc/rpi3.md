# Raspberry Pi 3におけるマイクロベンチマーク

## CPUスケーリングガバナー

``` console
sudo sh -c 'echo performance >/sys/devices/system/cpu/cpufreq/policy0/scaling_governor'
```

cpufrequtilsが利用可能ならば、cpufreq-setコマンドで設定することもできます。

``` console
sudo cpufreq-set --governor performance
```

## systemdのCPU親和性

`/etc/systemd/system.conf`でcore3を使わないように設定します。

```
CPUAffinity=0 1 2
```

## プロセスの設定

### CPU親和性

`sched_setaffinity`でcore3を使うように設定します。

``` lua
local unix = require "dromozoa.unix"
assert(unix.sched_setaffinity(unix.getpid(), { 3 }))
```

### スケジューラ

`sched_get_priority_max`でスケジューラを`SCHED_FIFO`に設定します。

``` lua
local unix = require "dromozoa.unix"
assert(unix.sched_setscheduler(unix.getpid(), unix.SCHED_FIFO, {
  sched_priority = unix.sched_get_priority_max(unix.SCHED_FIFO) - 1
}))
```

### ページロック

`mlockall`でページをロックします。

``` lua
local uint32 = require "dromozoa.commons.uint32"
local unix = require "dromozoa.unix"
assert(unix.mlockall(uint32.bor(unix.MCL_CURRENT, unix.MCL_FUTURE)))
```

## 参考リンク

* [RT PREEMPT HOWTO](https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO)
* [RHEL7 | パフォーマンスチューニングガイド](https://access.redhat.com/site/documentation/ja-JP/Red_Hat_Enterprise_Linux/7/html/Performance_Tuning_Guide/index.html)
* [Arch Linux | CPU周波数スケーリング](https://wiki.archlinuxjp.org/index.php/CPU_%E5%91%A8%E6%B3%A2%E6%95%B0%E3%82%B9%E3%82%B1%E3%83%BC%E3%83%AA%E3%83%B3%E3%82%B0)
