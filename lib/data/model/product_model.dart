
class ProductModel {
  String? productId;
  String? productName;
  String? productNameAr;
  String? productDescription;
  String? productDescriptionAr;
  String? productImage;
  int? productCount;
  int? productActive;
  int? productPrice;
  int? productDiscount;
  String? productDatetime;
  int? productCategory;
  int? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryDatetime;
  String? favorite;
  String? productPriceDiscount;

  ProductModel({
        this.productId,
        this.productName,
        this.productNameAr,
        this.productDescription,
        this.productDescriptionAr,
        this.productImage,
        this.productCount,
        this.productActive,
        this.productPrice,
        this.productDiscount,
        this.productDatetime,
        this.productCategory,
        this.categoryId,
        this.categoryName,
        this.categoryNameAr,
        this.categoryImage,
        this.categoryDatetime,
        this.favorite,
        this.productPriceDiscount,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'].toString();
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDescription = json['product_description'];
    productDescriptionAr = json['product_description_ar'];
    productImage = json['product_image'];
    productCount = json['product_count'];
    productActive = json['product_active'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productDatetime = json['product_datetime'];
    productCategory = json['product_category'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
    categoryDatetime = json['category_datetime'];
    productPriceDiscount = json['product_price_discount'].toString();
    favorite = json['favorite'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_description'] = this.productDescription;
    data['product_description_ar'] = this.productDescriptionAr;
    data['product_image'] = this.productImage;
    data['product_count'] = this.productCount;
    data['product_active'] = this.productActive;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_datetime'] = this.productDatetime;
    data['product_category'] = this.productCategory;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_image'] = this.categoryImage;
    data['category_datetime'] = this.categoryDatetime;
    data['product_price_discount'] = this.productPriceDiscount;
    data['favorite'] = this.favorite;
    return data;
  }
}