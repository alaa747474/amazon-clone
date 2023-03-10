part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoaded extends SearchState {
  final List<Product>filtered;

  const SearchLoaded(this.filtered);
    @override
  List<Object> get props => [filtered];
}
