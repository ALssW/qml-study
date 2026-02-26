#ifndef XVIDEO_H
#define XVIDEO_H

#include <qimage.h>
#include <QPainter>
#include <QQuickItem>
#include <QQuickPaintedItem>

#include "opencv2/videoio.hpp"

class XVideo : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit XVideo(QQuickPaintedItem* parent = nullptr);
    void paint(QPainter* painter) override;

    Q_INVOKABLE bool open(QString filename);
    Q_INVOKABLE QVariant readFrame();
    Q_INVOKABLE void paintFrame(QVariant frame);

signals:
    void readEnd();

private:
    std::unique_ptr<cv::VideoCapture> video_;
    cv::Mat frame_;
    QImage image_;

};

#endif // XVIDEO_H
