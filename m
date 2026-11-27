Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF446606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aTwx5boD;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qkyioOM0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gjdrx3euSiAEMErutY0JYjYN2n45z1n7UHc3QAAko7c=; b=aTwx5boDTtMRSu
	DecWV5nanqPhIr+FndwNvBnCWB9tZXSA3z4IsG8YjUszgf+RlNCOOG2zbb/LGvuoh1lFiDTfvAmOv
	i/2DB7c2Mr/etHgDeflZLNzhj5/jSPM6BzE0D3TR3GPWm4BHVebp4oQzxRXp1TdcQiBg+G/gHNYUT
	1V3xHpaSEqXx49rFOlaa4K8gs7tg9phmCYqTD32zMzxcX1MzGYmkjAXv9sbIxvaSuJcRXcLmlfmm8
	cgbLt1Idt3br4eitOXUfbI25T0VhuG5uh+HERjc4LdFNlxWf3hOQ3gbsa0kO2EVmE+lZC1LyPdk62
	3G1Tm6M+qiT+UtqzlT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzYf-0000000HDvN-0kyg;
	Fri, 27 Nov 2026 17:16:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzYY-0000000HDrw-0sX4;
	Fri, 27 Nov 2026 17:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795799776;
	bh=bVBUXX8330ifIeLBo2AGrlc80cOvc2VojVyWCTAozGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qkyioOM0Vu3FMmd/r6dkM6vQgh/nSAT355dK/TEUEQirRn0O0J2SYB+cKPPJn2P6f
	 0phk7FtOdxuuUFzfKudjeoKU2OY3W3bUfQBtNIH3bUZadpVGgLbUdTguDhQlr+gXcE
	 LNTnmBhgFa/UFJGAiF3vbmDmkH/Q1QVR7ZX5obx8G3ACXVl0qqxx+sdhBfZjJa5uM4
	 MHQmTl1b/F1HfOX8e5Ku1+iRVLEQCO3xpf8Ak99/vM73A3lyIZsyYSf8QbpCXoi1k1
	 F6er5cmrAh7bdupIXg+XoyI7+tXpH87b9FxYHOrwwyAEOFn11X82BdP3FYgSy85IBB
	 7WbpabrBrwk5g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 44C8617E07FF;
	Fri, 27 Nov 2026 18:16:14 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Nov 2026 12:16:10 -0500
Subject: [PATCH v2 1/4] media: Add a v4l2 memory allocations tracker
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-v4l2-add-mem-tracker-v2-1-73b0494260e7@collabora.com>
References: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
In-Reply-To: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_091620_851958_D0317E5E 
X-CRM114-Status: GOOD (  30.06  )
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

This is a wrapper around dma allocation functions to keep track of
allocated buffers and expose the list through a per v4l2 device debugfs.

This currently doesn't support all kind of memory allocation, only
dma_alloc_attrs.

The wrapper can therefore be used by drivers, but also by the vb2
allocation functions, so that all buffers are accounted for.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/common/videobuf2/videobuf2-dma-contig.c  |  24 ++-
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-allocator.c           | 181 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-device.c              |   4 +-
 include/media/v4l2-allocator.h                     |  26 +++
 include/media/v4l2-device.h                        |   3 +
 include/media/videobuf2-core.h                     |   4 +
 7 files changed, 235 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 9ce6284cd5f2..b6b7ddc96b9c 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -22,6 +22,7 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-memops.h>
+#include <media/v4l2-allocator.h>
 
 struct vb2_dc_buf {
 	struct device			*dev;
@@ -43,6 +44,7 @@ struct vb2_dc_buf {
 	struct dma_buf_attachment	*db_attach;
 
 	struct vb2_buffer		*vb;
+	struct v4l2_device		*v4l2_dev;
 	bool				non_coherent_mem;
 };
 
@@ -181,8 +183,10 @@ static void vb2_dc_put(void *buf_priv)
 			sg_free_table(buf->sgt_base);
 			kfree(buf->sgt_base);
 		}
-		dma_free_attrs(buf->dev, buf->size, buf->cookie,
-			       buf->dma_addr, buf->attrs);
+
+		v4l2_dma_free_attrs(buf->v4l2_dev, buf->dev, buf->size, buf->cookie,
+				    buf->dma_addr, buf->attrs);
+
 	}
 	put_device(buf->dev);
 	kfree(buf);
@@ -191,12 +195,17 @@ static void vb2_dc_put(void *buf_priv)
 static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
 {
 	struct vb2_queue *q = buf->vb->vb2_queue;
+	char name[64] = {0};
+
+	sprintf(name, "%s-%d", q->name, buf->vb->index);
 
-	buf->cookie = dma_alloc_attrs(buf->dev,
-				      buf->size,
-				      &buf->dma_addr,
-				      GFP_KERNEL | q->gfp_flags,
-				      buf->attrs);
+	buf->cookie = v4l2_dma_alloc_attrs(buf->v4l2_dev,
+					   buf->dev,
+					   buf->size,
+					   &buf->dma_addr,
+					   GFP_KERNEL | q->gfp_flags,
+					   buf->attrs,
+					   name);
 	if (!buf->cookie)
 		return -ENOMEM;
 
@@ -246,6 +255,7 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
 	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->vb = vb;
 	buf->non_coherent_mem = vb->vb2_queue->non_coherent_mem;
+	buf->v4l2_dev = vb->vb2_queue->v4l2_dev;
 
 	buf->size = size;
 	/* Prevent the device from being released while the buffer is used */
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 329f0eadce99..be53dc1de493 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -9,6 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
 tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
+			v4l2-allocator.o \
 			v4l2-event.o v4l2-subdev.o v4l2-common.o \
 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
diff --git a/drivers/media/v4l2-core/v4l2-allocator.c b/drivers/media/v4l2-core/v4l2-allocator.c
new file mode 100644
index 000000000000..d600e0591501
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-allocator.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <media/v4l2-allocator.h>
+#include <media/v4l2-device.h>
+
+#include <linux/types.h>
+#include <linux/debugfs.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/seq_file.h>
+
+#define ENTRY_NAME_LEN	64
+
+struct v4l2_allocator {
+	struct list_head list;
+	// Serializes access to the allocation list
+	struct mutex lock;
+	struct dentry *debugfs_dir;
+	struct dentry *debugfs_entry;
+};
+
+struct v4l2_allocator_entry {
+	struct list_head list;
+	size_t size;
+	dma_addr_t dma_addr;
+	char name[ENTRY_NAME_LEN];
+	char creator[TASK_COMM_LEN];
+	pid_t tgid;
+	u16 fd;
+};
+
+#ifdef CONFIG_DEBUG_FS
+static int v4l2_allocator_debugfs_show(struct seq_file *m, void *data)
+{
+	struct v4l2_device *v4l2_dev = m->private;
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry;
+	size_t total_size = 0;
+
+	if (!allocator)
+		return 0;
+
+	seq_puts(m, "created-by                      fd              pid             size            label\n");
+	seq_puts(m, "-------------------------------------------------------------------------------------\n");
+	mutex_lock(&allocator->lock);
+	list_for_each_entry(entry, &allocator->list, list) {
+		seq_printf(m, "%-32s%-16u%-16u%-16zu%s\n",
+			   entry->creator,
+			   entry->fd,
+			   entry->tgid,
+			   entry->size,
+			   entry->name);
+		total_size += entry->size;
+	}
+	mutex_unlock(&allocator->lock);
+
+	seq_puts(m, "=====================================================================================\n");
+	seq_printf(m, "Total size: %zu\n", total_size);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(v4l2_allocator_debugfs);
+#endif
+
+int v4l2_allocator_init(struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_allocator *allocator;
+	struct dentry *v4l2_debugfs_dir;
+
+	allocator = kzalloc_obj(*allocator);
+	if (!allocator)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&allocator->list);
+	mutex_init(&allocator->lock);
+	v4l2_dev->v4l2_allocator = allocator;
+
+	v4l2_debugfs_dir = v4l2_debugfs_root();
+
+	allocator->debugfs_dir = debugfs_create_dir(dev_name(v4l2_dev->dev),
+						    v4l2_debugfs_dir);
+	allocator->debugfs_entry = debugfs_create_file("mem", 0444,
+						       allocator->debugfs_dir,
+						       v4l2_dev,
+						       &v4l2_allocator_debugfs_fops);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_allocator_init);
+
+void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry, *tmp;
+
+	if (allocator) {
+		debugfs_remove(allocator->debugfs_entry);
+		debugfs_remove(allocator->debugfs_dir);
+		mutex_lock(&allocator->lock);
+		list_for_each_entry_safe(entry, tmp, &allocator->list, list) {
+			list_del(&entry->list);
+			kfree(entry);
+		}
+		mutex_unlock(&allocator->lock);
+		mutex_destroy(&allocator->lock);
+		kfree(allocator);
+		v4l2_dev->v4l2_allocator = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_allocator_cleanup);
+
+static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
+			      dma_addr_t dma_addr, const char *name)
+{
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry;
+
+	if (!allocator)
+		return -EINVAL;
+
+	entry = kzalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->size = size;
+	entry->dma_addr = dma_addr;
+	strscpy(entry->name, name, sizeof(entry->name));
+	get_task_comm(entry->creator, current->group_leader);
+	entry->tgid = current->tgid;
+
+	mutex_lock(&allocator->lock);
+	list_add(&entry->list, &allocator->list);
+	mutex_unlock(&allocator->lock);
+
+	return 0;
+}
+
+static void v4l2_allocator_remove(struct v4l2_device *v4l2_dev, size_t size, dma_addr_t dma_addr)
+{
+	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
+	struct v4l2_allocator_entry *entry, *tmp;
+
+	if (!allocator)
+		return;
+
+	mutex_lock(&allocator->lock);
+	list_for_each_entry_safe(entry, tmp, &allocator->list, list) {
+		if (entry->size == size && entry->dma_addr == dma_addr) {
+			list_del(&entry->list);
+			mutex_unlock(&allocator->lock);
+			kfree(entry);
+			return;
+		}
+	}
+	mutex_unlock(&allocator->lock);
+}
+
+void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			   size_t size, dma_addr_t *dma_handle,
+			   gfp_t flag, unsigned long attrs, const char *name)
+{
+	void *ret = dma_alloc_attrs(dev, size, dma_handle, flag, attrs);
+
+	if (ret && v4l2_dev)
+		v4l2_allocator_add(v4l2_dev, size, *dma_handle, name);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_dma_alloc_attrs);
+
+void v4l2_dma_free_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			 size_t size, void *cpu_addr,
+			 dma_addr_t dma_handle, unsigned long attrs)
+{
+	if (v4l2_dev)
+		v4l2_allocator_remove(v4l2_dev, size, dma_handle);
+
+	dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
+}
+EXPORT_SYMBOL_GPL(v4l2_dma_free_attrs);
+
diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 67e3073de132..3cce2b4bc4c7 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -13,6 +13,7 @@
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-allocator.h>
 
 int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
 {
@@ -38,7 +39,7 @@ int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
 			dev->driver->name, dev_name(dev));
 	if (!dev_get_drvdata(dev))
 		dev_set_drvdata(dev, v4l2_dev);
-	return 0;
+	return v4l2_allocator_init(v4l2_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_device_register);
 
@@ -93,6 +94,7 @@ void v4l2_device_unregister(struct v4l2_device *v4l2_dev)
 	 * unregistered before. */
 	if (v4l2_dev == NULL || !v4l2_dev->name[0])
 		return;
+	v4l2_allocator_cleanup(v4l2_dev);
 	v4l2_device_disconnect(v4l2_dev);
 
 	/* Unregister subdevs */
diff --git a/include/media/v4l2-allocator.h b/include/media/v4l2-allocator.h
new file mode 100644
index 000000000000..f3fe0da10321
--- /dev/null
+++ b/include/media/v4l2-allocator.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * V4L2 Memory Allocator - Track memory allocations and deallocations in the v4l2 device.
+ *
+ * It provides functions to allocate and free memory while keeping
+ * track of the allocations for debugging and analysis purposes.
+ *
+ * Copyright 2026 Collabora, Ltd.
+ *   Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+
+#include <media/v4l2-device.h>
+
+int v4l2_allocator_init(struct v4l2_device *v4l2_dev);
+void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev);
+
+void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			   size_t size, dma_addr_t *dma_handle,
+			   gfp_t flag, unsigned long attrs, const char *name);
+
+void v4l2_dma_free_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
+			 size_t size, void *cpu_addr,
+			 dma_addr_t dma_handle, unsigned long attrs);
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8db0..cefc90adc93d 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -14,6 +14,7 @@
 #include <media/v4l2-dev.h>
 
 struct v4l2_ctrl_handler;
+struct v4l2_allocator;
 
 /**
  * struct v4l2_device - main struct to for V4L2 device drivers
@@ -21,6 +22,7 @@ struct v4l2_ctrl_handler;
  * @dev: pointer to struct device.
  * @mdev: pointer to struct media_device, may be NULL.
  * @subdevs: used to keep track of the registered subdevs
+ * @v4l2_allocator: V4L2 buffer allocation tracking
  * @lock: lock this struct; can be used by the driver as well
  *	if this struct is embedded into a larger struct.
  * @name: unique device name, by default the driver name + bus ID
@@ -46,6 +48,7 @@ struct v4l2_device {
 	struct device *dev;
 	struct media_device *mdev;
 	struct list_head subdevs;
+	struct v4l2_allocator *v4l2_allocator;
 	spinlock_t lock;
 	char name[36];
 	void (*notify)(struct v4l2_subdev *sd,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..dc5572cf41c8 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <media/media-request.h>
 #include <media/frame_vector.h>
+#include <media/v4l2-device.h>
 
 #define VB2_MAX_FRAME	(32)
 #define VB2_MAX_PLANES	(8)
@@ -479,6 +480,8 @@ struct vb2_buf_ops {
  * @io_modes:	supported io methods (see &enum vb2_io_modes).
  * @dev:	device to use for the default allocation context if the driver
  *		doesn't fill in the @alloc_devs array.
+ * @v4l2_dev:	the v4l2 device associated with this queue.
+ * @v4l2_fh:	the v4l2 filehandle associated with this queue.
  * @dma_attrs:	DMA attributes to use for the DMA.
  * @bidirectional: when this flag is set the DMA direction for the buffers of
  *		this queue will be overridden with %DMA_BIDIRECTIONAL direction.
@@ -602,6 +605,7 @@ struct vb2_queue {
 	unsigned int			type;
 	unsigned int			io_modes;
 	struct device			*dev;
+	struct v4l2_device		*v4l2_dev;
 	unsigned long			dma_attrs;
 	unsigned int			bidirectional:1;
 	unsigned int			fileio_read_once:1;

-- 
2.56.1


