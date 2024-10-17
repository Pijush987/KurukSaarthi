
import 'package:equatable/equatable.dart';
import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';

abstract class ListsEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class FetchLists extends ListsEvent {
  final int limit;
  final String searchQuery;
  final String voterIdFilter;
  final String age;
  final bool refresh;
  final String region;
  final String booth;

  FetchLists({this.limit = 15, this.searchQuery = '', this.voterIdFilter = '', this.age = '',this.region = '',this.booth = '',this.refresh = false});

}

class RegionChange extends ListsEvent{
  final String selectedRegion;

  RegionChange({this.selectedRegion = ''});

  @override
  List<Object> get props => [selectedRegion];
}

class BoothChange extends ListsEvent{
  final String selectedBooth;

  BoothChange({this.selectedBooth = ''});

  @override
  List<Object> get props => [selectedBooth];
}

class AgeChange extends ListsEvent{
  final String selectedAge;

  AgeChange({this.selectedAge = ''});

  @override
  List<Object> get props => [selectedAge];
}
