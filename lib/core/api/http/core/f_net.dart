import 'package:flutterrtest/core/api/http/core/dio_adapter.dart';
import 'package:flutterrtest/core/api/http/core/f_error.dart';
import 'package:flutterrtest/core/api/http/core/f_net_adapter.dart';
import 'package:flutterrtest/core/api/http/request/base_request.dart';


class FNet {
  FNet._();

  static FNet? _instance;

  static FNet getInstance() {
    if (_instance == null) {
      _instance = FNet._();
    }
    return _instance!;
  }

  Future fire(BaseRequest request) async {
    BaseNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on FNetError catch(e){
      error = e;
      response = e.data;
      printLog(e.message);
    }catch(e){
      //其他异常
      printLog(e);
    }

    if(response==null){
      printLog(error);
    }
    var result = response?.data;
    print(result);
    var status = response?.errorCode;
    printLog("status = $status");
    switch(status){
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(),data: result);
      default:
        throw FNetError(status ?? -1, result.toString(),data: result);
    }

  }


  Future<BaseNetResponse<T>> send<T>(BaseRequest request) async {
    FNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void printLog(log) {
    print("${log}");
  }
}