# Make a Pandas DataFrame with two-dimensional list
import pandas as pd
# List1  
lst = [['Greek', 20], ['is', 25], ['for', 30],['Greeksforgeeks',3]]
# creating df object with columns specified 
df = pd.DataFrame(lst, columns = ['Tag','number'])
print(df)

#595. Big Countries
import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    df = (world["population"] >= 25000000) | (world["area"]>=3000000)
    return world[df][["name", "population", "area"]]


#1757. Recyclable and Low Fat Products
import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    df = products[(products['low_fats'] == 'Y') & (products['recyclable'] == 'Y')]
    df = df[['product_id']]
    return df


#183. Customers Who Never Order
import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df =  customers[~customers['id'].isin(orders['customerId'])]
    return df[['name']].rename(columns = {'name': 'Customers'})

#Alternative
import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df = customers.merge(orders, left_on = 'id', right_on = 'customerId', how ='left')
    df = df[df['customerId'].isna()]
    return df[['name']].rename(columns = {'name': 'Customers'})
