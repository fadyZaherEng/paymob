// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_visa_ref_code/modules/order/cubit/cubit.dart';
import 'package:paymob_visa_ref_code/modules/order/cubit/sates.dart';
import 'package:paymob_visa_ref_code/modules/toggle/toogle_screen.dart';
import 'package:paymob_visa_ref_code/shared/components/components.dart';

class RegisterOrder extends StatelessWidget {
  RegisterOrder({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderCubitSates>(
      listener: (ctx, state) {
        if (state is PaymentOrderIdSuccessStates) {
          navigateToWithReturn(context, ToggleScreen());
        }
      },
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text(
              "Paymob",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Delivery.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.46,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: defaultTextForm(
                                controller: firstNameController,
                                type: TextInputType.name,
                                hintText: 'First name',
                                prefix: Icons.person,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name!';
                                  }
                                  return null;
                                },
                                onChanged: () {},
                                onSubmitted: () {},
                                obscure: false,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: defaultTextForm(
                                controller: lastNameController,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your last name !';
                                  }
                                  return null;
                                },
                                type: TextInputType.name,
                                hintText: 'Last name',
                                prefix: Icons.person,
                                onChanged: () {},
                                onSubmitted: () {},
                                obscure: false,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        defaultTextForm(
                          controller: emailController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email  !';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          hintText: 'Email',
                          prefix: Icons.email,
                          onChanged: () {},
                          onSubmitted: () {},
                          obscure: false,
                        ),
                        const SizedBox(height: 10),
                        defaultTextForm(
                          controller: phoneController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone !';
                            }
                            return null;
                          },
                          type: TextInputType.number,
                          hintText: 'Phone',
                          prefix: Icons.phone,
                          onChanged: () {},
                          onSubmitted: () {},
                          obscure: false,
                        ),
                        const SizedBox(height: 10),
                        defaultTextForm(
                          controller: priceController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your price !';
                            }
                            return null;
                          },
                          type: TextInputType.number,
                          hintText: 'Price',
                          prefix: Icons.monetization_on,
                          onChanged: () {},
                          onSubmitted: () {},
                          obscure: false,
                        ),
                        const SizedBox(height: 20),
                        state is PaymentOrderIdLoadingStates
                            ?const CircularProgressIndicator()
                            : Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.deepPurple,
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      OrderCubit.get(context)
                                          .getOrderRegistrationID(
                                              price: priceController.text
                                                  .toString(),
                                              firstName: firstNameController
                                                  .text
                                                  .toString(),
                                              lastName: lastNameController.text
                                                  .toString(),
                                              email: emailController.text
                                                  .toString(),
                                              phone: phoneController.text)
                                          .toString();
                                    }
                                  },
                                  child: const Text(
                                    'Register Order',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
