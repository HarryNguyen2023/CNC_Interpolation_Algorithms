# CNC-DDA-Interpolation

## Author Harry Nguyen (11/19/2023)

### 1. Scope

Programming the linear, circular and parabolic (high orders) DDA interpolation algorithm in MATALB. The DDA circular algorithm is refered from the first order sequential circular DDA presented in [1], while the parabolic DDA is given in [2], all from the NUS researchers.

### 2. Overview
In computer numerical control (CNC) machines, the axes' linear motion are discrete and characterized by the unit of BLU or the smallest controllable linear movement of the axes, due to the limitation of servo motor and the mechanical transmission system. Therefore, we need an interpolator algorithm to approximate the desired contour of the 3D CAD models of the cut objects. 

There are 2 common ways to control the CNC axes [1]:
- Reference pulse: each command pulse make the servo motor to move 1 BLU and the frequency of the reference pulse will determine the velocity of the axes' linear motion.
- Reference word: the ratio between the reference words of 2 axes is proportional to the velocity ratio of those 2 axes, which result in the inclination of the mahcine tool's path.

Due to the high precision requirement of the CNC machine, the interpolator system must ensure not only approximate the desired contour to some specific tolerance, but also the desired velocity of machine axes, in order to achieve the required feedrate which relate to the surface quality of the products.
Some of the most popular reference pulse interpolator algorithm are: digital differential analyzer (DDA), Stairs Approximation method and Direct Search method [3], and the DDA has proved to be the most suitable for CNC machine usage. 

### 3. DDA algorithm

This algorithm was invented in the 80s of the last century to fit the limited digital hardware in that time, which try to minimize the memory usage to only a few registers and simplify the operator to only integer addition and subtraction.
In the first days, they are applied on digital hardware system which are solid and unchangeble. However, due to the rapid progress of solid state technology such as the high speed microprocessor or DSP and FPGA, DDA software are now available on many modern CNC machine that bring them the necessary flexibility and ease to incoporated with adaptive control algorithm.

DDA mostly includes the integrand, adder, remainders registers and all the operators are performed according to the input pulse from an external clock. Everytime the adder register is overflow, a reference interrupt pulse will be generated to the servo controller. Overtime, there has been many updated version of the DDA algorithms which enhance the performance with smaller position and velocity error.

### 4. Reference

[1]. F.S. Lim, Y.S. Wong, M. Rahman, Circular interpolators for numerical control: A comparison of the modified DDA techniques and an LSI interpolator, Computers in Industry, Volume 18, Issue 1, 1992, Pages 41-52, ISSN 0166-3615.

[2]. O.H. Chai, Y.S. Wong, A.N. Poo, A DDA parabolic interpolator for computer numerical control of machine tools, Mechatronics, Volume 4, Issue 7, 1994, Pages 673-692, ISSN 0957-4158.

[3]. R.R.Burleson, INTERPOLATION ALGORITHMS FOR MACHINE TOOLS, Fabrication Systems Department, Y-12 Development Division, 1981.
