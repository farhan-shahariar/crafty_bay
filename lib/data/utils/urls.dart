class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static const String listProductSliderUrl = '$_baseUrl/ListProductSlider';
  static const String categoryListUrl = '$_baseUrl/CategoryList';
  static const String readProfileUrl = '$_baseUrl/ReadProfile';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static String productListUrl(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String productDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
}
