enum MemoryLevel {
  l3x4("3x4", 12, 3),
  l4x4("4x4", 16, 4),
  l4x5("4x5", 20, 4),
  l5x6("5x6", 30, 5),
  l6x8("6x8", 48, 6),
  l7x10("7x10", 70, 7),
  l8x10("8x10", 80, 8),
  l8x12("8x12", 96, 8);

  final int count;
  final int columns;
  final String title;

  const MemoryLevel(this.title, this.count, this.columns);
}
