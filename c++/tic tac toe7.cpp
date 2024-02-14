#include<iostream>
using namespace std;
void displayGrid(char arrPlayer[])
{
    
    string divider = "  |  ";
    
        cout<<arrPlayer[0]<<divider<<arrPlayer[1]<<divider<<arrPlayer[2]<<"\n";
         cout<<arrPlayer[3]<<divider<<arrPlayer[4]<<divider<<arrPlayer[5]<<"\n";
          cout<<arrPlayer[6]<<divider<<arrPlayer[7]<<divider<<arrPlayer[8]<<"\n";
}
void validateNum(int &num, int arrFilled[])
{
                 for(int x = 0; x < 9; x++)
                        {
                            if(num == arrFilled[x])
                            {
                                num = 0;
                            }
                        }
}
void checkWinner(char arrPlayer[], string &whoWon,  string arrWin[])
{
    string comboX;
    string comboO;
    whoWon = "None";
    for(int x = 0; x < 9; x++)
    {
        if(arrPlayer[x] == 'X')
        {
            comboX += to_string(x+1);
            //doesn't work if we played more than 3 moves
        }
        else
        {
            comboO += to_string(x+1);
        }
    }
    
    for(int x =0; x < 9; x++)
    {
        if(comboX == arrWin[x] )
        {
            whoWon = "Player1";
        }
        else if(comboO == arrWin[x])
        {
            whoWon = "Player2";
        }
        //code for a tie event        
    }
    
}
void playGame(int type)
{

    //an array to take the positions filled and the x or o on the position
    //use of parallel arrays
    int arrFilled[9];
    int num;
    int numAI;
    string whoWon;
    string arrWin[] = {"123","159","147","258","369","357","456","789"};
    bool done;
    char arrPlayer [9]  = {'1','2','3','4','5','6','7','8','9'};//x or o...at first it's _ just numbers
    int filled;
    char numC;
    for(int x = 0; x< 9; x++)
    {
        arrFilled[x] = 0;
    }
    cout<<"Playing "<<type <<"-player...\n";
    displayGrid(arrPlayer);
    switch(type)
    {
        case 1:
            do
            {
                do{
                     
                            cout<<"Player: Choose a number to place your X: ";
                            cin>>num;
                            validateNum(num,arrFilled);//validate the player's input
                            

                        
                    
                }
                while(num == 0);
                arrPlayer[num-1] = 'X';
                arrFilled[num-1] = num;
                //just a robot or ai sort of
                            do
                            {
                                numAI= rand() % 10;//randomly
                                validateNum(numAI, arrFilled);
                            }
                            while(numAI == 0 );
                //show the user's move
                
                arrFilled[numAI-1] = numAI;
                displayGrid(arrPlayer);
                cout<<"Computer's turn...\n";
                arrPlayer[numAI-1] = 'O';
                displayGrid(arrPlayer);
                //check if one of the players has won 
                checkWinner(arrPlayer, whoWon, arrWin);
                if(whoWon == "Player1" || whoWon== "Player2")
                {
                    
                    done = true;
                }
             } 
             while(!done);
                //break after loop after game is done 
                break;               
    }
    
    
}
int main()
{    
    int arrPosition[9] = {1,2,3,4,5,6,7,8,9};
    
    int choice;
        //simple tik tak toe game without ai 
    
    
    do
    {
        cout<<"Simple tic tac toe X O X O X O\n\n";
        cout<<"1. Play Game - Single Player \n"
                <<"2. Play Game - 2 Players\n"
                <<"0. Exit\n"
                <<"Choice>> ";
         cin>>choice;
         
         switch(choice) 
         {
             case 1:
                 playGame(choice);
                 break;
             case 2:
                 playGame(choice);
                 break;
              case 0:
                  cout<<"Exiting...";
                  break;
             default:
                 cout<<"Invalid\n";
                 break;     
         }
    }
    while(choice!= 0);
    
    
    return 0;
}