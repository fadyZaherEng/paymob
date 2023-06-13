abstract class OrderCubitSates{}
class OrderCubitInitialSates extends OrderCubitSates{}
//auth
class PaymentAuthLoadingStates extends OrderCubitSates {}
class PaymentAuthSuccessStates extends OrderCubitSates {}
class PaymentAuthErrorStates extends OrderCubitSates {
  final String error;
  PaymentAuthErrorStates(this.error);
}

// for order id request
class PaymentOrderIdLoadingStates extends OrderCubitSates {}
class PaymentOrderIdSuccessStates extends OrderCubitSates {}
class PaymentOrderIdErrorStates extends OrderCubitSates {
  final String error;
  PaymentOrderIdErrorStates(this.error);
}

// for request token payment
class PaymentRequestTokenLoadingStates extends OrderCubitSates {}
class PaymentRequestTokenSuccessStates extends OrderCubitSates {}
class PaymentRequestTokenErrorStates extends OrderCubitSates {
  final String error;
  PaymentRequestTokenErrorStates(this.error);
}

// for ref code kiosk
class PaymentRefCodeLoadingStates extends OrderCubitSates {}
class PaymentRefCodeSuccessStates extends OrderCubitSates {}
class PaymentRefCodeErrorStates extends OrderCubitSates {
  final String error;
  PaymentRefCodeErrorStates(this.error);
}