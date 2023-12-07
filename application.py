import mysql.connector

def display_data(cur):
    result = cur.fetchall()
    print(result)

def guest_view(cur):
    print('')
    print("____WELCOME___")
    while(True):
        print('What would you like to view?')
        print('1-Art Objects')
        print('2-Artists')
        print('3-Exhibitions')
        print('4-Quit')
        user_user_selection = input('Please enter your choice: ')
        print('')
        while user_user_selection not in ['1', '2', '3', '4']:
            user_user_selection = input('\nInvalid input.\nPlease enter a valid choice: ')
        if user_user_selection == '4':
            print('Thank you for using our database!')
            break
        elif user_user_selection == '1':
            choice = input('Would you like to see:\n1-PAINTING \n2-Sculptures Statues\n3-Other\nPlease enter your choice: ')

            if choice == '1':
                cur.execute('''SELECT
                            A.ARTIST,       A.YEAR,     A.TITLE,        A.DESCRIPTION,
                            A.CULTURE,      A.EPOCH,    A.EXHIBITION,
                            P.PAINT_TYPE,   P.DRAWN,    P.STYLE
                            FROM ART_OBJECT AS A JOIN PAINTING AS P ON A.ID_NUM = P.ID_NUM''')
                display_data(cur)

            elif choice == '2':
                cur.execute('''SELECT
                            A.ARTIST,       A.YEAR,     A.TITLE,        A.DESCRIPTION,
                            A.CULTURE,      A.EPOCH,    A.EXHIBITION,
                            P.MATERIAL,     P.HEIGHT,   P.HEIGHT,       P.STYLE
                             FROM ART_OBJECT AS A JOIN SCULPTURE_STATUE AS P ON A.ID_NUM = P.ID_NUM''')
                display_data(cur)
            elif choice == '3':
                cur.execute('''SELECT
                            A.ARTIST,       A.YEAR,     A.TITLE,        A.DESCRIPTION,
                            A.CULTURE,      A.EPOCH,    A.EXHIBITION,
                            P.Type,         P.STYLE
                            FROM ART_OBJECT AS A JOIN OTHER AS P ON A.ID_NUM = P.ID_NUM''')
                display_data(cur)
            
            else:
                print('invalid input')
                continue

        elif user_user_selection == '2':
            cur.execute('''SELECT
                        NAME,               DATE_BORN,  DATE_DIED,
                        COUNTRY_OF_ORIGIN,  Epoch,      MAIN_STYLE,     DESCRIPTION
                        FROM ARTIST''')
            display_data(cur)

        elif user_user_selection == '3':
            cur.execute('''SELECT
                        NAME,           START_DATE,      END_DATE
                        FROM EXHIBITION''')
            display_data(cur)
           
        else:
            print('Invalid input.')
            continue
                  


def admin_view(cur):
    while True:
        print('\nWould you like to:\n1-Execute an SQL command\n2-Run an SQL script\n3-Quit')
        choice = input('Please enter your selection: ')
        while choice not in ['1', '2', '3']:
            choice = input('Invalid input. Please enter a valid choice: ')

        if choice == '1':
            execute_single_command(cur)
        elif choice == '2':
            execute_sql_script(cur)
        elif choice == '3':
            print('\nThank you for using our database!')
            exit()

if __name__ == "__main__":
    
    print("___WELCOME___")
    print("Select your role:")
    print("1-Admin")
    print("2-Employee")
    print("3-Guest")
    print("0-Quit")

    user_selection = input("please type 1, 2, or 3 to select your role: ")
    while user_selection not in ['1', '2', '3', '0']:
        user_selection = input("Invalid input, please enter either 1, 2, 3, or 0: ")
    
    if user_selection == '0':
        print('Thank you for using our database!')
        exit()

    if user_selection in ['1','2']:
        username= input("user name: ")
        passcode= input("password: ")

    else:
        username="guest"
        passcode=None
    
    
  
    cnx = mysql.connector.connect(
    user = username,
    password = passcode,
    autocommit = True
    )
    if (cnx.is_connected()):
        print("Connection Successful")
    
    else:
        print("Connection Unsuccessful")

    cur = cnx.cursor(buffered=True)
    cur.execute("use ARTMUSEUM")

    if user_selection == '3':
        guest_view(cur)
    
    elif user_selection == '1':
        admin_view(cur)

