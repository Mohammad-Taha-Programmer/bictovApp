import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({Key? key}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  List<CategoryModel> _categories = [
    CategoryModel(categoryName: 'أسماك ومأكولات بحرية', isChosen: false),
    CategoryModel(categoryName: 'أجهزة كهربائية', isChosen: false),
    CategoryModel(categoryName: 'خضار وفواكه', isChosen: false),
    CategoryModel(categoryName: 'أجهزة موبايل ومستلزماتها', isChosen: false),
    CategoryModel(categoryName: 'أجهزة حاسوب ومستلزماتها', isChosen: false),
  ];

  List<CategoryModel> _chosenCategories = [];

  Widget categoryItem(String categoryName, int index){
    return ListTile(
      title: Text(categoryName),
      trailing:  _categories[index].isChosen? Icon(Icons.check_box_sharp, color: Colors.green[700]) : Icon(Icons.check_box_outlined, color: Colors.grey),
      onTap: (){
        setState(() {
          _categories[index].isChosen = !_categories[index].isChosen;
          if( _categories[index].isChosen == true){
            _chosenCategories.add(CategoryModel(categoryName: categoryName, isChosen: _categories[index].isChosen));
          }else{
            _chosenCategories.removeWhere((element) => element.categoryName == categoryName);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.separated(
          itemCount: _categories.length,
          itemBuilder: (BuildContext context, int index) => categoryItem(_categories[index].categoryName, index),
          separatorBuilder: (BuildContext context, int index) => Divider(thickness: 2))
      ),
    );
  }
}


class CategoryModel{
  String categoryName;
  bool isChosen;
  CategoryModel({required this.categoryName, required this.isChosen});
}



class ProductCard extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final double rating;
  final double price;
  final VoidCallback onAddToCartPressed;

  ProductCard({
    required this.productName,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              productName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20.0,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // Handle rating updates here
                },
              ),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: onAddToCartPressed,
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
