/**
 * Use this helper script to create a bucket policy for the aggregated CURS bucket,
 * giving s3:PutObject permissions to all accounts in the accounts array
 */

const accounts = [
  '111111111111',
  '222222222222'
]

const statements = accounts.map((account) => {
  return {
    "Effect": "Allow",
    "Principal": {
      "AWS": `arn:aws:iam::${account}:root`
    },
    "Action": "s3:PutObject",
    "Resource": `arn:aws:s3:::cost-usage-reports-aggregated/curs/account=${account}/*`
  }
});

const policy = {
  "Version": "2012-10-17",
  "Statement": statements
}

console.log(JSON.stringify(policy, null, 2));
