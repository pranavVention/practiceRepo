# Python Project Deployment - Beginner's guide
It is a good practice to install Python dependencies in a virtual environment. This helps to keep your system clean and organized. This guide will help you create a virtual environment and install Python dependencies in it.

# Create a virtual environment (called .venv)
You can create a virtual environment by following these instructions:
#### macOS/Linux
```bash
python3 -m venv .venv
```
#### Windows
```bash
python -m venv .venv
```

## Activate the virtual environment
```bash
source .venv/bin/activate
```

# Creating python dependencies file
To install a package :
```
pip install <package-name>
```

To save python dependencies in requirements.txt
```bash
pip freeze > requirements.txt
```
### Downloading Dependencies for Offline Installation
If you need to install packages on a machine without an internet connection, you can download them on a machine with internet access using the following command:
```bash
pip download -r requirements.txt -d packages --python-version 3.7.0 --only-binary=:all: 
```
Note: Make sure that the package version specified in ```requirements.txt``` is available for the Python version specified with ```--python-version```.

If a package is not available as a pre-built binary package, you may see the following error message:

    ERROR: Could not find a version that satisfies the requirement <package-name>==<version> (from versions: none)
    ERROR: No matching distribution found for <package-name>==<version>


To download the source distribution of the package, run:
```
cd packages
pip download <package-name>==<version>
``` 

# Installing python dependencies
#### Create a new .venv and activate
```bash 
python -m venv .venv
source .venv/bin/activate
```
To install Python dependencies from the internet, run the following command:
```bash
pip install -r requirements.txt
```

If you don't have an internet connection, you can copy the ```packages``` folder and run the following command:
```bash
pip install --no-index --find-links=packages -r requirements.txt
```

To install other packages that are present as source distribution in ```.tar.gz``` format, run the following command:
```bash
# Example : install paho-mqtt from the tar.gz file
pip install ./packages/paho-mqtt-1.6.1.tar.gz 
```


## To install everything from a bash file:

1. Place the ```packages``` folder and ```requirements.txt``` file in the same directory.

2. In that directory, create ```setup.sh``` file with the following content:
```bash
#!/bin/bash

# create virtual environment
python -m venv .venv

# activate virtual environment
source .venv/bin/activate

# install packages from local directory
pip install --no-index --find-links=packages -r requirements.txt

# iExample : install paho-mqtt from the tar.gz file
pip install ./packages/paho-mqtt-1.6.1.tar.gz
```

3. Make it an executable file
```bash
chmod +x setup.sh
```

4. Run the bash file
```bash
./setup.sh
```

