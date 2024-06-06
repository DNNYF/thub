import "package:flutter/material.dart";
import "package:vint/utils/exports.dart";
import 'package:flutter_svg/flutter_svg.dart';

class Myaccount extends StatelessWidget {
  const Myaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun Saya'),
        actions: [
          IconButton(icon: Icon(Icons.email), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'images/profile.jpeg'), // 
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama User',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Voucher: 5', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            // Tokoku Section
            ListTile(
              title: Text('Tokoku'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to My Shop or Create Shop page
              },
            ),
            Divider(),
            // Riwayat Aktivitas Section
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                _buildActivityCard(
                    context, Icons.account_balance_wallet, 'Menunggu Dibayar'),
                _buildActivityCard(
                    context, 'images/pkgSend.svg', 'Menunggu Dikirim',
                    isSvg: true),
                _buildActivityCard(
                    context, 'images/pkgSended.svg', 'Sudah Terkirim',
                    isSvg: true),
                _buildActivityCard(
                    context, 'images/pkgdelivered.svg', 'Selesai',
                    isSvg: true),
              ],
            ),
            Divider(),
            // Favorit Section
            ListTile(
              title: Text('Favorit'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Favorite Products page
              },
            ),
            Divider(),
            // Kategori Bantuan/Customer Service Section
            ListTile(
              title: Text('Kendala Pesanan'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Order Issues page
              },
            ),
            ListTile(
              title: Text('Daftar Komplain'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Complaint List page
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildActivityCard(BuildContext context, dynamic icon, String title,
    {bool isSvg = false}) {
  return GestureDetector(
    onTap: () {
      // Navigate to corresponding page
    },
    child: Card(
      margin: EdgeInsets.all(4.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? SvgPicture.asset(
                    icon,
                    height: 20.0,
                    width: 20.0,
                  )
                : Icon(
                    icon,
                    size: 20.0,
                  ),
            SizedBox(height: 8.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}
