#ifndef MYPAINTER_H
#define MYPAINTER_H

#include <QPainter>
#include <QQmlEngine>
#include <QQuickPaintedItem>

// 继承 QQuickPaintedItem
class MyPainter : public QQuickPaintedItem
{
    Q_OBJECT
    // 字体大小
    Q_PROPERTY(int penSize MEMBER penSize_ NOTIFY penSizeChanged)
    // 字体颜色
    Q_PROPERTY(QColor penColor MEMBER penColor_ NOTIFY penColorChanged)

    QML_ELEMENT

public:
    explicit MyPainter(QQuickPaintedItem* parent = nullptr);

    Q_INVOKABLE void beginPaint(QPoint pos)
    {
        lastPos_ = pos;
        qDebug() << "beginPaint: pos:" << pos;
    }

    Q_INVOKABLE void movePaint(QPoint pos)
    {
        // 初始化 img
        if (img_.isNull())
        {
            img_ = QImage(this->width(), this->height(), QImage::Format_ARGB32);
        }
        qDebug() << "movePaint: last pos:" << lastPos_ << ", pos:" << pos;
        QPainter painter(&img_);
        QPen pen;
        pen.setStyle(Qt::SolidLine);
        pen.setWidth(this->penSize_);
        pen.setBrush(penColor_);
        pen.setCapStyle(Qt::RoundCap);
        pen.setJoinStyle(Qt::RoundJoin);
        painter.setPen(pen);
        painter.setRenderHints(QPainter::Antialiasing, true);
        // 从 lastPos_ 开始画线
        painter.drawLine(lastPos_, pos);
        // 更新 lastPos_
        lastPos_ = pos;
        update();
    }


signals:
    void penSizeChanged();
    void penColorChanged();

private:
    // 重写 paint
    void paint(QPainter* painter) override
    {
        qDebug() << "paint";
        // painter->drawText(QPoint(100, 100), "test paint");
        if (!img_.isNull())
        {
            painter->drawImage(QPoint(0, 0), img_);
        }
    }

    // 画图至 img 中，方便进行导出和撤销
    QImage img_;
    QPoint lastPos_;

    int penSize_ = 2;
    QColor penColor_ = QColor("lightblue");
};

#endif // MYPAINTER_H
