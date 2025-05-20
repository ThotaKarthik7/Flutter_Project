import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}


class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Counter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('${counterModel.count}', style: const TextStyle(fontSize: 36)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: counterModel.decrement,
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  iconSize: 36,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: counterModel.increment,
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                  iconSize: 36,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
