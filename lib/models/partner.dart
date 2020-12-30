class Partner {
  final String id;
  // final String avatar;
  final String legalName;

  final String vatNumber;
  final String vatID;
  final String category;

  Partner({this.id, this.legalName, this.vatNumber, this.vatID, this.category});

  factory Partner.fromMap(Map data) => Partner(
        id: data["id"],
        legalName: data["legalName"],
        vatNumber: data["vatNumber"],
        vatID: data["vatID"],
        category: data["category"],

        // avatar: data["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "legalName": legalName,
        "vatNumber": vatNumber,
        "vatID": vatID,
        "category": category,
      };
}
