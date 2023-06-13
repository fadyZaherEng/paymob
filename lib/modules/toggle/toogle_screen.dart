import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_visa_ref_code/modules/kiosk/ref_code_screen.dart';
import 'package:paymob_visa_ref_code/modules/order/cubit/cubit.dart';
import 'package:paymob_visa_ref_code/modules/order/cubit/sates.dart';
import 'package:paymob_visa_ref_code/modules/visa/visa_screen.dart';
import 'package:paymob_visa_ref_code/shared/components/components.dart';
import 'package:paymob_visa_ref_code/shared/components/constants.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderCubitSates>(
      listener: (context, state) {
        if (state is PaymentRefCodeSuccessStates) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.purple.shade400,
              content: const Text(
                "Success get ref code ",
                textAlign: TextAlign.center,
              ),
            ),
          );
          navigateToWithoutReturn(context,const ReferenceScreen());
          //  navigateAndFinish(context, const ReferenceScreen());
        }
        if (state is PaymentRefCodeErrorStates) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
              content: Text(
                "error get ref code ",
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body:  SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          OrderCubit.get(context).getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.purple, width: 4.0),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(AppImages.refCodeImage),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Payment with Ref code',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // navigateAndFinish(context, const VisaScreen());
                          navigateToWithReturn(context,VisaScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.purple, width: 4.0),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(AppImages.visaImage),
                              ),
                              Text(
                                'Payment with visa',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),

        );
      },
    );
  }
}
