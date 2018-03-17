@TestOn('chrome')
library dungeon_creator.display.test;

import 'package:test/test.dart';
import 'package:mockito/mockito.dart' as mockito;

import 'package:dungeon_creator/room.dart';
import 'package:dungeon_creator/dungeon_creator.dart';
import 'package:stagexl/stagexl.dart' show Shape, Stage, Graphics, Color;

void main() async {
  group('[display]', () {
    var x = 10;
    var y = 10;
    var width = 100;
    var height = 100;
    var room1;

    var x2 = 210;
    var y2 = 10;
    var width2 = 100;
    var height2 = 100;
    var room2;

    RoomConnection connection;

    setUp(() {
      room1 = new Room(x, y, width, height);
      room2 = new Room(x2, y2, width2, height2);
      connection = new RoomConnection(room1, room2);
    });

    tearDown(() {
      room1 = null;
      room2 = null;
      connection = null;
    });

    test('render_room does not return null', () {
      expect(new RenderDungeon().render_room_to_shape(room1), isNotNull);
    });

    test('render_room returns a stagexl shape', () {
      expect(
          new RenderDungeon().render_room_to_shape(room1),
          new isInstanceOf<Shape>()
      );
    });


    test('render_room call shape..graphics.rect(...) with correct args', () {
      var shape = new MockShape();
      new RenderDungeon().render_room_to_shape(room1, shape: shape);
      mockito.verify(
          shape.graphics.rect(
              room1.x,
              room1.y,
              room1.width,
              room1.height
          )
      ).called(1);
    });

    test('render_room call shape..graphics.strokeColor(...) with correct args', () {
      var shape = new MockShape();
      var colour = Color.Black;
      new RenderDungeon().render_room_to_shape(room1, colour: colour, shape: shape);
      mockito.verify(
          shape.graphics.strokeColor(colour)
      ).called(1);
    });

    test('render_room call shape..graphics.fillColor(...) with correct args', () {
      var shape = new MockShape();
      var fillColour = Color.Black;

      new RenderDungeon().render_room_to_shape(room1, fillColour: fillColour, shape: shape);
      mockito.verify(
          shape.graphics.fillColor(fillColour)
      ).called(1);
    });

    test('render_connection_to_shape does not return null', () {
      expect(
          new RenderDungeon().render_connection_to_shape(connection),
          isNotNull
      );
    });

    test('render_connection_to_shape returns a stagexl shape', () {
      expect(
          new RenderDungeon().render_connection_to_shape(connection),
          new isInstanceOf<Shape>()
      );
    });

    test('render_connection_to_shape call shape..graphics.rect(...) with correct args', () {
      var shape = new MockShape();
      new RenderDungeon().render_connection_to_shape(connection, shape: shape);
      mockito.verify(
          shape.graphics.rect(
              connection.room1.x + connection.room1.width,
              connection.room1.y + connection.room1.height / 2,
              connection.room2.x - (connection.room1.x + connection.room1.width),
              10
          )
      ).called(1);
    });

    test('render_connection_to_shape call shape..graphics.strokeColor(...) with correct args', () {
      var shape = new MockShape();
      var colour = Color.Black;
      new RenderDungeon().render_connection_to_shape(connection, colour: colour, shape: shape);
      mockito.verify(
          shape.graphics.strokeColor(colour)
      ).called(1);
    });

    test('display_room calls stage.addChild', () async {
      MockStage stage = new MockStage();
      MockRender renderer = new MockRender();
      new Draw(renderer).draw_room(room1, stage);
      mockito.verify(stage.addChild(mockito.captureAny)).called(1);
    });

    test('display_room calls render_room', () async {
      MockStage stage = new MockStage();
      MockRender renderer = new MockRender();
//      Draw.render = renderer;
      Draw draw = new Draw(renderer);
      draw.draw_room(room1, stage);

      mockito.verify(
          renderer.render_room_to_shape(mockito.captureAny)
      ).called(1);
      mockito.verifyNoMoreInteractions(renderer);
    });

    test('draw_corridoor calls render_connection_to_shape', () {
      MockStage stage = new MockStage();
      MockRender renderer = new MockRender();
      new Draw(renderer).draw_corridoor(connection, stage);
      mockito.verify(
          renderer.render_connection_to_shape(mockito.captureAny)
      ).called(1);
    });

    test('draw_corridoor calls stage.addChild', () async {
      MockStage stage = new MockStage();
      MockRender renderer = new MockRender();
      new Draw(renderer).draw_corridoor(connection, stage);
      mockito.verify(stage.addChild(mockito.captureAny)).called(1);
    });
  });
}

class MockStage extends mockito.Mock implements Stage {}

class MockRender extends mockito.Mock implements RenderDungeon {}

class MockShape extends mockito.Mock implements Shape {
  var graphics = new MockGraphics();
}

class MockGraphics extends mockito.Mock implements Graphics {}