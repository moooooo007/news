class NewsBody {
  NewsBody({
      this.status, 
      this.totalResults, 
      this.articles,
      this.code,
      this .massege
  });

  NewsBody.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json["code"];
    massege = json ["massage"];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  List<Articles>? articles;
  String? code;
  String? massege;
NewsBody copyWith({  String? status,
  num? totalResults,
  List<Articles>? articles,
}) => NewsBody(  status: status ?? this.status,
  totalResults: totalResults ?? this.totalResults,
  articles: articles ?? this.articles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"engadget","name":"Engadget"}
/// author : "Jon Fingas"
/// title : "California sues Amazon for preventing third-party sellers offering cheaper prices elsewhere"
/// description : "Amazon still can't avoid lawsuits over third-party prices. The New York Timesreports California has filed an antitrust lawsuit accusing Amazon of violating both the Cartwright Act and state competition law through its pricing rules. The internet giant is stif…"
/// url : "https://www.engadget.com/california-amazon-antitrust-lawsuit-prices-195937087.html"
/// urlToImage : "https://s.yimg.com/os/creatr-uploaded-images/2021-02/a19cdc50-660a-11eb-af7f-f4c0d78c832d"
/// publishedAt : "2022-09-14T19:59:37Z"
/// content : "Amazon still can't avoid lawsuits over third-party prices. The New York Timesreports California has filed an antitrust lawsuit accusing Amazon of violating both the Cartwright Act and state competiti… [+2292 chars]"

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
Articles copyWith({  Source? source,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => Articles(  source: source ?? this.source,
  author: author ?? this.author,
  title: title ?? this.title,
  description: description ?? this.description,
  url: url ?? this.url,
  urlToImage: urlToImage ?? this.urlToImage,
  publishedAt: publishedAt ?? this.publishedAt,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}

/// id : "engadget"
/// name : "Engadget"

class Source {
  Source({
      this.id, 
      this.name,});

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;
Source copyWith({  String? id,
  String? name,
}) => Source(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}