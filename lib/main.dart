import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:arts_home/core/my_bloc_observer.dart';
import 'package:arts_home/data/remote/data_providers/my_dio.dart';
import 'package:arts_home/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  MyDio.dioInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit()..getMovies(),
          ),

        ],
        child: MaterialApp(
          title: 'Movies App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      );
    });
  }
}
