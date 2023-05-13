import 'package:first_flutter/present/utils/common_util.dart';
import 'package:flutter/cupertino.dart';

import '../../data/datasources/remote_movie_datasource.dart';
import '../../data/model/enum.dart';
import '../../data/model/movie_model.dart';

class BottomNavProvider extends ChangeNotifier {
  static const LIST = 0;
  static const FAVORITE = 1;
  int _tab = LIST;
  int get tab => _tab;

  setTab(int tab) {
    _tab = tab;
  }
  tabList() {
    _tab = LIST;
    notifyListeners();
  }
  tabFavorite() {
    _tab = FAVORITE;
    notifyListeners();
  }
}
class ListFragmentProvider extends ChangeNotifier {
  late List<Search> _searchList;
  List<Search> get searchList => _searchList;

  Status get status => _status;
  Status _status = Status.none;

  Future<void> getSearchList(String keyword, int page) async {
    CommonUtil().checkInternetConnection().then((value) {
      if (value) {
        _status = Status.loading;
        notifyListeners();
        APICall().getSearchList(keyword, page).then((response) {
          if (response.statusCode == 200) {
            _searchList = Resp.fromJson(response.data).search;
            _status = Status.success;
            notifyListeners();
          } else {
            _status = Status.failed;
            notifyListeners();
          }
        });
      } else {
        _status = Status.noInternet;
        notifyListeners();
      }
    });
  }
}