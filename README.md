# 8086-Temperature-Control-System

In this project, It can be controlled the temperature on any room-place using with emulator 8086. (using Assembly Language and Proteus)
. In ***[23-32]*** degrees are the control fan motor doesn't working.
It works ***outside[23,32]*** degrees. Because it is not necesarry, it is good for room temperature from 23 to 32 degrees.

There are few instructions below, they represented project working scheme and screen shots.



 *Program files and project created with **Proteus software and emu8086**. They should be installed for execute the files.*


*Note: I have prepared  **explanation video** to understanding easly of my project
https://disk.yandex.com.tr/i/x6q5UAOW2R7MMQ*




## Screenshots

![Alt Text](https://www.linkpicture.com/q/temperature.jpg)




![Alt Text](https://www.linkpicture.com/q/4_343.jpg)



![Alt Text](https://www.linkpicture.com/q/3_382.jpg)


![Alt Text](https://www.linkpicture.com/q/temp2.jpg)




## Using & Run 



Clone the project

```bash
  git clone https://github.com/egemengulpinar/emu8086-Temperature-Control.git
```

*Follow the ***explanation video***, then select same option and setting to execute project.*


- Open emu8086 and import temperature.asm file. Save assembly file on emu8086 with ***.com*** file format.

- Open `Proteus Software` and import `17-155-014 temperature control project.pdsprj` project file.



- Click 8086 program and select `"Edit Component"` settings on the Proteus software, open previous ***.com*** file and click ***OK***

- Then click ***start*** button on project diagram in Proteus Software

- You can change the temperature with  `CONTROL-TEMPERATURE` part.

When the program was executed (if  temperature > 33&deg;  or temperature < 23&deg;), the control fan motor will working succesfully.






