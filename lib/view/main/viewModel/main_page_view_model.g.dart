// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageViewModel on _MainPageViewModelBase, Store {
  late final _$selectedTabIndexAtom =
      Atom(name: '_MainPageViewModelBase.selectedTabIndex', context: context);

  @override
  int get selectedTabIndex {
    _$selectedTabIndexAtom.reportRead();
    return super.selectedTabIndex;
  }

  @override
  set selectedTabIndex(int value) {
    _$selectedTabIndexAtom.reportWrite(value, super.selectedTabIndex, () {
      super.selectedTabIndex = value;
    });
  }

  late final _$_MainPageViewModelBaseActionController =
      ActionController(name: '_MainPageViewModelBase', context: context);

  @override
  void setTabIndex(int index) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
        name: '_MainPageViewModelBase.setTabIndex');
    try {
      return super.setTabIndex(index);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTabIndex: ${selectedTabIndex}
    ''';
  }
}
