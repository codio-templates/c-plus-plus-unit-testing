---------

## Install Google Test yourself

Enter the following commands in a terminal window if you want to add Google test on your own.
```bash
sudo apt update
sudo apt-get install libgtest-dev
cd /usr/src/googletest/googletest
sudo mkdir build
cd build
sudo apt-get install cmake
sudo cmake ..
sudo make
sudo cp libgtest* /usr/lib/
cd ..
sudo rm -rf build

sudo mkdir /usr/local/lib/googletest
sudo ln -s /usr/lib/libgtest.a /usr/local/lib/googletest/libgtest.a
sudo ln -s /usr/lib/libgtest_main.a /usr/local/lib/googletest/libgtest_main.a
```

## Install the XML parser
If you want to parse the output from the unit tests, you'll need to install an XML parser.

`sudo apt install libxml2-utils`

## Create a new stack
To create a new stack with this installation see [these instructions](https://docs.codio.com/common/develop/stacks/create-stack.html#create-stack). 