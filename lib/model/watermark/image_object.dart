class ImageObject {
  final String url;
  final bool canEdit;
  final bool visible;

  ImageObject({required this.url, required this.canEdit, this.visible = true});

  ImageObject copyWith({String? url, bool? canEdit, bool? visible}) {
    return ImageObject(
      url: url ?? this.url,
      canEdit: canEdit ?? this.canEdit,
      visible: visible ?? this.visible,
    );
  }
}
