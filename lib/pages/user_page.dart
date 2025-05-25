import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool _isVisible = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.purple[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sua medicação está disponível para retirada!',
                  style: TextStyle(fontSize: 24, color: Colors.purple[800]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200, // Largura fixa do card
              child: Card(
                color: Colors.purple[100],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Código de retirada', style: TextStyle(fontSize: 16, color: Colors.purple[800])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _isVisible ? '123456' : '******',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.purple[800],
                            ),
                          ),
                          IconButton(
                            icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
