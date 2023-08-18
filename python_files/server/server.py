import asyncio
from websockets.server import serve
import json

async def echo(websocket):
    print('foi?')
    print(websocket)
    await websocket.send('Pacote enviado!')
    async for msg in websocket:
        data = msg.decode('ascii', 'strict')
        print('Data: ', data)

async def main():
    async with serve(echo, "localhost", 8080):
        print('Server Conected: localhost:8080')
        await asyncio.Future()

asyncio.run(main())