import 'package:flutter/material.dart';
import '../common/widget/loading_widget.dart';
import '../controller/product_controller.dart';
import '../data/models/product.dart';

class SearchProductView extends StatefulWidget {
  const SearchProductView({super.key});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  final TextEditingController _searchController = TextEditingController();
  final ProductController _controller = ProductController();

  bool _isLoading = false;
  String _errorMessage = '';
  List<Product> _products = [];

  Future<void> _searchProducts() async {
    final keyword = _searchController.text.trim();

    if (keyword.isEmpty) {
      setState(() {
        _products = [];
        _errorMessage = 'Vui lòng nhập từ khóa tìm kiếm';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
      _products = [];
    });

    try {
      final result = await _controller.searchProducts(keyword);

      setState(() {
        _products = result;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Lỗi: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const LoadingWidget();
    }

    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          _errorMessage,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (_products.isEmpty) {
      return const Center(
        child: Text('Chưa có kết quả tìm kiếm'),
      );
    }

    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: product.thumbnail.isNotEmpty
                ? Image.network(
              product.thumbnail,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            )
                : const Icon(Icons.image),
            title: Text(product.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${product.price.toStringAsFixed(2)}'),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Product - 6451071035'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Nhập từ khóa, ví dụ: phone',
                    ),
                    onSubmitted: (_) => _searchProducts(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _searchProducts,
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }
}