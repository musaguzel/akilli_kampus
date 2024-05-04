import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../view/main/viewModel/main_page_view_model.dart';
import '../navigation/navigation_service.dart';

class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> dependItems = [

    Provider.value(value: NavigationService.instance),
    ChangeNotifierProvider(
      create: (_) => MainPageViewModel(),
    ),
  ];

}
