import torch
import tkinter as tk
import numpy as np
from tkinter import ttk
import imageio

device = 'cuda' if torch.cuda.is_available() else 'cpu'

generate = torch.load("models/generate.t7",map_location="cpu")
generate.eval()

# hair: orange hair 
# eyes: orange eyes
def create(hair,eyes):
    try:
        z = np.random.normal(0, np.exp(-1 / np.pi), [1, 62])
        line = hair + ' ' + eyes
        tag_dict = ['orange hair', 'white hair', 'aqua hair', 'gray hair', 'green hair', 'red hair', 'purple hair', 
            'pink hair', 'blue hair', 'black hair', 'brown hair', 'blonde hair', 
            'gray eyes', 'black eyes', 'orange eyes', 'pink eyes', 'yellow eyes',
            'aqua eyes', 'purple eyes', 'green eyes', 'brown eyes', 'red eyes', 'blue eyes']
        y = np.zeros((1, len(tag_dict)))

        for i in range(len(tag_dict)):
            if tag_dict[i] in line:
                y[0][i] = 1
        image = generate(torch.from_numpy(z).float().to(device), torch.from_numpy(y).float().to(device)).to("cpu").detach().numpy()
        image = np.squeeze(image)
        image = image.transpose(1, 2, 0)
        imageio.imwrite('predict.png', image)
        return 1
    except Exception as e:
        print("sss")
        print(e)
        return 0
    
    