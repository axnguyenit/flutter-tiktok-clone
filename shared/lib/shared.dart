library core;

import 'log/log.dart';
import 'log/log_impl.dart';

export 'animated/animated.dart';
export 'blocs/blocs.dart';
export 'extensions/extensions.dart';
export 'models/models.dart';
export 'services/services.dart';
export 'widgets/widgets.dart';

Log get log => LogImpl();
