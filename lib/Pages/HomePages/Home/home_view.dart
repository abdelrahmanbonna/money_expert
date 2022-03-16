import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/Pages/HomePages/Home/home_viewmodel.dart';
import 'package:money_expert/Widgets/HomePages/Home/balance_card.dart';
import 'package:money_expert/Widgets/HomePages/Home/debits_card.dart';
import 'package:money_expert/Widgets/HomePages/Home/payment_card.dart';
import 'package:money_expert/Widgets/HomePages/Home/welcome_card.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletons/skeletons.dart';

import '../../../extensions/padding_ext.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => const HomeView(),
      viewModel: HomeViewModel(),
    );
  }
}

class HomeView extends HookView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: mediaQuery.padding.left,
              right: mediaQuery.padding.right,
              top: mediaQuery.padding.top + mediaQuery.size.height * 0.01,
              bottom: mediaQuery.padding.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeCard(
                  username: viewModel.username,
                  loaded: viewModel.userDataloaded,
                  imgURL: viewModel.imgURL,
                ).setOnlyPadding(context, 0.08, 0.01, 0.0, 0.0),
                BalanceCard(
                  cashBalance: viewModel.cashBalance,
                  bankBalance: viewModel.bankBalance,
                ).setOnlyPadding(context, 0, 0.02, 0.0, 0.0),
                Text(
                  'home_screen.last_debits'.tr(),
                  style: GoogleFonts.ubuntu(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: theme.primaryColor.withOpacity(0.7),
                  ),
                ).setOnlyPadding(context, 0, 0.02, 0.0427, 0.0427),
                if (viewModel.userDataloaded)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      return index == 0
                          ? const DebitsCard(
                              icon: FontAwesomeIcons.coins,
                              amount: 10.0,
                              username: 'Ebraam Boshra',
                              thing: 'nescafe',
                            )
                          : const DebitsCard(
                              icon: FontAwesomeIcons.coins,
                              amount: 1000.0,
                              username: 'Ebraam Boshra',
                              thing: 'food',
                              type: DebitType.owesYou,
                            );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                if (!viewModel.userDataloaded)
                  SizedBox(
                    width: mediaQuery.size.width,
                    height: mediaQuery.size.height * 0.55,
                    child: SkeletonListView(
                      itemCount: 3,
                      item: const DebitsCard(
                        icon: FontAwesomeIcons.coins,
                        username: ' ',
                        thing: ' ',
                      ).setOnlyPadding(context, 0.02, 0.01, 0, 0),
                    ),
                  ),
                Text(
                  'home_screen.last_payments'.tr(),
                  style: GoogleFonts.ubuntu(
                    textStyle: theme.textTheme.headline4,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: theme.primaryColor.withOpacity(0.7),
                  ),
                ).setOnlyPadding(context, 0.02, 0.02, 0.0427, 0.0427),
                if (viewModel.userDataloaded)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      return const PaymentCard(
                        amount: 100.0,
                        thing: 'Food',
                      );
                    },
                    scrollDirection: Axis.vertical,
                  ).setOnlyPadding(context, 0, 0.1, 0, 0),
              ],
            ),
          ),
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
          ).setOnlyPadding(
              context,
              mediaQuery.padding.top + 10,
              mediaQuery.size.height * 0.01,
              mediaQuery.size.width * 0.0427,
              mediaQuery.size.width * 0.0427,
              enableMediaQuery: false),
        ],
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
          Icons.add,
          color: theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
