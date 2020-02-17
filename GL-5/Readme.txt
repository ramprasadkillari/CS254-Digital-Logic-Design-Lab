Lab for 20th of March 2019, CS254

Here is the lab assignment

Part 1: There is an elevator that services 0+6 floors (ground plus six
floors).
Outside each floor is a pair of call buttons, one for going up, and the
other for going down.
Inside the elevator are 7 buttons for each of the 7 floors, a stop button
for emergency stop, buttons for opening and closing the elevator.
Design an algorithm that would facilitate a work conserving elevator
When the elevator is in motion, it wants to complete all tasks in that
direction of motion
When there are no requests, the elevator resides at some default floor
What is the size of the buffer that you will need to store queue values?

Part 2:

Test bench should use the foll data set:
Dataset
start=0
1,2,5,6,0,1,3,4,5,2,0,3,4,3,5,0,2,idle_50,6,2,1,6,4,5,3,2,3,6,5,0,1,4,0,6,3,4,0,3,4,idle_100,0,5,2,3,0,1,2,4,6,0,3,5,0,2,4,0,1,3,5,0,
3,4,1,2,4,3,2,5,6,6,2, idle_30, 3,0,4,2,3,4,5,2,3,5,1,0,3,0,4,0,5,0,3,4,0
Each of the above requests arrive after 25 time units.
Compute average waiting time at a floor.
Assume 10 time units at each floor (for people to get in or depart the
elevator) and assume 10 time units to move between adjacent floors.
Calculate total time to execute above data-set. Assume that requests keep
arriving and that you would not be in a position that the elevator is idle
(unless stated). Idle_x implies that the elevator is idle for that much
time.
