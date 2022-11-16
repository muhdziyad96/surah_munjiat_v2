import 'package:flutter/material.dart';
import 'package:flutter_speech/flutter_speech.dart';

const languages = [
  Language('Arabic', 'ar_AR'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  late SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;

  //String _currentLocale = 'en_US';
  Language selectedLang = const Language('Arabic', 'ar_AR');

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('ar_AR').then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih'),
        actions: [
          PopupMenuButton<Language>(
            onSelected: _selectLangHandler,
            itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.grey.shade200,
                        child: Text(transcription))),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.grey.shade200,
                )),
                _buildButton(
                  onPressed: _speechRecognitionAvailable && !_isListening
                      ? () => start()
                      : null,
                  label: _isListening ? 'Listening...' : 'Start Zikr',
                ),
                // _buildButton(
                //   onPressed: _isListening ? () => cancel() : null,
                //   label: 'Cancel',
                // ),
                _buildButton(
                  onPressed: _isListening ? () => stop() : null,
                  label: 'Stop',
                ),
                _buildButton(
                  label: 'Subhanallah : $count1',
                ),
                _buildButton(
                  label: 'Alhamdulillah : $count2',
                ),
                _buildButton(
                  label: 'Allahuakbar : $count3',
                ),
              ],
            ),
          )),
    );
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => CheckedPopupMenuItem<Language>(
            value: l,
            checked: selectedLang == l,
            child: Text(l.name),
          ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  Widget _buildButton({required String label, VoidCallback? onPressed}) =>
      Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ));
  Widget _countButton({required String label, VoidCallback? onPressed}) =>
      Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(color: Colors.green),
            ),
          ));

  void start() => _speech.activate(selectedLang.code).then((_) {
        return _speech.listen().then((result) {
          print('_MyAppState.start => result $result');
          setState(() {
            _isListening = result;
            print(result);
          });
        });
      });

  // void cancel() =>
  //     _speech.cancel().then((_) => setState(() => _isListening = false));

  void stop() => _speech.stop().then((_) {
        setState(() {
          _isListening = false;
          count1 = 0;
          count2 = 0;
          count3 = 0;
        });
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    setState(
        () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    print('_MyAppState.onRecognitionResult... $text');
    setState(() => transcription = text);
    final List s = text.split('سبحان الله');
    final List al = text.split('الحمد لله');
    final List aa = text.split('الله اكبر');
    setState(() => count1 = s.length - 1);
    setState(() => count2 = al.length - 1);
    setState(() => count3 = aa.length - 1);
  }

  void onRecognitionComplete(String text) {
    // print('_MyAppState.onRecognitionComplete... $text');
    setState(() => _isListening = false);
  }

  void errorHandler() => activateSpeechRecognizer();
}
