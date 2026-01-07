class ATM:
  # The Constructor: Initializes a new ATM account object
  def __init__(self, account_name, pin, balance=0):
    self.account_name = account_name
    self.pin = pin
    self.balance = balance
    self.history = [] # Stores a list of all transactions
    self.log_history(f"Account created with initial balance of ${balance}")

  # Helper Method: Internally records messages into the history list
  def log_history(self, message):
    self.history.append(message)

  # Security Check: Displays the current balance if the PIN is correct
  def check_balance(self, input_pin):
    if input_pin == self.pin:
      print(f"\n--- [ {self.account_name}'s Balance : ${self.balance} ] ---")
    else:
      print("Wrong pin")
  
  # Deposit Logic: Increases balance and logs the transaction
  def deposit(self, amount):
    if amount > 0:
      self.balance += amount
      self.log_history(f"Deposited ${amount}")
      print(f"\n--- [ ${amount} has been deposited ] ---")

  # Withdrawal Logic: Checks PIN and ensures sufficient funds before deducting
  def withdraw(self, input_pin, amount):
    if input_pin != self.pin:
      print("Wrong pin")
      return
    elif amount > self.balance:
      print("Insufficient balance")
    else:
      self.balance -= amount
      self.log_history(f"Withdrew ${amount}")
      print(f"\n--- [ ${amount} has been withdrawn ] ---")

  # Transfer Logic: Deducts from this account and calls receive_funds on a target object
  def transfer(self, input_pin, target_account, amount):
    if input_pin != self.pin:
      print("Wrong pin")
      return
    if amount > self.balance:
      print("Insufficient balance")
    else:
      self.balance -= amount
      # Interact with another ATM instance
      target_account.receive_funds(amount, self.account_name)
      self.log_history(f"Transferred ${amount} to {target_account.account_name}")
      print(f"\n--- [ Transferred ${amount} to {target_account.account_name} ] ---")
      
  # Receive Logic: Automatically called by another account during a transfer
  def receive_funds(self, amount, sender_name):
    self.balance += amount
    self.log_history(f"Received from {sender_name}: +${amount}")

  # Report Logic: Displays the transaction history log
  def show_history(self):
    print(f"\n---  Transaction History for: {self.account_name}  ---")
    for i, record in enumerate(self.history, 1):
      print(f"{i}. {record}")
