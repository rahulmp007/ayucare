class User {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String username;
  final int? adminId;
  final bool isAdmin;
  final bool isActive;
  final String? branch;
  final String createdAt;
  final String updatedAt;
  final String token;

  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.username,
    required this.adminId,
    required this.isAdmin,
    required this.isActive,
    required this.branch,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, email: $email, address: $address, username: $username, adminId: $adminId, isAdmin: $isAdmin, isActive: $isActive, branch: $branch, createdAt: $createdAt, updatedAt: $updatedAt, token: $token)';
  }
}
