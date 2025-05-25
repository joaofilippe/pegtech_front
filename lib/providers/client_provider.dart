import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ClientProvider with ChangeNotifier {
  List<User> _clients = [];
  bool _isLoading = false;
  String? _error;

  List<User> get clients => _clients;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchClients() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('http://localhost:8080/users'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _clients = data
            .map((json) => User.fromJson(json))
            .where((user) => user.type == 'C')
            .toList();
      } else {
        _error = 'Erro ao carregar clientes: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Erro ao carregar clientes: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<RegistrationResult> submitRegistration({
    required String clientId,
    required String hours,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/lockers/package'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'user_id': clientId,
          'expiration_time': int.parse(hours),
        }),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return RegistrationResult(
          lockerNumber: data['locker'].toString(),
          portNumber: data['port'].toString(),
          registrationCode: data['package_code'],
        );
      } else {
        throw Exception('Erro ao registrar pacote: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao registrar pacote: $e');
    }
  }
}

class RegistrationResult {
  final String lockerNumber;
  final String portNumber;
  final String registrationCode;

  RegistrationResult({
    required this.lockerNumber,
    required this.portNumber,
    required this.registrationCode,
  });
} 