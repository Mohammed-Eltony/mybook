import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/services/local_storage.dart';
import 'package:mybook/core/widgets/nav_bar_widget.dart';
import 'package:mybook/features/auth/presentation/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var token = AppLocalStorage.getCacheData('token') ?? "";
    Future.delayed(const Duration(seconds: 3), () {
      navToReplacement(
          context, token == '' ? const LoginView() : const NavBarWidget());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SvgPicture.asset(
        'assets/logo_app.svg',
      ),
    ));
  }
}
