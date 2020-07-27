# UxPlay is an application to screen iOS devices to Linux

# install dependencies
sudo apt-get install --yes cmake
sudo apt-get install --yes libssl-dev libavahi-compat-libdnssd-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-libav
sudo apt-get install --yes gstreamer1.0-vaapi
sudo apt install --yes gstreamer1.0-plugins-bad

# clone repository
git clone git@github.com:antimof/UxPlay.git
cd UxPlay
mkdir build
cd build
cmake ..
make
# move binary to local bin
sudo mv uxplay /usr/local/bin/
cd ../..
rm -rf UxPlay
