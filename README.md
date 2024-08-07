# FOSSEE Scilab Octave Toolbox

This is a scilab toolbox to call octave functions. It requires octave to be installed on the system. 

## This toolbox has been built and tested using 
1. `OS - Linux Debian 10, Ubuntu 23.04 (64-bit)`
2. `Octave - Version 7.3.0`
3. `Scilab - Version 6.1.x`

## Software prerequisites:
Run the following commands in the linux terminal
1. `sudo apt-get install build-essential (~117 MB download)`
2. `sudo apt-get install liboctave-dev (~103 MB download)`
3. `sudo apt-get install octave`
4. `sudo apt-get install scilab`

## Install the required octave packages using the below command in linux terminal
1. `sudo apt-get install octave-<pkg name>`
For example, to install signal package in octave, do
1. `sudo apt-get install octave-signal`

## Launch Scilab and run the following commands inside the scilab console
1. `cd <path to fossee-scilab-octave-toolbox directory>`
2. `exec builder.sce`
3. `exec loader.sce`
4. `help octave_fun` (then execute the examples appearing on the help page to test the toolbox)

## Building the source
In case if executing the builder and loader files in scilab throw an error regarding .so files, you probably need to build the toolbox from source. Do the following on the linux terminal
1. Download the fossee-scilab-octave-toolbox source from [`atoms.scilab.org`](https://atoms.scilab.org)
2. Close scilab, if running
3. `cd <path to fossee-scilab-octave-toolbox/src/ directory>`
4. `make clean`
5. `make`
6. `make install`

## Issues Faced in Scilab-Octave Toolbox Development

The Scilab team at FOSSEE, IIT Bombay is developing a toolbox to enable Octave functionalities within Scilab. Throughout this development, we have encountered several key challenges related to version compatibility, dependency management, and build complexity. We are sharing these issues to seek community input and facilitate collaborative problem-solving.

### 1. Version Compatibility Issues
** Problem:** Updates in Scilab can alter the behavior of toolboxes, particularly those involving C or C++ code. For instance, our Octave toolbox, which functioned well in Scilab 5.x, failed in Scilab 6 due to changes in the C interface. These changes resulted in crashes of our function calls.
** Impact:** Each new version of Scilab requires us to validate and potentially modify our toolbox to ensure compatibility, creating a continuous maintenance burden.

### 2. Dependency Management Challenges
** Problem:** Toolboxes often rely on specific versions of external libraries. For instance, the current version of the Scilab Octave toolbox requires liboctave6. However, upgrading to a newer version of Octave may necessitate liboctave7 or a higher version, depending on the latest release. This discrepancy can prevent the toolbox from functioning unless the exact older version of liboctave and its dependencies are installed.
** Impact:** This version mismatch complicates the management of library dependencies and requires careful handling to ensure the toolbox continues to work correctly after an Octave upgrade.

### 3. Build Process Complications
** Problem:** Recommending a source-only approach for building the Octave toolbox presents significant challenges. Users must install a complete C/C++ toolchain, Octave headers, and libraries, and properly configure the builder.sce file with system-specific paths. This process varies across different operating systems (Linux, Windows, Mac) and can be particularly challenging for new users.
** Impact:** The complexity of setup and configuration can discourage users from successfully building the toolbox, making it hard for people to use.

**Call for Contributions
We invite contributors to assist in resolving these issues. Your expertise and insights could help us overcome these challenges and improve the functionality and accessibility of the Scilab-Octave toolbox. **

