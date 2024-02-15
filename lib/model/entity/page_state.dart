sealed class PageState {
  const PageState();
  const factory PageState.dialog(String? title, String? description) =
      PageStateDialog;
  const factory PageState.snackBar(String text) = PageStateSnackBar;
  const factory PageState.loading() = PageStateLoading;
  const factory PageState.none() = PageStateNone;
}

class PageStateDialog extends PageState {
  const PageStateDialog(this.title, this.description);
  final String? title;
  final String? description;
}

class PageStateSnackBar extends PageState {
  const PageStateSnackBar(this.text);
  final String text;
}

class PageStateLoading extends PageState {
  const PageStateLoading();
}

class PageStateNone extends PageState {
  const PageStateNone();
}
