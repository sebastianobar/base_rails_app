module ApplicationHelper
  def current_path_with_locale(locale)
    uri =  URI.parse(request.path)
    new_query_ar = URI.decode_www_form(String(uri.query)).to_h.tap { _1["locale"] = locale }
    uri.query = URI.encode_www_form(new_query_ar)
    uri.to_s
  end
end
