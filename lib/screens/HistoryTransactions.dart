import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String date;
  final String description;
  final double amount;

  Transaction({
    required this.id,
    required this.date,
    required this.description,
    required this.amount,
  });
}

class TransactionHistoryPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      date: '2024-03-01',
      description: 'Konsultasi dengan Dokter',
      amount: -50.0,
    ),
    Transaction(
      id: '2',
      date: '2024-03-05',
      description: 'Transaksi Layanan Medis',
      amount: -120.0,
    ),
    Transaction(
      id: '3',
      date: '2024-03-10',
      description: 'Riwayat Transaksi Beli Produk',
      amount: -70.0,
    ),
    // Tambahkan transaksi lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text(transaction.description),
            subtitle: Text(transaction.date),
            trailing: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: transaction.amount > 0 ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TransactionHistoryPage(),
  ));
}
