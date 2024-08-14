import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mybook/core/services/dio_helper.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/intro/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  await AppLocalStorage.init();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'My Book',
              theme: ThemeData(
                fontFamily: GoogleFonts.poppins().fontFamily,
                inputDecorationTheme: const InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                useMaterial3: true,
              ),
              home: child,
            ),
          );
        },
        child: const SplashView());
  }
}
