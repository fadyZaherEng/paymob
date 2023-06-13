import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_visa_ref_code/modules/order/cubit/cubit.dart';
import 'package:paymob_visa_ref_code/modules/order/cubit/sates.dart';
import 'package:paymob_visa_ref_code/modules/order/register_order.dart';
import 'package:paymob_visa_ref_code/shared/network/remote/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.Init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderCubit>(
      create: (ctx)=>OrderCubit()..getAuthToken(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:RegisterOrder(),
      ),
    );
  }
}
