import 'package:flutter/cupertino.dart';

class PaginationScrollController {
  late ScrollController scrollController;
  late Function loadAction;
  late Function? upState;

  void init({Function? initAction, required Function loadAction, Function? upState}) {
    if (initAction != null) {
      initAction();
    }
    this.loadAction = loadAction;
    this.upState = upState;
    scrollController = ScrollController()..addListener(scrollListener);
  }

  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
  }

  void scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent - 5;
    double minScroll = scrollController.position.minScrollExtent;
    double currentScroll = scrollController.position.pixels;
    if (maxScroll <= currentScroll) {
      loadAction();
    }else if(minScroll == currentScroll){
      if(upState != null){
        upState!();
      }

    }
  }
}