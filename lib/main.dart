import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medical_app/Features/auth/data/repositories/auth_repositories.dart';
import 'package:medical_app/Features/auth/presentation/view_model.dart/auth_cubit.dart';
import 'package:medical_app/Features/home/presentation/views/home_screen_view.dart';
import 'package:medical_app/Features/splash/presentation/views/splash_view.dart';
import 'package:medical_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(AuthRepository(FirebaseAuth.instance)),
            ),
          ],
          child: const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          ),
        );
      },
    );
  }
}
