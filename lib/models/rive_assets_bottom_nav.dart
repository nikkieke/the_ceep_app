import 'package:rive/rive.dart';

class RiveAssets {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAssets(
      { required this.src,
        required this.artboard,
        required this.stateMachineName,
        required this.title,
        this.input});

  set setInput(SMIBool status){
    input = status;
  }

}

List<RiveAssets> bottomNav = [
  RiveAssets(src: "assets/RiveAssets/icons.riv",
    artboard: "HOME", stateMachineName: "HOME_interactivity",
    title: 'Home',),
  RiveAssets(src: "assets/RiveAssets/icons.riv",
    artboard: "CHAT", stateMachineName: "CHAT_Interactivity",
    title: 'Transactions',),
  RiveAssets(src: "assets/RiveAssets/icons.riv",
    artboard: "BELL", stateMachineName: "BELL_Interactivity",
    title: 'Sales',),
  RiveAssets(src: "assets/RiveAssets/icons.riv",
    artboard: "REFRESH/RELOAD", stateMachineName: "RELOAD_Interactivity",
    title: 'Updates',),
];