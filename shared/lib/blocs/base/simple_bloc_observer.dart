import 'package:shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log.trace('TRANSITION: ', messages: [
      '- Current State >>>> ${transition.currentState}',
      '- Event >>>> ${transition.event}',
      '- Next State >>>> ${transition.nextState}'
    ]);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.error('\n ---- ${bloc.toString()}: $error ----');
    super.onError(bloc, error, stackTrace);
  }
}
