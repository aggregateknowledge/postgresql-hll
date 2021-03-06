-- ----------------------------------------------------------------
-- Type Modifier Signature
-- ----------------------------------------------------------------

SELECT hll_set_output_version(1);

DROP TABLE IF EXISTS test_qiundgkm;

-- Using all defaults.
CREATE TABLE test_qiundgkm (v1 hll);
\d test_qiundgkm
DROP TABLE test_qiundgkm;

-- Partial defaults.
CREATE TABLE test_qiundgkm (v1 hll(10));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(10, 4));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(10, 4, 64));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(10, 4, 64, 0));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

-- ERROR:  invalid number of type modifiers
CREATE TABLE test_qiundgkm (v1 hll(10, 4, 64, 0, 42));

-- ----------------------------------------------------------------
-- Range Check log2nregs
-- ----------------------------------------------------------------

-- ERROR:  log2m modifier must be between 0 and 17
CREATE TABLE test_qiundgkm (v1 hll(-1));

CREATE TABLE test_qiundgkm (v1 hll(0));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(31));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

-- ERROR:  log2m modifier must be between 0 and 17
CREATE TABLE test_qiundgkm (v1 hll(32));

-- ----------------------------------------------------------------
-- Range Check regwidth
-- ----------------------------------------------------------------

-- ERROR:  regwidth modifier must be between 0 and 7
CREATE TABLE test_qiundgkm (v1 hll(11, -1));

CREATE TABLE test_qiundgkm (v1 hll(11, 0));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(11, 7));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

-- ERROR:  regwidth modifier must be between 0 and 7
CREATE TABLE test_qiundgkm (v1 hll(11, 8));

-- ----------------------------------------------------------------
-- Range Check expthresh
-- ----------------------------------------------------------------

-- ERROR:  expthresh modifier must be between -1 and 16383
CREATE TABLE test_qiundgkm (v1 hll(11, 5, -2));

CREATE TABLE test_qiundgkm (v1 hll(11, 5, -1));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(11, 5, 0));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(11, 5, 128));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(11, 5, 4294967296));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

-- ERROR:  expthresh modifier must be between -1 and 16383
CREATE TABLE test_qiundgkm (v1 hll(11, 5, 8589934592));

-- ----------------------------------------------------------------
-- Range Check nosparse
-- ----------------------------------------------------------------

-- ERROR:  nosparse modifier must be 0 or 1
CREATE TABLE test_qiundgkm (v1 hll(11, 5, 128, -1));

CREATE TABLE test_qiundgkm (v1 hll(11, 5, 128, 0));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

CREATE TABLE test_qiundgkm (v1 hll(11, 5, 128, 1));
\d test_qiundgkm
DROP TABLE test_qiundgkm;

-- ERROR:  nosparse modifier must be 0 or 1
CREATE TABLE test_qiundgkm (v1 hll(11, 5, 128, 2));
