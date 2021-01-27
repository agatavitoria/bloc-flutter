import 'package:bloc/bloc.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'news_events.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  final client = HnpwaClient();

  @override
  NewsState get initialState => NewsState.initialState(); 

  NewsBloc() {
    add(LoadEvent());
  }

  @override
  Stream<NewsState> mapEventToState(NewsEvents event) async* {
    if (event is LoadEvent) {
      print('carregando');
      yield this.state.copyWith(loading: true);
      final feed = await client.news();
      yield this.state.copyWith(loading: false, news: feed.items);
    } else if (event is DeleteEvent) {
      final newList = List<FeedItem>.from(this.state.news);
      newList.removeAt(event.position);
      yield this.state.copyWith(news: newList);
    }
  }
}