#Limelight

[Limelight](https://github.com/limelight-stream) is an open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield, but built for Linux/OS X/Windows.

Limelight-odroid allows you to stream your full collection of Steam games from your powerful desktop to your Odroid/Ubuntu device.

Limelight also has a [Desktop implementation](https://github.com/limelight-stream/limelight-pc) (which this is based on) and an [Android implementation](https://github.com/limelight-stream/limelight-android). Versions for [iOS](https://github.com/limelight-stream/limelight-ios) and [Windows and Windows Phone](https://github.com/limelight-stream/limelight-windows) are currently in development.

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

## Installing on Odroid

These instructions have been tested on Odroid-C1 and should work for Odroid-U3

###1. Install build tools

```
$ sudo apt-get install ant gcc make git openjdk-7-jdk libopus0 libopus-dev
```
#### *note*
On the Odroid-C1 I received "perl: warning: Setting local failed" with `gcc`, I edited **/etc/default/locale** and **$HOME/.pam_environment** ([link](https://help.ubuntu.com/community/Locale)) with my local "en_US.UTF-8" for all settings then rebooted. Some of the settings were set to "es_US.UTF-8" (this doesn't effect the builds but removes ugly text while building)

###2. Install and configure FFmpeg

```
$ wget -O ffmpeg.zip https://github.com/FFmpeg/FFmpeg/archive/96470ca22b3b46677de0e2df64e87c5ec80d752b.zip
$ unzip ffmpeg.zip && cd FFmpeg-96470ca22b3b46677de0e2df64e87c5ec80d752b
$ ./configure --enable-gpl --enable-shared --enable-avresample --disable-nonfree --disable-ffmpeg --disable-ffplay --disable-ffprobe --disable-ffserver --disable-doc --disable-debug
$ make clean && make
$ su -c "make install"
```

It is also worth mentioning that the FFmpeg tip usually works too, this is just the last tested version.

###3. Setup the path

Add "
export LD_LIBRARY_PATH=/usr/local/lib/
" to **$HOME/.bash_profile** and

```
$ source ~/.bash_profile
```

to update the shell. This assumes you are using bash of course.

###4. Compiling lime-light

First get the code and compile the JNI libraries, copying them to the **$SOURCE_ROOT/libs/linarm** folder... and compile!

```
$ git clone https://github.com/fporter/limelight-odroid.git limelight
$ cd limelight
$ (cd jni && sh build_linarm.sh)
$ ant
```

###5. Run

```
$ java -jar limelight-linarm.jar
```

##Authors

* [Cameron Gutman](https://github.com/cgutman)  
* [Diego Waxemberg](https://github.com/dwaxemberg)  
* [Aaron Neyer](https://github.com/Aaronneyer)  
* [Andrew Hennessy](https://github.com/yetanothername)

Limelight is the work of students at [Case Western](http://case.edu) and was
started as a project at [MHacks](http://mhacks.org).

Odroid version modified from [Desktop build](https://github.com/limelight-stream/limelight-pc) by [Forrest Porter](https://github.com/fporter)
