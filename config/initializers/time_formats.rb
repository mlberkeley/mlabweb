Time::DATE_FORMATS[:medium_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}, %Y") }
