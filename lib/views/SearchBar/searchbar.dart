import 'package:flutter/material.dart';

class Product {
  final String name;
  Product(this.name);
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  List<Product> _products = [
    Product('Mobile Legend'),
    Product('Albion Online'),
    Product('Valorant'),
    Product('Free Fire'),
    Product('World Of Warcraft'),
    Product('Lost Ark'),
    Product('New World'),
  ];
  List<Product> _searchResults = [];

  @override
  void initState() {
    _searchResults.addAll(_products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                    _searchResults = _products
                        .where((product) => product.name
                            .toLowerCase()
                            .contains(_searchText.toLowerCase()))
                        .toList();
                  });
                },
                onSubmitted: (value) {
                  _startSearch();
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
            if (_searchText.isNotEmpty)
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    _searchText = '';
                    _searchResults = _products;
                  });
                },
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _startSearch();
            },
          ),
        ],
      ),
      body: _searchResults.isEmpty
          ? Center(
              child: Text('Product not exist'),
            )
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index].name),
                  onTap: () {
                    _onProductSelected(_searchResults[index]);
                  },
                );
              },
            ),
    );
  }

  void _startSearch() {
    print('Starting search...');
  }

  void _onProductSelected(Product product) {
    print('Selected product: ${product.name}');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
