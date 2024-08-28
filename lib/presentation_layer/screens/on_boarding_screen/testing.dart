import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);
  static const widgetName = 'Testing';
  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Model>(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Providers')),
        body: WidgetChild(),
      ),
    );
  }
}

class WidgetChild extends StatelessWidget {
  const WidgetChild({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Model model = Provider.of<Model>(context, listen: false);
    return Column(
      children: [
        Center(
          child: Text(context.watch<Model>().name),
        ),
        SizedBox(height: 10),
        MaterialButton(
          onPressed: () {
            context.read<Model>().changeName();
          },
          child: const Text('Do Something'),
          color: Colors.blue,
        ),
      ],
    );
  }
}

class Model with ChangeNotifier {
  String name = 'Welcome';
  void changeName() {
    name = 'Welcome, Mohammad';
    notifyListeners();
  }
}

class ProvOne with ChangeNotifier {
  String showsomething1 = 'Show Something';
  String showsomething2 = 'Show Something';

  String get showone => showsomething1;
  String get showtwo => showsomething2;

  ElevatedButton get button1 => ElevatedButton(
        onPressed: () {
          dosomething1();
        },
        child: const Text('Do Something 1'),
      );

  ElevatedButton get button2 => ElevatedButton(
      onPressed: () {
        dosomething2();
      },
      child: const Text('Do Something 2'));

  void dosomething1() {
    showsomething1 = 'Yes Provider 1';
    notifyListeners();
  }

  void dosomething2() {
    showsomething2 = 'Yes Provider 2';
    notifyListeners();
  }
}
