import 'package:vint/utils/exports.dart';

class Summary extends StatelessWidget {
  // Contoh data item pembelian
  final List<Map<String, dynamic>> purchaseItems = [
    {'name': 'Item 1', 'quantity': 2, 'price': 50000},
    {'name': 'Item 2', 'quantity': 1, 'price': 150000},
    {'name': 'Item 3', 'quantity': 3, 'price': 75000},
  ];

  @override
  Widget build(BuildContext context) {
    // Menghitung total harga
    final int totalPrice = purchaseItems.fold<int>(
      0,
      (sum, item) => sum + item['price'] * item['quantity'] as int,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title: Text("Summary"), leading: BackButton(color: Colors.black),
              elevation: 2.0,
              ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Items Purchased:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: purchaseItems.length,
                    itemBuilder: (context, index) {
                      final item = purchaseItems[index];
                      return ListTile(
                        title: Text(item['name']),
                        subtitle: Text('Quantity: ${item['quantity']}'),
                        trailing: Text('Rp ${item['price']}'),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Total Price: Rp $totalPrice',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }
}
