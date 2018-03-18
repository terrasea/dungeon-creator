part of dungeon_creator.backend;

Set<Room> generate_rooms(count, dungeon_width, dungeon_height,
    {room_width: 101, room_height: 101}) {
  Random rand = new Random();
  List<Room> generated_rooms = new List<Room>();
  List<Room> rooms = new List<Room>.generate(count, (index) {
    Room room;
    do {
      room = new LabeledRoom('$index', rand.nextInt(dungeon_width - room_width),
          rand.nextInt(dungeon_height - room_height), room_width, room_height);
    } while (overlaps_any(room, generated_rooms));
    generated_rooms.add(room);

    return room;
  });

  return new Set<Room>.from(rooms);
}

List<RoomConnection> generate_connections(Set<Room> rooms, count) {
  Random rand = new Random();
  return new List.generate(count, (index) {
    return new RoomConnection(rooms.elementAt(rand.nextInt(rooms.length)),
        rooms.elementAt(rand.nextInt(rooms.length)));
  });
}

bool overlaps_any(value, List taken) {
  List<bool> is_taken = new List<bool>();

  taken.forEach((item) {
    is_taken.add(overlap(value, item) && overlap(item, value));
  });

  return is_taken.any((item) => item);
}

/**Overlapping rectangles overlap both horizontally & vertically*/
bool overlap(r1, r2) =>
    range_overlap(r1.left, r1.right, r2.left, r2.right) &&
    range_overlap(r1.bottom, r1.top, r2.bottom, r2.top);

/**Neither range is completely greater than the other*/
bool range_overlap(a_min, a_max, b_min, b_max) =>
    (a_min <= b_max) && (b_min <= a_max) ||
    (a_min >= b_max) && (b_min >= a_max);
