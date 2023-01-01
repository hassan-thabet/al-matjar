abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class UserDataLoading extends ExploreState {}

class UserDataLoaded extends ExploreState {
  final String userName;

  UserDataLoaded({required this.userName});
}

class IndicatorIndexChanged extends ExploreState {}

class OfferDataLoading extends ExploreState {}

class OffersDataLoaded extends ExploreState {}
