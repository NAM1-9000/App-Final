import 'package:final22735/data/model/transaction_model.dart';

class DataModel {
  final DateTime date;
  final int money;
  final List<TransactionModel> transaction;

  DataModel({
    required this.date,
    required this.money,
    required this.transaction,
  });

  DataModel.fromMap(Map<String, dynamic> map)
      : date = DateTime.parse(map['date']),
        money = map['money'],
        transaction = (map['transaction'] as List)
            .map((item) =>
                TransactionModel.fromMap(item as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'money': money,
      'transaction': transaction.map((item) => item.toMap()).toList(),
    };
  }
}
