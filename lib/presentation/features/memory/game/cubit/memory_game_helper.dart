part of 'memory_game_cubit.dart';

List<String> getIconsList(int count) {
  final List<String> icons = [];
  const String filename = "assets/memory/img_mem_";
  for (var i = 0; i < count; i++) {
    icons.add("$filename$i.svg");
  }
  return icons;
}

Set<int> getRandomIndices(int count, int range) {
  final indices = <int>{};
  do {
    final random = Random().nextInt(range);
    if (!indices.contains(random)) {
      indices.add(random);
    }
  } while (indices.length < count);
  return indices;
}
