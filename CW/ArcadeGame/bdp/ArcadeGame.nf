Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(ArcadeGame))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(ArcadeGame))==(Machine(ArcadeGame));
  Level(Machine(ArcadeGame))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(ArcadeGame)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(ArcadeGame))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(ArcadeGame))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(ArcadeGame))==(?);
  List_Includes(Machine(ArcadeGame))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(ArcadeGame))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(ArcadeGame))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(ArcadeGame))==(?);
  Context_List_Variables(Machine(ArcadeGame))==(?);
  Abstract_List_Variables(Machine(ArcadeGame))==(?);
  Local_List_Variables(Machine(ArcadeGame))==(gameStatus,collisionCount,visitedRegions,spaceshipPower,spaceshipLocation);
  List_Variables(Machine(ArcadeGame))==(gameStatus,collisionCount,visitedRegions,spaceshipPower,spaceshipLocation);
  External_List_Variables(Machine(ArcadeGame))==(gameStatus,collisionCount,visitedRegions,spaceshipPower,spaceshipLocation)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(ArcadeGame))==(?);
  Abstract_List_VisibleVariables(Machine(ArcadeGame))==(?);
  External_List_VisibleVariables(Machine(ArcadeGame))==(?);
  Expanded_List_VisibleVariables(Machine(ArcadeGame))==(?);
  List_VisibleVariables(Machine(ArcadeGame))==(?);
  Internal_List_VisibleVariables(Machine(ArcadeGame))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(ArcadeGame))==(btrue);
  Gluing_List_Invariant(Machine(ArcadeGame))==(btrue);
  Expanded_List_Invariant(Machine(ArcadeGame))==(btrue);
  Abstract_List_Invariant(Machine(ArcadeGame))==(btrue);
  Context_List_Invariant(Machine(ArcadeGame))==(btrue);
  List_Invariant(Machine(ArcadeGame))==(spaceshipLocation: Space & spaceshipPower: NAT & visitedRegions: seq(Space) & collisionCount: NAT & gameStatus <: GAME_STATE)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(ArcadeGame))==(btrue);
  Abstract_List_Assertions(Machine(ArcadeGame))==(btrue);
  Context_List_Assertions(Machine(ArcadeGame))==(btrue);
  List_Assertions(Machine(ArcadeGame))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(ArcadeGame))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(ArcadeGame))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(ArcadeGame))==(spaceshipLocation,spaceshipPower,visitedRegions,collisionCount,gameStatus:=1|->1,0,[1|->1],0,{Not_Started});
  Context_List_Initialisation(Machine(ArcadeGame))==(skip);
  List_Initialisation(Machine(ArcadeGame))==(spaceshipLocation,spaceshipPower,visitedRegions,collisionCount,gameStatus:=1|->1,0,[1|->1],0,{Not_Started})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(ArcadeGame))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(ArcadeGame))==(btrue);
  List_Constraints(Machine(ArcadeGame))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(ArcadeGame))==(NewGame,MissionStatus,RegionsVisited,DockedAtStarbase,GameStatus,MoveUp,MoveDown,MoveForward,MoveBackward,EngageWarpDrive);
  List_Operations(Machine(ArcadeGame))==(NewGame,MissionStatus,RegionsVisited,DockedAtStarbase,GameStatus,MoveUp,MoveDown,MoveForward,MoveBackward,EngageWarpDrive)
END
&
THEORY ListInputX IS
  List_Input(Machine(ArcadeGame),NewGame)==(power);
  List_Input(Machine(ArcadeGame),MissionStatus)==(?);
  List_Input(Machine(ArcadeGame),RegionsVisited)==(?);
  List_Input(Machine(ArcadeGame),DockedAtStarbase)==(?);
  List_Input(Machine(ArcadeGame),GameStatus)==(?);
  List_Input(Machine(ArcadeGame),MoveUp)==(?);
  List_Input(Machine(ArcadeGame),MoveDown)==(?);
  List_Input(Machine(ArcadeGame),MoveForward)==(?);
  List_Input(Machine(ArcadeGame),MoveBackward)==(?);
  List_Input(Machine(ArcadeGame),EngageWarpDrive)==(newposition)
END
&
THEORY ListOutputX IS
  List_Output(Machine(ArcadeGame),NewGame)==(?);
  List_Output(Machine(ArcadeGame),MissionStatus)==(location,powerReserves,collisions);
  List_Output(Machine(ArcadeGame),RegionsVisited)==(route);
  List_Output(Machine(ArcadeGame),DockedAtStarbase)==(isSpaceshipDocked);
  List_Output(Machine(ArcadeGame),GameStatus)==(message);
  List_Output(Machine(ArcadeGame),MoveUp)==(message);
  List_Output(Machine(ArcadeGame),MoveDown)==(message);
  List_Output(Machine(ArcadeGame),MoveForward)==(message);
  List_Output(Machine(ArcadeGame),MoveBackward)==(message);
  List_Output(Machine(ArcadeGame),EngageWarpDrive)==(message)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(ArcadeGame),NewGame)==(NewGame(power));
  List_Header(Machine(ArcadeGame),MissionStatus)==(location,powerReserves,collisions <-- MissionStatus);
  List_Header(Machine(ArcadeGame),RegionsVisited)==(route <-- RegionsVisited);
  List_Header(Machine(ArcadeGame),DockedAtStarbase)==(isSpaceshipDocked <-- DockedAtStarbase);
  List_Header(Machine(ArcadeGame),GameStatus)==(message <-- GameStatus);
  List_Header(Machine(ArcadeGame),MoveUp)==(message <-- MoveUp);
  List_Header(Machine(ArcadeGame),MoveDown)==(message <-- MoveDown);
  List_Header(Machine(ArcadeGame),MoveForward)==(message <-- MoveForward);
  List_Header(Machine(ArcadeGame),MoveBackward)==(message <-- MoveBackward);
  List_Header(Machine(ArcadeGame),EngageWarpDrive)==(message <-- EngageWarpDrive(newposition))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(ArcadeGame),NewGame)==(power: NAT1 & power mod 20 = 0 & power<=200);
  List_Precondition(Machine(ArcadeGame),MissionStatus)==(Not_Over: gameStatus);
  List_Precondition(Machine(ArcadeGame),RegionsVisited)==(Not_Over: gameStatus);
  List_Precondition(Machine(ArcadeGame),DockedAtStarbase)==(Not_Over: gameStatus);
  List_Precondition(Machine(ArcadeGame),GameStatus)==(Not_Over: gameStatus);
  List_Precondition(Machine(ArcadeGame),MoveUp)==(spaceshipLocation/=StarBase & spaceshipPower/=0);
  List_Precondition(Machine(ArcadeGame),MoveDown)==(spaceshipLocation/=StarBase & spaceshipPower/=0);
  List_Precondition(Machine(ArcadeGame),MoveForward)==(spaceshipLocation/=StarBase & spaceshipPower/=0);
  List_Precondition(Machine(ArcadeGame),MoveBackward)==(spaceshipLocation/=StarBase & spaceshipPower/=0);
  List_Precondition(Machine(ArcadeGame),EngageWarpDrive)==(spaceshipLocation/=StarBase & spaceshipPower/=0 & newposition: WholeSpace)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(ArcadeGame),EngageWarpDrive)==(spaceshipLocation/=StarBase & spaceshipPower/=0 & newposition: WholeSpace | spaceshipPower<PowerWasteWarpDrive ==> gameStatus,message:={Lost},Failed_due_to_insufficient_power [] not(spaceshipPower<PowerWasteWarpDrive) ==> (newposition/:Space ==> message:=Failed_due_to_space_boundary_issues [] not(newposition/:Space) ==> (newposition: AsteroidLocations ==> message:=Failed_due_to_an_asteroid [] not(newposition: AsteroidLocations) ==> (newposition = spaceshipLocation ==> message:=Cannot_Warp_Into_Current_Position [] not(newposition = spaceshipLocation) ==> (spaceshipLocation = StarBase ==> gameStatus,message:={Won},Successful_move [] not(spaceshipLocation = StarBase) ==> spaceshipPower,spaceshipLocation,visitedRegions,message:=spaceshipPower-PowerWasteWarpDrive,newposition,visitedRegions^[newposition],Successful_move)))));
  Expanded_List_Substitution(Machine(ArcadeGame),MoveBackward)==(spaceshipLocation/=StarBase & spaceshipPower/=0 | spaceshipPower<PowerWasteNormalMove ==> gameStatus,message:={Lost},Failed_due_to_insufficient_power [] not(spaceshipPower<PowerWasteNormalMove) ==> (pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)/:Space ==> message:=Failed_due_to_space_boundary_issues [] not(pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)/:Space) ==> (pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation): AsteroidLocations ==> spaceshipPower,collisionCount,message:=spaceshipPower-PowerWasteAstroidCollisions,succ(collisionCount),Failed_due_to_an_asteroid [] not(pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation): AsteroidLocations) ==> (spaceshipLocation = StarBase ==> gameStatus,message:={Won},Successful_move [] not(spaceshipLocation = StarBase) ==> spaceshipPower,spaceshipLocation,visitedRegions,message:=spaceshipPower-PowerWasteNormalMove,pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation),visitedRegions^[pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)],Successful_move))));
  Expanded_List_Substitution(Machine(ArcadeGame),MoveForward)==(spaceshipLocation/=StarBase & spaceshipPower/=0 | spaceshipPower<PowerWasteNormalMove ==> gameStatus,message:={Lost},Failed_due_to_insufficient_power [] not(spaceshipPower<PowerWasteNormalMove) ==> (succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)/:Space ==> message:=Failed_due_to_space_boundary_issues [] not(succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)/:Space) ==> (succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation): AsteroidLocations ==> spaceshipPower,collisionCount,message:=spaceshipPower-PowerWasteAstroidCollisions,succ(collisionCount),Failed_due_to_an_asteroid [] not(succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation): AsteroidLocations) ==> (spaceshipLocation = StarBase ==> gameStatus,message:={Won},Successful_move [] not(spaceshipLocation = StarBase) ==> spaceshipPower,spaceshipLocation,visitedRegions,message:=spaceshipPower-PowerWasteNormalMove,succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation),visitedRegions^[succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)],Successful_move))));
  Expanded_List_Substitution(Machine(ArcadeGame),MoveDown)==(spaceshipLocation/=StarBase & spaceshipPower/=0 | spaceshipPower<PowerWasteNormalMove ==> gameStatus,message:={Lost},Failed_due_to_insufficient_power [] not(spaceshipPower<PowerWasteNormalMove) ==> (prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation))/:Space ==> message:=Failed_due_to_space_boundary_issues [] not(prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation))/:Space) ==> (prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation)): AsteroidLocations ==> spaceshipPower,collisionCount,message:=spaceshipPower-PowerWasteAstroidCollisions,succ(collisionCount),Failed_due_to_an_asteroid [] not(prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation)): AsteroidLocations) ==> (spaceshipLocation = StarBase ==> gameStatus,message:={Won},Successful_move [] not(spaceshipLocation = StarBase) ==> spaceshipPower,spaceshipLocation,visitedRegions,message:=spaceshipPower-PowerWasteNormalMove,prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation)),visitedRegions^[prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation))],Successful_move))));
  Expanded_List_Substitution(Machine(ArcadeGame),MoveUp)==(spaceshipLocation/=StarBase & spaceshipPower/=0 | spaceshipPower<PowerWasteNormalMove ==> gameStatus,message:={Lost},Failed_due_to_insufficient_power [] not(spaceshipPower<PowerWasteNormalMove) ==> (prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation))/:Space ==> message:=Failed_due_to_space_boundary_issues [] not(prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation))/:Space) ==> (prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation)): AsteroidLocations ==> spaceshipPower,collisionCount,message:=spaceshipPower-PowerWasteAstroidCollisions,succ(collisionCount),Failed_due_to_an_asteroid [] not(prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation)): AsteroidLocations) ==> (spaceshipLocation = StarBase ==> gameStatus,message:={Won},Successful_move [] not(spaceshipLocation = StarBase) ==> spaceshipPower,spaceshipLocation,visitedRegions,message:=spaceshipPower-PowerWasteNormalMove,prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation)),visitedRegions^[prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation))],Successful_move))));
  Expanded_List_Substitution(Machine(ArcadeGame),GameStatus)==(Not_Over: gameStatus | spaceshipLocation = StarBase ==> message:=Won [] not(spaceshipLocation = StarBase) ==> (spaceshipPower = 0 ==> message:=Lost [] not(spaceshipPower = 0) ==> message:=Not_Over));
  Expanded_List_Substitution(Machine(ArcadeGame),DockedAtStarbase)==(Not_Over: gameStatus | spaceshipLocation = StarBase ==> isSpaceshipDocked:=Docked [] not(spaceshipLocation = StarBase) ==> isSpaceshipDocked:=Not_docked);
  Expanded_List_Substitution(Machine(ArcadeGame),RegionsVisited)==(Not_Over: gameStatus | route:=visitedRegions);
  Expanded_List_Substitution(Machine(ArcadeGame),MissionStatus)==(Not_Over: gameStatus | location,powerReserves,collisions:=spaceshipLocation,spaceshipPower,collisionCount);
  Expanded_List_Substitution(Machine(ArcadeGame),NewGame)==(power: NAT1 & power mod 20 = 0 & power<=200 | spaceshipLocation,spaceshipPower,visitedRegions,collisionCount,gameStatus:=1|->1,power,[1|->1],0,{Not_Over});
  List_Substitution(Machine(ArcadeGame),NewGame)==(spaceshipLocation,spaceshipPower,visitedRegions,collisionCount,gameStatus:=1|->1,power,[1|->1],0,{Not_Over});
  List_Substitution(Machine(ArcadeGame),MissionStatus)==(location:=spaceshipLocation || powerReserves:=spaceshipPower || collisions:=collisionCount);
  List_Substitution(Machine(ArcadeGame),RegionsVisited)==(route:=visitedRegions);
  List_Substitution(Machine(ArcadeGame),DockedAtStarbase)==(IF spaceshipLocation = StarBase THEN isSpaceshipDocked:=Docked ELSE isSpaceshipDocked:=Not_docked END);
  List_Substitution(Machine(ArcadeGame),GameStatus)==(IF spaceshipLocation = StarBase THEN message:=Won ELSE IF spaceshipPower = 0 THEN message:=Lost ELSE message:=Not_Over END END);
  List_Substitution(Machine(ArcadeGame),MoveUp)==(IF spaceshipPower<PowerWasteNormalMove THEN gameStatus:={Lost} || message:=Failed_due_to_insufficient_power ELSIF prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation))/:Space THEN message:=Failed_due_to_space_boundary_issues ELSIF prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation)): AsteroidLocations THEN spaceshipPower:=spaceshipPower-PowerWasteAstroidCollisions || collisionCount:=succ(collisionCount) || message:=Failed_due_to_an_asteroid ELSIF spaceshipLocation = StarBase THEN gameStatus:={Won} || message:=Successful_move ELSE spaceshipPower:=spaceshipPower-PowerWasteNormalMove || spaceshipLocation:=prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation)) || visitedRegions:=visitedRegions^[prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->succ(prj2(xCoordinates,yCoordinates)(spaceshipLocation))] || message:=Successful_move END);
  List_Substitution(Machine(ArcadeGame),MoveDown)==(IF spaceshipPower<PowerWasteNormalMove THEN gameStatus:={Lost} || message:=Failed_due_to_insufficient_power ELSIF prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation))/:Space THEN message:=Failed_due_to_space_boundary_issues ELSIF prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation)): AsteroidLocations THEN spaceshipPower:=spaceshipPower-PowerWasteAstroidCollisions || collisionCount:=succ(collisionCount) || message:=Failed_due_to_an_asteroid ELSIF spaceshipLocation = StarBase THEN gameStatus:={Won} || message:=Successful_move ELSE spaceshipPower:=spaceshipPower-PowerWasteNormalMove || spaceshipLocation:=prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation)) || visitedRegions:=visitedRegions^[prj1(xCoordinates,yCoordinates)(spaceshipLocation)|->pred(prj2(xCoordinates,yCoordinates)(spaceshipLocation))] || message:=Successful_move END);
  List_Substitution(Machine(ArcadeGame),MoveForward)==(IF spaceshipPower<PowerWasteNormalMove THEN gameStatus:={Lost} || message:=Failed_due_to_insufficient_power ELSIF succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)/:Space THEN message:=Failed_due_to_space_boundary_issues ELSIF succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation): AsteroidLocations THEN spaceshipPower:=spaceshipPower-PowerWasteAstroidCollisions || collisionCount:=succ(collisionCount) || message:=Failed_due_to_an_asteroid ELSIF spaceshipLocation = StarBase THEN gameStatus:={Won} || message:=Successful_move ELSE spaceshipPower:=spaceshipPower-PowerWasteNormalMove || spaceshipLocation:=succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation) || visitedRegions:=visitedRegions^[succ(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)] || message:=Successful_move END);
  List_Substitution(Machine(ArcadeGame),MoveBackward)==(IF spaceshipPower<PowerWasteNormalMove THEN gameStatus:={Lost} || message:=Failed_due_to_insufficient_power ELSIF pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)/:Space THEN message:=Failed_due_to_space_boundary_issues ELSIF pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation): AsteroidLocations THEN spaceshipPower:=spaceshipPower-PowerWasteAstroidCollisions || collisionCount:=succ(collisionCount) || message:=Failed_due_to_an_asteroid ELSIF spaceshipLocation = StarBase THEN gameStatus:={Won} || message:=Successful_move ELSE spaceshipPower:=spaceshipPower-PowerWasteNormalMove || spaceshipLocation:=pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation) || visitedRegions:=visitedRegions^[pred(prj1(xCoordinates,yCoordinates)(spaceshipLocation))|->prj2(xCoordinates,yCoordinates)(spaceshipLocation)] || message:=Successful_move END);
  List_Substitution(Machine(ArcadeGame),EngageWarpDrive)==(IF spaceshipPower<PowerWasteWarpDrive THEN gameStatus:={Lost} || message:=Failed_due_to_insufficient_power ELSIF newposition/:Space THEN message:=Failed_due_to_space_boundary_issues ELSIF newposition: AsteroidLocations THEN message:=Failed_due_to_an_asteroid ELSIF newposition = spaceshipLocation THEN message:=Cannot_Warp_Into_Current_Position ELSIF spaceshipLocation = StarBase THEN gameStatus:={Won} || message:=Successful_move ELSE spaceshipPower:=spaceshipPower-PowerWasteWarpDrive || spaceshipLocation:=newposition || visitedRegions:=visitedRegions^[newposition] || message:=Successful_move END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(ArcadeGame))==(xCoordinates,yCoordinates,WholeSpace,Space,AsteroidLocations,StarBase,PowerWasteAstroidCollisions,PowerWasteNormalMove,PowerWasteWarpDrive);
  Inherited_List_Constants(Machine(ArcadeGame))==(?);
  List_Constants(Machine(ArcadeGame))==(xCoordinates,yCoordinates,WholeSpace,Space,AsteroidLocations,StarBase,PowerWasteAstroidCollisions,PowerWasteNormalMove,PowerWasteWarpDrive)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(ArcadeGame),GAME_STATE)==({Won,Lost,Not_Over,Not_Started});
  Context_List_Enumerated(Machine(ArcadeGame))==(?);
  Context_List_Defered(Machine(ArcadeGame))==(?);
  Context_List_Sets(Machine(ArcadeGame))==(?);
  List_Valuable_Sets(Machine(ArcadeGame))==(?);
  Inherited_List_Enumerated(Machine(ArcadeGame))==(?);
  Inherited_List_Defered(Machine(ArcadeGame))==(?);
  Inherited_List_Sets(Machine(ArcadeGame))==(?);
  List_Enumerated(Machine(ArcadeGame))==(GAME_STATE,MESSAGES);
  List_Defered(Machine(ArcadeGame))==(?);
  List_Sets(Machine(ArcadeGame))==(GAME_STATE,MESSAGES);
  Set_Definition(Machine(ArcadeGame),MESSAGES)==({Failed_due_to_insufficient_power,Failed_due_to_space_boundary_issues,Failed_due_to_an_asteroid,Successful_move,Docked,Not_docked,Cannot_Warp_Into_Current_Position})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(ArcadeGame))==(?);
  Expanded_List_HiddenConstants(Machine(ArcadeGame))==(?);
  List_HiddenConstants(Machine(ArcadeGame))==(?);
  External_List_HiddenConstants(Machine(ArcadeGame))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(ArcadeGame))==(btrue);
  Context_List_Properties(Machine(ArcadeGame))==(btrue);
  Inherited_List_Properties(Machine(ArcadeGame))==(btrue);
  List_Properties(Machine(ArcadeGame))==(xCoordinates <: NAT1 & xCoordinates = 1..12 & yCoordinates <: NAT1 & yCoordinates = 1..7 & WholeSpace = {xx,yy | xx: NAT1 & yy: NAT1 & xx<=15 & yy<=10} & Space = xCoordinates*yCoordinates & AsteroidLocations <: Space & AsteroidLocations = {3|->2,3|->5,5|->4,6|->7,7|->1,7|->5,7|->7,8|->3,10|->6,11|->2,12|->5} & StarBase: Space & StarBase = 6|->4 & PowerWasteAstroidCollisions = 10 & PowerWasteNormalMove = 5 & PowerWasteWarpDrive = 20 & GAME_STATE: FIN(INTEGER) & not(GAME_STATE = {}) & MESSAGES: FIN(INTEGER) & not(MESSAGES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(ArcadeGame),NewGame)==(?);
  List_ANY_Var(Machine(ArcadeGame),MissionStatus)==(?);
  List_ANY_Var(Machine(ArcadeGame),RegionsVisited)==(?);
  List_ANY_Var(Machine(ArcadeGame),DockedAtStarbase)==(?);
  List_ANY_Var(Machine(ArcadeGame),GameStatus)==(?);
  List_ANY_Var(Machine(ArcadeGame),MoveUp)==(?);
  List_ANY_Var(Machine(ArcadeGame),MoveDown)==(?);
  List_ANY_Var(Machine(ArcadeGame),MoveForward)==(?);
  List_ANY_Var(Machine(ArcadeGame),MoveBackward)==(?);
  List_ANY_Var(Machine(ArcadeGame),EngageWarpDrive)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(ArcadeGame)) == (xCoordinates,yCoordinates,WholeSpace,Space,AsteroidLocations,StarBase,PowerWasteAstroidCollisions,PowerWasteNormalMove,PowerWasteWarpDrive,GAME_STATE,MESSAGES,Won,Lost,Not_Over,Not_Started,Failed_due_to_insufficient_power,Failed_due_to_space_boundary_issues,Failed_due_to_an_asteroid,Successful_move,Docked,Not_docked,Cannot_Warp_Into_Current_Position | ? | gameStatus,collisionCount,visitedRegions,spaceshipPower,spaceshipLocation | ? | NewGame,MissionStatus,RegionsVisited,DockedAtStarbase,GameStatus,MoveUp,MoveDown,MoveForward,MoveBackward,EngageWarpDrive | ? | ? | ? | ArcadeGame);
  List_Of_HiddenCst_Ids(Machine(ArcadeGame)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(ArcadeGame)) == (xCoordinates,yCoordinates,WholeSpace,Space,AsteroidLocations,StarBase,PowerWasteAstroidCollisions,PowerWasteNormalMove,PowerWasteWarpDrive);
  List_Of_VisibleVar_Ids(Machine(ArcadeGame)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(ArcadeGame)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(ArcadeGame)) == (Type(GAME_STATE) == Cst(SetOf(etype(GAME_STATE,0,3)));Type(MESSAGES) == Cst(SetOf(etype(MESSAGES,0,6))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(ArcadeGame)) == (Type(Won) == Cst(etype(GAME_STATE,0,3));Type(Lost) == Cst(etype(GAME_STATE,0,3));Type(Not_Over) == Cst(etype(GAME_STATE,0,3));Type(Not_Started) == Cst(etype(GAME_STATE,0,3));Type(Failed_due_to_insufficient_power) == Cst(etype(MESSAGES,0,6));Type(Failed_due_to_space_boundary_issues) == Cst(etype(MESSAGES,0,6));Type(Failed_due_to_an_asteroid) == Cst(etype(MESSAGES,0,6));Type(Successful_move) == Cst(etype(MESSAGES,0,6));Type(Docked) == Cst(etype(MESSAGES,0,6));Type(Not_docked) == Cst(etype(MESSAGES,0,6));Type(Cannot_Warp_Into_Current_Position) == Cst(etype(MESSAGES,0,6));Type(xCoordinates) == Cst(SetOf(btype(INTEGER,"[xCoordinates","]xCoordinates")));Type(yCoordinates) == Cst(SetOf(btype(INTEGER,"[yCoordinates","]yCoordinates")));Type(WholeSpace) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(Space) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(AsteroidLocations) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(StarBase) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(PowerWasteAstroidCollisions) == Cst(btype(INTEGER,?,?));Type(PowerWasteNormalMove) == Cst(btype(INTEGER,?,?));Type(PowerWasteWarpDrive) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(ArcadeGame)) == (Type(gameStatus) == Mvl(SetOf(etype(GAME_STATE,?,?)));Type(collisionCount) == Mvl(btype(INTEGER,?,?));Type(visitedRegions) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(spaceshipPower) == Mvl(btype(INTEGER,?,?));Type(spaceshipLocation) == Mvl(btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(ArcadeGame)) == (Type(EngageWarpDrive) == Cst(etype(MESSAGES,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(MoveBackward) == Cst(etype(MESSAGES,?,?),No_type);Type(MoveForward) == Cst(etype(MESSAGES,?,?),No_type);Type(MoveDown) == Cst(etype(MESSAGES,?,?),No_type);Type(MoveUp) == Cst(etype(MESSAGES,?,?),No_type);Type(GameStatus) == Cst(etype(GAME_STATE,?,?),No_type);Type(DockedAtStarbase) == Cst(etype(MESSAGES,?,?),No_type);Type(RegionsVisited) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(MissionStatus) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(NewGame) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(ArcadeGame)) == (Type(GameStatus) == Cst(etype(GAME_STATE,?,?),No_type);Type(DockedAtStarbase) == Cst(etype(MESSAGES,?,?),No_type);Type(RegionsVisited) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(MissionStatus) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
