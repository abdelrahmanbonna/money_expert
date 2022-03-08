import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Configurations/page_route_names.dart';
import 'package:money_expert/Widgets/General/raised_rounded_button.dart';
import 'package:money_expert/Widgets/General/raised_textfield.dart';
import 'package:money_expert/extensions/extensions.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:flutter/material.dart';

import 'login_viewmodel.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;

    return MVVM(
      view: () => LoginView(
        titleTag: args[0].toString(),
      ),
      viewModel: LoginViewModel(),
    );
  }
}

class LoginView extends HookView<LoginViewModel> {
  final String titleTag;
  const LoginView({
    Key? key,
    required this.titleTag,
  }) : super(key: key);

  @override
  Widget render(BuildContext context, viewModel) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: titleTag,
            child: Text(
              'app_title'.tr(),
              style: GoogleFonts.lato(
                textStyle: theme.textTheme.headline4,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: theme.primaryColor,
              ),
            ).setOnlyPadding(context, 0, 0.1, 0, 0),
          ),
          RaisedTextField(
            hint: 'login_screen.email'.tr(),
            controller: viewModel.emailController,
            icon: FontAwesomeIcons.envelope,
          ).setHorizontalAndVerticalPadding(context, 0.0427, 0.01),
          RaisedTextField(
            hint: 'login_screen.password'.tr(),
            controller: viewModel.passwordController,
            icon: FontAwesomeIcons.lock,
            obscure: !viewModel.showPassword,
            trellingWidget: IconButton(
              icon: Icon(
                viewModel.showPassword
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
                size: 23,
                color: theme.primaryColor,
              ),
              onPressed: () {
                viewModel.setShowPassword(!viewModel.showPassword);
              },
            ),
          ).setHorizontalAndVerticalPadding(context, 0.0427, 0.01),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              PageRouteName.forgetPassword,
              arguments: [
                titleTag,
              ],
            ),
            child: Text(
              'login_screen.forgetpassword'.tr(),
              style: GoogleFonts.lato(
                textStyle: theme.textTheme.headline4,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: theme.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ).setOnlyPadding(context, 0.02, 0, 0, 0),
        ],
      ),
      floatingActionButton: RaisedRoundedButton(
        width: mediaQuery.size.width * 0.9,
        title: 'login_screen.login'.tr(),
        onTap: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(PageRouteName.home, (route) => false);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
