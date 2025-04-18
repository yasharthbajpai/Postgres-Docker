#!/usr/bin/env python3
"""
Simple script to read data from the children table in PostgreSQL
"""
import pg8000.native

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
        
        # Close connection
        conn.close()
        
        return results
    except Exception as e:
        print(f"Error reading from database: {e}")
        if conn:
            conn.close()
        return None

def print_table(data, headers):
    """Print data in a simple table format"""
    if not data:
        return
    
    # Find the maximum width for each column
    col_widths = [max(len(str(row[i])) for row in data + [headers]) for i in range(len(headers))]
    
    # Print headers
    header_row = " | ".join(f"{headers[i]:{col_widths[i]}}" for i in range(len(headers)))
    print(header_row)
    print("-" * len(header_row))
    
    # Print data rows
    for row in data:
        row_str = " | ".join(f"{str(row[i]):{col_widths[i]}}" for i in range(len(row)))
        print(row_str)

def main():
    """Main function"""
    print("\n===== CHILDREN DATABASE RECORDS =====\n")
    
    # Read data
    records = read_children_data()
    
    if records:
        # Display as table
        headers = ["ID", "Name", "Age", "Grade", "Hobby"]
        print_table(records, headers)
        print(f"\nTotal records: {len(records)}")
    else:
        print("No data found or could not connect to database.")
    
    print("\n=====================================\n")

if __name__ == "__main__":
    main() 