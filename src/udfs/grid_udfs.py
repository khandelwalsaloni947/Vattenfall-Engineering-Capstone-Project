from pyspark.sql.functions import udf
from pyspark.sql.types import StringType

def severity_level(sev):
    return sev

severity_udf = udf(severity_level, StringType())