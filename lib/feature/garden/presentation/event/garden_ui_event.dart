sealed class GardenUiEvent {
  const GardenUiEvent();
}

class ShowSuccess extends GardenUiEvent {
  final String message;
  const ShowSuccess(this.message);
}

class GroupCreated extends GardenUiEvent {
  const GroupCreated();
}

class GroupsLeft extends GardenUiEvent {
  const GroupsLeft();
}

