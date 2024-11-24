class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static const String listProductSliderUrl = '$_baseUrl/ListProductSlider';
  static const String categoryListUrl = '$_baseUrl/CategoryList';
  static String productListUrl(String remark) => '$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategory(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
}
