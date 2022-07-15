
class CartData {

  int? quantity;
  final double? price;
  double? totalPrice;
  String? foodID;

  CartData({this.price, this.foodID});

  setQuantity(int quantity) {
    this.quantity = quantity;
    totalPrice = quantity * price!;
  }

  int? getQuantity(){
    return quantity;
  }

  double? gettotalPrice(){
    return totalPrice;
  }













}