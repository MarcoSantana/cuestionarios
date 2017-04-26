TODO
==========
* Question:
    distractors (has_may)
    
    * paper_trail (or some kind of versioning perhaps self table reference)
    * :body string
    * :notes text (try to hide it from standar querying)
    * :author (find a gem for this)
    

* Distractor:
    * question (belongs_to)
    
    * paper_trail (or some kind of versioning perhaps self table reference)
    * :body string
    * :notes text (try to hide it from standar querying)
    * :author (find a gem for this)
    
    * :weight {float 2,1} default 1.0
    
    due to the use of weight ther is no need to have ":correct bool)
    se if I can test for a top value i.e. if a question has a maximum val the sum of the distractors matches

* Quiz
    questions (has_many)
    slots (has many)
    
    paper_trail (or some kind of versioning perhaps self table reference)
    :description string
    :notes text (try to hide it from standar querying)
    :author (find a gem for this)
    :application_venues (hm)
    :passing_grade float 5,2
    :version ??
    Must be able to display single questions and sets of multiple questions
    ( I asume it must be from the existance of the null slot_id)

* Authorship
    each element of the quiz must have author(s)
    

    
