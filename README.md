#Limelight

[Limelight](https://github.com/limelight-stream) is an open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield, but built for Linux/OS X/Windows.

Limelight-odroid allows you to stream your full collection of Steam games from your powerful desktop to your Odroid/Ubuntu device.

Limelight also has a [Desktop implementation](https://github.com/limelight-stream/limelight-pc) (which this is based on) and an [Android implementation](https://github.com/limelight-stream/limelight-android). Versions for [iOS](https://github.com/limelight-stream/limelight-ios) and [Windows Phone](https://github.com/limelight-stream/limelight-wp) are currently in development.

##Features

* Streams Steam and all of your games from your Odroid
* Keyboard and Mouse support
* Full support for Xbox 360 controllers, PS3 and PS4 controllers, and other HID gamepads

##Features to come

* Use mDNS to scan for compatible GeForce Experience (GFE) machines on the network
* Choose from your list of available games instead of just launching Steam

##Installation

* Download [GeForce Experience](http://www.geforce.com/geforce-experience) and install on your Windows PC
* <s>Download the appropriate jar from the GitHub releases page</s> (no jars available for odroid yet, TODO)
* Build jar from source

##Requirements

* [GFE compatible](http://shield.nvidia.com/play-pc-games/) computer with GTX 600/700 series GPU (for the PC from which you're streaming)
* High-end wireless router (802.11n dual-band recommended) or wired network

##Usage

* Ensure your machines are on the same network
* Turn on Shield Streaming in the GFE settings
* In Limelight, enter your PC's IP or Hostname and click "Pair".
* Accept the pairing confirmation on your PC
* For gamepad support, make sure you've mapped your controller in the Options -> Gamepad Settings menu.
* In Limelight, click "Start Streaming"
* Play games!

To launch Limelight from a command line:
* `java -jar limelight-[os].jar -host address [options]`
* `-host` [address] the address to connect to. This can be a hostname or ip
  address.
* `-pair` [address] the address to pair to. This can be a hostname or ip address.
* `-fs` launch in full screen
* `-720` use 1280x720 resolution (default)
* `-1080` use 1920x1080 resolution
* `-30fps` use 30 fps stream (default)
* `-60fps` use 60 fps stream

##Compilation

* Install ant, gcc, make and other required build tools as required
* Install openjdk-7-jdk, libopus/libopus-dev, FFmpeg libs (See FFmpeg Setep below), and possibly other libraries
* Have `export LD_LIBRARY_PATH=/usr/local/lib/` or change the path to point to the FFmpeg libraries
* Compile libraries in jni/*/ folders via the `./buildlinuxarm.sh` command within each directory
* Copy each *.so produced to libs/linarm/
* Go to the source root and run `ant`
* Should create build/limelight-linarm.jar

##FFmpeg Setup (libavcodec, libavutil, ...)
These are the only libraries where the default dev packages didn't work for me. The source can can be gotten via the [tip](https://github.com/FFmpeg/FFmpeg/) or the [last tested](https://github.com/FFmpeg/FFmpeg/tree/96470ca22b3b46677de0e2df64e87c5ec80d752b).
  ```
  $ ./configure --enable-gpl --enable-shared --disable-nonfree --disable-ffmpeg --disable-ffplay --disable-ffprobe --disable-ffserver --disable-doc --disable-debug
  $ make clean && make
  $ su -c "make install"
  ```

##Authors

* [Cameron Gutman](https://github.com/cgutman)  
* [Diego Waxemberg](https://github.com/dwaxemberg)  
* [Aaron Neyer](https://github.com/Aaronneyer)  
* [Andrew Hennessy](https://github.com/yetanothername)

Limelight is the work of students at [Case Western](http://case.edu) and was
started as a project at [MHacks](http://mhacks.org).

Odroid version modified from [Desktop build](https://github.com/limelight-stream/limelight-pc) by [Forrest Porter](https://github.com/fporter)
