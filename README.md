# Project Title: Decentralized FAST Cafeteria Shopping System
It is a group project; however, the size of the group shall not exceed four students. The group
members must be the same as in Project 1. Your submission shall be made in the classroom, and you
shall submit a zip file containing all the source codes. Deadline is 06th

**Scenario Specifications:**
FAST University has requested batch 20 students currently enrolled in the CS-4049 course to
develop a futuristic DAPP that revolutionizes the way students and staff interact with the cafeteria. 
The DAPP aims to provide a seamless and transparent experience for ordering meals, processing
transactions, handling payments via cryptocurrency, and rewarding loyal customers.
The DAPP will have three different stakeholders, i.e., (i) university management, (ii) cafeteria staff, and (iii) cafeteria users. The DAPP must satisfy the following requirements.
1. Smart Contracts: Instead of one monolithic contract, the DAPP must be designed to use
multiple contracts, each playing a crucial role in the cafeteria shopping system. Contracts
should cover functionalities such as menu management, order processing, payments, loyalty
rewards, and promotions. The exact details of the smart contracts will follow later.
2. Inter-contract Functionality: Smart contracts must interact with each other through function
calls, creating a cohesive and interconnected system. For instance, the order contract may call
functions from the menu contract to fetch item details. Likewise, the rewards contract could
interact with the payment contract to credit loyalty tokens.

3. ERC20 Token Standard Implementation: Instead of using BTC/ETH or any other well-
established coin, the Rector has decided to develop an indigenous coin with the name of

FastCoin. The smart contract that implements FastCoin must adhere to the ERC20 token
standard. This contract must be designed to facilitate payments, loyalty rewards, and potential
promotions through the FastCoin token.

### Smart Contracts:

  As a requirement, the following smart contracts must be supported by the DAPP.
  
  **1. Menu Management Contract [10 marks]:** Manages the cafeteria menu, including items, prices,
  and availability. This contract provides functions for the cafeteria staff to add new menu items,
  update prices, and check item availability.
  
  **2. Order Processing Contract [10 marks]:** Facilitates the order processing system, allowing users
  to select items, specify quantities, and place orders. This contract calls functions from the
  menu management contract to retrieve item details and calculate the total order amount.
  
  **3. Payment Contract (ERC20) [10 marks]:** Implements the rector’s vision of FastCoin as ERC20
  token standard, serving as a utility token for financial transactions within the cafeteria system.
  This contract manages functions for processing payments, deducting token amounts, and
  ensuring secure transactions.
  Needless to say, the owner of this contract will be university management.
  
  **4. Rewards and Loyalty Contract [10 marks]:** Establishes a rewards and loyalty program,
  encouraging users to earn tokens based on their purchasing behavior. University management
  has multiple meetings with the cafeteria staff – to decide/agree on the specifics of rewards
  and loyalty programs – without any success. To avoid any further delays in the development of
  DAPP, university management has decided to leave it to batch 20 CS4049 students to come
  up with the features of rewards and loyalty programs.
  This contract interacts with the payment contract to credit loyalty tokens to users' accounts.
  
  **5. Promotions and Discounts Contract [10 marks]:** Introduces a dynamic promotions system,
  allowing the cafeteria staff to offer discounts or special promotions. This contract collaborates
  with the order processing contract to apply for promotions and calculate adjusted order amounts.
  Once again university management has instructed us to keep this functionality simple and focus
  on the timely completion of the project.
  
  **Note:** The university management has conveyed clear instructions that the development team
  shall complete any missing requirements themselves.

### Web Integration:
  The web3 application will be developed in JavaScript using the React framework. To reduce the time
  for development, the university management has given clear instructions to not focus on making
  very elegant UI/UX parts. The only requirement is the functional working of the web application.
  The following user interactions must be supported by the web3 application.

### Cafeteria staff
    • The cafeteria staff can log in to update the menu items and their prices. [10 marks]
    • Moreover, the cafeteria staff can offer discounts and special promotions. [10 marks]
    • The reward and loyalty program details shall be hardcoded in the smart contract and the
      cafeteria staff is not allowed to change the program details. ‘

### Cafeteria users
    • Users log in to the cafeteria shopping system, browse the menu, and place orders through a
      user-friendly interface. [10 marks]

    • The order processing contract interacts with the menu management contract to fetch item
      details, calculates the total order amount, and provides a summary to the users on the web.
      [10 marks]

    • Users make payments on the web using the utility token through the payment contract,
      ensuring secure and transparent transactions. [10 marks]
    
    • The rewards and loyalty contract interacts with the payment contract to credit users with
      loyalty tokens based on their purchases. The details must be visible to the users on the web.
      [10 marks]

    • The promotions contract collaborates with the order processing contract to apply discounts or
      promotions to eligible orders. The details must be visible to the users on the web. [10 marks]
