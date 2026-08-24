import json
import pandas as pd


INPUT_FILE = "../data/sample_orders.json"
OUTPUT_FILE = "../data/processed_orders.csv"


def load_data(file_path):
    """Load JSON order data."""
    with open(file_path, "r") as file:
        return json.load(file)


def transform_data(data):
    """Clean and transform order data."""

    df = pd.DataFrame(data)

    # Remove duplicate orders
    df = df.drop_duplicates(subset=["order_id"])

    # Convert date column
    df["order_date"] = pd.to_datetime(df["order_date"])

    # Validate quantity
    df = df[df["quantity"] > 0]

    # Calculate revenue
    df["revenue"] = df["quantity"] * df["unit_price"]

    # Standardize country names
    df["country"] = df["country"].str.strip()

    return df


def main():

    data = load_data(INPUT_FILE)

    df = transform_data(data)

    df.to_csv(OUTPUT_FILE, index=False)

    print(f"Successfully processed {len(df)} records.")
    print(f"Output file: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
