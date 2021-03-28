import 'package:flutter/material.dart';
import '../enums/view_state.dart';
import '../errors/widget_not_implemented_exception.dart';

class Folded extends StatelessWidget {
  final ViewState? viewState;
  final Widget? initial;
  final Widget? busy;
  final Widget? error;
  final Widget? data;

  const Folded(
      {required this.viewState, this.initial, this.data, this.busy, this.error});


  Widget get _empty => const SizedBox();

  @override
  Widget build(BuildContext context) {
    switch (viewState ?? ViewState.INITIAL) {
      case ViewState.INITIAL:
        return initial ?? _empty;
      case ViewState.BUSY:
        return busy ?? _empty;
      case ViewState.ERROR:
        return error ?? _empty;
      case ViewState.DATA:
        return data ?? _empty;
      default: throw WidgetNotImplementedException();
    }
  }
}
