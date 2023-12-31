import sys
import asyncio
from websockets.server import serve
from generator import Gen
import json

async def echo(websocket):
    async for msg in websocket:
        data = msg.decode('ascii', 'strict')
        data = json.loads(data)
        Gen.set_model(data['model'])
        txt = Gen.creator(data['input'], data['leng'], data['sample'])
        print('Data: ', data)
        await websocket.send(txt.encode('ascii', 'strict'))

async def main():
    async with serve(echo, "localhost", 8080):
        print('Server Conected: localhost:8080')
        await asyncio.Future()

asyncio.run(main())