class ShortCutGlobal {
  static final ShortCutGlobal _instance = ShortCutGlobal._();

  ShortCutGlobal._();

  factory ShortCutGlobal() {
    return _instance;
  }

  final List<Map<String, String>> _shortCuts = [
    {
      'title':'Soporte',
      'image':'Soporte01.png',
    },
    {
      'title':'Diagnostico inteligente',
      'image':'Soporte02.png',
    },
    {
      'title':'Preguntas frecuentes',
      'image':'Soporte03.png',
    },
    {
      'title':'Hable con una persona',
      'image':'Soporte04.png',
    },
    {
      'title':'Portal de soporte',
      'image':'Soporte05.png',
    },
    {
      'title':'Crear rutina',
      'image':'Soporte06.png',
    },
    {
      'title':'Hacer recorrido',
      'image':'Soporte07.png',
    },
  ];

  List<Map<String, String>> get shortCuts => _shortCuts;
}
