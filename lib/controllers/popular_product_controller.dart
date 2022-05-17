// ignore_for_file: avoid_print

import 'package:foodies_palpa/controllers/cart_controller.dart';
import 'package:foodies_palpa/data/repository/popular_product_repo.dart';
import 'package:foodies_palpa/models/cart_model.dart';
import 'package:foodies_palpa/models/product_model.dart';
import 'package:foodies_palpa/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  late CartController _cart;

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

//A method responsible for increasing or decreasing items based on button click

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print("Quantity " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("Quantity " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((quantity + _inCartItem) < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mainColor);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if ((quantity + _inCartItem) > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mainColor);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel productModel, CartController cartController) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cartController;
    var exist = false;
    exist = _cart.existInCart(productModel);
    print("exist or not  " + exist.toString());
    if (exist) {
      _inCartItem = _cart.getQuantity(productModel);
    }
    print("The quantity in the cart is " + _inCartItem.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    //  _cart.items.forEach((key, value) {
    //   print("The id is " +
    //       value.id.toString() +
    //       " The quantity is " +
    //       value.quantity.toString());
    // });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
