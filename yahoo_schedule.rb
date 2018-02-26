def programmes_crawler(date,channel)
  @result
  @programmes = Array.new()
  programmes_url = 'https://movies.yahoo.com.tw/tv_channels.html?mtime_date='+date+'&channel='+channel
  doc = Nokogiri::HTML(open(programmes_url))
  #channel
  channel_name = doc.css("div[class='channel_box'] ul li[class='select']").text.strip
  @result = {
    channel: channel_name
  }
  #schedule
  doc.css("div[class='period_box _c'] ul li").each do |li|
      time = li.css("div")[0].text 
      name = li.css("div")[1].text
      programme = {
        time: time,
        name: name
      }
      @programmes.push(programme)
  end

  @result['schedule'] = @programmes

  return @result
end