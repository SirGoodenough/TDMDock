FROM jlesage/baseimage-gui:debian-10

RUN ln -s /usr/lib/x86_64-linux-gnu/libxcb-util.so.0.0.0 /usr/lib/x86_64-linux-gnu/libxcb-util.so.1

RUN apt-get update && apt-get upgrade -y
RUN add-pkg libqt5x11extras5 python3 python3-pip git -y --no-install-recommends
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install wheel
RUN python3 -m pip install pyqt5
RUN python3 -m pip install setuptools

# Install Tasmota Device Manager
RUN pip3 install tdmgr

# Set the name of the application (this appears in the browser)
ENV APP_NAME="Tasmota Device Manager"

# Environment Variables
# see https://github.com/jlesage/docker-baseimage-gui/#environment-variables
ENV TZ="America/Chicago"

# Copy the start script
COPY startapp.sh /startapp.sh

# Create volume
VOLUME /config
