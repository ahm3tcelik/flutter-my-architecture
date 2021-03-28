import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/index.dart' as CoreWidgets;
import 'test_controller.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test View Page"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildViewState,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          controller.getData();
                        },
                        child: Text('Get Data'),
                      )),
                  SizedBox(width: 5),
                  Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          controller.getError();
                        },
                        color: Get.theme!.errorColor,
                        child: Text('Get Error'),
                      ))
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(padding: EdgeInsets.all(8), child: buildConnectionState),
          )
        ],
      ),
    );
  }

  Widget get _buildViewState {
    return Obx(() {
      return CoreWidgets.Folded(
        viewState: controller.viewState.value,
        initial: SizedBox(),
        busy: Center(child: CircularProgressIndicator()),
        error: _buildErrorWithMsg,
        data: _buildSuccessData,
      );
    });
  }

  Widget get buildConnectionState {
    return Obx(() {
      switch (controller.connectivityResult.value) {
        case ConnectivityResult.none:
          return _buildNoneConnection;
        case ConnectivityResult.wifi:
          return _buildWifiConnection;
        case ConnectivityResult.mobile:
          return _buildMobileConnection;
        default:
          return SizedBox();
      }
    });
  }

  Widget get _buildNoneConnection {
    return Chip(
      backgroundColor: Get.theme!.colorScheme.primaryVariant,
      elevation: 4,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("None"),
          SizedBox(width: 8),
          Icon(Icons.warning_amber_outlined, color: Get.theme!.errorColor)
        ],
      ),
      shadowColor: Get.theme!.errorColor,
      padding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }


  Widget get _buildWifiConnection {
    return Chip(
      backgroundColor: Get.theme!.colorScheme.primaryVariant,
      elevation: 4,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Wifi"),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Get.theme!.colorScheme.primary),
        ],
      ),
      shadowColor: Get.theme!.colorScheme.primary,
      padding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget get _buildMobileConnection {
    return Chip(
      backgroundColor: Get.theme!.colorScheme.primaryVariant,
      elevation: 4,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Cell'),
          SizedBox(width: 8),
          Icon(Icons.signal_cellular_alt, color: Get.theme!.colorScheme.secondary),
        ],
      ),
      shadowColor: Get.theme!.colorScheme.secondary,
      padding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget get _buildSuccessData {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.done, color: Get.context!.theme.accentColor, size: 48),
        Text('Data recieved successfully')
      ],
    );
  }

  Widget get _buildErrorWithMsg {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, color: Get.context!.theme.errorColor, size: 48),
        Text('An error ocurred')
      ],
    );
  }
}
