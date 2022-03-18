abstract class HomeStates {} // Parent State

class HomeInitialState extends HomeStates {}
class ChangeBottomNavBarIndexState extends HomeStates {}


class HomeLoadingModelData extends HomeStates {}
class HomeSuccessModelData extends HomeStates {}
class HomeFailModelData extends HomeStates {}


class CategoriesLoadingModelData extends HomeStates {}
class CategoriesSuccessModelData extends HomeStates {}
class CategoriesFailModelData extends HomeStates{}


class FavoritesLoadingModelData extends HomeStates {}
class FavoritesSuccessModelData extends HomeStates {}
class FavoritesFailModelData extends HomeStates {}



class GetFavoritesLoadingModelData extends HomeStates {}
class GetFavoritesSuccessModelData extends HomeStates {}
class GetFavoritesFailModelData extends HomeStates {}



class GetProfileLoadingModelData extends HomeStates {}
class GetProfileSuccessModelData extends HomeStates {}
class GetProfileFailModelData extends HomeStates {}

class changeProfileTextState extends HomeStates {}
