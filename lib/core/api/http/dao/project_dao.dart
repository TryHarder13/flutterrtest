import 'package:flutterrtest/core/api/http/core/f_net.dart';
import 'package:flutterrtest/core/api/http/request/categoty_request.dart';
import 'package:flutterrtest/models/study_world.dart';

class ProjectDao {

  ///获取文章体系
  static getCategory() async {
    CategoryRequest request = CategoryRequest();
    var result = await FNet.getInstance().fire(request);
    List list = result['data'];
    List<StudyWorld> categoryList = list.map((e) {
      return StudyWorld.fromJson(e);
    }).toList();
    return categoryList;
  }
}
