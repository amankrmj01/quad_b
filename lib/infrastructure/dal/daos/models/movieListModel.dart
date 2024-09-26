import 'dart:convert';

List<MovieListModel> fromJson(String str) => List<MovieListModel>.from(
      json.decode(str).map(
            (x) => MovieListModel.fromJson(x),
          ),
    );

String toJson(List<MovieListModel> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class MovieListModel {
  final double score;
  final ShowModel show;

  MovieListModel({
    required this.score,
    required this.show,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) => MovieListModel(
        score: json["score"]?.toDouble() ?? 0.0,
        show: ShowModel.fromJson(json["show"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": show.toJson(),
      };
}

class ShowModel {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int runtime;
  final int averageRuntime;
  final DateTime premiered;
  final dynamic ended;
  final String officialSite;
  final Schedule schedule;
  final Rating rating;
  final int weight;
  final Network network;
  final dynamic webChannel;
  final dynamic dvdCountry;
  final Externals externals;
  final Image image;
  final String summary;
  final int updated;
  final Links links;

  ShowModel({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) => ShowModel(
        id: json["id"] ?? 0,
        url: json["url"] ?? '',
        name: json["name"] ?? '',
        type: json["type"] ?? '',
        language: json["language"] ?? '',
        genres: List<String>.from(json["genres"]?.map((x) => x) ?? []),
        status: json["status"] ?? '',
        runtime: json["runtime"] ?? 0,
        averageRuntime: json["averageRuntime"] ?? 0,
        premiered: DateTime.parse(json["premiered"] ?? '1970-01-01'),
        ended: json["ended"],
        officialSite: json["officialSite"] ?? '',
        schedule: Schedule.fromJson(json["schedule"] ?? {}),
        rating: Rating.fromJson(json["rating"] ?? {}),
        weight: json["weight"] ?? 0,
        network: Network.fromJson(json["network"] ?? {}),
        webChannel: json["webChannel"],
        dvdCountry: json["dvdCountry"],
        externals: Externals.fromJson(json["externals"] ?? {}),
        image: Image.fromJson(json["image"] ?? {}),
        summary: json["summary"] ?? '',
        updated: json["updated"] ?? 0,
        links: Links.fromJson(json["_links"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered":
            "${premiered.year.toString().padLeft(4, '0')}-${premiered.month.toString().padLeft(2, '0')}-${premiered.day.toString().padLeft(2, '0')}",
        "ended": ended,
        "officialSite": officialSite,
        "schedule": schedule.toJson(),
        "rating": rating.toJson(),
        "weight": weight,
        "network": network.toJson(),
        "webChannel": webChannel,
        "dvdCountry": dvdCountry,
        "externals": externals.toJson(),
        "image": image.toJson(),
        "summary": summary,
        "updated": updated,
        "_links": links.toJson(),
      };
}

class Externals {
  final dynamic tvrage;
  final int thetvdb;
  final String imdb;

  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"] ?? 0,
        imdb: json["imdb"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

class Image {
  final String medium;
  final String original;

  Image({
    required this.medium,
    required this.original,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"] ?? '',
        original: json["original"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  final Self self;
  final Previousepisode previousepisode;

  Links({
    required this.self,
    required this.previousepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Self.fromJson(json["self"] ?? {}),
        previousepisode:
            Previousepisode.fromJson(json["previousepisode"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "previousepisode": previousepisode.toJson(),
      };
}

class Previousepisode {
  final String href;
  final String name;

  Previousepisode({
    required this.href,
    required this.name,
  });

  factory Previousepisode.fromJson(Map<String, dynamic> json) =>
      Previousepisode(
        href: json["href"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "name": name,
      };
}

class Self {
  final String href;

  Self({
    required this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Network {
  final int id;
  final String name;
  final Country country;
  final String officialSite;

  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        country: Country.fromJson(json["country"] ?? {}),
        officialSite: json["officialSite"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country.toJson(),
        "officialSite": officialSite,
      };
}

class Country {
  final String name;
  final String code;
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] ?? '',
        code: json["code"] ?? '',
        timezone: json["timezone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

class Rating {
  final double average;

  Rating({
    required this.average,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"] ?? '',
        days: List<String>.from(json["days"]?.map((x) => x) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
      };
}
