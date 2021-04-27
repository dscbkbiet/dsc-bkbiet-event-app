extension StringExtension on String {
  String intelliTrim({int size = 15}) {
    return this.length > size ? '${this.substring(0, size)}...' : this;
  }
}
