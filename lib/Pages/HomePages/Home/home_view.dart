import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_expert/Pages/HomePages/Home/home_viewmodel.dart';
import 'package:money_expert/Widgets/HomePages/Home/balance_card.dart';
import 'package:money_expert/Widgets/HomePages/Home/welcome_card.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../extensions/padding_ext.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(view: () => const HomeView(), viewModel: HomeViewModel());
  }
}

class HomeView extends HookView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: mediaQuery.padding.left,
          right: mediaQuery.padding.right,
          top: mediaQuery.padding.top + mediaQuery.size.height * 0.01,
          bottom: mediaQuery.padding.bottom,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: mediaQuery.size.width * 0.1,
                  height: mediaQuery.size.width * 0.1,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        blurRadius: 15,
                        offset: const Offset(4, 4),
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: theme.shadowColor,
                        blurRadius: 15,
                        offset: const Offset(-4, -4),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      //TODO open a navbar
                    },
                    child: Icon(
                      FontAwesomeIcons.ellipsisV,
                      color: theme.primaryColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ).setOnlyPadding(context, 0, 0.01, 0.0427, 0.0427),
            WelcomeCard(
              username: viewModel.username,
              loaded: viewModel.userDataloaded,
            ).setOnlyPadding(context, 0, 0.01, 0.0, 0.0),
            BalanceCard(
              balance: viewModel.balance,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO add a new transaction
        },
        clipBehavior: Clip.antiAlias,
        backgroundColor: theme.primaryColor,
        tooltip: 'home_screen.add_new_transaction'.tr(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Icon(
          Icons.plus_one,
          color: theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
