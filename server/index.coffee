com = require 'serialport'
express = require 'express'
app = express()

PORT = 4321

app.use express.static 'client'

serialPort = new com.SerialPort '/dev/ttyUSB0',
  baudrate: 9600
  parser: com.parsers.readline '\n'

connected = false
serialPort.on 'open', ->
  connected = true

app.post '/color/:rgb', (req, res) ->
  serialPort.write "0,7,255,#{req.params.rgb}\n"
  res.status(200).end()

app.post '/mode/:mode', (req, res) ->
  serialPort.write "0,#{req.params.mode},255,0,0,0\n"
  res.status(200).end()

app.get '/', (req, res) ->

app.listen PORT
console.log 'starting on port', PORT
