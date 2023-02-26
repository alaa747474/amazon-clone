import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_amazon_app/features/product/data/model/product.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<Product>filtered=[];
  seatchFilter(
      {required String typedText, required List<Product> searchedList}) {
    filtered = searchedList
        .where((product) =>
            product.name.toLowerCase().startsWith(typedText) ||
            product.category.toLowerCase().startsWith(typedText))
        .toList();
    emit(SearchLoaded(filtered));
  }
  clearList(){
    filtered.clear();
    emit(SearchLoaded(filtered));
  }
}
