import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

import 'package:dungeon_creator/backend.dart';
import 'package:dungeon_creator/dungeon_creator.dart';

Future<Null> main() async {
  StageOptions options = new StageOptions()
    ..backgroundColor = Color.Black
    ..renderEngine = RenderEngine.Canvas2D;

  var canvas = html.querySelector('#stage');
  var stage = new Stage(canvas, width: 1280, height: 800, options: options);

  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = new ResourceManager();
  resourceManager.addBitmapData("dart", "images/dart@1x.png");

  await resourceManager.load();

  print(stage.bounds.width);
  Set<Room> rooms = generate_rooms(10, 1280, 800);
  List<RoomConnection> connections = generate_connections(rooms, 10);
  Draw draw = new Draw(new RenderDungeon());
  rooms.forEach((room) {
    draw.draw_room(room, stage);
  });
  connections.forEach((connection) {
    draw.draw_corridoor(connection, stage);
  });

//  var connection = new RoomConnection(room1, room2);
//  var connection2 = new RoomConnection(room3, room2);
//  var connection3 = new RoomConnection(room2, room4);
//  var connection4 = new RoomConnection(room2, room5);
//  var connection5 = new RoomConnection(room2, room6);
//  var connection6 = new RoomConnection(room4, room7);
//  new Draw(new RenderDungeon())
//    ..draw_room(room1, stage)
//    ..draw_room(room2, stage)
//    ..draw_room(room3, stage)
//    ..draw_room(room4, stage)
//    ..draw_room(room5, stage)
//    ..draw_room(room6, stage)
//    ..draw_room(room7, stage)
//    ..draw_corridoor(connection, stage,
//        colour: Color.White, fillColour: Color.Aqua)
//    ..draw_corridoor(connection2, stage,
//        colour: Color.Blue, fillColour: Color.Green)
//    ..draw_corridoor(connection3, stage,
//        colour: Color.Purple, fillColour: Color.MediumPurple)
//    ..draw_corridoor(connection4, stage,
//        colour: Color.Gray, fillColour: Color.GreenYellow)
//    ..draw_corridoor(connection5, stage,
//        colour: Color.Gray, fillColour: Color.GreenYellow)
//    ..draw_corridoor(connection6, stage,
//        colour: Color.Gray, fillColour: Color.Yellow);
}
