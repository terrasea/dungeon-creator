library dungeon_creator.backend;

import 'dart:math';

class Room {
  final int x;
  final int y;
  final int width;
  final int height;

  Room(this.x, this.y, this.width, this.height);
}

class LabeledRoom implements Room {

  final String label;
  final int y;
  final int x;
  final int width;
  final int height;

  LabeledRoom(this.label, this.x, this.y, this.width, this.height);
}

class RoomConnection {
  final Room room1;
  final Room room2;

  RoomConnection(this.room1, this.room2);
}

const STRAIGHT_CORRIDOOR = 0;
const SQUARED_CORRIDOOR = 1;
const MAX_CORRIDOOR = SQUARED_CORRIDOOR;

create_room(x, y, width, height) => new Room(x, y, width, height);

create_room_connection(room1, room2) => new RoomConnection(room1, room2);

rand_connection_type() => new Random().nextInt(MAX_CORRIDOOR);