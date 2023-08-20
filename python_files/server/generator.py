from transformers import pipeline 

#generator = None
generator = pipeline('text-generation', model="gpt2-medium")

class Gen:
#    generator = pipeline('text-generation', model="gpt2")#'EleutherAI/gpt-neo-2.7B')
    def set_model(mdl):
        global generator
 #       generator = pipeline('text-generation', model=str(mdl))
        generator = pipeline('text-generation', model="gpt2-medium")


    def creator(prompt, maxl, sample):
#        generator = pipeline('text-generation', model=str(mdl))#'EleutherAI/gpt-neo-2.7B')
        print(prompt)
        if maxl == None or maxl == "":
            maxl = 150
        if sample == None or sample == "":
            sample = False 
        res = generator(prompt, max_length=maxl, do_sample=sample, temperature=0.9) # Fourth line
        txt = res[0]['generated_text']
        print('\n'+txt+'\n')
        return txt