FROM ubuntu

MAINTAINER Thomas Charlat

RUN \
  apt-get update && \
  apt-get install -y software-properties-common curl lib32stdc++6 lib32z1


# install node
RUN curl http://nodejs.org/dist/v0.12.4/node-v0.12.4-linux-x64.tar.gz | tar xz -C /usr/local/ --strip=1

# install cordova
RUN npm i -g cordova

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/cache/oracle-jdk8-installer


# download and extract sdk
RUN curl http://dl.google.com/android/android-sdk_r24.2-linux.tgz | tar xz -C /usr/local/


ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# update and accept licences
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/android-sdk-linux/tools/android update sdk --no-ui -a --filter platform-tool,build-tools-22.0.1,android-22
