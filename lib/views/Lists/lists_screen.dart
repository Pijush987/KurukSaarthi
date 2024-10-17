import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/home_bloc/home_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_event.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_state.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/empty_list_widget.dart';
import 'package:kuruk_saarthi/configs/components/person_details_widget.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Lists/widget/Age_dropdown.dart';
import 'package:kuruk_saarthi/views/Lists/widget/booth_dropdown_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/image_capture_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/language_selection_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/language_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/search_textfromfield_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/select_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/share_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/tahsil_dropdown_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/voice_search_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/voter_list_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<ListsScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late AnimationController languageController;
  late AnimationController ageController;
  late AnimationController shareController;
  late AnimationController boothController;
  late AnimationController tahsilController;
  late RangeValues currentRangeValues ;
  final _searchFocusNode = FocusNode();
  ScrollController _scrollController = ScrollController();
  // ListsBloc _listsBloc = ListsBloc();

  @override
  void initState() {
    super.initState();
    currentRangeValues = const RangeValues(18, 80);

    ageController = BottomSheet.createAnimationController(this);
    ageController.duration = const Duration(milliseconds: 500);
    ageController.reverseDuration = const Duration(milliseconds: 500);
    ageController.drive(CurveTween(curve: Curves.easeIn));

    languageController = BottomSheet.createAnimationController(this);
    languageController.duration = const Duration(milliseconds: 500);
    languageController.reverseDuration = const Duration(milliseconds: 500);
    languageController.drive(CurveTween(curve: Curves.easeIn));

    boothController = BottomSheet.createAnimationController(this);
    boothController.duration = const Duration(milliseconds: 500);
    boothController.reverseDuration = const Duration(milliseconds: 500);
    boothController.drive(CurveTween(curve: Curves.easeIn));

    tahsilController = BottomSheet.createAnimationController(this);
    tahsilController.duration = const Duration(milliseconds: 500);
    tahsilController.reverseDuration = const Duration(milliseconds: 500);
    tahsilController.drive(CurveTween(curve: Curves.easeIn));

    shareController = BottomSheet.createAnimationController(this);
    shareController.duration = const Duration(milliseconds: 500);
    shareController.reverseDuration = const Duration(milliseconds: 500);
    shareController.drive(CurveTween(curve: Curves.easeIn));


    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );


    // _listsBloc.add(FetchLists());
    context.read<ListsBloc>().add(BoothChange(selectedBooth: ''));
    context.read<ListsBloc>().add(RegionChange(selectedRegion: ''));
    context.read<ListsBloc>().add(AgeChange(selectedAge: ''));
    context.read<ListsBloc>().add(FetchLists());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if(context.read<ListsBloc>().state.selectedAge.isNotEmpty){
          context.read<ListsBloc>().add(FetchLists(age: context.read<ListsBloc>().state.selectedAge));
        }
        else if(context.read<ListsBloc>().state.selectedRegion.isNotEmpty){
          context.read<ListsBloc>().add(FetchLists(region: context.read<ListsBloc>().state.selectedRegion));
        }
        else if(context.read<ListsBloc>().state.selectedBooth.isNotEmpty){
          context.read<ListsBloc>().add(FetchLists(booth:context.read<ListsBloc>().state.selectedBooth));
        }
        else{
          context.read<ListsBloc>().add(FetchLists());
        }
      }
    });
  }

  Future<void> _onRefresh()async{
    context.read<ListsBloc>().add(FetchLists(refresh: true));
    // _listsBloc.add(FetchLists(refresh: true));
    context.read<ListsBloc>().add(BoothChange(selectedBooth: ''));
    context.read<ListsBloc>().add(RegionChange(selectedRegion: ''));
    context.read<ListsBloc>().add(AgeChange(selectedAge: ''));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchFocusNode.dispose();
    _animationController.dispose();
    ageController.dispose();
    tahsilController.dispose();
    boothController.dispose();
    shareController.dispose();
    languageController.dispose();
    _scrollController.dispose();
    // _listsBloc.close();

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            body: InkWell(
              hoverColor: AppColors.transparent,
              splashColor: AppColors.transparent,
              highlightColor:AppColors.transparent,
              onTap:(){
                if(_searchFocusNode.hasFocus){
                  FocusScope.of(context).requestFocus(new FocusNode());
                }
              },
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constant.sideHorizontalPadding),
                  child: Container(
                    color: Colors.transparent,
                    height: context.mediaQueryHeight,
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(children: [
                            Expanded(child: Row(
                              children: [
                                SvgImageWidget(svgPath: AssetsPath.locationIcon,color: null),
                                const SizedBox(width: 12),
                                Text(AppLocalizations.of(context)!.bhandaraVidhanSabha,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700,fontFamily: ''),),
                              ],
                            )),
                            LanguageWidget(
                              onTap: (){
                                openLanguageBottomSheet();
                              },
                            )
                          ],),
                        ),
                        const SizedBox(height: 12),
                        Row(children: [
                          Expanded(
                            child:  SearchTextFromFieldWidget(
                              focusNode: _searchFocusNode,
                              onChange: (value) {
                                print("value  $value");
                                // _listsBloc.add(FetchLists(searchQuery: value));
                              },
                              onSubmit: (value) {
                                print("value  $value");
                                context.read<ListsBloc>().add(FetchLists(searchQuery: value,refresh: true));
                                // _listsBloc.add(FetchLists(searchQuery: value,refresh: true));
                              },
                            ),
                          ),

                          const SizedBox(width: 12),
                          const VoiceSearchWidget(),
                          const SizedBox(width: 12),
                          const ImageCaptureWidget(),

                        ],),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(child: BlocBuilder<ListsBloc, ListsState>(
                              builder: (context, state) {
                                return SelectWidget(
                                  text:state.selectedRegion.isEmpty?AppLocalizations.of(context)!.selectRegion:state.selectedRegion,
                                  onTap: (){
                                    openTahsilBottomSheet();
                                  },
                                );
                              },
                            )),
                            const SizedBox(width: 12),
                            Expanded(child: BlocBuilder<ListsBloc, ListsState>(
                              builder: (context, state) {
                                return SelectWidget(
                                  text:state.selectedBooth.isEmpty?AppLocalizations.of(context)!.booth:state.selectedBooth,
                                  onTap: (){
                                    openBoothBottomSheet();
                                  },
                                );
                              },
                            )),
                            const SizedBox(width: 12),
                            Expanded(child: BlocBuilder<ListsBloc, ListsState>(
                              builder: (context, state) {
                                return SelectWidget(
                                  text:state.selectedAge.isEmpty?AppLocalizations.of(context)!.age:state.selectedAge,
                                  onTap: (){
                                    openAgeBottomSheet();
                                  },
                                );
                              },
                            )),
                          ],
                        ),
                        const SizedBox(height: 12),
                        BlocBuilder<ListsBloc, ListsState>(
                            // buildWhen: (current, previous) {
                            //   debugPrint("fetch data &&& 1 ${current.postApiStatus}");
                            //   debugPrint("fetch data &&& 2 ${previous.postApiStatus}");
                            //   return current.postApiStatus != previous.postApiStatus;
                            // },
                            builder: (context, state) {
                              debugPrint("fetch data &&& 3${state.postApiStatus}");
                              if (state.postApiStatus == PostApiStatus.loading) {
                                return   Expanded(
                                    child: Center(child: CircularProgressIndicator())
                                );
                              }
                              else if (state.postApiStatus == PostApiStatus.success) {
                                return state.allVoters.isEmpty?
                                Expanded(
                                  child: Center(child: EmptyListWidget(isRefresh: true,onTab: _onRefresh)),
                                ) :Expanded(
                                    child:  SingleChildScrollView(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      controller: _scrollController,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const SizedBox(height: 18),
                                          const SizedBox(height: 16),
                                          const VoterListBar(),
                                          const SizedBox(height: 16),
                                          ListView.separated(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemBuilder: (context,index){
                                                final voters = state.allVoters[index];
                                                return PersonDetailsWidget(booth: voters.boothNumber, voterId: voters.voterIDNumber, name: voters.name,dob: voters.state,age: voters.age.toString(),sex: voters.gender,onShare: (){
                                                  showModalBottomSheet(
                                                      context: context,
                                                      backgroundColor: Colors.transparent,
                                                      transitionAnimationController: shareController,
                                                      isScrollControlled: true,
                                                      builder: (BuildContext context) {
                                                        return ShareWidget(name: voters.name, voterId:voters.voterIDNumber, sex: voters.gender, age: voters.age.toString(), imagePath: '', booth: voters.boothNumber, boothAddress:voters.boothAddress,);

                                                      }
                                                  );
                                                },);
                                              }, separatorBuilder: (context,index){
                                            return SizedBox(height: 12);
                                          }, itemCount: state.allVoters.length),
                                          const SizedBox(height: 150),
                                        ],),
                                    )
                                );
                              }
                              else if (state.postApiStatus == PostApiStatus.error) {
                                return Center(child: Text(state.message));
                              }
                              else {
                                return Expanded(
                                  child: Center(child: EmptyListWidget()),
                                );
                              }
                            }),

                      ],),
                    ),
                  ),
                ),
              ),
            )
        );
      },
    );
  }
  openAgeBottomSheet(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: ageController,
        builder: (BuildContext context) {
          return AgeDropdown(onTap: () {  }, currentRangeValues: currentRangeValues,);

        }
    );
  }
  // openShareSheet(){
  //   return
  // }
  openLanguageBottomSheet(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: languageController,
        builder: (BuildContext context) {
          return LanguageSelectionWidget(onTap: () {  },);

        }
    );
  }
  openBoothBottomSheet(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: boothController,
        builder: (BuildContext context) {
          return BoothDropdownWidget(onTap: () {  },);

        }
    );
  }
  openTahsilBottomSheet(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: tahsilController,
        builder: (BuildContext context) {
          return TahsilDropdownWidget(onTap: () {  },);

        }
    );
  }

}