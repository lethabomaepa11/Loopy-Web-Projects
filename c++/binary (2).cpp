#include<iostream>
#include <fstream>
#include  <string>
using namespace std;
struct Person {
    string name;
    int age;
    string gender;
    int  amountSpent;

} customer;//create a customer as a person struct
void getInfo()
{
    cout<<"Customer information...\n\n";

    cout<<"Enter your name: ";
    cin.ignore();
    getline(cin,customer.name);

    cout<<"Enter your age: ";
    cin>>customer.age;

    cout<<"Your gender: ";
    cin>>customer.gender;

    cout<<"The amount  spent today: R";
    cin>>customer.amountSpent;

    //open the binary file in out mode
    ofstream customerData;
    customerData.open("customers.bin",ios::app | ios::binary);

    if(customerData.is_open())
    {

        customerData.write(reinterpret_cast<char*>(&customer), sizeof(Person));
    }
    else
    {
        cout<<"failed to open file\n";
    }
    //closing the file
    customerData.close();
    if(customerData.good())
        cout<<"Added successfully\n";
}

void readAllData()
{
    ifstream customerData;
    customerData. open("customers.bin", ios::binary);
    if(customerData.is_open())
    {
        int counter = 0;
        while(!customerData.eof())
        {
            counter++;
            customerData. read(reinterpret_cast<char*>(&customer), sizeof(Person));
            cout<<"_________________________________________\n";
            cout<<"Customer "<<counter<<"\n";
            cout<<"Name: "<<customer.name<<"\n";
            cout<<"Age: "<<customer.age<<endl;
            cout<<"Gender: "<<customer. gender<<"\n";
            cout<<"Amount Spent: R"<<customer.amountSpent<<endl;
        }

    }
    else {
        cout<<"Failed to open\n";
    }
    customerData.close ();
}



void stats(int choice)
{
        //LS >> lowest spender, HS >> highest spender
    string HSGender = 0;
    string LSGender = 0;
    int lowestAmount = 0;
    int highestAmount = 0;
    int  HSAge = 0;
    int LSAge = 0;
    int avgAmount = 0;
    int avgAge = 0;
    int counter = 0;
    
    ifstream stat;
    stat.open("customers.bin", ios::binary);
    
    if(stat.is_open())
    {
        while(!stat.eof())
        {
            counter++;
            stat.read(reinterpret_cast<char*>(&customer), sizeof(Person));
            if(customer.amountSpent > highestAmount)
            {
                highestAmount = customer.amountSpent;
                HSAge = customer.age;
                HSGender  = customer.gender;
            }
            else if(customer.amountSpent < lowestAmount)
            {
                lowestAmount = customer.amountSpent;
                LSAge = customer.age;
                LSGender = customer.gender;                
            }
            
            //averages 
            avgAge += customer.age;
            avgAmount += customer.amountSpent;           
        }
        avgAge = avgAge/counter;
        avgAmount = avgAmount/counter;
    }
    
    //everything is calculated, now just display
    switch (choice)
                  {
                      case 1:
                          cout<<"\nHighest  amount Spent: "<<highestAmount <<"\n"
                                  <<"Lowest amount spent: "<<lowestAmount <<"\n";
                          break;
                      case 2: 
                          cout<<"\nAverage amount spent: "<<avgAmount<<"\n";
                          break;
                      case 3:
                          cout<<"Highest Spending Age: "<<HSAge<<"\n";
                          cout<<"Highest  Spending Gender: "<<HSGender<<"\n";
                          cout<<"Lowest Spending Age: "<<LSAge<<"\n";
                          cout<<"Lowest  Spending Gender: "<<LSGender<<"\n";
                           break;
                      case 4:
                          cout<<"Average Age: "<<avgAge<<"\n";
                          break;
                      case 5:
                          break;
                      default:
                          cout<<"Invalid Stat option\n";
                  }
    
}
int main()
{
    int choice = 100;
    do
    {
        cout<<"MAIN MENU\n\n"
            <<"1. Add new customer\n"
            <<"2. Display all customers\n"
            <<"3. View Stats\n"
            <<"0. Exit\n"
            <<">> ";
        cin>>choice;

        switch(choice)
        {
        case 0:
            break;
        case 1:
            getInfo();
            break;
        case 2:
            readAllData();
            break;
         case 3:
             //stats menu 
             do
             {
                 cout<<"\nSTATS MENU \n\n"
                         <<"1. Highest and Lowest amount spent\n"
                         <<"2. Average amount spent \n"
                         <<"3. Highest  and Lowest spending gender and age\n"
                         <<"4. Average age\n"
                         <<"5. Back to MAIN MENU \n"
                         <<"Stat choice>> ";
                         cin>>choice;
                         stats(choice);
                  
             }
             while(choice!=5);
             
             break;
        default:
            cout<<"INVALID CHOICE\n";
        }
    }
    while(choice!=0);
    return 0;
}