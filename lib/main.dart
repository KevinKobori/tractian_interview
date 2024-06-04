import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tractian_interview/core/configuration/app_builder.dart';
import 'package:tractian_interview/core/configuration/constants/api.dart';
import 'package:tractian_interview/core/configuration/constants/dot_env.dart';
import 'package:tractian_interview/core/repositories/company_repository.dart';

Future<void> _startSingletons() async {
  await DotEnv.initialize();
  await Api.initialize();
}

final companyRepository = CompanyRepository(
  apiRequest: Dio(Api.instance.options),
  apiPaths: Api.instance.paths.company,
);

void main() async {
  await _startSingletons();
  runApp(AppBuilder(appTitle: DotEnv.instance.appTitle));
}

class HomePage extends StatefulWidget {
  const HomePage({required this.title, super.key});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
