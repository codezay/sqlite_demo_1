class Song {
  int? id;
  String? name;
  String? cat;
  String? font;
  String? font2;
  String? timestamp;
  String? yvideo;
  String? bkgndfname;
  String? key;
  String? copy;
  String? notes;
  String? lyrics;
  String? lyrics2;
  String? title2;
  String? tags;
  String? slideseq;
  String? rating;
  String? chordsavailable;
  String? usagecount;
  int? subcat;

  Song({
    this.id,
    this.name,
    this.cat,
    this.font,
    this.font2,
    this.timestamp,
    this.yvideo,
    this.bkgndfname,
    this.key,
    this.copy,
    this.notes,
    this.lyrics,
    this.lyrics2,
    this.title2,
    this.tags,
    this.slideseq,
    this.rating,
    this.chordsavailable,
    this.usagecount,
    this.subcat,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cat': cat,
      'font': font,
      'font2': font2,
      'timestamp': timestamp,
      'yvideo': yvideo,
      'bkgndfname': bkgndfname,
      'key': key,
      'copy': copy,
      'notes': notes,
      'lyrics': lyrics,
      'lyrics2': lyrics2,
      'title2': title2,
      'tags': tags,
      'slideseq': slideseq,
      'rating': rating,
      'chordsavailable': chordsavailable,
      'usagecount': usagecount,
      'subcat': subcat,
    };
  }

  static Song fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      name: map['name'],
      cat: map['cat'],
      font: map['font'],
      font2: map['font2'],
      timestamp: map['timestamp'],
      yvideo: map['yvideo'],
      bkgndfname: map['bkgndfname'],
      key: map['key'],
      copy: map['copy'],
      notes: map['notes'],
      lyrics: map['lyrics'],
      lyrics2: map['lyrics2'],
      title2: map['title2'],
      tags: map['tags'],
      slideseq: map['slideseq'],
      rating: map['rating'],
      chordsavailable: map['chordsavailable'],
      usagecount: map['usagecount'],
      subcat: map['subcat'],
    );
  }
}
