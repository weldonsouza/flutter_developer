class Post {
  String idPost;
  String codigo;
  int respostas;
  int dataHora;
  String estaLido;
  String autorID;
  String autorNome;
  String autorImageUrl;
  String texto;
  int versao;

  Post({
    this.idPost,
    this.codigo,
    this.respostas,
    this.dataHora,
    this.estaLido,
    this.autorID,
    this.autorNome,
    this.autorImageUrl,
    this.texto,
    this.versao,
  });

  Post.fromJson(Map<String, dynamic> json) {
    idPost = json['idPost'];
    codigo = json['Codigo'];
    respostas = json['Respostas'];
    dataHora = json['DataHora'];
    estaLido = json['EstaLido'];
    autorID = json['AutorID'];
    autorNome = json['AutorNome'];
    autorImageUrl = json['AutorImageUrl'];
    texto = json['Texto'];
    versao = json['Versao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPost'] = this.idPost;
    data['Codigo'] = this.codigo;
    data['Respostas'] = this.respostas;
    data['DataHora'] = this.dataHora;
    data['EstaLido'] = this.estaLido;
    data['AutorID'] = this.autorID;
    data['AutorNome'] = this.autorNome;
    data['AutorImageUrl'] = this.autorImageUrl;
    data['Texto'] = this.texto;
    data['Versao'] = this.versao;
    return data;
  }
}
