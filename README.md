# State-Estimation
This is a state estimation project, such that we take the output of a certain system, and feeded it to the Kalman filter and particle filter to estimate the internal state of that system.

 In this project we have simulated the following non linear system:
![alt text](https://github.com/anan0110692/State-Estimation/blob/master/tt.jpg)

Then, we feeded the output(z) to the Kalman filter to estimate the internal state of that system(x).
## Requirements:
MATLAB
## How to run the code:
### KALMAN FILTER:
- Clone this repo and make it your MATLAB current folder.
- Run the "nin.m" script file which will generate two signals: xT,y
- Call "kalman1" in this way: kalman1(xT,y)
### Particle FILTER:
- Clone this repo and make it your MATLAB current folder.
- Run the "nin.m" script file which will generate two signals: xT,y
- Call "kalman1" in this way: parttt1(xT,y)
