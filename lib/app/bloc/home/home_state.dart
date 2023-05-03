abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeUpdateFabVisibility extends HomeState {
  bool isVisible;
  HomeUpdateFabVisibility(this.isVisible);
}

class HomeTimelineIndex extends HomeState {
  int selectedTimelineIndex = 0;
  HomeTimelineIndex(this.selectedTimelineIndex);
}
