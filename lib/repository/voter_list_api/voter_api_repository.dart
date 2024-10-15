import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';

abstract class VoterListApiRepository {
  Future<VoterListModel> voterListApi ({dynamic queryParams, dynamic header});
}