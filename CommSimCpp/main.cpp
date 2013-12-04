#include <QtWidgets/QApplication>
#include <QtWidgets/QSplashScreen>
#include <QThread>
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QSplashScreen *Splash = new QSplashScreen();
    Splash->setPixmap();
    Splash->show();
    Splash->showMessage();
    MainWindow w;
    w.setWindowTitle(QObject::tr("CommSim Project Alpha"));
    w.hide();
    QTimer::singleShot(1500,&w,show());
    QThread::sleep(2);
    Splash->close();
    
    return a.exec();
}
