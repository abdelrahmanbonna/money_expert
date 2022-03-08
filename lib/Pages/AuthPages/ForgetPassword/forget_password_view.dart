import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Pages/AuthPages/ForgetPassword/forget_password_viewmodel.dart';
import 'package:money_expert/extensions/extensions.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../../Widgets/General/raised_rounded_button.dart';
import '../../../Widgets/General/raised_textfield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as List;

    return MVVM(
      view: () =>  ForgetPasswordView(titleTag: args[0].toString(),),
      viewModel: ForgetPasswordViewModel(),
    );
  }
}

class ForgetPasswordView extends HookView<ForgetPasswordViewModel> {
 final String titleTag;
  const ForgetPasswordView({Key? key,required this.titleTag}) : super(key: key);

  @override
  Widget render(BuildContext context, ForgetPasswordViewModel viewModel) {
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
          Text(
            'forget_password_screen.hint_text'.tr(),
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: theme.textTheme.bodyText1,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: theme.primaryColor,
            ),
          ).setOnlyPadding(context, 0, 0.01, 0.0427, 0.0427),
          RaisedTextField(
            hint: 'forget_password_screen.email'.tr(),
            controller: viewModel.emailController,
          ).setHorizontalAndVerticalPadding(context, 0.0427, 0.01),
        ],
      ),
      floatingActionButton: RaisedRoundedButton(
        width: mediaQuery.size.width * 0.9,
        title: 'forget_password_screen.reset_password'.tr(),
        onTap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
