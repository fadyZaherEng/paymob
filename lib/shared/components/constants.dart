// ignore_for_file: constant_identifier_names

class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RJd05qVTRMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuMm51Y3U3WmNranRwOW1PT2NDNU5nbW1VLUZrV0Q4c3hoX0wySkdJLWZnYjRnRFFyUFdxaERTQ3RfWEZWT3Z2S2trbWNZUWExLWVCUTA0ekpuMGpxQ2c=";
  static const String CompletPathAuth = '/auth/tokens';
  static const CompletPathOrder = '/ecommerce/orders';
  static const CompletPathPayment = '/acceptance/payment_keys';
  static const CompletPathRefCode = '/acceptance/payments/pay';
 //frame 2: https://accept.paymob.com/api/acceptance/iframes/766429?payment_token={payment_key_obtained_previously}
  //frame 1: static String visaUrl = '$baseUrl/acceptance/iframes/424000?payment_token=$finalToken';
  static String visaUrl = '$baseUrl/acceptance/iframes/766429?payment_token=$finalToken';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';
  static String finalToken = '';

  static const String integrationIdCard = '3908258';
  static const String integrationIdKiosk = '3908274';

  static String refCode = '';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
