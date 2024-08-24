import 'package:flutter/material.dart';

class NotFoundComponent extends StatelessWidget {
  const NotFoundComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/rafiki.png')),
            Text('Resultado não encontrado',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                )),
            Text(
              'Não encontramos nenhum resultado \nparecido com',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}