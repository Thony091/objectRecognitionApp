
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  // Variables para la cámara y el selector de imágenes
  late CameraController _controller;
  late ImagePicker _imagePicker;
  late List<CameraDescription> _cameras;
  String _recognitionResult = '';
  late Future<void> _initializeCameraFuture;
  

  // Cargar el modelo de TensorFlow Lite
  Future<void> _loadModel() async {
    final options = InterpreterOptions();
    final interpreter = await Interpreter.fromAsset('your_model.tflite', options: options);
    // ... (código para procesar y aplicar el modelo)
  }

// Inicializar la cámara
Future<void> _initializeCamera() async {
  _cameras = await availableCameras();
  _controller = CameraController(_cameras[0], ResolutionPreset.high);
  await _controller.initialize();
}

  // Capturar imagen desde la cámara
  void _captureImage() async {
    final image = await _controller.takePicture();
    // Procesar y aplicar el modelo a la imagen capturada
    // Actualizar el estado con el resultado
  }

  // Seleccionar imagen desde la galería
  void _selectImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Procesar y aplicar el modelo a la imagen seleccionada
      // Actualizar el estado con el resultado
    }
  }

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _initializeCameraFuture = _initializeCamera();
    _loadModel();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
  children: <Widget>[
    Expanded(
      child: FutureBuilder(
        future: _initializeCameraFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: _controller == null || !_controller.value.isInitialized
                  ? Center(child: CircularProgressIndicator())
                  : AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _captureImage,
          child: Text('Capturar'),
        ),
        ElevatedButton(
          onPressed: _selectImage,
          child: Text('Seleccionar'),
        ),
      ],
    ),
    // Otros widgets
  ],
),
    );
  }
}