## setup

- docker-compose -f docker-compose.yml build
- docker-compose -f docker-compose.yml up -d

## run unit tests

- docker-compose -f docker-compose.yml exec toy-robot mix test

## play

- docker-compose -f docker-compose.yml exec toy-robot mix escript.build
- docker-compose -f docker-compose.yml exec toy-robot ./app


## ToDo
- [x] add unit tests
- [x] stateless, functional design
- [x] make it executable
- [x] update documentation
- [] statefull design (actor/genserver?)

------------------


# Toy Robot Simulator

This challenge should take no longer than a couple of hours. Once complete, please send us a link to the repository with your code and tests. The next stage will be an interview with Xplor engineers including some pair programming based on this challenge.

This challenge is to establish your knowledge of the Elixir language and idioms. Thus, please complete this challenge in Elixir.

## Description:
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.  
- There are no other obstructions on the table surface.  
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.  

## Commands
- *PLACE X,Y,F*: will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner. The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
- *MOVE*: will move the toy robot one unit forward in the direction it is currently facing.
- *LEFT*: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- *RIGHT*: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- *REPORT*: will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

## Notes
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.  
- Input can be from a file, or from standard input, as the developer chooses.  
- Provide test data to exercise the application.  


## Constraints

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

## Example Input and Output

```
a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH

b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST

c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```


## Deliverables
The source files, the test data and any test code as well as instructions on how to build, run and test it.
It is not required to provide any graphical output showing the movement of the toy robot.

