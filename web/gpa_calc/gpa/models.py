from django.db import models

# Create your models here.
# pass the current semester's subject wise grades in a dictionary as (subject(str)+credits(str))
# as key and grade(str) as value and one more dictionary as second parameter to GPA_CALC 
# like key=semester_count and value=current_cgpa
class GPA_CALC:

    def __init__(self, di, cur_cgpa):
        self.__score= di.copy()
        self.__sgpa=0
        self.__cgpa= cur_cgpa
    
    def grade_to_score(self, val):
        if val== 'EX':
            return 10
        elif val== 'A':
            return 9
        elif val== 'B':
            return 8    
        elif val== 'C':
            return 7    
        elif val== 'D':
            return 6    
        elif val== 'P':
            return 5    
        elif val== 'F':
            return 0    

    def sgpa_calc(self):
        total_credits=0
        for k, v in self.__score.items():                               #last character of key is credit of that subject
            self.__sgpa += self.grade_to_score(v) * int(k[-1])
            total_credits += int(k[-1])
        self.__sgpa /= total_credits
        return self.__sgpa

    def cgpa_calc(self):
        n=1
        val=0
        for k, v in self.__cgpa.items():
            n+=k
            val += (self.__sgpa + self.__cgpa[k])/2
        self.__cgpa.pop(n-1)
        self.__cgpa[n]=val
        return self.__cgpa
