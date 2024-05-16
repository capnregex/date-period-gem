module Date::ExtraMethods
  def weekday
    @weekday ||= on_weekday? ? 'weekday' : 'weekend'
  end

  def name
    @name ||= strftime("%A")
  end

  def abr
    @abr ||= strftime("%a")
  end

  def ab
    @ab ||= abr[0, 2]
  end

  def id
    @id ||= to_fs(:id).downcase
  end

  def css_class
    @css_class ||= ['day', name.downcase, id, weekday].join(' ')
  end
end
