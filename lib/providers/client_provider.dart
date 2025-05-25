import 'package:flutter/foundation.dart';
import '../models/client.dart';

class ClientProvider with ChangeNotifier {
  List<Client> _clients = [];
  bool _isLoading = false;
  String? _error;

  List<Client> get clients => _clients;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchClients() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Replace with your actual API call
      // Simulated API call
      await Future.delayed(const Duration(seconds: 1));
      _clients = [
        Client(
          id: '1',
          name: 'João da Silva',
          code: '123456',
          isAvailable: true,
        ),
        Client(
          id: '2',
          name: 'Maria Oliveira',
          code: '789012',
          isAvailable: false,
        ),
      ];
    } catch (e) {
      _error = 'Erro ao carregar clientes: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
} 