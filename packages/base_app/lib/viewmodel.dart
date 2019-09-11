import 'package:scoped_model/scoped_model.dart';
export 'package:scoped_model/scoped_model.dart';

class ViewModel extends Model {
  bool loading = false;

  void startLoading() {
    loading = true;
    notifyListeners();
  }

  void stopLoading() {
    loading = false;
    notifyListeners();
  }
}