class PriceRangeModel{
  String range;
  bool isChecked;

  PriceRangeModel({required this.range, required this.isChecked});


}

List<PriceRangeModel> priceRange = [
  PriceRangeModel(range: 'Dưới 1tr', isChecked: false),
  PriceRangeModel(range: 'Từ 1tr-5tr', isChecked: false),
  PriceRangeModel(range: 'Từ 5tr-10tr', isChecked: false),
  PriceRangeModel(range: 'Từ 10tr-15tr', isChecked: false),
  PriceRangeModel(range: 'Từ 15tr-20tr', isChecked: false),
  PriceRangeModel(range: 'Trên 20tr', isChecked: false),
];


