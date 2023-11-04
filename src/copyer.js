const { S3Client, CopyObjectCommand } = require('@aws-sdk/client-s3');
const s3 = new S3Client({});

const exampleEvent = require('./example_event.json')

/**
 * Handler can be used inline in a lambda function to copy an S3 object from one bucket to another,
 * using S3 trigger as event source. Transforms the key to a new path, based on the accountId
 * found in the source bucket's path.
 * @param {event} event an AWS lambda event
 */

async function handler(event) {
  const { TARGET_BUCKET, TARGET_DEFAULT_PATH } = process.env;
  const sourceBucket = event.Records[0].s3.bucket.name;
  const encodedSourceKey = event.Records[0].s3.object.key;
  const sourceKey = decodeURIComponent(encodedSourceKey);
  const accountId = /(\d{12})/.exec(sourceKey)[0];
  const extractedKey = /(year=.*)$/.exec(sourceKey)[0];
  const targetKey = `${TARGET_DEFAULT_PATH}account=${accountId}/${extractedKey}`;

  console.log(`Copying ${sourceBucket}/${sourceKey} to ${TARGET_BUCKET}/${TARGET_DEFAULT_PATH}/${accountId}/${extractedKey}`);
  await s3.send(new CopyObjectCommand({
    Bucket: TARGET_BUCKET,
    CopySource: `${sourceBucket}/${sourceKey}`,
    Key: targetKey
  }));
}

(async () => {
  process.env.TARGET_BUCKET = 'cost-usage-reports-aggregated';
  process.env.TARGET_DEFAULT_PATH = 'curs/'
  await handler(exampleEvent)
})()


