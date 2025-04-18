#!/usr/bin/env python3
"""
Script to read data from the children table in PostgreSQL
"""
import pg8000.native
import pandas as pd
from tabulate import tabulate

def connect_to_database():
    """Connect to the PostgreSQL database"""
    try:
        conn = pg8000.native.Connection(
            user="postgres",
            password="postgres",
            host="localhost",
            database="mydb",
            port=5432
        )
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None

def read_children_data():
    """Read data from the children table"""
    conn = connect_to_database()
    if not conn:
        return None
    
    try:
        # Execute query
        results = conn.run("SELECT id, name, age, grade, hobby FROM children ORDER BY age")
        
        # Create DataFrame
        columns = ["ID", "Name", "Age", "Grade", "Hobby"]
        df = pd.DataFrame(results, columns=columns)
        
        # Close connection
        conn.close()
        
        return df
    except Exception as e:
        print(f"Error reading from database: {e}")
        if conn:
            conn.close()
        return None

def main():
    """Main function"""
    print("\n===== CHILDREN DATABASE RECORDS =====\n")
    
    # Read data
    df = read_children_data()
    
    if df is not None and not df.empty:
        # Display as table
        print(tabulate(df, headers="keys", tablefmt="pretty", showindex=False))
        print(f"\nTotal records: {len(df)}")
    else:
        print("No data found or could not connect to database.")
    
    print("\n=====================================\n")

if __name__ == "__main__":
    main() 