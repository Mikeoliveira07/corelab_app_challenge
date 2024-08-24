import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Anestésicos e Agulhas Gengival'),
          ),
          ListTile(
            title: Text('Biossegurança'),
          ),
          ListTile(
            title: Text('Descartáveis'),
          ),
          ListTile(
            title: Text('Dentística e Estética'),
          ),
          ListTile(
            title: Text('Ortodontia'),
          ),
          ListTile(
            title: Text('Endodontia'),
          ),
          // Adicione outras categorias conforme necessário
        ],
      ),
    );
  }
}




