import 'package:flutter/material.dart';

class MenuPageLoadedFailureView extends StatelessWidget {
  final String failureMessage;
  final void Function() onReload;

  const MenuPageLoadedFailureView({
    required this.failureMessage,
    required this.onReload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TRACTIAN')),
      body: Center(child: Text(failureMessage)),
    );
  }
}
