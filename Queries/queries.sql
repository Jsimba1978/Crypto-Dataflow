-- Query 1: Extract distinct addresses involved in transactions
SELECT DISTINCT address
FROM your_table_name;

-- Query 2: Count the number of transactions per address
SELECT address, COUNT(*) AS transaction_count
FROM your_table_name
GROUP BY address;

-- Query 3: Find the maximum transaction index in each block
SELECT blockNumber, MAX(transactionIndex) AS max_transaction_index
FROM your_table_name
GROUP BY blockNumber;

-- Query 4: List transactions associated with a specific topic
SELECT *
FROM your_table_name
WHERE topics LIKE '%0xddf252ad1be2c89b69c2b068fc378daa952ba7f1%';

-- Query 5: Sum of 'data' field (assuming it represents value) grouped by blockHash
SELECT blockHash, SUM(CAST(data AS BIGINT)) AS total_value
FROM your_table_name
GROUP BY blockHash;

-- Query 6: Identify transactions that have more than one distinct topic
SELECT transactionHash, COUNT(DISTINCT topics) AS distinct_topics
FROM your_table_name
GROUP BY transactionHash
HAVING COUNT(DISTINCT topics) > 1;

-- Query 7: List the most recent transactions (assuming blockNumber can be a proxy for recency)
SELECT *
FROM your_table_name
ORDER BY blockNumber DESC
LIMIT 10;

-- Query 8: Find all transactions that have been marked as removed
SELECT *
FROM your_table_name
WHERE removed = 'true';

-- Query 9: Analyze the count of transactions per blockNumber
SELECT blockNumber, COUNT(*) AS transactions_per_block
FROM your_table_name
GROUP BY blockNumber
ORDER BY transactions_per_block DESC;

-- Query 10: Check for transactions with incomplete or missing mandatory fields
SELECT *
FROM your_table_name
WHERE address IS NULL OR transactionHash IS NULL OR blockNumber IS NULL;
