import logging
log_filename= 'log/log.out'
logging.basicConfig(level=logging.DEBUG, filename= log_filename)
logging.debug('trying to import')

try:
	from NewsSentiment import TargetSentimentClassifier
except Exception as e:
	logging.error('Exception occurred', exc_info=True)



