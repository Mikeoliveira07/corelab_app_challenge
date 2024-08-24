import 'package:corelab_app_challenge/components/not_found.dart';
import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../models/product.dart';

// Mock de Produtos

final List<Product> products = [
  Product(
    
    name: 'Condicionador Ácido Fosfórico 37%',
    description: 'Condicionador para dentística e estética.',
    category: 'Dentística e Estética',
    price: 290.90,
    imageUrl: 'assets/images/condicionador_acido.png',
  ),
  Product(
    name: 'Anestésicos e Agulhas Gengival',
    description: 'Agulhas para uso odontológico.',
    category: 'Anestésicos e Agulhas',
    price: 99.90,
    imageUrl: 'assets/images/condicionador_acido.png',
  ),
  Product(
    name: 'Condicionador Ácido Fosfórico 37% - AllPrime',
    description: 'Condicionador para dentística e estética.',
    category: 'Dentística e Estética',
    price: 290.90,
    imageUrl: 'assets/images/mascara.png',
  ),
  // Adicione mais produtos conforme necessário
];




class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      final lowerQuery = query.toLowerCase();
      return product.name.toLowerCase().contains(lowerQuery) ||
          product.description.toLowerCase().contains(lowerQuery) ||
          product.category.toLowerCase().contains(lowerQuery) ||
          product.price.toString().contains(lowerQuery);
    }).toList();

    return Scaffold(
      appBar: CustomAppBar(
        onSearch: (value) {
          setState(() {
            query = value;
          });
        },
      ),
      body: filteredProducts.isEmpty
          ? const NotFoundComponent()
          : ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        leading: Image.asset(
                          product.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'R\$ ${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Em até 12x de R\$ ${(product.price / 12).toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.lightBlue,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'NOVO',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );

              },
            ),
    );
  }
}

