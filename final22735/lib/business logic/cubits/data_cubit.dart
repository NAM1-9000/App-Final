import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final22735/data/model/data_model.dart';

class DataCubit extends Cubit<List<DataModel>> {
  DataCubit() : super([]);

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('transactions').get();
    List<DataModel> data = querySnapshot.docs.map((doc) {
      return DataModel.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
    emit(data);
  }
}
