from random import randint
import psycopg2
from datetime import datetime

try:
    connection = psycopg2.connect(user="postgres",
                                  password="postgres",
                                  host="postgres",
                                  port="5432",
                                  database="postgres")
    cursor = connection.cursor()

    postgres_insert_query = " INSERT INTO public_table (id, time) VALUES (%s,%s)"
    record_to_insert = ('aaa1{}'.format(randint(200,999)),datetime.now().timestamp())
    cursor.execute(postgres_insert_query, record_to_insert)

    connection.commit()
    count = cursor.rowcount
    print(count, "Record inserted successfully into mobile table")
    
    postgreSQL_select_Query = "select * from public_table"

    cursor.execute(postgreSQL_select_Query)
    
    print("Selecting rows from mobile table using cursor.fetchall")
    mobile_records = cursor.fetchall()
    print("Print each row and it's columns values")
    for row in mobile_records:
        print("id = {}, time = {}".format(row[0],row[1]))
        
except (Exception, psycopg2.Error) as error:
    print("Failed to insert record into mobile table", error)

finally:
    # closing database connection.
    if connection:
        print(cursor.rownumber)
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")