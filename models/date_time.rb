class DateTime

  def self.split_for_ruby(sql_timestamp)
    return sql_timestamp.split(" ")
  end

  def self.combine_for_sql(date, time="00:00:00")
    return "#{date} #{time}"
  end

end
