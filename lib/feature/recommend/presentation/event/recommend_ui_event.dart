sealed class RecommendUiEvent {
  const RecommendUiEvent();
}

class Completed extends RecommendUiEvent {
  const Completed();
}

class Failed extends RecommendUiEvent {
  const Failed();
}

class ShowToast extends RecommendUiEvent {
  final String message;
  const ShowToast(this.message);
}
