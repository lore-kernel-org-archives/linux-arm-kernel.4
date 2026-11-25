Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wki7t4mq;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ASbH5ClL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pswBG59guH62lCEWMkmDWSD12p1MDexE4B9kdFA3m4U=; b=wki7t4mqFEXmpI
	KZc7jHE+YS8vcxvdmrlZqfjsOVBM7rnXXyKyRa5+61sLcyDJSyC1gK1z4YAb2EFosK0QUYLoxSzaf
	aLypoSvrkPtcsvhCYYvFQnCgI2znHugQCVx+ESekYkIyTt0r/41+2a4WBHwPD1fss+w/7WHUC3SCL
	pWMo9YqWexJQh5lyRlhwAgSGSsuoRB5NoOzSL/ZhTduXyQoVbsfjMza8N44LoiUOvGyh2W1xNvFne
	B4hjCC5FVy5qmEoTClvHJefR5YzHnr9/Lga/1RQI+W+ZZXA4IlMyozxabZwSNhv3fy9UD1UQGB0rf
	Lh0pn7oFtygg3Q3g/87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEig-0000000AJcG-1jX9;
	Wed, 25 Nov 2026 15:15:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEhT-0000000AJ2Z-1cuq;
	Wed, 25 Nov 2026 15:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619660;
	bh=3FBbaws9N7wLOiseRH6Q6m5ib4Wx+e8jlcCc3+XKZBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ASbH5ClLNnGjUwfH7e4o5b685+X9TmNyXcyV2jrR8F9qsFaazzGmR80zqS0QvO+BO
	 1UMlSbcnnDO/ZyLCoNTljTsJmYXREZHlf4XICNX3v/hX+DjcNLzN5aEBB7MXytgn0b
	 Z5PQu2vRRaLYfwqUDbzeBO1e0ByrFP8Z+oMuspP5aT8JKPcHoROqIopzfxcQXvgIhz
	 mJp2zCl3SpQ1bVT01MK4G1NMZRl1BO2GKDUhpNRzKJYWggazT3+rN0nbE2NfMOh+pO
	 yksSLrSbrocvinVpZ3Hl2/8rYLYNX2cxSECaFXplMLCGMkQsj+TixcNUK5P1qtXKMx
	 gAz2mmE97GalA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 733A717E11E0;
	Wed, 25 Nov 2026 16:14:19 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 10:12:00 -0500
Subject: [PATCH v4 3/5] media: v4l2-core: Add v4l2-metrics interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-fdinfo-v4-3-2dc73fad9932@collabora.com>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_071423_605911_B41B2910 
X-CRM114-Status: GOOD (  21.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Provide helpers for V4L2 drivers to set fdinfo data and print the
key:value pairs in a standard way.

Drivers can set metrics values with helpers like:
 - v4l2_metrics_update_hw_usage
 - v4l2_metrics_set_driver_type

And also call the show helpers from their show_fdinfo callback with:
 - v4l2_metrics_show -- Shows the values set previously
 - v4l2_metrics_show_clock -- Shows the main clock state.

Per-core metrics are supported by passing a numeric core_id to the
show helpers, so a single file descriptor can report metrics for
multiple hardware cores.

The show_clock helper is used instead of storing a clock reference in
v4l2_metrics for the following reasons:
 - Clocks are at the device level, this is not a per-fd information
 - This avoids having clock references in v4l2-core
 - Drivers can use different approaches to manage clocks
   (e.g.: bulk_data or not: A set helper wouldn't please all drivers)
 - Arguably, clocks could be exposed elsewhere (like a debugfs), but we
   want something close to what DRM does and centralizing information has
   its advantages for userspace tooling.

In DRM the key:value pair format for clocks is documented and each driver
can write them directly based on that.
In this case, provide a helper and document the format.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/Makefile       |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c     |  2 +
 drivers/media/v4l2-core/v4l2-fh.c      |  3 ++
 drivers/media/v4l2-core/v4l2-metrics.c | 78 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-fh.h                |  3 ++
 include/media/v4l2-metrics.h           | 47 ++++++++++++++++++++
 6 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 329f0eadce99..4bfd4e19dff8 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -9,7 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
 tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
-			v4l2-event.o v4l2-subdev.o v4l2-common.o \
+			v4l2-event.o v4l2-subdev.o v4l2-common.o v4l2-metrics.o \
 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 8a350ef3a9ed..b71d48eef9d8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -486,6 +486,8 @@ static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
 {
 	struct video_device *vdev = video_devdata(filp);
 
+	seq_printf(m, "v4l2-driver:\t%s\n", vdev->v4l2_dev->name);
+
 	if (vdev->fops->show_fdinfo)
 		vdev->fops->show_fdinfo(m, filp);
 }
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b184bed8aca9..1ed91d344f4e 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -17,6 +17,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-metrics.h>
 
 void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 {
@@ -38,6 +39,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	INIT_LIST_HEAD(&fh->subscribed);
 	fh->sequence = -1;
 	mutex_init(&fh->subscribe_lock);
+	v4l2_metrics_init(&fh->metrics);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
 
@@ -88,6 +90,7 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
 	v4l2_event_unsubscribe_all(fh);
 	mutex_destroy(&fh->subscribe_lock);
 	fh->vdev = NULL;
+	v4l2_metrics_exit(&fh->metrics);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_exit);
 
diff --git a/drivers/media/v4l2-core/v4l2-metrics.c b/drivers/media/v4l2-core/v4l2-metrics.c
new file mode 100644
index 000000000000..5de68c0f3969
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-metrics.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * v4l2-metrics.c
+ *
+ * V4L2 metrics management.
+ *
+ * Maintain a per-file handle list of metrics about the hardware and handle
+ * exposing it in the fdinfo.
+ *
+ * Copyright (C) 2026 Collabora.
+ *
+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include <linux/types.h>
+#include <linux/seq_file.h>
+#include <linux/clk.h>
+#include <media/v4l2-metrics.h>
+
+static const char * const driver_type_name[] = {
+	[V4L2_DRIVER_TYPE_UNKNOWN] = "unknown",
+	[V4L2_DRIVER_TYPE_STATELESS_ENCODER] = "stateless-encoder",
+	[V4L2_DRIVER_TYPE_STATELESS_DECODER] = "stateless-decoder",
+};
+
+void v4l2_metrics_init(struct v4l2_metrics *metrics)
+{
+	metrics->hw_usage_time = 0;
+	metrics->hw_usage_cycles = 0;
+	metrics->has_hw_usage_cycles = false;
+	metrics->driver_type = V4L2_DRIVER_TYPE_UNKNOWN;
+}
+
+void v4l2_metrics_exit(struct v4l2_metrics *metrics)
+{
+}
+
+void v4l2_metrics_update_hw_time(struct v4l2_metrics *metrics, u64 time_ns)
+{
+	metrics->hw_usage_time += time_ns;
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_update_hw_time);
+
+void v4l2_metrics_update_hw_cycles(struct v4l2_metrics *metrics, u64 cycles)
+{
+	metrics->hw_usage_cycles += cycles;
+	metrics->has_hw_usage_cycles = true;
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_update_hw_cycles);
+
+void v4l2_metrics_set_driver_type(struct v4l2_metrics *metrics, enum v4l2_driver_type type)
+{
+	if (type >= V4L2_DRIVER_TYPE_COUNT)
+		return;
+
+	metrics->driver_type = type;
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_set_driver_type);
+
+void v4l2_metrics_show(struct v4l2_metrics *metrics, struct seq_file *m, unsigned int core_id)
+{
+	seq_printf(m, "v4l2-driver-type:\t%s\n", driver_type_name[metrics->driver_type]);
+	seq_printf(m, "v4l2-core-usage-time-%u:\t%llu ns\n", core_id, metrics->hw_usage_time);
+
+	if (metrics->has_hw_usage_cycles)
+		seq_printf(m, "v4l2-core-usage-cycles-%u:\t%llu\n",
+			   core_id, metrics->hw_usage_cycles);
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_show);
+
+void v4l2_metrics_show_clock(struct seq_file *m, struct clk *clk, unsigned int core_id)
+{
+	seq_printf(m, "v4l2-maxfreq-%u:\t%lu Hz\n",
+		   core_id, clk_get_rate(clk));
+	seq_printf(m, "v4l2-curfreq-%u:\t%lu Hz\n",
+		   core_id, clk_get_rate(clk));
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_show_clock);
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7e..4f1ca1bbc61f 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -17,6 +17,7 @@
 #include <linux/kconfig.h>
 #include <linux/list.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-metrics.h>
 
 struct video_device;
 struct v4l2_ctrl_handler;
@@ -27,6 +28,7 @@ struct v4l2_ctrl_handler;
  * @list: list of file handlers
  * @vdev: pointer to &struct video_device
  * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
+ * @metrics: metrics information for this handle
  * @prio: priority of the file handler, as defined by &enum v4l2_priority
  *
  * @wait: event' s wait queue
@@ -43,6 +45,7 @@ struct v4l2_fh {
 	struct list_head	list;
 	struct video_device	*vdev;
 	struct v4l2_ctrl_handler *ctrl_handler;
+	struct v4l2_metrics	metrics;
 	enum v4l2_priority	prio;
 
 	/* Events */
diff --git a/include/media/v4l2-metrics.h b/include/media/v4l2-metrics.h
new file mode 100644
index 000000000000..fc493b65f117
--- /dev/null
+++ b/include/media/v4l2-metrics.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * v4l2-metrics.h
+ *
+ * V4L2 metrics management.
+ *
+ * Maintain a per-file handle list of statistics about the hardware and handle
+ * exposing it in the fdinfo.
+ *
+ * Copyright (C) 2026 Collabora.
+ *
+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
+ */
+#ifndef V4L2_METRICS_H
+#define V4L2_METRICS_H
+
+#include <linux/types.h>
+
+struct clk;
+struct seq_file;
+
+enum v4l2_driver_type {
+	V4L2_DRIVER_TYPE_UNKNOWN = 0,
+	V4L2_DRIVER_TYPE_STATELESS_ENCODER,
+	V4L2_DRIVER_TYPE_STATELESS_DECODER,
+
+	V4L2_DRIVER_TYPE_COUNT,
+};
+
+struct v4l2_metrics {
+	u64 hw_usage_time;
+	u64 hw_usage_cycles;
+	bool has_hw_usage_cycles;
+	enum v4l2_driver_type driver_type;
+};
+
+void v4l2_metrics_init(struct v4l2_metrics *metrics);
+void v4l2_metrics_exit(struct v4l2_metrics *metrics);
+
+void v4l2_metrics_update_hw_time(struct v4l2_metrics *metrics, u64 time_ns);
+void v4l2_metrics_update_hw_cycles(struct v4l2_metrics *metrics, u64 cycles);
+void v4l2_metrics_set_driver_type(struct v4l2_metrics *metrics, enum v4l2_driver_type type);
+
+void v4l2_metrics_show(struct v4l2_metrics *metrics, struct seq_file *m, unsigned int core_id);
+void v4l2_metrics_show_clock(struct seq_file *m, struct clk *clk, unsigned int core_id);
+
+#endif /* V4L2_METRICS_H */

-- 
2.56.1


