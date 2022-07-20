// ignore_for_file: public_member_api_docs, sort_constructors_first

class KeyboardModel {
  String number;
  String letter;
  bool isShowLetter;
  bool isShowIconButton;
  bool isActive;
  KeyboardModel({
    required this.number,
    required this.letter,
    required this.isShowLetter,
    required this.isShowIconButton,
    required this.isActive,
  });

  
}


List<KeyboardModel> models = [
    KeyboardModel(
        number: "1",
        letter: "",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "2",
        letter: "ABC",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "3",
        letter: "DEF",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "4",
        letter: "GHI",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "5",
        letter: "JKL",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "6",
        letter: "MNO",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "7",
        letter: "PQRS",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "8",
        letter: "TUV",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "9",
        letter: "WXYZ",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "",
        letter: "",
        isShowLetter: false,
        isShowIconButton: false,
        isActive: false),
    KeyboardModel(
        number: "0",
        letter: "",
        isShowLetter: false,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "",
        letter: "",
        isShowLetter: false,
        isShowIconButton: true,
        isActive: true),
  ];