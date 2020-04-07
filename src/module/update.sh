sudo killall hlcand
sleep 1
sudo rmmod hlcan.ko
rm hlcan.ko
make clean
make
sudo modprobe can_dev
sudo insmod hlcan.ko
sudo ../hlcand -m 0 -s 500000 /dev/ttyUSB1 -F &
sleep 2
sudo ip link set can0 up 
echo sending a frame
cansend can0  0A1#cafebabe
echo -------- STARTING CANDUMP
candump can0
