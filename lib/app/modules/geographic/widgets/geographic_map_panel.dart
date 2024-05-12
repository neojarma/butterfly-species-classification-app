import 'package:butterfly_classification/app/modules/geographic/controllers/geographic_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class GeographicMapPanel extends StatefulWidget {
  const GeographicMapPanel({
    super.key,
    required this.controller,
  });

  final GeographicController controller;

  @override
  State<GeographicMapPanel> createState() => _GeographicMapPanelState();
}

class _GeographicMapPanelState extends State<GeographicMapPanel> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(-2.5489, 118.0149),
        initialZoom: 4,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.neoj.butterfly_classification',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
        MarkerLayer(
          markers: widget.controller.markers,
        ),
      ],
    );
  }
}
