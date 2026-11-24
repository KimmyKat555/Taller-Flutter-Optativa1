# Taller Flutter - Aplicación Calculadora Multiherramienta

Aplicación móvil desarrollada en **Flutter** como práctica de arquitectura modular, navegación declarativa y manejo de estado local con interfaz completamente en español.

## Funcionalidades

* **Pantalla de Inicio (`HomeScreen`):** Portada con tarjetas de acceso directo a cada herramienta.
* **Calcular Edad (`AgeScreen`):** Selección de fecha de nacimiento mediante selector de calendario (`showDatePicker`) y cálculo exacto de años cumplidos.
* **Calcular IMC (`BmiScreen`):** Formulario con validación de entrada para calcular el Índice de Masa Corporal (en metros o centímetros) y mostrar su clasificación nutricional.
* **Signo Zodiacal (`ZodiacScreen`):** Selección de fecha para determinar el signo zodiacal occidental correspondiente.
* **Menú Lateral (`AppDrawer`):** Navegación rápida y consistente entre todas las vistas de la aplicación.

## Estructura del Proyecto

```text
lib/
├── core/                  # Utilidades o configuraciones base
├── features/
│   ├── screens/           # Pantallas principales (Home, Age, BMI, Zodiac)
│   └── widgets/           # Componentes reutilizables (AppDrawer)
├── routes/                # Configuración de rutas con go_router
└── main.dart              # Punto de entrada de la aplicación

Requisitos Previos
Flutter SDK instalado y configurado en el PATH.

Visual Studio Code o Android Studio con las extensiones de Flutter y Dart.

Un navegador web (como Google Chrome) o un dispositivo Android físico/emulador con depuración USB habilitada.

Cómo Ejecutar y Probar la Aplicación

Clonar el repositorio:
git clone [https://github.com/KimmyKat555/Taller-Flutter-Optativa1.git]
cd Taller-Flutter-Optativa1

Instalar las dependencias:
flutter pub get

Verificar dispositivos disponibles:
flutter devices


Ejecutar la aplicación:
En dispositivo móvil conectado o emulador:
flutter run o ejecución y depuración

En navegador web (Chrome):
flutter run -d chrome
