import 'package:get_it/get_it.dart';
import 'core/viewmodels/order_crud_model.dart';
import 'core/viewmodels/product_crud_model.dart';
import 'core/services/firestore_api.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FirestoreAPI('products'));
  locator.registerLazySingleton(() => ProductCRUDModel());
  locator.registerLazySingleton(() => OrderCRUDModel());
}