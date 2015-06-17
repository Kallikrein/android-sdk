#android-sdk


> What is in this docker ?

In short, a minimal android sdk and cordova.

> Wait, what ?

http://cordova.apache.org  
https://developer.android.com/guide/index.html

> Just tell me what Cordova is !

Cordova is a cross-platform smartphone application compiler (I guess ?). YOu can code your app like a web app, with html, js, and stuff. (plugins *cough*). You focus on developping an android 'proof of concept' for your app and quickly launch your app on other OS's when you are ready for production.

> Do I need it ?

If you want to start building an app quickly you can be set in no time. Jump to [quickstart](/#quick-start)

> Do I have the skills to start using your docker ? I heard it's complicated.

If you are on a recent linux, installation will be a matter of minutes. Then you can start using the command line aliases I am providing and you will be using docker without even knowing it's there.
https://docs.docker.com/installation/

> I am using boot2docker with [insert proprietary here] and I can't mount my usb ...

I can't help you. I'm not even sure something can be done.

> I want something more or the image needs an update.

Email me and I can maintain this image.

### Aliases I use

In ~/.bash_aliases :
```
alias mine='sudo chown -R $USER'
alias drun='docker run -it --rm'
alias cordova='drun --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/src -v $PWD/gradle:/root/.gradle kallikrein/android-sdk cordova'
```

### A note on security :
The commands I proposed to use are ```--privileged```, which means your containers are much more dangerous for your system. If you mess anything up, that is.

> Why should we use ```--privileged``` ?

It's **optionnal**, you can do without this flag, but you won't be able to upload and launch your app on your phone with the built in ```cordova run```, since you need an access to your usb devices.
If you don't want to use usb, you can remove  ```--privileged -v /dev/bus/usb:/dev/bus/usb```.

**NB** : I intend to further enhance this image to display the emulator view. For this feature you will need to mount X11 devices and use the ```--privileged``` flag too.



###Quick Start

Let's create our first app :
(considering you are using my aliases)

```
docker pull kallikrein/android-sdk
```
```
cordova create myAPP
```
(The myAPP folder must NOT exist before using this command.)

```
cd myAPP
```
```
cordova platform add android
```
```
cordova build
```
```
mine ..
```  
If you are launching the app with privilege, you can plug in your phone and :
```cordova run```
