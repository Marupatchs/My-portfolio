## Created 4-5 method for ATM mocking up

from types import ClassMethodDescriptorType
class ATM:
    def __init__(self, name, bank, balance, pin):
        self.name = name
        self.bank = bank
        self.balance = balance
        self.pin = pin

    ## method 1 - check balnce
    def check_balance(self):
        while True:
            your_pin = input("Please enter your pin: ")
            if your_pin == f"{self.pin}":
                print(f"Your current balance: {self.balance} Bath")
                break
            else:
                print("Incorrect pin, please try again")
                continue

    ## method 2 - deposit
    def deposit(self):
        while True:
            your_pin = input("Please enter your pin: ")
            if your_pin == f"{self.pin}":
                print("How much would you like to deposit?")
                your_deposit = int(input("Please enter your deposit amount: "))
                self.balance += your_deposit
                print(f"Your current balance: {self.balance} Bath")
                break
            else:
                print("Incorrect pin, please try again")
                continue

    ## method 3 - withdraw
    def withdraw(self):
        while True:
            your_pin = input("Please enter your pin: ")
            if your_pin == f"{self.pin}":
                print("How much would you like to withdraw?")
                your_withdraw = int(input("Please enter your withdraw amount: "))
                if your_withdraw > self.balance:
                    print("Insufficient balance")
                    break
                else:
                    self.balance -= your_withdraw
                    print(f"Your current balance: {self.balance} Bath")
                break
            else:
                print("Incorrect pin, please try again")
                break

    ## method 4 - transfer
    def transfer(self):
        while True:
            your_pin = input("Please enter your pin: ")
            if your_pin == f"{self.pin}":
                print("What is account that you would like to transfer?")
                transfer_bank = input("Please enter account bank: ").upper()
                transfer_account = input("Please enter account name: ").capitalize()
                print("How much would you like to transfer?")
                print("Be cautious of transfer involving criminals")
                print("or the incorrect account")
                print("Please check again")
                your_transfer = int(input("Please enter your transfer amount: "))
                if your_transfer > self.balance:
                    print("Insufficient balance")
                    break
                else:
                    self.balance -= your_transfer
                    print(f"Transfered {your_transfer} to {transfer_account} on {transfer_bank}")
                    print(f"Your current balance: {self.balance} Bath")
                    break
            else:
                return "Incorrect pin, please try again"
                continue

    ## method 5 - close account
    def close_account(self):
        print(f"Your current balance is {self.balance}")
        close_acc = input("Would you ensure to close your account?(y/n): ").lower()
        if close_acc == "y":
            print(f"Your final balance is {self.balance} and has been closed")
            print("Thank you for using our service")
            self.balance = 0
        elif close_acc == "n":
            print("Thank you for using our service")
        else:
            print("Incorrect answer, please try again")
