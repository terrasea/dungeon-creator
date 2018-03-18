library dungeon_creator_test;

import 'package:test/test.dart';

import 'package:dungeon_creator/backend.dart';

void main() {
  group('[room]', () {
    var room;
    var x = 0;
    var y = 1;
    var width = 100;
    var height = 101;
    setUp(() {
      room = create_room(x, y, width, height);
    });

    tearDown(() {
      room = null;
    });

    test('create_room does not return null', () {
      expect(room, isNotNull);
    });

    test('create_room is created with correct x position', () {
      expect(room.x, x);
    });

    test('create_room is created with correct y position', () {
      expect(room.y, y);
    });

    test('create_room is created with correct width', () {
      expect(room.width, width);
    });

    test('create_room is created with correct height', () {
      expect(room.height, height);
    });
  });

  group('[RoomConnection]', () {
    var room1;
    var r1_x = 0;
    var r1_y = 1;
    var r1_width = 100;
    var r1_height = 101;
    var room2;
    var r2_x = 0;
    var r2_y = 1;
    var r2_width = 100;
    var r2_height = 101;
    var connection;
    setUp(() {
      room1 = create_room(r1_x, r1_y, r1_width, r1_height);
      room2 = create_room(r2_x, r2_y, r2_width, r2_height);
      connection = create_room_connection(room1, room2);
    });

    tearDown(() {
      room1 = null;
      room2 = null;
    });

    test('create_room_connection does not return null', () {
      expect(connection, isNotNull);
    });

    test('connection.room1 is room1', () {
      expect(connection.room1, room1);
    });

    test('connection.room2 is room2', () {
      expect(connection.room2, room2);
    });

    test('get_connection_type returns int', () {
      expect(rand_connection_type(), new isInstanceOf<int>());
    });
  });

  group('random dungeon', () {
    Set<Room> rooms;
    var room_count = 10;
    var dungeon_width = 1000;
    var dungeon_height = 1000;
    setUp(() {
      rooms = generate_rooms(room_count, dungeon_width, dungeon_height);
    });

    tearDown(() {
      rooms = null;
    });

    test('ganerate random rooms of certain number', () {
      expect(rooms.length, room_count);
    });

    test('2 rooms overlap', () {
      Room room = new Room(681, 409, 101, 101);
      Room room2 = new Room(740, 416, 101, 101);

      expect(overlap(room, room2), isTrue);
    });

    test('room does overlap a room in a list', () {
      Room room = new Room(681, 409, 101, 101);
      Room room2 = new Room(740, 416, 101, 101);
      Room room3 = new Room(900, 416, 101, 101);
      List roomList = new List()
        ..add(room2)
        ..add(room3)
      ;

      expect(overlaps_any(room, roomList), isTrue);
    });
  });
}
