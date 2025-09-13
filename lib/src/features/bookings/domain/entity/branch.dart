class Branch {
  final int? id;
  final String name;
  final String location;
  final String phone;
  final String mail;
  final String address;

  Branch({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.mail,
    required this.address,
  });

  @override
  String toString() {
    return 'Branch(id: $id, name: $name, location: $location, phone: $phone, mail: $mail, address: $address)';
  }
}
