abstract class HomeState {}

class HomeInitialState extends HomeState {}

class TabBarChangeState extends HomeState {
  final int currentTab;

  TabBarChangeState(this.currentTab);
}
