# dependencies
# sudo apt install --yes build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

# # dependencies for functionality
# sudo apt install --yes libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

# # download release
# git clone --recursive https://github.com/polybar/polybar
# cd polybar

# # conda causes issues --> deactivate if present
# conda deactivate

# # compilation
# mkdir build
# cd build
# cp ~/dotfiles/xpp/CMakeLists.txt ../lib/xpp/
# cmake ..
# make -j$(nproc)
# # Optional. This will install the polybar executable in /usr/local/bin
# sudo make install

# # remove source code
# cd ../..
# rm -rf polybar
sudo apt install --yes polybar

# copy configs

# install mpc for media control
sudo apt install --yes mpc
sudo apt install --yes dbus

# install for temperature sensors
sudo apt install lm-sensors
sudo apt install hddtemp
sudo sensors-detect
