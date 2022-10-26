import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Widget to manage multiple tabs that scroll
class AnchorTabPanel extends StatefulWidget {
  /// Tabs that will move the scroll to the body widget
  final List<String> tabs;

  /// Widgets that will be inserted in a scrollable column
  final List<Widget> body;

  /// Duration of the animation that selects the tab
  final Duration animationDuration;

  /// Curve of the animation that selects the tab
  final Curve animationCurve;

  /// Controller for the body scroll
  final ScrollController? scrollController;

  /// Height of the tab bar buttons
  final double tabHeight;

  /// Height for the selected tab button
  final double selectedTabHeight;

  final Color colorHeader;
  final Color colorHeaderNotSelected;
  final Map<String, String> conversionMap;

  /// Flag that you can put to false to avoid build each time the selected tab changes
  final bool rebuildBody;

  const AnchorTabPanel(
      {required this.tabs,
        required this.body,
        this.animationDuration = const Duration(milliseconds: 2000),
        this.animationCurve = Curves.ease,
        this.scrollController,
        this.rebuildBody = true,
        this.tabHeight = 40,
        this.selectedTabHeight = 40,
        this.colorHeader = Colors.black,
        this.conversionMap = const {},
        this.colorHeaderNotSelected = Colors.grey,
        Key? key})
      : assert(tabs.length == body.length),
        super(key: key);

  @override
  _AnchorTabPanelState createState() => _AnchorTabPanelState();
}

class _AnchorTabPanelState extends State<AnchorTabPanel> {
  late List<GlobalKey?> keysTabs;

  late List<GlobalKey?> keysBody;

  Widget? bodyWidget;

  List<double>? visibility;

  int selectedTab = 0;

  DateTime ensureVisibleTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    keysTabs = List.generate(widget.tabs.length, (index) => null);

    double screenWidth = MediaQuery.of(context).size.width;

    Widget tabsWidget = createTabsWidget();

    List<Widget> blocks = [];

    // Create the body widgets just once
    // as the set state is just to to control the selected tab
    if (visibility == null ||
        visibility!.length != widget.tabs.length ||
        widget.rebuildBody) {
      visibility = List.generate(widget.tabs.length, (index) => 0);
      keysBody = List.generate(widget.body.length, (index) => null);
      for (int i = 0; i < widget.body.length; i++) {
        String widgetMapKey = widget.tabs[i];
        Widget targetWiget = widget.body[i];
        blocks.add(generateBlock(i, Text(widgetMapKey), screenWidth, targetWiget));
      }

      bodyWidget = Expanded(
        child: SingleChildScrollView(
          controller: widget.scrollController ?? ScrollController(),
          child: Column(
            children: blocks,
          ),
        ),
      );
    }

    Column result = Column(
      children: [
        tabsWidget,
        Divider(color: Colors.grey, height: 1),
        bodyWidget!,
      ],
    );

    return result;
  }

  Widget createTabsWidget() {
    // Create the tabs widget
    List<Widget> tabsItems = [];

    for (int i = 0; i < widget.tabs.length; i++) {
      String widgetMapKey = widget.tabs[i];
      GlobalKey tabKey = GlobalKey(debugLabel: 'tab $i');
      keysTabs[i] = tabKey;

      tabsItems.add(
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Column(
            children: [
              MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  key: tabKey,
                  height: selectedTab == i
                      ? widget.selectedTabHeight
                      : widget.tabHeight,
                  color: Colors.transparent,
                  child: Text(widget.conversionMap.isEmpty  ? widgetMapKey[0].toUpperCase() + widgetMapKey.substring(1).toLowerCase() : widget.conversionMap[widgetMapKey]!,
                      style: TextStyle(
                          color: selectedTab == i ? widget.colorHeader : widget.colorHeaderNotSelected,
                          decoration:  selectedTab == i ? TextDecoration.underline : TextDecoration.none,
                          fontSize:  selectedTab == i ? 17.0 : 14.0, fontWeight: FontWeight.w600,  fontFamily: 'Dance')),
                  onPressed: () {
                    scrollToWidgetWithKey(keysBody[i]!);
                    if (mounted) {
                      setState(() {
                        selectedTab = i;
                      });
                    }
                  }),
            ],
          ),
        ),
      );
    }

    Widget tabsWidget = Container(
      margin: const EdgeInsets.all(5),
      height: widget.selectedTabHeight + 10,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: tabsItems,
      ),
    );

    return tabsWidget;
  }

  /// Generate block for the index
  Widget generateBlock(
      int index, Widget widgetMapKey, double screenWidth, Widget targetWidget) {
    final GlobalKey key = GlobalKey(debugLabel: 'block' + index.toString());
    keysBody[index] = key;

    return VisibilityDetector(
        key: key,
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          visibility![index] = visiblePercentage;
          int currentIndex = lastVisibleIndex(visibility!);

          bool validIndex = currentIndex >= 0;
          bool changedTab = selectedTab != currentIndex;
          bool isVisible = visiblePercentage > 0;
          if (validIndex && changedTab && isVisible) {
            if (mounted) {
              if (DateTime.now()
                  .isBefore(ensureVisibleTime.add(widget.animationDuration))) {
                return;
              }

              setState(
                    () {
                  selectedTab = currentIndex;
                  scrollToWidgetWithKey(keysTabs[currentIndex]!);
                },
              );
            }
          }
        },
        child: targetWidget);
  }

  void scrollToWidgetWithKey(GlobalKey key) {
    if (key.currentContext != null) {
      ensureVisibleTime = DateTime.now();
      Scrollable.ensureVisible(key.currentContext!,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  static int lastVisibleIndex(List<double> visibility) {
    int lastIndex = -1;

    if (visibility[0] > 0) {
      return 0;
    } else if (visibility[visibility.length - 1] > 0) {
      return visibility.length - 1;
    }

    for (int i = 1; i < visibility.length - 1; i++) {
      if (visibility[i] > 0) {
        return i;
      }
    }

    return lastIndex;
  }
}
