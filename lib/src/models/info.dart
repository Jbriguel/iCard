
class info {
  
  String? _title;
  String? _content; 

  info({ 
    required String? title,
    required String? content
  }) { 
    _title = title;
    _content = content; 
  }
 
  String? get title => _title;
  String? get content => _content; 

 
  set title(String? title) => _title = title;
  set content(String? content) => _content = content; 


  Map<String, dynamic> toMap() {
    return { 
      'title': title,
      'content': content, 
    };
  }

  info.fromMap(Map<String, dynamic> res)
      : 
        _title = res['title'],
        _content = res['content'] ;
}
