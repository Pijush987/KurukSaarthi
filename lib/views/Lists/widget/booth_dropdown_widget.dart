import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/home_bloc/home_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_event.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_state.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoothDropdownWidget extends StatefulWidget {
  final VoidCallback onTap;
  const BoothDropdownWidget({super.key, required this.onTap});

  @override
  State<BoothDropdownWidget> createState() => _BoothDropdownWidgetState();
}

class _BoothDropdownWidgetState extends State<BoothDropdownWidget> {

  List<String> items = [];
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBooth();
  }

  Future _getBooth() async{
    items = await databaseHelper.allBooth();
    if(mounted){
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      onTap: widget.onTap,
      child: Container(
        height: 280,
        width: context.mediaQueryWidth,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.fieldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(AppLocalizations.of(context)!.selectBoothNumbere,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w700),),
              ),
              BlocBuilder<ListsBloc, ListsState>(
                  builder: (context, state) {
                  return ListView.separated(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_,index){
                    return InkWell(
                      onTap: (){
          
                        context.read<ListsBloc>().add(BoothChange(selectedBooth: ''));
                        context.read<ListsBloc>().add(RegionChange(selectedRegion: ''));
                        context.read<ListsBloc>().add(AgeChange(selectedAge: ''));
                        context.read<ListsBloc>().add(BoothChange(selectedBooth: items[index]));
                        context.read<ListsBloc>().add(FetchLists(booth: items[index],refresh: true));
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(state.selectedBooth == items[index]?Icons.circle_rounded:Icons.circle_outlined,color: AppColors.primaryColor,size: 16,),
                          const SizedBox(width: 14),
                          Text(items[index],style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    );
                  }, separatorBuilder: (_,index){
                    return SizedBox(height: 10);
                  }, itemCount: items.length);
                }
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }
}