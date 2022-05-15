class Dica {

  String description;
  String message;
  String date;
  String publisher;

  Dica(this.description, this.message, this.date, this.publisher);
  
  factory Dica.fromJson(json) {
    return Dica(
       json['descricao'],
       json['mensagem'],
       json['dataCriacao'],
       json['especialista']['usuario']['nome'],
    );
  }
}