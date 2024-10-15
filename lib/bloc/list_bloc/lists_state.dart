
import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:kuruk_saarthi/utils/enums.dart';


 class ListsState extends Equatable {

  final List<VoterModel> allVoters;
  final String message;
  final PostApiStatus postApiStatus;

  const ListsState({ required this.allVoters, this.message = '', this.postApiStatus = PostApiStatus.initial});

  ListsState copyWith ({
    List<VoterModel>? allVoters,
    String? message,
    PostApiStatus? postApiStatus
  }){
    return ListsState(
        allVoters: allVoters ?? this.allVoters,
        message: message ?? this.message,
        postApiStatus: postApiStatus ?? this.postApiStatus
    );
  }

  @override
  List<Object> get props => [allVoters,message,postApiStatus];
}
