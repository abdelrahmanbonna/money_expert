import 'package:flutter/material.dart';
import 'add_transaction_viewmodel.dart';
import 'package:pmvvm/pmvvm.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => const AddTransactionView(),
      viewModel: AddTransactionViewModel(),
    );
  }
}

class AddTransactionView extends HookView<AddTransactionViewModel> {
  const AddTransactionView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, viewModel) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
