import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../color/color.dart';

class EmptyListWidget extends StatelessWidget {

  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.doc_text_search,
                color: AppColors.primaryColor,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(AppLocalizations.of(context)!.noResultFound, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}