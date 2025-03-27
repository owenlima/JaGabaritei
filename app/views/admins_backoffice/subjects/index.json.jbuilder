json.array! @subjects do |subject|
  json.id subject.id
  json.description subject.description
  json.questions subject.questions.count
end
