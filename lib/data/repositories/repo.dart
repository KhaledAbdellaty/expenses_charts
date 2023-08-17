import 'package:expenses/data/data_service/remote_data_source.dart';

import '../model/expenses_model.dart';

class Repo {
  final remoteDataSourceImpl = RemoteDataSourceImpl.instance;
  Repo._();
  static Repo get instance => Repo._();
  Future<ExpensesModel> getExpenses() async {
    final res = await remoteDataSourceImpl.getExpenses();
    return ExpensesModel.fromJson(res.data);
  }
}
