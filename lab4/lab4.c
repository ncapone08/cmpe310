#include <stdio.h>
#include <stdlib.h>

extern findSum(arr, len);

void getFile(char* buf){
    
    printf("Enter File Name:\n");
    scanf("%s", buf);
}

int main(){
    char fileName[255]; // arbitrary file
    getFile(fileName);
    FILE *fp;
    fp = fopen(fileName, "r"); // read file

    int length; 
    int number;

    char buf[100];
    
    int count = 0;

    // get the first line
    if (fgets(buf, sizeof(buf), fp)){
        if(sscanf(buf, "%d", &length) == 1){
            printf("Acquired Length: %d\n", length);
        }
        
    }

    int vals[length];

    while(fscanf(fp, "%d", &number) == 1 && count < length){
        vals[count] = number;
        count++;
    }

    // check for values
    for (int i = 0; i < length; i++){
        printf("Numbers added: %d\n", vals[i]);
    }

    //pass the values to the registers
    printf("Sum from assembly is: %d\n", findSum(vals, length));
}

