import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bots_app/src/blocs/blocs.dart';
import 'package:bots_app/src/services/services.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppService service;
  final AppState initWithState;

  AppBloc({@required this.service, this.initWithState});

  @override
  AppState get initialState =>
      initWithState == null ? AppEmpty() : initWithState;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    //
    // FETCH
    //
    if (event is FetchEvent) {
      yield AppLoading();
      try {
        final list = await service.loadUsers();
        yield AppLoaded(response: list);
      } catch (e) {
        print(e);
        yield AppError();
      }
    }
  }
}
