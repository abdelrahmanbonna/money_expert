import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'search_viewmodel.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => SearchView(),
      viewModel: SearchViewModel(),
    );
  }
}

class SearchView extends HookView<SearchViewModel> {
  SearchView({Key? key}) : super(key: key, reactive: true);
  @override
  Widget render(BuildContext context, SearchViewModel viewModel) {
    throw 'Error page not emplemented';
  }
}
