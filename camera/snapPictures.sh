DATA_DIR=/data/pictures

# This creates files with format: <hostname>_mmddHHMMSS.jpg
HOSTNAME="$(uname -n)"
OUTPUT_FILE="${HOSTNAME}_%010d.jpg"

# This is the format we want (pic_YYYYmmddHHMMSS.jpg) but doesn't work since the timestamp is being evaluated only once when the script starts
#OUTPUT_FILE="pic_$(date +%Y%m%d%H%M%S).jpg"

JPG_QUALITY=10
TIMELAPSE_MILLISECONDS=1000
ROTATE_180=""
#ROTATE_180="--vflip --hflip"

#raspistill --nopreview --quality ${JPG_QUALITY} --timeout 0 ${ROTATE_180} --timelapse ${TIMELAPSE_MILLISECONDS} --datetime --output ${DATA_DIR}/${FILE_FORMAT} 

# Do a self-tuning picture snap
raspistill --nopreview \
	--quality ${JPG_QUALITY} \
	--exposure night \
	${ROTATE_180} \
	--datetime \
	--output "${DATA_DIR}/${OUTPUT_FILE}.tune.jpg"


#
# Start the timelapse
#
# timeout: number of milliseconds we allow the engine to self tune settings for best picture quality
# exposure: light sensitivity setting.  We can set a default start value like 'night' of give a custom numeric value.  Let the command run with the "--verbose --settings" to let the engine self-tune and output setting values (make sure to have --timeout disabled when running the self-tune)
# timelapse: take a new picture every N-millisesonds
#	--timeout 0 \
#	--timeout ${TIMELAPSE_MILLISECONDS} \

raspistill --nopreview \
	--quality ${JPG_QUALITY} \
	--exposure night \
	${ROTATE_180} \
	--timeout 0 \
	--timelapse ${TIMELAPSE_MILLISECONDS} \
	--datetime \
	--output "${DATA_DIR}/${OUTPUT_FILE}"

