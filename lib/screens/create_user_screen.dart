// lib/screens/create_user_screen.dart

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // Pacote para gerar IDs únicos
import 'package:roboldo/models/user.dart';
import 'package:roboldo/services/user_service.dart';
import 'package:roboldo/screens/home_screen.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _uuid = const Uuid();

  // Função para criar o usuário e navegar para a tela principal
  void _createUser() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      // Exibe uma mensagem de erro se o nome estiver vazio
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira um nome.')),
      );
      return;
    }

    // Cria uma nova instância de User com um ID único
    final newUser = User(id: _uuid.v4(), name: name);

    // Salva o novo usuário no armazenamento local
    await UserService.saveUser(newUser);

    // Navega para a tela principal (HomeScreen) e substitui a tela atual
    // para que o usuário não possa voltar
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen(user: newUser)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bem-vindo(a)!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Insira seu nome para começar:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // Campo de texto para o nome
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Seu nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Botão para criar o usuário
            ElevatedButton(
              onPressed: _createUser,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
