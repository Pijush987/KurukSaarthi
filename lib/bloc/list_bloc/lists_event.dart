
import 'package:equatable/equatable.dart';
import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';

abstract class ListsEvent extends Equatable {

  @override
  List<Object> get props => [];
}

// class UpdateVotersList extends ListsEvent{
//   final List<VoterModel> allVoters;
//   UpdateVotersList(this.allVoters);
// }

class FetchLists extends ListsEvent {
  final int limit;
  final String searchQuery;
  final String voterIdFilter;
  final String age;
  final bool refresh;

  FetchLists({this.limit = 15, this.searchQuery = '', this.voterIdFilter = '', this.age = '',this.refresh = false});

}
