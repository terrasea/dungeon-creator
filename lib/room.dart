part of dungeon_creator.backend;

class Room {
  final int x;
  final int y;
  final int width;
  final int height;

  get left => x;
  get right => x + width;
  get bottom => y + height;
  get top => y;

  Room(this.x, this.y, this.width, this.height);

  bool operator==(room) {
    return room.x == x &&
        room.y == y &&
        room.width == width &&
        room.height == height;
  }

  int get hashCode => int.parse('$x$y$width$height');
}

class LabeledRoom implements Room {

  final String label;
  final int y;
  final int x;
  final int width;
  final int height;

  get left => x;
  get right => x + width;
  get bottom => y + height;
  get top => y;

  LabeledRoom(this.label, this.x, this.y, this.width, this.height);

  @override
  bool operator==(room) {
    return room.x == x &&
        room.y == y &&
        room.width == width &&
        room.height == height;
  }

  @override
  int get hashCode => int.parse('$x$y$width$height');
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
create_labeled_room(label, x, y, width, height) => new LabeledRoom(label, x, y, width, height);


create_room_connection(room1, room2) => new RoomConnection(room1, room2);

rand_connection_type() => new Random().nextInt(MAX_CORRIDOOR);