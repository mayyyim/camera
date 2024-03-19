class TextObject {
  final String text;
  final bool canEdit;
  final bool visible;

  TextObject({required this.text, this.canEdit = true, this.visible = true});

  TextObject copyWith({String? text, bool? canEdit, bool? visible}) {
    return TextObject(
      text: text ?? this.text,
      canEdit: canEdit ?? this.canEdit,
      visible: visible ?? this.visible,
    );
  }
}
