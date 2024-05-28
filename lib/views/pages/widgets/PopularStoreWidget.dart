import 'package:vint/utils/exports.dart';

class PopularStoreWidget extends StatelessWidget {
  final List<String> popularStores = ["Store A", "Store B", "Store C", "Store D", "Store E"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: popularStores.map((store) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.store,
                        size: 50, // Ubah ukuran ikon
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        store,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: -15,
                  left: MediaQuery.of(context).size.width * 0.08,
                  child: Container(
                    width: 80, // Ubah lebar logo
                    height: 80, // Ubah tinggi logo
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.store,
                      size: 50, // Ubah ukuran ikon
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
