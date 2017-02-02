firstword::String->String
firstword " "=" "
firstword (x:' ':xs)=[x]
firstword (x:y:xs)=x:firstword(y:xs)
