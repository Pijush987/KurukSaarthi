import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_event.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceSearchWidget extends StatefulWidget {
  const VoiceSearchWidget({super.key});

  @override
  State<VoiceSearchWidget> createState() => _VoiceSearchWidgetState();
}

class _VoiceSearchWidgetState extends State<VoiceSearchWidget> {

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Press the button and start speaking";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (val) {
        if(val.isNotEmpty && val == "done"){
          print("RRRRRRRRR $val");
          print("RRRRRRRRR 66 ${_text.toString().trim()}");

          context.read<ListsBloc>().add(FetchLists(searchQuery:_text.replaceAll(' ', ''),refresh: true));

        }
      },
      onError: (val) => print("onError: $val"),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) => setState(() {
          _text = val.recognizedWords;
          print("RRRRRRRRR $_text");
        }),
      );
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: _isListening ? _stopListening : _startListening,
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:_isListening?AppColors.primaryColor: AppColors.textFieldColor,
              border: Border.all(color: AppColors.cardBorderColor)
            ),
            child: SvgImageWidget(svgPath: AssetsPath.voiceIcon,color: _isListening?AppColors.whiteColor:null),
          ),
        ),
        if(_isListening)
        Positioned(
          top: 0,
            right: 0,
            child: Container(height: 16,width: 16,decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8)
        ),))
      ],
    );
  }
}