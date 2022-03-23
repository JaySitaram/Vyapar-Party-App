import 'package:vyapar_party_app/model/product_model.dart';

class Invoice {
  final InvoiceInfo info;
  List? items;

  Invoice({
    required this.info,
    this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}