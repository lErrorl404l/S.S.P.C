# S.S.P.C
## Steam System Parameter Collector

### The use of this is to hopefully make it easier to run certain games on steam, that require startup parameters to run properly and smoothly

```
Installation is easy, just download the latest update, run the script based on your system
Linux/MacOS=.sh (Coming Soon)
Windows=.ps1
```

-vulkan =
Vulkan is a low-overhead, cross-platform API, open standard for 3D graphics and computing. Vulkan targets high-performance real-time 3D graphics applications, such as video games and interactive media. In contrast to the older OpenGL and Direct3D 11 APIs, Vulkan is intended to offer higher performance and more balanced CPU and GPU usage.

-enableHT =
Enables the use of all logical CPU cores for parallel tasks processing. If your CPU does not support Hyper-Threading or similar technology, this parameter is ignored. When disabled, only physical cores are used.
Note that enabling this parameter may slightly improve or harm the performance depending on a scenario. This parameter may be overriden by -cpuCount so if you want to use the maximum number of CPU cores use "-enableHT" without "-cpuCount".
