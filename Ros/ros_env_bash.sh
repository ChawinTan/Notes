## ros2 eloquent
sudo apt-get update && sudo apt-get install -q -y \
    dirmngr \
    gnupg2 \
    python3-pip \
    curl \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*
# setup keys
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# setup sources list
sudo echo "deb http://packages.ros.org/ros2/ubuntu bionic main" > /etc/apt/sources.list.d/ros2-latest.list
# install bootstrap tools
sudo apt-get update && apt-get install --no-install-recommends -y \
    git \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    python3-rosdep \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*
ROS_DISTRO=eloquent
rosdep init && rosdep update --rosdistro $ROS_DISTRO
colcon mixin add default \
  https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml && \
colcon mixin update && \
colcon metadata add default \
  https://raw.githubusercontent.com/colcon/colcon-metadata-repository/master/index.yaml && \
colcon metadata update
# argcomplete
sudo apt install -y \
    python3-argcomplete \
    && rm -rf /var/lib/apt/lists/*
sudo apt update && sudo apt install -y \
    ros-$ROS_DISTRO-desktop \
    && rm -rf /var/lib/apt/lists/*
echo "source /opt/ros/$ROS_DISTRO/setup.bash" > ~/.bashrc
source ~/.bashrc
## gazebo-ros-pkgs for gazebo9
echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
# setup keys
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
# install gazebo9
sudo apt-get update && sudo apt-get install -y \
  gazebo9 \
  libgazebo9-dev \
  ros-$ROS_DISTRO-gazebo-ros-pkgs \
  ros-$ROS_DISTRO-gazebo-ros \
  ros-$ROS_DISTRO-gazebo-msgs \
  ros-$ROS_DISTRO-gazebo-dev \
  && rm -rf /var/lib/apt/lists/*
## dependencies for ignition
echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt update && apt install -y g++-8
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8
## dependencies
sudo apt update && sudo apt install -y \
  cmake \
  wget \
  python3-vcstool \
  qt5-default \
  libeigen3-dev \
  libwebsocketpp-dev \
  libboost-all-dev \
  curl \
  python3-shapely \
  python3-yaml \
  python3-requests \
  gdb \
  && rm -rf /var/lib/apt/lists/*
sudo apt-get update && sudo apt-get install -y \
  libccd-dev \
  libfcl-dev \
  ros-$ROS_DISTRO-launch-xml \
  libyaml-cpp-dev \
  python-shapely \
  && rm -rf /var/lib/apt/lists/*
# menge dependencies
sudo apt-get update && sudo apt-get install -y \
  libsdl2-ttf-dev \
  libsdl2-image-dev \
  libsdl2-dev \
  && rm -rf /var/lib/apt/lists/*
# ignition dependencies
sudo apt-get update && sudo apt-get install -y \
  freeglut3-dev \
  libavcodec-dev \
  libavdevice-dev \
  libavformat-dev \
  libavutil-dev \
  libdart6-collision-ode-dev \
  libdart6-dev \
  libdart6-utils-urdf-dev \
  libfreeimage-dev \
  libgflags-dev \
  libglew-dev \
  libgts-dev \
  libogre-1.9-dev \
  libogre-2.1-dev \
  libprotobuf-dev \
  libprotobuf-dev \
  libprotoc-dev \
  libqt5core5a \
  libswscale-dev \
  libtinyxml2-dev \
  libtinyxml-dev \
  pkg-config \
  protobuf-compiler \
  python \
  qml-module-qt-labs-folderlistmodel \
  qml-module-qt-labs-settings \
  qml-module-qtquick2 \
  qml-module-qtquick-controls \
  qml-module-qtquick-controls2 \
  qml-module-qtquick-dialogs \
  qml-module-qtquick-layouts \
  qml-module-qtqml-models2 \
  qtbase5-dev \
  qtdeclarative5-dev \
  qtquickcontrols2-5-dev \
  ruby \
  ruby-ronn \
  uuid-dev \
  libzip-dev \
  libjsoncpp-dev \
  libcurl4-openssl-dev \
  libyaml-dev \
  libzmq3-dev \
  libsqlite3-dev \
  libwebsockets-dev \
  swig \
  ruby-dev \
  && rm -rf /var/lib/apt/lists/*