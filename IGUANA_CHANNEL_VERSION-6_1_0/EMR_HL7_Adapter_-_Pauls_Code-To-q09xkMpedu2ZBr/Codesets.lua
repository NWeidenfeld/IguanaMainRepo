local code = [[{
   "organ donor code": {
"codes":{
      "I": "",
      "P": "",
      "R": "",
      "U": "U",
      "F": "F",
      "Y": "Y",
      "N": "N"
   }},
    "administrative sex": {
"codes":{
      "A": "U",
      "F": "F",
      "U": "U",
      "M": "M",
      "O": "O",
      "N": "U"
   },
   "default":"other"
 },
   "segment action code": {
"codes":{
      "A": "A",
      "D": "D",
      "U": "U"
   }},
   "marital status": {
"codes":{     
"A": "A",
      "P": "",
      "C": "",
      "R": "",
      "E": "",
      "T": "",
      "W": "W",
      "D": "D",
      "I": "",
      "S": "S",
      "G": "",
      "B": "",
      "M": "M",
      "U": "",
      "O": "",
      "N": ""
   }}
}]]
return json.parse{data=code}