import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Widgets/General/raised_textfield.dart';
import 'package:money_expert/extensions/extensions.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../../Configurations/page_route_names.dart';
import '../../../Widgets/General/raised_rounded_button.dart';
import 'sign_up_viewmodel.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;

    return MVVM(
      view: (_, __) => SignUpView(
        titleTag: args[0].toString(),
      ),
      viewModel: SignUpViewModel(),
    );
  }
}

class SignUpView extends HookView<SignUpViewModel> {
  final String titleTag;

  const SignUpView({Key? key, required this.titleTag}) : super(key: key);

  @override
  Widget render(BuildContext context, viewModel) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: titleTag,
              child: Text(
                'app_title'.tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: theme.textTheme.headline4,
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: theme.primaryColor,
                ),
              ).setOnlyPadding(context, 0, 0.05, 0, 0),
            ),
          ),
          RaisedTextField(
            hint: 'sign_up_screen.user_name'.tr(),
            controller: viewModel.usernameController,
            icon: FontAwesomeIcons.userCircle,
          ).setHorizontalAndVerticalPadding(context, 0.0427, 0.01),
          RaisedTextField(
            hint: 'sign_up_screen.email'.tr(),
            controller: viewModel.emailController,
            icon: FontAwesomeIcons.envelope,
          ).setHorizontalAndVerticalPadding(context, 0.0427, 0.01),
          RaisedTextField(
            hint: 'sign_up_screen.password'.tr(),
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RaisedRoundedButton(
        title: 'sign_up_screen.sign_up'.tr(),
        onTap: () =>
            Navigator.of(context).pushNamed(PageRouteName.signUp, arguments: [
          titleTag,
        ]),
      ).setHorizontalAndVerticalPadding(context, 0.0427, 0),
    );
  }
}
