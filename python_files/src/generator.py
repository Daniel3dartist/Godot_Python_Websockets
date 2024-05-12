from transformers import pipeline
from typing import Type

class Gen:
    def __init__(self):
        self.generator = pipeline('text-generation', model="gpt2-medium")
# generator = pipeline('text-generation', model="gpt2")#'EleutherAI/gpt-neo-2.7B')
    def set_model(self, mdl:str="gpt2-medium"):
        self.generator = pipeline('text-generation', model=mdl)

    def creator(self, prompt, maxl=150, sample=False):
        if type(maxl) != int or maxl <= 0 or maxl == None:
            maxl = 150
        if sample == None or sample == "" or sample == " ":
            sample = False
        res = self.generator(prompt, max_length=maxl, do_sample=sample, temperature=0.9)
        print(res)
        txt = res[0]['generated_text']
        print('\n'+txt+'\n')
        return txt
