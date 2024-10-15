part of 'region_select_bloc.dart';

class RegionSelectState extends Equatable {
  final String selectedRegion;
  final List<String> selectedItemsList;
  final bool isIconVisible;
  final bool isDropdownExpanded;
  final String message;
  final PostApiStatus postApiStatus;
   RegionSelectState({required this.selectedItemsList , this.selectedRegion = '', this.message = '', this.postApiStatus = PostApiStatus.initial, this.isDropdownExpanded = false, this.isIconVisible = false});

  RegionSelectState copyWith ({
    String? selectedRegion,
    String? message,
    PostApiStatus? postApiStatus,
    bool? isDropdownExpanded,
    bool? isIconVisible,
    List<String>? selectedItemsList
  }){
    return RegionSelectState(
        selectedRegion: selectedRegion ?? this.selectedRegion,
        message: message ?? this.message,
        postApiStatus: postApiStatus ?? this.postApiStatus,
        isDropdownExpanded: isDropdownExpanded ?? this.isDropdownExpanded,
        isIconVisible: isIconVisible ?? this.isIconVisible,
        selectedItemsList: selectedItemsList ?? this.selectedItemsList
    );
  }

  @override
  List<Object> get props => [selectedRegion,message,postApiStatus,isDropdownExpanded,isIconVisible,selectedItemsList??[]];
}
