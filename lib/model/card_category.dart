class CardCategory {
  String? image;
  String? name;

  CardCategory({this.image, this.name});
}

List<CardCategory> myCategory = [
  CardCategory(image: 'assets/images/product_image.png', name: 'Product'),
  CardCategory(image: 'assets/images/party_image.png', name: 'Party'),
  CardCategory(
      image: 'assets/images/income_expense.png', name: 'Income Expenses'),
  CardCategory(image: 'assets/images/report.png', name: 'Reports'),
];
