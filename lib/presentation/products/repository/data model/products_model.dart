class ProductResponse {
  final String status;
  final int results;
  final ProductData data;

  ProductResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'],
      results: json['results'],
      data: ProductData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'results': results,
        'data': data.toJson(),
      };
}

class ProductData {
  final List<Product> products;

  ProductData({required this.products});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products.map((p) => p.toJson()).toList(),
      };
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final List<String> images;
  final int stock;
  final String condition;
  final Seller seller;
  final Location location;
  final bool isActive;
  final DateTime createdAt;
  final String formattedPrice;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.images,
    required this.stock,
    required this.condition,
    required this.seller,
    required this.location,
    required this.isActive,
    required this.createdAt,
    required this.formattedPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      images: List<String>.from(json['images'] ?? []),
      stock: json['stock'],
      condition: json['condition'],
      seller: Seller.fromJson(json['seller']),
      location: Location.fromJson(json['location']),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      formattedPrice: json['formattedPrice'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'category': category,
        'images': images,
        'stock': stock,
        'condition': condition,
        'seller': seller.toJson(),
        'location': location.toJson(),
        'isActive': isActive,
        'createdAt': createdAt.toIso8601String(),
        'formattedPrice': formattedPrice,
      };
}

class Seller {
  final String id;
  final String name;
  final String phone;

  Seller({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'phone': phone,
      };
}

class Location {
  final String city;

  Location({required this.city});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() => {
        'city': city,
      };
}
