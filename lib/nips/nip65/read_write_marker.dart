enum ReadWriteMarker {
  readOnly,
  writeOnly,
  readWrite;

  static ReadWriteMarker from({required bool read, required bool write}) {
    if (read) {
      if (write) {
        return ReadWriteMarker.readWrite;
      }
      return ReadWriteMarker.readOnly;
    }
    if (write) {
      return ReadWriteMarker.writeOnly;
    }
    throw Exception("illegal read & write false values for this marker");
  }

  bool get isRead =>
      this == ReadWriteMarker.readOnly || this == ReadWriteMarker.readWrite;

  bool get isWrite =>
      this == ReadWriteMarker.writeOnly || this == ReadWriteMarker.readWrite;

}
