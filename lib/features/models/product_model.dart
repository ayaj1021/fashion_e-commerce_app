// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String productId;
  String name;
  String image;
  double price;
bool? isAvailable;
String description;
String? categoryName;
  ProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    this.isAvailable,
    required this.description,
    this.categoryName,
  });

  ProductModel copyWith({
    String? productId,
    String? name,
    String? image,
    double? price,
    bool? isAvailable,
    String? description,
    String? categoryName,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'isAvailable': isAvailable,
      'description': description,
      'categoryName': categoryName,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      isAvailable: map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      description: map['description'] as String,
      categoryName: map['categoryName'] != null ? map['categoryName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(productId: $productId, name: $name, image: $image, price: $price, isAvailable: $isAvailable, description: $description, categoryName: $categoryName)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.productId == productId &&
      other.name == name &&
      other.image == image &&
      other.price == price &&
      other.isAvailable == isAvailable &&
      other.description == description &&
      other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
      name.hashCode ^
      image.hashCode ^
      price.hashCode ^
      isAvailable.hashCode ^
      description.hashCode ^
      categoryName.hashCode;
  }
}
