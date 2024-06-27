import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailPage extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final double productPrice;
  final String productDescription;
  final String storeName;
  final String storeLogoUrl;
  final double storeRating;
  final String storeLastActive;
  final List<String> reviews;

  ProductDetailPage({
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.storeName,
    required this.storeLogoUrl,
    required this.storeRating,
    required this.storeLastActive,
    required this.reviews,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isExpanded = false;

  void _toggleDescriptionExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:
                        Image.asset(widget.imageUrl, height: 300, width: 400),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.productName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp ${widget.productPrice}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isExpanded
                        ? widget.productDescription
                        : shortenDescription(widget.productDescription),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: _toggleDescriptionExpansion,
                    child: Text(
                      isExpanded
                          ? 'Tampilkan lebih sedikit'
                          : 'Tampilkan lebih banyak',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.storeLogoUrl),
                        radius: 20,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.storeName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.verified,
                                  size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              Text(
                                '${widget.storeRating} / 5.0',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            'Aktif ${widget.storeLastActive} lalu',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          // Add logic to open store link
                        },
                        child: Text('Kunjungi Toko'),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Review Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ...widget.reviews.map((review) => buildReviewCard(review)),
                  SizedBox(
                      height: 60), // Spacing to ensure content above buttons
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      _showOrderInfo(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Beli Sekarang'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      // Add to cart logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added to Cart')),
                      );
                    },
                    icon: Icon(Icons.shopping_cart, size: 32),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String shortenDescription(String description) {
    if (description.length <= 150) {
      return description;
    } else {
      return description.substring(0, 150) + '...';
    }
  }

  Widget buildReviewCard(String review) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.star, color: Colors.amber),
        title: Text(review),
      ),
    );
  }

  void _showOrderInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Pesanan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama/ID Akun Game',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Catatan untuk Penjual',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _launchMidtransPayment();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Pesan'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _launchMidtransPayment() async {
    const midtransPaymentUrl =
        'https://app.sandbox.midtrans.com/payment-links/1719506642436';
    // ignore: deprecated_member_use
    if (await canLaunch(midtransPaymentUrl)) {
      // ignore: deprecated_member_use
      await launch(midtransPaymentUrl);
    } else {
      throw 'Could not launch $midtransPaymentUrl';
    }
  }
}
