/* ArcadeGame
* Author: Nujitha
* Creation date: 11/18/21
*/
MACHINE
    ArcadeGame
    
SETS
    GAME_STATE = { Won, Lost, Not_Over, Not_Started } ;
    MESSAGES = { Failed_due_to_insufficient_power, Failed_due_to_space_boundary_issues, 
        Failed_due_to_an_asteroid, Successful_move, Docked, Not_docked,
        Cannot_Warp_Into_Current_Position }
    
CONSTANTS
    xCoordinates, yCoordinates, WholeSpace, Space, AsteroidLocations, StarBase, PowerWasteAstroidCollisions, 
    PowerWasteNormalMove, PowerWasteWarpDrive
    
PROPERTIES
    //Grid coordinations
    xCoordinates <: NAT1 & xCoordinates = 1..12
    & yCoordinates <: NAT1 & yCoordinates = 1..7
    //Imitate the out of boundary scenarios
    & WholeSpace = { xx, yy | xx : NAT1 & yy : NAT1 & xx <= 15 & yy <= 10 }
    //Valid space area
    & Space = xCoordinates * yCoordinates
    //Asteroid locations
    & AsteroidLocations <: Space
    & AsteroidLocations = { 
        (3 |-> 2), (3 |-> 5), (5 |-> 4), (6 |-> 7), (7 |-> 1), 
        (7 |-> 5), (7 |-> 7), (8 |-> 3), (10 |-> 6), (11 |-> 2), (12 |-> 5) }
    //Starbase location
    & StarBase : Space
    & StarBase = 6 |-> 4
    //Power consumption volumes
    & PowerWasteAstroidCollisions = 10
    & PowerWasteNormalMove = 5
    & PowerWasteWarpDrive = 20
    
DEFINITIONS
    isGameOver == ( spaceshipLocation /= StarBase & spaceshipPower /= 0 )
    
VARIABLES
    spaceshipLocation, spaceshipPower, visitedRegions, collisionCount, gameStatus
    
INVARIANT 
    spaceshipLocation : Space & spaceshipPower : NAT & visitedRegions : seq( Space )
    & collisionCount : NAT & gameStatus <: GAME_STATE
    
INITIALISATION
    spaceshipLocation, spaceshipPower, visitedRegions, collisionCount, gameStatus :=  
    1 |-> 1, 0, [ ( 1 |-> 1 ) ], 0, { Not_Started }
    
OPERATIONS
    //start a new game or restart the game
    NewGame( power ) =
    PRE
        power : NAT1 & power mod 20 = 0 & power <= 200
    THEN
        spaceshipLocation, spaceshipPower, visitedRegions, collisionCount, gameStatus :=  
        1 |-> 1, power, [ ( 1 |-> 1 ) ], 0, { Not_Over }
    END ;
    
    //displays information about the spaceship
    location, powerReserves, collisions <-- MissionStatus =
    PRE
        Not_Over : gameStatus
    THEN
        location := spaceshipLocation
        || powerReserves := spaceshipPower
        || collisions := collisionCount
    END ;
    
    //displays the entire route of spaceship
    route <-- RegionsVisited =
    PRE
        Not_Over : gameStatus
    THEN
        route := visitedRegions
    END ;
    
    //displays if the spaceship is docked or not at the starbase
    isSpaceshipDocked <-- DockedAtStarbase =
    PRE
        Not_Over : gameStatus
    THEN
        IF ( spaceshipLocation = StarBase )
        THEN
            isSpaceshipDocked := Docked
        ELSE
            isSpaceshipDocked := Not_docked
        END
    END ;
    
    //display game status
    message <-- GameStatus =
    PRE
        Not_Over : gameStatus
    THEN
        IF ( spaceshipLocation = StarBase )
        THEN
            message := Won
        ELSE IF ( spaceshipPower = 0 )
            THEN
                message := Lost
            ELSE
                message := Not_Over
            END
        END
    END ;
    
    message <-- MoveUp =
    PRE
        isGameOver
    THEN
        //check if spaceship has sufficient power
        IF ( spaceshipPower < PowerWasteNormalMove ) 
        THEN
            gameStatus := { Lost } || message := Failed_due_to_insufficient_power
            //check if the spaceship is within the space boundary
        ELSIF ( ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                    succ( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ) /: Space )
        THEN
            message := Failed_due_to_space_boundary_issues
            //check if spaceship in collides an asteriod
        ELSIF ( ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                    succ( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ) : AsteroidLocations ) 
        THEN
            spaceshipPower := spaceshipPower - PowerWasteAstroidCollisions
            || collisionCount := succ( collisionCount )
            || message := Failed_due_to_an_asteroid
            //check if spaceship docked at starbase
        ELSIF ( spaceshipLocation = StarBase )
        THEN
            gameStatus := { Won }
            || message := Successful_move
        ELSE //successful move
            spaceshipPower := (spaceshipPower - PowerWasteNormalMove)
            || spaceshipLocation := ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                succ( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) )
            || visitedRegions := visitedRegions ^ [ ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                    succ( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ) ]
            || message := Successful_move
        END
    END ;
    
    message <-- MoveDown =
    PRE
        isGameOver
    THEN
        //check if spaceship has sufficient power
        IF ( spaceshipPower < PowerWasteNormalMove ) 
        THEN
            gameStatus := { Lost } || message := Failed_due_to_insufficient_power
            //check if the spaceship is within the space boundary
        ELSIF ( ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                    pred( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ) /: Space )
        THEN
            message := Failed_due_to_space_boundary_issues
            //check if spaceship in collides an asteriod
        ELSIF ( ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                    pred( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ) : AsteroidLocations ) 
        THEN
            spaceshipPower := spaceshipPower - PowerWasteAstroidCollisions
            || collisionCount := succ( collisionCount )
            || message := Failed_due_to_an_asteroid
            //check if spaceship docked at starbase
        ELSIF ( spaceshipLocation = StarBase )
        THEN
            gameStatus := { Won }
            || message := Successful_move
        ELSE //successful move
            spaceshipPower := (spaceshipPower - PowerWasteNormalMove)
            || spaceshipLocation := ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                pred( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) )
            || visitedRegions := visitedRegions ^ [ ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) |-> 
                    pred( prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ) ]
            || message := Successful_move
        END
    END ;
    
    message <-- MoveForward =
    PRE
        isGameOver
    THEN
        //check if spaceship has sufficient power
        IF ( spaceshipPower < PowerWasteNormalMove ) 
        THEN
            gameStatus := { Lost } || message := Failed_due_to_insufficient_power
            //check if the spaceship is within the space boundary
        ELSIF ( ( succ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                    prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) /: Space )
        THEN
            message := Failed_due_to_space_boundary_issues
            //check if spaceship in collides an asteriod
        ELSIF ( ( succ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                    prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) : AsteroidLocations ) 
        THEN
            spaceshipPower := spaceshipPower - PowerWasteAstroidCollisions
            || collisionCount := succ( collisionCount )
            || message := Failed_due_to_an_asteroid
            //check if spaceship docked at starbase
        ELSIF ( spaceshipLocation = StarBase )
        THEN
            gameStatus := { Won }
            || message := Successful_move
        ELSE //successful move
            spaceshipPower := (spaceshipPower - PowerWasteNormalMove)
            || spaceshipLocation := ( succ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                prj2(xCoordinates, yCoordinates)(spaceshipLocation) )
            || visitedRegions := visitedRegions ^ [ ( succ( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                    prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ]
            || message := Successful_move
        END
    END ;
    
    message <-- MoveBackward =
    PRE
        isGameOver
    THEN
        //check if spaceship has sufficient power
        IF ( spaceshipPower < PowerWasteNormalMove ) 
        THEN
            gameStatus := { Lost } || message := Failed_due_to_insufficient_power
            //check if the spaceship is within the space boundary
        ELSIF ( ( pred( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                    prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) /: Space )
        THEN
            message := Failed_due_to_space_boundary_issues
            //check if spaceship in collides an asteriod
        ELSIF ( ( pred( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                    prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) : AsteroidLocations ) 
        THEN
            spaceshipPower := spaceshipPower - PowerWasteAstroidCollisions
            || collisionCount := succ( collisionCount )
            || message := Failed_due_to_an_asteroid
            //check if spaceship docked at starbase
        ELSIF ( spaceshipLocation = StarBase )
        THEN
            gameStatus := { Won }
            || message := Successful_move
        ELSE //successful move
            spaceshipPower := (spaceshipPower - PowerWasteNormalMove)
            || spaceshipLocation := ( pred( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                prj2(xCoordinates, yCoordinates)(spaceshipLocation) )
            || visitedRegions := visitedRegions ^ [ ( pred( prj1(xCoordinates, yCoordinates)(spaceshipLocation) ) |-> 
                    prj2(xCoordinates, yCoordinates)(spaceshipLocation) ) ]
            || message := Successful_move
        END
    END ;
    
    message <-- EngageWarpDrive( newposition ) =
    PRE
        isGameOver & newposition : WholeSpace
    THEN
        //check if spaceship has sufficient power
        IF ( spaceshipPower < PowerWasteWarpDrive )
        THEN
            gameStatus := { Lost } || message := Failed_due_to_insufficient_power
            //check if the spaceship is within the space boundary
        ELSIF ( newposition /: Space )
        THEN
            message := Failed_due_to_space_boundary_issues
            //check if spaceship in collides an asteriod
        ELSIF ( newposition : AsteroidLocations )
        THEN
            message := Failed_due_to_an_asteroid
            //prevent warp into current position
        ELSIF ( newposition = spaceshipLocation )
        THEN
            message := Cannot_Warp_Into_Current_Position
            //check if spaceship docked at starbase
        ELSIF ( spaceshipLocation = StarBase )
        THEN
            gameStatus := { Won }
            || message := Successful_move
            //successful move
        ELSE
            spaceshipPower := (spaceshipPower - PowerWasteWarpDrive)
            || spaceshipLocation := newposition
            || visitedRegions := visitedRegions ^ [ newposition ]
            || message := Successful_move
        END
    END 
    
END
