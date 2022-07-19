rcc run -t SeleniumTask -e devdata\env.json
rcc run -t PlaywrightTask -e devdata\env.json
rcc run -t SeleniumTask -e devdata\env-my.json
rcc run -t PlaywrightTask -e devdata\env-my.json
rcc run -t MyCustomTask
pause
robot --outputdir result test-s.robot
robot --outputdir result test-p.robot
robot --outputdir result --variablefile devdata/env-my.py test-s.robot
robot --outputdir result --variablefile devdata/env-my.py test-p.robot
robot --outputdir result test-my.robot
pause
