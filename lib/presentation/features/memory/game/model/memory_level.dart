enum MemoryLevel {
  l3x4(12, 3);

  final int count;
  final int columns;

  const MemoryLevel(this.count, this.columns);
}
