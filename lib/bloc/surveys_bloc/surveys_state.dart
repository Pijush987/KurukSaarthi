part of 'surveys_bloc.dart';

 class SurveysState extends Equatable {
   final int count ;
   final Map<String,dynamic> staticSurvey;

   final List<SurveyModel> allSurvey;
   final List<dynamic> selectedSurveyDropdownList;
   final List<Map<String,dynamic>>selectedSurveys;
   final bool isLoading;

   final String boothInchargeName;

  final String message;
  final PostApiStatus postApiStatus;
  final PostApiStatus postApiStatusStatic;

  final String selectedRegion;
  final List<String> allRegion;
  final bool isRegionDropdownExpanded;

  final String selectedArea;
  final List<String> allArea;
  final bool isAreaDropdownExpanded;

  final String selectedBoothNumber;
  final List<String> boothNumberItemsList;
  final bool isBoothNumberDropdownExpanded;

  final String selectedVoter;
  final bool isVoterIconVisible;



  SurveysState({
    this.count = 0,
    required this.staticSurvey ,
    required this.allSurvey,
    required this.selectedSurveyDropdownList,
    required this.selectedSurveys,
    this.boothInchargeName = '',
    this.isLoading = false,

    this.message  = '',
    this.postApiStatus = PostApiStatus.initial,
    this.postApiStatusStatic = PostApiStatus.initial,

    this.selectedRegion = '',
    required this.allRegion,
    this.isRegionDropdownExpanded = false,

    this.selectedArea = '',
    required this.allArea,
    this.isAreaDropdownExpanded = false,

    required this.boothNumberItemsList ,
    this.selectedBoothNumber = '',
    this.isBoothNumberDropdownExpanded = false,

    this.selectedVoter = '',
    this.isVoterIconVisible = false,
  });

  SurveysState copyWith ({
     int? count,
     Map<String,dynamic>? staticSurvey,
     List<SurveyModel>? allSurvey,
     List<Map<String,dynamic>>? selectedSurveys,
     List<dynamic>? selectedSurveyDropdownList,

    String? boothInchargeName,
    bool? isLoading,

    String? message,
    PostApiStatus? postApiStatus,
    PostApiStatus? postApiStatusStatic,

    String? selectedRegion,
    List<String>? allRegion,
    bool? isRegionDropdownExpanded,

    List<String>? allArea,
    String? selectedArea,
    bool? isAreaDropdownExpanded,

    String? selectedBoothNumber,
    List<String>? boothNumberItemsList,
    bool? isBoothNumberDropdownExpanded,

    String? selectedVoter,
    List<String>? selectedVoterItemsList,
    bool? isVoterIconVisible,
    List<bool>? isVoterDropdownExpanded
  }){
    return SurveysState(
      count: count ?? this.count,
      staticSurvey: staticSurvey ?? this.staticSurvey,
      selectedSurveyDropdownList: selectedSurveyDropdownList ?? this.selectedSurveyDropdownList,
      selectedSurveys: selectedSurveys ?? this.selectedSurveys,
      allSurvey: allSurvey ?? this.allSurvey,
      boothInchargeName: boothInchargeName ?? this.boothInchargeName,
      isLoading: isLoading ?? this.isLoading,

      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      postApiStatusStatic: postApiStatusStatic ?? this.postApiStatusStatic,

      selectedRegion: selectedRegion ?? this.selectedRegion,
      allRegion: allRegion ?? this.allRegion,
      isRegionDropdownExpanded: isRegionDropdownExpanded ?? this.isRegionDropdownExpanded,

      allArea: allArea ?? this.allArea,
      selectedArea: selectedArea ?? this.selectedArea,
      isAreaDropdownExpanded: isAreaDropdownExpanded ?? this.isAreaDropdownExpanded,

      selectedBoothNumber: selectedBoothNumber ?? this.selectedBoothNumber,
      boothNumberItemsList: boothNumberItemsList ?? this.boothNumberItemsList,
      isBoothNumberDropdownExpanded: isBoothNumberDropdownExpanded ?? this.isBoothNumberDropdownExpanded,

      selectedVoter: selectedVoter ?? this.selectedVoter,
      isVoterIconVisible: isVoterIconVisible ?? this.isVoterIconVisible,
    );
  }

  @override
  List<Object> get props => [
    count,
    staticSurvey,
    selectedSurveys,
    selectedSurveyDropdownList,
    isLoading,
    allSurvey,
    postApiStatusStatic,
    boothInchargeName,
    message,
    postApiStatus,
    selectedRegion,
    allRegion,
    isRegionDropdownExpanded,
    allArea,
    selectedArea,
    isAreaDropdownExpanded,
    selectedBoothNumber,
    boothNumberItemsList,
    isBoothNumberDropdownExpanded,
    selectedVoter,
    isVoterIconVisible,
  ];
}
