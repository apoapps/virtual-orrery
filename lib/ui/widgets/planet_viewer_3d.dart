import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PlanetViewer3D extends StatelessWidget {
  final String modelPath;
  final double initialRotationSpeed;
  final bool enableZoom;

  const PlanetViewer3D({
    super.key,
    required this.modelPath,
    this.initialRotationSpeed = 0.02, // Velocidad de rotación inicial
    this.enableZoom = false, // Zoom deshabilitado por defecto
  });

  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      src: modelPath,
      alt: "A 3D model of a planet",
      autoRotate: true,
      autoRotateDelay: 1000,
      cameraControls: false,
    );
  }
}
