import 'package:vint/utils/exports.dart';

class CategoriesWidget extends StatelessWidget {
  final List<String> categoryNames = ["TopUp Game", "Item", "Akun", "Koin Game", "Voucher"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 5; i++)
          Container(
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "images/${i + 1}.png", // Pastikan nama file sesuai
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Text(
                      categoryNames[i].split(" ")[0], // Bagian pertama dari string (Top Up)
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      categoryNames[i].split(" ").sublist(1).join(" "), // Bagian kedua dari string (Game)
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
