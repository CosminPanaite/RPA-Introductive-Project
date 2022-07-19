# rf-robocorp-tutorial

Robot Framework Tutorial with Robocorp, including Selenium and Playwright libraries. The project can be used as a starting point for automating own repetitive tasks, or to automatize the manual repetitive tests and verifications performed e.g., during a software development project. Robot Framework makes it easier for anyone with basic scripting knowledge (i.e., not necessarily a developer) to implement and run own automated tests and verifications, that otherwise would be run manually.

In order to setup and run this project, there are two ways. One is with Robocorp, the other is manually with Python and Robot Framework:

# Introduction

Robot Framework is an open-source automation framework, based on Python, that is highly customizable and extendable through libraries. Robot Framework makes Python, which is a native language for automation, accessible to anyone with basic scripting knowledge. This means automation is accessible not only for developers, but for testers, support specialists, or other IT workers.

Robocorp is mainly a **RPA** solution based on Robot Framework. It is going one step further and makes the whole Python and Robot Framework environment setup easier, as well as it makes tasks or tests runs even more accessible. Also, it is putting together and customizing a lot of RPA libraries, basically covering all aspects of computer tasks or tests automation.

# 1. Robocorp QuickStart

The easier is to start with Robocorp, Rcc toolchain, which is automatically installing everything needed for run: https://robocorp.com/

1. Download this project release

2. Install Robocorp Rcc toolchain

    Execute _tools\install rcc.bat_ to install Rcc tool automatically and set the Path environment variable. Otherwise, do it manually:

    Download **Rcc tool** from https://downloads.robocorp.com/rcc/releases/latest/windows64/rcc.exe and copy it anywhere in the PATH (e.g. open Command prompt and type path. The path could be e.g. %userprofile%\Rcc\)

    Open cmd within project directory and run once:
    
    - Disable tracking: `rcc configure identity --do-not-track`
    
    - Check: `rcc configure identity`

3. Run the first task

    Open command prompt and run `rcc run -t SeleniumTask -e devdata\env.json`

    On first run the full environment is loaded, thus the first run will take up to 5 minutes to run.

4. In order to visualize and modify the robot code, there are 3 alternatives:
    - **Visual Studio Code** with extensions (free for personal or commercial use): https://robocorp.com/docs/developer-tools/visual-studio-code/overview
    - Robocorp Lab (free for personal or non-commercial internal business use)
    - PyCharm Community with Robocorp (free, open source)

5. If VS Code is the preferred approach, install the two extensions from the above link or from within VS Code: **Robocorp Code** and **Robot Framework Language Server**

6. Open the downloaded _rf-robocorp-tutorial_ folder within VSCode and check the following files:

- Environment settings: _conda.yaml_
- Tasks names: _robot.yaml_
- Environment variables: _env.json_ and _env-my.json_
- Robot tasks: _tasks-*.robot

7. Run within VS Code or command line:
    - Open project folder within Visual Studio Code, press CTRL+SHIFT+P, _Robocorp: Run Robot_, Choose task to run (will use default devdata/env.json)
    - Command prompt > _rcc run -t taskname -e devdata\env.json_ (taskname as defined in robot.yaml), e.g.:

         `rcc run -t SeleniumTask -e devdata\env.json`

         `rcc run -t PlaywrightTask -e devdata\env.json`

         `rcc run -t SeleniumTask -e devdata\env-my.json`

         `rcc run -t PlaywrightTask -e devdata\env-my.json`

         `rcc run -t MyCustomTask`



## Notes for Robocorp and Rcc.exe

- Environment is downloaded under _AppData\Local\robocorp_. This folder can be removed in order to cleanup everything and start from scratch the above commands.
- First task run or when environment needs updating might take several minutes for all downloads to be performed
- Environment can be cleaned with > `rcc configuration cleanup --help` (e.g. --all, --dryrun, etc.)
    https://robocorp.com/docs/rcc/manual
- Setting **DEBUG=pw:api** environment variables before run, enables Playwright log capture (**Warning**: passwords are logged in this log file)

# 2. Python and Robot Framework QuickStart

Instead of using Robocorp and Rcc tool as described above, it is also possible to setup manually Python environment and corresponding libraries and run the tasks with Robot Framework:

1. Download this project release

2. Environment setup

Download and install **Python 3.10.1** from https://python.org under a local directory, e.g. _C:\Python3x_
    - Choose e.g.: Customize installation, All optional features and Add Python to environment variables option.
    - Make sure that both _Python_ and _Python\Scripts_ directories are added to Path System variable.

Download and install **Node.js 16.14.2** from https://nodejs.org/en/download. It can be installed in the default Program Files location.
    - For upgrade there is no need to remove previous installation, just install the upgrade in the same location. Also, there is no need to reinstall dependencies during upgrade.

3. Run the following commands in order to install Python libraries used by this project:

     > `pip install robotframework`

     > `pip install robotframework-seleniumlibrary`

     > `pip install webdrivermanager`

     > `pip install robotframework-browser`


    - After finishing, run:
    > `rfbrowser init`

    > `webdrivermanager chrome --linkpath C:\Python3x` (or any folder in the PATH)

4. install **Visual Studio Code**

5. Install the two extensions: **Robocorp Code** and **Robot Framework Language Server**

    - Within VSCode go to Extension settings and set Robot > Language-server: Python to e.g. _C:\Python3x\python.exe_ or match with above Python installation directory.

6. Open the downloaded _rf-robocorp-tutorial_ folder within VSCode and check the following files:

- Environment variables: _env.py_ and _env-my.py_
- Robot tests: _test-*.robot

7. Run the test or task with the following command:

    `robot --outputdir result test-s.robot`

    `robot --outputdir result test-p.robot`
  
    `robot --outputdir result --variablefile devdata/env-my.py test-s.robot`
  
    `robot --outputdir result --variablefile devdata/env-my.py test-p.robot`

    `robot --outputdir result test-my.robot`

# 3. Project Files
    
Robocorp specific files:

- _tasks-p.robot_, _tasks-s.robot_, _tasks-my.robot_ contains the tasks instructions
    
- _devdata\env.json_, _devdata\env-my.json_ contains custom variables
    
- _conda.yaml_ defines the environment
        
- _robot.yaml_ defines the tasks and other run parameters

Robot Framework specific files:

- _test-p.robot_, _test-s.robot_, _test-my.robot_ contains the tests instructions

- _devdata\env.py_, _devdata\env-my.py_ contains custom variables

Playwright selectors:
- Run from command line: _node inspect.js_, go to desired URL, then open developer tools, Console and run _playwright.$('text=Google')_ or _playwright.$('anyselector')_ to test different Playwright selectors are working as expected.

# 4. Documentation

- Robocorp Documentation: https://robocorp.com/docs/
    
- Rcc: https://robocorp.com/docs/rcc/overview

- Robocorp RPA Libraries: https://robocorp.com/docs/libraries/rpa-framework

- Robot Framework User Guide: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

- Selenium Keywords: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
  
- Browser Playwright Keywords: https://marketsquare.github.io/robotframework-browser/Browser.html
   
- Robot Framework Standard Libraries: https://robotframework.org/robotframework/#standard-libraries

- Other useful projects examples can be found at: https://github.com/robocorp
