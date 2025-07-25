import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resturant_app/features/home/search/presentation/cubits/search/search_cubit.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Speachtoaudio extends StatefulWidget {
  const Speachtoaudio({super.key});

  @override
  State<Speachtoaudio> createState() => _SpeachtoaudioState();
}

class _SpeachtoaudioState extends State<Speachtoaudio> {
  @override
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'اضغط للبدء بالتحدث';
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _listen,
      icon: Icon(
        _isListening ? Icons.mic : Icons.mic_none,
        color: _isListening ? Colors.blue : Colors.grey,
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      Permission permission = Permission.microphone;

      bool available = await _speech.initialize(
        onStatus: (val) => log('الحالة: $val'),
        onError: (val) => log('الخطأ: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            _text = val.recognizedWords;
            BlocProvider.of<SearchCubit>(context).searchByName(meal: _text);
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
