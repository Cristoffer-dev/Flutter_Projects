// Importa las bibliotecas necesarias de Flutter y el archivo "data.dart"
import 'package:flutter/material.dart';
import 'package:travel_app/data.dart';

// Función principal que inicia la aplicación
void main() {
  runApp(const MainApp());
}

// Widget principal de la aplicación
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Muestra el título de la aplicación
              Title(),
              // Muestra el carrusel de lugares principales
              MainCarrousel(),
              // Muestra el título de las actividades
              ActivitiesTitle(),
              // Muestra la lista de actividades
              ActivitiesList(),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget que muestra el título principal de la aplicación
class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título "Guatemala"
          Text(
            "Guatemala",
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 36),
          ),
          // Subtítulo "Corazón del mundo maya"
          const Text("Corazón del mundo maya")
        ],
      ),
    );
  }
}

// Widget que muestra el carrusel de lugares principales
class MainCarrousel extends StatelessWidget {
  const MainCarrousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 248,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PlacesCard(
          index: index,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: places.length,
      ),
    );
  }
}

// Widget que muestra un lugar en el carrusel
class PlacesCard extends StatelessWidget {
  final int index;
  const PlacesCard({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 248,
      // Fondo del lugar con degradado
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(places[index]['image'].toString()),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        width: 164,
        height: 124,
        // Degradado oscuro sobre la imagen
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.8),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre del lugar
              Text(
                places[index]['place'].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Descripción del lugar
              Text(
                places[index]['description'].toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget que muestra el título de las actividades
class ActivitiesTitle extends StatelessWidget {
  const ActivitiesTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "Actividades",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

// Widget que muestra la lista de actividades
class ActivitiesList extends StatelessWidget {
  const ActivitiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) => ActivitiesCard(
                index: index,
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: activities.length),
    );
  }
}

// Widget que muestra cada tarjeta de actividad en la lista
class ActivitiesCard extends StatelessWidget {
  final int index;
  const ActivitiesCard({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 86,
      // Fondo de la actividad con degradado
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(activities[index]['image'].toString()),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        width: 320,
        height: 86,
        // Degradado oscuro sobre la imagen
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black, Colors.black.withOpacity(0)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 170,
                // Nombre de la actividad
                child: Text(
                  activities[index]['name'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Duración de la actividad
                    Text(
                      activities[index]['duration'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    // Precio de la actividad
                    Text(
                      activities[index]['price'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
