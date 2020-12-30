class Distributor {
  final String id;
  // final String avatar;
  final String position;
  final String institution;
  final String number;
  final String category;
  final String address;

  Distributor(
      {this.id,
      this.position,
      this.institution,
      this.number,
      this.category,
      this.address});

  factory Distributor.fromMap(Map data) => Distributor(
        id: data["id"],
        position: data["position"],
        institution: data["institution"],
        number: data["number"],
        category: data["category"],
        address: data["address"],
        // avatar: data["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "position": position,
        "institution": institution,
        "number": number,
        "category": category,
        "address": address,
      };
}
