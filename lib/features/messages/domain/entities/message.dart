class Message {
  final String id;
  final String text;
  final DateTime createdAt;
  final String phoneNumber;
  final String userImage;
  final bool isRead;

  Message({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.phoneNumber,
    required this.userImage,
    required this.isRead,
  });
}