import 'package:vint/utils/exports.dart';

class PopularCategoryWidget extends StatelessWidget {
  final List<Map<String, String>> popularGames = [
    {"name": "Mobile Legends", "image": "https://storage.googleapis.com/tokogame-img/products/mobile-legends-20240508.png"},
    {"name": "Free Fire", "image": "https://mumu-global.fp.ps.easebar.com/file/62444ebecc777c06eaf00159sXRv5HDe02?fop=imageView/0/w/150/h/150"},
    {"name": "PUBG Mobile", "image": "https://play-lh.googleusercontent.com/uqq6a-fHayQxsNQkxB9ZZXag8N7Du5mOEKcScr9yltHqx3RKgCdr9VJHKGO2vY_GUe0=s150"},
    {"name": "Valorant", "image": "https://www.blibli.com/friends-backend/wp-content/uploads/2024/03/B111508-Cover-apa-itu-valorant-150x150.jpg"},
    {"name": "Fortnite", "image": "https://www.gamespace.com/wp-content/uploads/2017/07/Fortnite-150x150.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: popularGames.map((game) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(game['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      game['name']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
