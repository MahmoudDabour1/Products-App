
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../core/Dio_helper.dart';
import 'model.dart';
part 'states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialStates());

  static ProductsCubit get(context) => BlocProvider.of(context);

  final dioHelper = DioHelper();
  ProductsData? model;

  getProducts() async {
    emit(ProductsLoadingStates());
    final respo = await dioHelper.getData(endPoint: "products");
    if(respo.statusCode==200&&respo.data["status"])
    {
       model = ProductsData.fromJson(respo.data);
      emit(ProductsSuccessStates(msg: respo.data["msg"]));
    }
    else
      {
        emit(ProductsFailedStates(msg: respo.data["mag"]));
      }
  }



   deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://store.webautobazaar.com/api/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final respo = await dioHelper.getData(endPoint: "products");
    if(respo.statusCode==200&&respo.data["status"])
    {
      model = ProductsData.fromJson(respo.data);
      emit(ProductsSuccessStates(msg: respo.data["msg"]));
    }
    else
    {
      emit(ProductsFailedStates(msg: respo.data["mag"]));
    }
  }
}
