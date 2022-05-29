class chatClass {
  final String name;
  final String message;
  final String time;
  final int newMessage;

  chatClass(this.name, this.message, this.time, this.newMessage);
}

List<chatClass> temporalData = [
  new chatClass("Rodrigo Lara", "Mi hermano!, ¿Un partido hoy?", "15:30", 2),
  new chatClass("Bill Gates", "Windows 11 esta disponible!", "5:00", 0),
  new chatClass("Rachel", "Estoy bien, gracias", "10:30", 0),
  new chatClass("Barry Allen", "Soy el hombre mas rapido", "12:30", 0),
];
