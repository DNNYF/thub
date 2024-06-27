import 'package:flutter/material.dart';
import 'package:vint/views/pages/product_detail_page.dart';

class ItemsWidget extends StatelessWidget {
  // Daftar gambar yang tersedia
  final List<String> imageList = [
    "images/valorant_points.png",
    "images/dl.png",
    "images/robux.png",
    "images/wdp.png",
    "images/ak47.png",
    "images/morgananightmare.png"
    // Tambahkan gambar lain di sini sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < imageList.length; i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-20%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          imageUrl: imageList[i],
                          productName: "Valorant Points",
                          productPrice: 100000,
                          productDescription: """
Cara Redeem Code Valorant

Fresh Code
Limited Stock!! 100% Legal

Cara Aktivasi KODE:
1. Pastikan akun Riot kamu berasal dari Region Indonesia
2. Masukan ID Valoran mu. contoh : Vint#1234
3. Tunggu 5-10 menit untuk pengisian point
4. Selesai 

Note :
- Toko tidak bertanggung jawab mengenai kesalahan Input ID
- Bila ID tidak ditemukan , admin akan melakukan penundaan pengiriman
                          """,
                          storeName: "Vint Store",
                          storeLogoUrl:
                              "images/vint.png", // Path to the store logo
                          storeRating: 4.9,
                          storeLastActive: "5 Jam",
                          reviews: ["Review 1", "Review 2", "Review 3"],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      imageList[i],
                      height: 120,
                      width: 200,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "1125 Points",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Deskripsi Produk",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp.100.000",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
