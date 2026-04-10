import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  static const String _naverMapClientIdFromEnv = String.fromEnvironment(
    'NAVER_MAP_CLIENT_ID',
  );

  @override
  Widget build(BuildContext context) {
    if (_naverMapClientIdFromEnv.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'NAVER_MAP_CLIENT_ID를 설정하면 지도를 볼 수 있어요.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    const seoulCityHall = NLatLng(37.5666, 126.979);

    return NaverMap(
      options: const NaverMapViewOptions(
        initialCameraPosition: NCameraPosition(
          target: seoulCityHall,
          zoom: 14,
        ),
      ),
      onMapReady: (controller) async {
        final marker = NMarker(
          id: 'city_hall',
          position: seoulCityHall,
          caption: const NOverlayCaption(text: '서울시청'),
        );
        await controller.addOverlay(marker);
      },
    );
  }
}
