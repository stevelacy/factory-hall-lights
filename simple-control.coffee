com = require 'serialport'

serialPort = new com.SerialPort '/dev/ttyUSB0',
  baudrate: 9600
  parser: com.parsers.readline '\n'


serialPort.on 'open', (e) ->
  console.log e
  serialPort.on 'data', (data) ->
    console.log data


  setTimeout ->
    serialPort.write '0,7,255,0,255,255\n', (err, res) ->
      console.log err, res
  , 2000




# modes
# 0: weird cycle
# 1: rainbow
# 2: slow rainbow
# 3: fast rainbow with green pause (broken)
# 4: sun
# 5: white
# 6: midnight blue
# 7: RGB  0,7,<intensity>,<R>,<G>,<b>\n'
