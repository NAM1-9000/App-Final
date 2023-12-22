class TransactionModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int amount;

  TransactionModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  TransactionModel.fromMap(Map<String, dynamic> map)
      : imageUrl = map['imageUrl'],
        title = map['title'],
        subtitle = map['subtitle'],
        amount = map['amount'];

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'subtitle': subtitle,
      'amount': amount,
    };
  }
}
