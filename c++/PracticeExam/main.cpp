#include <iostream>
#include <string>
#include <iomanip>
#include <time.h>
#include <fstream>

using namespace std;
struct Order
{
    string username;
    double amount;
    bool savingsCard;//savings card members reference number starts with Sav-, normal starts with Nor-
    string refNo;
    int day4Delivery;//depends on the type of delivery method
};
void newOrder(Order *ptrOrders, int &orders)
{
    string username;
    double amount;
    bool savingsCard;
    string refNO;
    int days4Delivery,choice;
    Order newOrder;


    cout<<"New Order\n\n"
        <<"Enter the username: ";
        cin.ignore();
    getline(cin,username);
    cout<<"Enter the amount of the items: R";
    cin>>amount;
    do
    {
        cout<<"Savings member?:\n"
            <<"1. No\n"
            <<"2. Yes\n"
            <<"Choice: ";
        cin>>choice;
    }while(choice > 2 || choice < 1);
    savingsCard = choice - 1;//subtract 1 to make it a bool 1 or 0
    srand(time(0));
    if(savingsCard)
    {
        days4Delivery = rand()%10 + 1;//between 1 and 9 days
        refNO = "Sav-";//start with Sav
    }
    else
    {
        days4Delivery = rand()%20 + 2;//between 2 and 19 days
        refNO = "Nor-";//normal client
    }
    //create a reference number
    for(int i = 1; i <= 9; i++)
    {
        if(i%3 == 0)
        {
            refNO += char(rand()%91+65);//according to ascii these are alphabets, alphabets will be on 3, 6 and 9
        }
        else
        {
            refNO += (to_string(rand()%10));//converts to string and concatenates the number
        }
    }

    //all is done, now display feedback after you have added the values to the array
    (*(ptrOrders+orders)).username = username;
    (*(ptrOrders+orders)).amount = amount;
    (*(ptrOrders+orders)).savingsCard = savingsCard;
    (*(ptrOrders+orders)).day4Delivery = days4Delivery;
    (*(ptrOrders+orders)).refNo = refNO;
    orders++;

    //write to file
    ofstream outfile;
    outfile.open("Orders.txt", ios::app);

    if(outfile.fail())
    {
        cerr<<"Error opening file\n";
    }
    else
    {
        //username@amount@savingsCard@refNo@days4Delivery
        outfile<<username;
        outfile<<"@";
        outfile<<amount;
        outfile<<"@";
        outfile<<savingsCard;
        outfile<<"@";
        outfile<<refNO;
        outfile<<"@";
        outfile<<days4Delivery;
        outfile<<endl;
    }

    if(outfile.good())
    {
        cout<<"\nThe Order was successful\n"
            <<"Order for: "<<username
            <<"\nAmount: R"<<amount
            <<"\nDelivery time: "<<days4Delivery<<" days\n"
            <<"Reference code: "<<refNO<<endl;
    }
    outfile.close();
}

void importData(Order *arrOrders, int &orders)
{
    Order importedOrder;
    ifstream infile;
    string line;
    int pos1,pos2,pos3,pos4,pos5;

    infile.open("Orders.txt");
    if(infile.fail())
    {
        cerr<<"\COuld not open file\n";
    }
    else
    {
        orders = 0;//reset
        while(!infile.eof())
        {
            getline(infile,line);
            pos1 = line.find("@");
            pos2 = line.find("@",pos1+1);
            pos3 = line.find("@",pos2+1);
            pos4 = line.find("@",pos3+1);
            pos5 = line.find("\n");//experimental

            //username@amount@savingsCard@refNo@days4Delivery
            importedOrder.username = line.substr(0,pos1);
            importedOrder.amount = static_cast<double>(stoi((line.substr(pos1+1,pos2-pos1-1)).c_str()));
            importedOrder.savingsCard = stoi((line.substr(pos2+1,pos3-pos2-1)).c_str());
            importedOrder.refNo = line.substr(pos3+1,pos4-pos3-1);
            importedOrder.day4Delivery = stoi((line.substr(pos4)).c_str());

            (*(arrOrders+orders)) = importedOrder;
            orders++;
        }

        cout<<"\nSuccessfully imported "<<orders<<" entries from file\n";
    }

    infile.close();
}

void displayAll(Order arrOrders[],int orders)
{
    double sumAmounts;
     //username@amount@savingsCard@refNo@days4Delivery
    int countSavings,maxDays,minDays;//stats
    maxDays = arrOrders[0].day4Delivery;
    maxDays = arrOrders[0].day4Delivery;
    string savings;
    cout<<"All Orders\n"
        <<"USERNAME\t AMOUNT\t\t SAVINGS\t REFERENCE ID\t DELIVERY TIME\n";
    for(int i = 0; i < orders; i++)
    {
        savings = arrOrders[i].savingsCard == 1? "Yes": "No";
        cout<<arrOrders[i].username<<"\t\t R"<<arrOrders[i].amount<<"\t "<<savings<<"\t\t "<<arrOrders[i].refNo<<"\t "<<arrOrders[i].day4Delivery<<" days\n";
        sumAmounts += arrOrders[i].amount;
        countSavings = arrOrders[i].savingsCard == 1? countSavings += 1: countSavings = countSavings;
        if(maxDays <= arrOrders[i].day4Delivery)
        {
            maxDays = arrOrders[i].day4Delivery;
        }
        if(minDays >= arrOrders[i].day4Delivery)
        {
            minDays = arrOrders[i].day4Delivery;
        }
    }
    cout<<"STATS\n"
        <<"Total Revenue: R"<<sumAmounts
        <<"\nTotal savings client: "<<countSavings
        <<"\nLongest delivery time: "<<maxDays<<" days"
        <<"\nShortest delivery time: "<<minDays<<" days"<<endl;
}

void viewOrders(Order *arrOrders, int &orders)
{
    int choice;
    do
    {
        cout<<"1. View Current Session data\n"
            <<"2. Import data\n"
            <<"0. Cancel\n"
            <<"Choice>> ";
        cin>>choice;

        switch(choice)
        {
        case 1:
            displayAll(arrOrders,orders);
            break;
        case 2:
            importData(arrOrders,orders);
            break;
        case 0:
            cout<<"\nExiting...\n";
            break;
        default:
            cout<<"Error: wrong input\n";
            break;
        }
    }while(choice!=0);
}
int main()
{
    Order arrOrders[100];
    Order* ptrArrOrders;//used in the function
    int orders = 0;
    int choice;

    cout<<"****Blue SHop Market****\n";
    do
    {
        cout<<"1. New Order\n"
            <<"2. View All Order\n"
            <<"3. Delete/Cancel order\n"
            <<"0. Exit\n"
            <<"Choice>> ";
        cin>>choice;

        switch(choice)
        {
        case 1:
            newOrder(arrOrders,orders);
            break;
        case 2:
            viewOrders(arrOrders,orders);
            break;
        case 3:
            //deleteOrder();
            break;
        case 0:
            cout<<"Thank you for using our store\n";
            break;
        default:
            cout<<"Wrong value entered\n";
            break;
        }
    }
    while(choice != 0);
    return 0;
}
