sealed class RecommendUiEvent {
  const RecommendUiEvent();
}

class ShowSuccess extends RecommendUiEvent {
  final String message;
  const ShowSuccess(this.message);
}

class GroupCreated extends RecommendUiEvent {
  const GroupCreated();
}

class GroupsLeft extends RecommendUiEvent {
  const GroupsLeft();
}

