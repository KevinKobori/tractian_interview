import 'package:flutter/material.dart';

class MenuPageLoadingView extends StatelessWidget {
  const MenuPageLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRACTIAN'),
      ),
      body: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
