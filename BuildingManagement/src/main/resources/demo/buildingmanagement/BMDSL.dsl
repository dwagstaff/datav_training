[when]There is a Building=$building:Building()
[when]There is a Room=
   $building:Building(); 
   $room:Room(building==$building)
[when]There is a fire in any room in any building=
   $building:Building(); 
   $room:Room(building==$building); 
   $fire:FireDetected(room==$room)
[when]There is a fire in building {name}=
   $building:Building(name=={name}); 
   $room:Room(building==$building); 
   $fire:FireDetected(room==$room)
[when]The temperature in a room exceeds the threshold for over {minutes} minutes=TemperatureThreshold( $max : max )
    $room: Room()
    Number( doubleValue > $max ) from accumulate(
        TemperatureSensor( $temp : value, room==$room ) over window:time( {minutes}m ),
        average( $temp ) )
[when]and sprinklers have not be activated in the last {seconds} seconds= not( SprinklerActivated( this after[0s,{seconds}s] $fire ) )
[when]The KWH usage in a room is greater then {khw} KHW for a period of {minutes} minutes=
    $room: Room()
    Number( doubleValue > {khw} ) from accumulate(
        Light(room==$room, $temp : kwhUsage ) over window:time( {minutes}m ),
        sum( $temp ) )
[when]There is a room with temperature above {f} F=
    $building: Building()
    $room:Room(building==$building)
    $temp:TemperatureSensor(room==$room, value > {f})
[when]Outside temperature is less then {f} F=
    $outside: OutsideTemperature(value < {f}) over window:time(15m) from entry-point WeatherService
[when]User {user} has requested temperature to be lowered in room {room}=
    $role: Role(name=="admin") from entry-point RolePool
    $user: User(name=="{user}", roles.contains($role)) from entry-point UserPool
    $room: Room(name=="{room}")
[when]Every day at {hour}:00=timer (cron:00 {hour} * * * *)
[when]Every {minutes} minutes= timer (cron: * 0/15 * * * ?)
[when]There is a room which is too hot=
    $room: Room()
    $hot: TemperatureHigh(room==$room)
[then]Call 911=$building.call911()
[then]Turn on the Sprinklers in the room=$room.turnOnSprinkler()
[then]Turn up the Air Conditioner=DataVServer.triggerWorkflow("Start AC")
[then]Notify Building Manager of High Energy Usage=DataVServer.triggerWorkflow("High Engergy Usage")
[then]Vent outside air into building=DataVServer.triggerWorkflow("Vent outside air in")
[then]Turn off all lights=DataVServer.triggerWorkflow("Turn off all lights")
[then]Bug Building Manager=DataVServer.triggerWorkflow("Spam BM")
[then]Assert that the room is too hot=insertLogical(new TemperatureHigh($room))



