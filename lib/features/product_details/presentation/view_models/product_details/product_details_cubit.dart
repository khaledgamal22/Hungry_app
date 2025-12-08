import 'package:bloc/bloc.dart';
import 'package:hungry/core/utils/app_images.dart';
import 'package:hungry/features/home/data/models/product_model.dart';
import 'package:hungry/features/product_details/data/models/add_to_cart_model.dart';
import 'package:hungry/features/product_details/data/models/topping_model.dart';
import 'package:hungry/features/product_details/data/repos/add_to_cart_repo.dart';
import 'package:hungry/features/product_details/data/repos/get_product_details_repo.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.getProductDetailsRepo, this.addToCartRepo)
    : super(ProductDetailsInitial());
  final GetProductDetailsRepo getProductDetailsRepo;
  final AddToCartRepo addToCartRepo;
  final List<ToppingModel> sideOptionsList = [
    ToppingModel(id: 1, name: 'Fries', image: AppImages.fries),
    ToppingModel(id: 2, name: 'Coleslaw', image: AppImages.coleslaw),
    ToppingModel(id: 3, name: 'Salad', image: AppImages.salad),
    ToppingModel(id: 4, name: 'Onion', image: AppImages.friesOnion),
  ];

  final List<ToppingModel> toppingsList = [
    ToppingModel(id: 1, name: 'Tomato', image: AppImages.tomato),
    ToppingModel(id: 2, name: 'Onions', image: AppImages.onion),
    ToppingModel(id: 3, name: 'Pickles', image: AppImages.pickels),
    ToppingModel(id: 4, name: 'Bacons', image: AppImages.bacons),
  ];

  AddToCartModel? addToCartModel;
  double spicy = 0;
  List<int> toppings = [];
  List<int> sideOptions = [];

  void getProductDetails({required int productId}) async {
    emit(ProductDetailsLoading());
    final result = await getProductDetailsRepo.getProductDetails(
      productId: productId,
    );
    result.fold(
      (failure) => emit(
        ProductDetailsFailure(
          errorMessage: failure.message ?? "An error occurred",
        ),
      ),
      (productModel) => emit(ProductDetailsSuccess(productModel: productModel)),
    );
  }

  void initializeAddToCartModel({required int productId}) {
    addToCartModel = AddToCartModel(
      productId: productId,
      quantity: 1,
      spicy: 0,
      toppings: [],
      sideOptions: [],
    );
  }

  addTopping(int toppingId) {
    if (toppings.contains(toppingId)) {
      toppings.remove(toppingId);
    } else {
      toppings.add(toppingId);
    }
    emit(AddToCartUpdated());
  }

  addSideOption(int sideOptionId) {
    if (sideOptions.contains(sideOptionId)) {
      sideOptions.remove(sideOptionId);
    } else {
      sideOptions.add(sideOptionId);
    }
    emit(AddToCartUpdated());
  }

  void updateAddToCartModel() {
    addToCartModel = addToCartModel!.copyWith(
      spicy: spicy,
      toppings: toppings,
      sideOptions: sideOptions,
    );
    emit(AddToCartUpdated());
  }

  void addToCart() async {
    emit(AddToCartLoading());
    final result = await addToCartRepo.addToCart(items: [addToCartModel!]);
    result.fold(
      (failure) => emit(
        AddToCartFailure(errorMessage: failure.message ?? "An error occurred"),
      ),
      (message) => emit(AddToCartSuccess(message: message)),
    );
  }
}
