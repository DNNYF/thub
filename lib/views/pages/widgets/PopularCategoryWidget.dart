import 'package:vint/utils/exports.dart';

class PopularCategoryWidget extends StatelessWidget {
  final List<Map<String, String>> popularGames = [
    {"name": "Mobile Legends", "image": "https://via.placeholder.com/150"},
    {"name": "Free Fire", "image": "https://via.placeholder.com/150"},
    {"name": "PUBG Mobile", "image": "https://via.placeholder.com/150"},
    {"name": "Valorant", "image": "https://via.placeholder.com/150"},
    {"name": "Fortnite", "image": "https://via.placeholder.com/150"},
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
