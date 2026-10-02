extension StringExtention on String {
  String get toAvatar {
    if (trim().isEmpty) return "";
    final parts = split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}