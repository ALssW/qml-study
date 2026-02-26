#include "XVideo.h"

#include "opencv2/imgproc.hpp"

XVideo::XVideo(QQuickPaintedItem* parent)
    : QQuickPaintedItem { parent }
{
    qDebug() << "Create XVideo::XVideo()";
    video_.reset(new cv::VideoCapture);
}

void XVideo::paint(QPainter* painter)
{
    if (image_.isNull())
    {
        return;
    }

    painter->drawImage(QPoint(0, 0), image_);
}

bool XVideo::open(QString filename)
{
    // 打开视频
    const auto open = video_->open(filename.toStdString());
    if (open)
    {
        // 初始化图片
        image_ = QImage(width(), height(), QImage::Format_BGR888);
    }

    return open;
}

QVariant XVideo::readFrame()
{
    QVariant frame;
    // 读取视频帧
    if (!video_->read(frame_))
    {
        // 视频播放完毕
        emit readEnd();
        return frame;
    }
    return QVariant::fromValue(frame_);
}

void XVideo::paintFrame(QVariant frame)
{
    // 接收并转换传入的帧
    const auto srcFrame = frame.value<cv::Mat>();
    if (srcFrame.empty())
    {
        return;
    }

    cv::Mat view;
    // 将帧重置大小为图片控件大小
    cv::resize(srcFrame, view,
               cv::Size(image_.width(), image_.height()));
    // 复制 opencv 读取的帧至 image_
    memcpy(image_.bits(), view.data, view.cols * view.rows * view.elemSize());
    // 刷新界面
    update();
}
