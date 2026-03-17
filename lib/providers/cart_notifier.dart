import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return const {

    };
  }


  void addProduct(Product product) {
    if(!state.contains(product)){
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if(state.contains(product)){
      state = state.where((p) => p.id != product.id).toSet();
    }
  }

}

@riverpod
int totalCount(ref){
  final cartProvider = ref.watch(cartNotifierProvider);

  int total = 0;

  for(Product product in cartProvider){
    total += product.price;
  }
  return total;
}
