import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
//import 'dart:math';

import 'package:dungeon_creator/room.dart';
import 'package:dungeon_creator/dungeon_creator.dart';

Future<Null> main() async {
  StageOptions options = new StageOptions()
    ..backgroundColor = Color.Black
    ..renderEngine = RenderEngine.WebGL;

  var canvas = html.querySelector('#stage');
  var stage = new Stage(canvas, width: 1280, height: 800, options: options);

  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = new ResourceManager();
  resourceManager.addBitmapData("dart", "images/dart@1x.png");

  await resourceManager.load();

  var room1 = new LabeledRoom('1', 10, 10, 101, 101);
  var room2 = new LabeledRoom('2', 600, 10, 101, 101);
  var room3 = new LabeledRoom('3', 100, 300, 101, 101);
  var room4 = new LabeledRoom('4', 500, 300, 101, 101);
  var room5 = new LabeledRoom('5', 900, 300, 101, 101);
  var room6 = new LabeledRoom('6', 900, 0, 101, 101);

  var connection = new RoomConnection(room1, room2);
  var connection2 = new RoomConnection(room3, room2);
  var connection3 = new RoomConnection(room4, room2);
  var connection4 = new RoomConnection(room5, room2);
  var connection5 = new RoomConnection(room2, room6);
  new Draw(new RenderDungeon())
    ..draw_room(room1, stage)
    ..draw_room(room2, stage)
    ..draw_room(room3, stage)
    ..draw_room(room4, stage)
    ..draw_room(room5, stage)
    ..draw_room(room6, stage)
    ..draw_corridoor(connection, stage,
        colour: Color.White, fillColour: Color.Aqua)
    ..draw_corridoor(connection2, stage,
        colour: Color.Blue, fillColour: Color.Green)
    ..draw_corridoor(connection3, stage,
        colour: Color.Purple, fillColour: Color.MediumPurple)
    ..draw_corridoor(connection4, stage,
        colour: Color.Gray, fillColour: Color.GreenYellow)
    ..draw_corridoor(connection5, stage,
        colour: Color.Gray, fillColour: Color.Yellow);
}
