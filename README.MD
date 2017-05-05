**TORRENT 2 S3**

this will be a complete AWS stack for my own purposes.
made up of AWS major components, the project is purely for me to catch up on my aws skills, particularlly around a complete stack as code.


1. Web front end - simple upload form (with eventual api support) to load a torrent file or a magnet URI for a torrent (also will support remote torrent url loading)

	form submit turns files in to base64 if a torrent file, loads the whole thing in to a json packet and submits to the message queue API

2. message queue API that recieves the JSON POST request from the webform/server, loads it in to a message queue.

3. aws SQS <> to SNS sends a web service request with the messae queue content to

4. deluge torrent web API, listens to the SNS post with the torrent data, loads torrent.

5. nodeJS file watcher https://github.com/paulmillr/chokidar watches for completed torrent updates message queue (complete) writes to second queue (transferingtos3)

6. s3 trigger complete update sns>sqs (remove queue) 

7. page queue updated with final trigger saying completed, present HTTP link to file.

##Operational Diagram##

Inline-style: 
![operations](https://github.com/joshjames/torrent2s3/Operations.png "Operations Diagram")






references and deendencies

deluge
https://whatbox.ca/wiki/Deluge_Console_Documentation
https://www.htpcguides.com/install-latest-deluge-ubuntu-server-14-04-lts/
http://deluge-webapi.readthedocs.io/en/latest/quickstart.html

torrent
http://btdigg.org/search?info_hash=7a1073bc39e6b0b01e3730227b8ffea6aeac5d59

sqs/sns
https://serverfault.com/questions/744983/aws-sqs-sns-lambda
http://budiirawan.com/how-to-connect-amazon-sns-to-amazon-sqs-queues/
https://github.com/andrewpuch/aws-sqs-node-js-examples


s3 complete trigger
http://docs.aws.amazon.com/lambda/latest/dg/walkthrough-s3-events-adminuser.html
http://stackoverflow.com/questions/32390263/get-notified-when-upload-is-completed-in-amazon-s3-bucket

node save to s3
http://thau.me/2014/02/nodejs-streaming-files-to-amazons3
http://stackoverflow.com/questions/28018855/upload-a-file-to-amazon-s3-with-nodejs

file watching
https://github.com/paulmillr/chokidar
node proxying
https://github.com/nodejitsu/node-http-proxy/

base64 encoding
http://www.hacksparrow.com/base64-encoding-decoding-in-node-js.html
https://gist.github.com/james2doyle/a4cff8e12456318c71b1
https://www.thepolyglotdeveloper.com/2016/02/convert-an-uploaded-image-to-a-base64-string-in-node-js/
https://icodealot.com/convert-data-to-base64-in-nodejs/
http://markocen.github.io/blog/pre-processing-uploaded-image-on-nodejs.html


something thats already done better
https://webtorrent.io/docs




================STAGE 2 completly serverless=====================

s3 static page (javascript) [s3]
	{
 	form submit > base64 encode clientsite (javascript) [s3]
 	Action submit addtorrentapi
 	}

addtorrentapi relay (nodejs) [lambda]
 	{
 	action create queue item (torrent_added) [sqs]
 	action webAPI add torrent (deluge webapi) [ec2]
 	}

watch_que (torrent_added) (nodejs) [lambda]
	{
	poll deluge api, update queue status (nodejs) [Lambda]
	action generate/update static page with torrent status (javascript [s3]
    }

 Deluge Transfer completed torrent [ec2]
 	{
 	action nodeJS transfer to s3
 	s3-SNS file transfer action add queue item (file_transfering)
 	}
	
s3-SNS file complete
	{
	Action geneate static complete page embedding http ready file. (nodejs) [lambda]
    }

