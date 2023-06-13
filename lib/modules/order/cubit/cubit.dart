import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_visa_ref_code/models/auth/AuthResponse.dart';
import 'package:paymob_visa_ref_code/models/kiosk/KioskResponse.dart';
import 'package:paymob_visa_ref_code/models/order/OrderResponse.dart';
import 'package:paymob_visa_ref_code/models/payment/PaymentResponse.dart';
import 'package:paymob_visa_ref_code/modules/order/cubit/sates.dart';
import 'package:paymob_visa_ref_code/shared/components/constants.dart';
import 'package:paymob_visa_ref_code/shared/network/remote/dio_helper.dart';

class OrderCubit extends Cubit<OrderCubitSates>{

  OrderCubit() : super(OrderCubitInitialSates());
  static OrderCubit get(context)=>BlocProvider.of(context);

  //auth api
  AuthResponse? authResponse;
  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingStates());
    DioHelper.putData(url: ApiContest.CompletPathAuth, data: {
      'api_key': ApiContest.paymentApiKey,
    }).then((value) {
      authResponse = AuthResponse.fromJson(value.data);
      ApiContest.paymentFirstToken = authResponse!.token;
      print('The token 🍅${ApiContest.paymentFirstToken}');
      emit(PaymentAuthSuccessStates());
    }).catchError((error) {
      print('Error in auth token 🤦‍♂️');
      emit(PaymentAuthErrorStates(error.toString()),
      );
    });
  }

  //get order id api
  OrderResponse? orderResponse;
  Future getOrderRegistrationID({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,}) async {
    emit(PaymentOrderIdLoadingStates());
    DioHelper.putData(url: ApiContest.CompletPathOrder, data: {
      "auth_token": authResponse!.token,
      "delivery_needed": "false",
      "amount_cents":price,
      "currency": "EGP",
      "items": [
        {
          "name": "ASC1515",
          "amount_cents": "500000",
          "description": "Smart Watch",
          "quantity": "1"
        },
        {
          "name": "ERT6565",
          "amount_cents": "200000",
          "description": "Power Bank",
          "quantity": "1"
        }
      ],
      "shipping_data": {
        "apartment": "803",
        "email": email,
        "floor": "42",
        "first_name": firstName,
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": phone,
        "postal_code": "01898",
        "extra_description": "8 Ram , 128 Giga",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name":lastName,
        "state": "Utah"
      },
      "shipping_details": {
        "notes" : " test",
        "number_of_packages": 1,
        "weight" : 1,
        "weight_unit" : "Kilogram",
        "length" : 1,
        "width" :1,
        "height" :1,
        "contents" : "product of some sorts"
      }
    }).then((value) {
      orderResponse = OrderResponse.fromJson(value.data);
      ApiContest.paymentOrderId = orderResponse!.id.toString();
      print('The order id 🍅 =${ApiContest.paymentOrderId}');
      getPaymentRequest(price, firstName, lastName, email, phone);
      emit(PaymentOrderIdSuccessStates());
    }).catchError((error) {
      print('Error in order id 🤦‍♂️ ${error.toString()}');
      emit(PaymentOrderIdErrorStates(error.toString()),
      );
    });
  }

  // for final request token payment api
  PaymentResponse? paymentResponse;
  Future<void> getPaymentRequest(
      String priceOrder,
      String firstName,
      String lastName,
      String email,
      String phone,
      ) async {
    emit(PaymentRequestTokenLoadingStates());
    DioHelper.putData(
      url: ApiContest.CompletPathPayment,
      data: {
        "auth_token": ApiContest.paymentFirstToken,
        "amount_cents": priceOrder,
        "expiration": 3600,
        "order_id": ApiContest.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiContest.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      paymentResponse =PaymentResponse.fromJson(value.data);
      ApiContest.finalToken = paymentResponse!.token!;
      print('Final token 🚀 ${ApiContest.finalToken}');
      emit(PaymentRequestTokenSuccessStates());
    }).catchError((error) {
      print('Error in final token 🤦‍♂️${error.toString()}');
      emit(
        PaymentRequestTokenErrorStates(error.toString()),
      );
    });
  }

  //get ref code api using final token
  KioskResponse? kioskResponse;
  Future getRefCode() async {
    DioHelper.putData(
      url: ApiContest.CompletPathRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": paymentResponse!.token,
      },
    ).then((value) {
      kioskResponse=KioskResponse.fromJson(value.data);
      ApiContest.refCode = kioskResponse!.id.toString();
      print('The ref code 🍅${ApiContest.refCode}');
      emit(PaymentRefCodeSuccessStates());
    }).catchError((error) {
      print("Error in ref code 🤦‍♂️ ${error.toString()}");
      emit(PaymentRefCodeErrorStates(error.toString()));
    });
  }
}