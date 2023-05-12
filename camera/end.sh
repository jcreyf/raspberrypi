echo "Running camera process:"
ps -ef | grep raspistill | grep -v grep

echo ""

echo "Stopping the camera process.."
killall raspistill

echo ""

echo "Running camera process:"
ps -ef | grep raspistill | grep -v grep

