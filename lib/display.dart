part of dungeon_creator;

class RenderDungeon {
  render_room_to_shape(Room room, {colour: Color.Blue, fillColour: Color.White, shape: null}) {
    Sprite _shape = shape != null ? shape : new Sprite();

    if(room is LabeledRoom) {
      _shape.addChild(
          new TextField()
            ..text = room.label
            ..x = room.x + room.width / 3
            ..y = room.y + room.height / 3
      );
    }

    return _shape
      ..graphics.rect(room.x, room.y, room.width, room.height)
      ..graphics.fillColor(fillColour)
      ..graphics.strokeColor(colour)
    ;
  }
  
  render_connection_to_shape(
      RoomConnection connection,
      {
        colour: Color.Blue,
        fillColour: Color.White,
        shape: null
      }
  ) {
    Shape _shape = shape != null ? shape : new Shape();
    if(
      connection.room1.x + connection.room1.width < connection.room2.x &&
      !(connection.room1.y < connection.room2.y) &&
      !(connection.room1.y > connection.room2.y)
    ) {
      print('1');
      return _shape
        ..graphics.rect(
            connection.room1.x + connection.room1.width,
            connection.room1.y + connection.room1.height / 2,
            connection.room2.x - (connection.room1.x + connection.room1.width),
            10
        )
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)
      ;
    } else if(
        connection.room1.x + 10 > connection.room2.x + connection.room1.width &&
        !(connection.room1.y < connection.room2.y) &&
        !(connection.room2.y < connection.room1.y)
    ) {
      print('2');
      return _shape
        ..graphics.rect(
            connection.room2.x + connection.room2.width,
            connection.room2.y + connection.room2.height / 2,
            connection.room1.x - (connection.room2.x + connection.room2.width),
            10
        )
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)
      ;
    } else if(
        connection.room1.y + connection.room1.height < connection.room2.y &&
        connection.room1.x + connection.room1.width < connection.room2.x
    ) {
      print('3');
      return _shape
          ..graphics.beginPath()
          ..graphics.moveTo(
              connection.room1.x + connection.room1.width,
              connection.room1.y + connection.room1.height / 2 - 10
          )
          ..graphics.lineTo(
              connection.room2.x + connection.room2.width / 2 + 10,
              connection.room2.y
          )
          ..graphics.lineTo(
              connection.room2.x + connection.room2.width / 2 - 10,
              connection.room2.y
          )
          ..graphics.lineTo(
              connection.room1.x + connection.room1.width,
              connection.room1.y + connection.room1.height / 2 + 10
          )
          ..graphics.fillColor(fillColour)
          ..graphics.strokeColor(colour)
          ..graphics.closePath()
      ;
    } else if(
      connection.room1.y + 10 > connection.room2.y + connection.room1.height &&
      connection.room1.x + connection.room1.width > connection.room2.x + 10
    ) {
      print('3a');
      return _shape
        ..graphics.beginPath()
        ..graphics.moveTo(
            connection.room2.x + connection.room2.width,
            connection.room2.y + connection.room2.height / 2 - 10
        )
        ..graphics.lineTo(
            connection.room1.x + connection.room1.width / 2 + 10,
            connection.room1.y
        )
        ..graphics.lineTo(
            connection.room1.x + connection.room1.width / 2 - 10,
            connection.room1.y
        )
        ..graphics.lineTo(
            connection.room2.x + connection.room2.width,
            connection.room2.y + connection.room2.height / 2 + 10
        )
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)
        ..graphics.closePath()
      ;
    } else if(
      connection.room1.y < connection.room2.y &&
      connection.room1.x + connection.room1.width < connection.room2.x
    ) {
      print('3b');
      return _shape
        ..graphics.beginPath()
        ..graphics.moveTo(
            connection.room1.x + connection.room1.width,
            connection.room1.y + connection.room1.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room2.x,
            connection.room2.y + connection.room2.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room2.x,
            connection.room2.y + connection.room2.height / 2 - 10
        )
        ..graphics.lineTo(
            connection.room1.x + connection.room1.width,
            connection.room1.y + connection.room1.height / 2 - 10
        )
        ..graphics.closePath()
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)

      ;
    } else if(
      connection.room2.y < connection.room1.y &&
      connection.room2.x + connection.room2.width < connection.room1.x
    ) {
      print('3c');
      return _shape
        ..graphics.beginPath()
        ..graphics.moveTo(
            connection.room2.x + connection.room2.width,
            connection.room2.y + connection.room2.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room1.x,
            connection.room1.y + connection.room1.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room1.x,
            connection.room1.y + connection.room1.height / 2 - 10
        )
        ..graphics.lineTo(
            connection.room2.x + connection.room2.width,
            connection.room2.y + connection.room2.height / 2 - 10
        )
        ..graphics.closePath()
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)
      ;
    } else if(
        connection.room2.y > connection.room1.y &&
        connection.room2.x + connection.room2.width < connection.room1.x
    ) {
      print('3d');
      return _shape
        ..graphics.beginPath()
        ..graphics.moveTo(
            connection.room2.x + connection.room2.width,
            connection.room2.y + connection.room2.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room1.x,
            connection.room1.y + connection.room1.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room1.x,
            connection.room1.y + connection.room1.height / 2 - 10
        )
        ..graphics.lineTo(
            connection.room2.x + connection.room2.width,
            connection.room2.y + connection.room2.height / 2 - 10
        )
        ..graphics.closePath()
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)
      ;
    } else if(
        connection.room1.y > connection.room2.y &&
        connection.room1.x + connection.room1.width < connection.room2.x
    ) {
      print('3e');
      return _shape
        ..graphics.beginPath()
        ..graphics.moveTo(
            connection.room1.x + connection.room1.width,
            connection.room1.y + connection.room1.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room2.x,
            connection.room2.y + connection.room2.height / 2 + 10
        )
        ..graphics.lineTo(
            connection.room2.x,
            connection.room2.y + connection.room2.height / 2 - 10
        )
        ..graphics.lineTo(
            connection.room1.x + connection.room1.width,
            connection.room1.y + connection.room1.height / 2 - 10
        )
        ..graphics.closePath()
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)
      ;
    } else if(
        connection.room1.y > connection.room2.y &&
        !(connection.room1.x + connection.room1.width < connection.room2.x)
    ) {
      print('3e');
      return _shape
        ..graphics.beginPath()
        ..graphics.moveTo(
            connection.room1.x + connection.room1.width / 2 - 10,
            connection.room1.y
        )
        ..graphics.lineTo(
            connection.room2.x + connection.room1.width / 2 - 10,
            connection.room2.y + connection.room2.height
        )
        ..graphics.lineTo(
            connection.room2.x + connection.room2.width / 2 + 10,
            connection.room2.y + connection.room2.height
        )
        ..graphics.lineTo(
            connection.room1.x + connection.room1.width / 2 + 10,
            connection.room1.y
        )
        ..graphics.closePath()
        ..graphics.fillColor(fillColour)
        ..graphics.strokeColor(colour)
      ;
    }

    print('4');
    return _shape;
//      ..graphics.rect(
//          connection.room1.x + connection.room1.width,
//          connection.room1.y + connection.room1.height / 2,
//          connection.room2.x - (connection.room1.x + connection.room1.width),
//          10
//      )
//      ..graphics.fillColor(fillColour)
//      ..graphics.strokeColor(colour)
//    ;
  }
}

class Draw {
  RenderDungeon render;

  Draw(this.render);

  draw_room(
      Room room,
      Stage stage,
      {
        colour: Color.Azure,
        fillColour: Color.BlanchedAlmond
      }
  ) {
    Sprite rect = render.render_room_to_shape(
        room,
        colour: colour,
        fillColour: fillColour
    );
    stage.addChild(rect);
  }
  
  draw_corridoor(
      RoomConnection connection,
      Stage stage,
      {
        colour: Color.Azure,
        fillColour: Color.BlanchedAlmond
      }
  ) {
    Shape rect = render.render_connection_to_shape(
        connection,
        colour: colour,
        fillColour: fillColour
    );
    stage.addChild(rect);
  }
}