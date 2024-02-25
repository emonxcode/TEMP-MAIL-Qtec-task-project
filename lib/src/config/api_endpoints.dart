class Urls {
  // static const String BASE_URL = 'http://10.0.2.2:2000/api/';
  static const String BASE_URL = 'https://artix-studio.xyz/api/';

  static String loginUrl = '${BASE_URL}user/login';
  static String categoryUrl = '${BASE_URL}category/getAllCategory';
  static String createCategoryUrl = '${BASE_URL}category/createCategory';
  static String getUnitsUrl = '${BASE_URL}unit/getAllUnits';
  static String createUnitUrl = '${BASE_URL}unit/createUnit';
  static String createSupplierUrl = '${BASE_URL}supplier/createSupplier';
  static String getSupplierUrl = '${BASE_URL}supplier/getAllSuppliersByShopId';
  static String createCustomerUrl = '${BASE_URL}customer/createCustomer';
  static String getAllCustomerUrl =
      '${BASE_URL}customer/getAllCustomersByShopId';
  static String createProduct = '${BASE_URL}product/createProduct';
  static String getAllProduct = '${BASE_URL}product/getAllProductsByShopId';
  static String getRowCount = '${BASE_URL}config/rowCount';

  // static const String baseUrl = 'http://10.0.2.2:2000';
  static const String baseUrl_img = 'https://artix-studio.xyz';
}
