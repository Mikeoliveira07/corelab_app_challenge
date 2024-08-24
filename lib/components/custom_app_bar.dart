import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearch;

  const CustomAppBar({super.key, required this.onSearch});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onSearch(_controller.text);
      setState(() {}); // Atualiza o estado para mostrar ou esconder o botão de limpar
    });
  }

  void _clearSearch() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 12),
              hintText: 'Buscar',
              border: InputBorder.none,
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: _clearSearch,
                    )
                  : const Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
