//base url
const String baseurl = 'https://marketa-backend-new-1.onrender.com';

//auth
const String loginUrl = '$baseurl/api/auth/login';
const String signupUrl = '$baseurl/api/auth/signup';

//products
const String addProductUrl = '$baseurl/api/products/';
const String getProductsUrl = '$baseurl/api/products/';
const String getSingleProductUrl = '$baseurl/api/products/';
const String updateProductUrl = '$baseurl/api/products/';
const String deleteProductUrl = '$baseurl/api/products/';
const String searchProductUrl = '$baseurl/api/products?search=';

//Orders
const String createOrderUrl = '$baseurl/api/orders/';
const String getOrdersUrl = '$baseurl/api/orders/';
const String deleteOrderUrl = '$baseurl/api/orders/';
const String shipOrderUrl = '$baseurl/api/orders/';
const String confirmDeliveryUrl = '$baseurl/api/orders/';

//Disputes
const String createDisputeUrl = '$baseurl/api/orders/';

//Admin
const String verifySellerUrl = '$baseurl/api/auth/seller/verify/';
