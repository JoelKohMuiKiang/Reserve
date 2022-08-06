class Users {
  final String id;
  final String name;
  final String matrixNumber;
  final int mobileNumber;
  final String profileImageUrl;

  Users({ required this.id, required this.name, required this.matrixNumber, required this.mobileNumber, required this.profileImageUrl});

  Users.fromMap(Map <String, dynamic> snapshot, String id):
      id = id,
      name = snapshot['name'] ?? '',
      matrixNumber = snapshot['matrixNumber'] ?? '',
      mobileNumber = snapshot['mobileNumber'] ?? '',
      profileImageUrl = snapshot['profileImage'] ?? '';
}