import sys
import asyncio
from websockets.server import serve
from generator import Gen
import json

async def echo(websocket):
    gen = Gen()
    async for msg in websocket:
        data = msg.decode('ascii', 'strict')
        data = json.loads(data)
        if data["model"] != None:
            gen.set_model(mdl=str(data['model']))
        else:
            gen.set_model()
        txt = gen.creator(data['input'], data['leng'], data['sample'])
        print('Data: ', data)
        try:
            await websocket.send(txt.replace("\n\n", "\n").encode('ascii', 'strict'))      
        except:
            await websocket.send("[ERRO] Can't created the text!".encode('ascii', 'strict'))

async def main():
    async with serve(echo, "localhost", 8080):
        print('Server Conected: localhost:8080')
        await asyncio.Future()

asyncio.run(main())