#simplest ruby program to read from arduino serial, 
#using the SerialPort gem
#(http://rubygems.org/gems/serialport)

require "serialport"

#params for serial port
port_str = "COM3"  #may be different for you
baud_rate = 115200
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

$port = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

def game0(ques)
  if ques
    morse = {
        ".-"=> "A",
        "-..."=> "B",
        "-.-."=> "C",
        "-.."=> "D",
        "."=> "E",
        "..-."=> "F",
        "--."=> "G",
        "...."=> "H",
        ".."=> "I",
        ".---"=> "J",
        "-.-"=> "K",
        ".-.."=> "L",
        "--"=> "M",
        "-."=> "N",
        "---"=> "O",
        ".--."=> "P",
        "--.-"=> "Q",
        ".-."=> "R",
        "..."=> "S",
        "-"=> "T",
        "..-"=> "U",
        "...-"=> "V",
        ".--"=> "W",
        "-..-"=> "X",
        "-.--"=> "Y",
        "--.."=> "Z",
        "-----"=> "0",
        ".----"=> "1",
        "..---"=> "2",
        "...--"=> "3",
        "....-"=> "4",
        "....."=> "5",
        "-...."=> "6",
        "--..."=> "7",
        "---.."=> "8",
        "----."=> "9"
    }
    answer = []
    ques.split(' ').each {|q| answer << morse[q]}
    $port.write("#{answer.join('')}\n")
    $port.flush()
  end
end

def game1(ques)
  if ques
    prng = Random.new
    prng = prng.rand(4)
    answer = ['w', 's', 'a', 'd']
    $port.write("#{answer[prng]}\n")
    $port.flush()
  end
end

def game2(ques)
  if ques
    answer = eval(ques)
    $port.write("#{answer}\n")
    $port.flush()
  end
end

choice = '1'

sleep 2 # wait machine
while true do
  $port.read_timeout = 20
  while (line = $port.readline) do
    puts line
    line = line[0..-2] if line
    if line == 'Nano$ enter your choice:'
      $port.write("#{choice}\n")
      $port.flush()
    end
    if line == 'Nano$ finish'
      $port.close()
      break
    end
    if choice == '0'
      if line == 'Nano$ activate Morse'
        ques = $port.readline
        puts ques
        ques = ques[6..-2]
        line = $port.readline
        puts line
        game0(ques)
      end
    end
    if choice == '1'
      sleep 2 if line == 'Nano$ send [a] to move left' # wait generate map
      if line == 'Nano$ show map'
        game1(line)
      end
    end
    if choice == '2'
      if line == 'Nano$ activate Calculator'
        ques = $port.readline
        puts ques
        ques = ques[6..-5]
        line = $port.readline
        puts line
        game2(ques)
      end
      end
  end
  break
end
