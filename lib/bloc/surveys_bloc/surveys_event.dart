part of 'surveys_bloc.dart';

abstract class SurveysEvent extends Equatable {
  const SurveysEvent();

  @override
  List<Object> get props => [];
}

class BoothInchargeNameChange extends SurveysEvent{
  final String boothInchargeName;

  const BoothInchargeNameChange({required this.boothInchargeName});

  @override
  List<Object> get props => [boothInchargeName];
}

class RegionChange extends SurveysEvent{
  final String selectedRegion;

  const RegionChange({required this.selectedRegion});

  @override
  List<Object> get props => [selectedRegion];
}
class RegionListChange extends SurveysEvent{
  final List<String> allRegionList;

  const RegionListChange({required this.allRegionList});

  @override
  List<Object> get props => [allRegionList];
}
class RegionDropdownExpanded extends SurveysEvent{
  final bool isRegionDropdownExpanded;

  const RegionDropdownExpanded({required this.isRegionDropdownExpanded});

  @override
  List<Object> get props => [isRegionDropdownExpanded];
}


class AreaChange extends SurveysEvent{
  final String selectedArea;

  const AreaChange({required this.selectedArea});

  @override
  List<Object> get props => [selectedArea];
}
class AreaListChange extends SurveysEvent{
  final List<String> allAreaList;

  const AreaListChange({required this.allAreaList});

  @override
  List<Object> get props => [allAreaList];
}
class AreaDropdownExpanded extends SurveysEvent{
  final bool isAreaDropdownExpanded;

  const AreaDropdownExpanded({required this.isAreaDropdownExpanded});

  @override
  List<Object> get props => [isAreaDropdownExpanded];
}



class BoothNumberChange extends SurveysEvent{
  final String boothNumberChange;

  const BoothNumberChange({this.boothNumberChange=''});

  @override
  List<Object> get props => [boothNumberChange];
}
class BoothNumberListChange extends SurveysEvent{
  final List<String> allBoothNumberList;

  const BoothNumberListChange({required this.allBoothNumberList});

  @override
  List<Object> get props => [allBoothNumberList];
}
class BoothDropdownExpanded extends SurveysEvent{
  final bool isBoothDropdownExpanded;

  const BoothDropdownExpanded({required this.isBoothDropdownExpanded});

  @override
  List<Object> get props => [isBoothDropdownExpanded];
}



class VoterChange extends SurveysEvent{
  final String voterNumberChange;
  final String voterIDNumber;
  final bool isUpdate;
  final int index;

  const VoterChange(this.voterIDNumber, {required this.voterNumberChange,this.index = 0, this.isUpdate = false});

  @override
  List<Object> get props => [voterNumberChange,index];
}
class VoterAddItemEvent extends SurveysEvent {
  final String voterItem;

  VoterAddItemEvent(this.voterItem);
}
class VoterRemoveItemEvent extends SurveysEvent {
  final String voterItem;

  VoterRemoveItemEvent(this.voterItem);
}
// class VoterDropdownExpanded extends SurveysEvent{
//   final int index;
//   const VoterDropdownExpanded({this.index=0});
//   @override
//   List<Object> get props => [index];
// }

class VoterIconVisible extends SurveysEvent{
  final bool isVoterIconVisible;

  const VoterIconVisible({required this.isVoterIconVisible});

  @override
  List<Object> get props => [isVoterIconVisible];
}
class VoterSelectedItem extends SurveysEvent{
  final String voterItem;
  const VoterSelectedItem(this.voterItem);
  @override
  List<Object> get props => [voterItem];
}


class StatusChange extends SurveysEvent{
  final PostApiStatus postApiStatus;
  const StatusChange({required this.postApiStatus});

  @override
  List<Object> get props => [postApiStatus];
}


class CreateBoothIncharge extends SurveysEvent{}
class SurveyManage extends SurveysEvent{}
class SurveyStatic extends SurveysEvent{}
// class EditBoothIncharge extends SurveysEvent{}

class FetchSurveyList extends SurveysEvent{
  final int limit;
  final bool refresh;

  FetchSurveyList({this.limit = 15, this.refresh = false});

}