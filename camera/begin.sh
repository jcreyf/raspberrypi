echo "Running camera process:"
ps -ef | grep raspistill | grep -v grep

echo ""

echo "Starting the camera process.."
startCamera.sh

echo ""

echo "Running camera process:"
ps -ef | grep raspistill | grep -v grep

