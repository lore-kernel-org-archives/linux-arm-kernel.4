Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4340606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PNEUL4ip;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AoPuYpEg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PSgf6sZ4Qtawl85/N6yrprouFZukFIZKD96Hi7eveoI=; b=PNEUL4ipPG4b50
	vrRfXzGJDtIDX2ivBPB9PUnBeAAMekV8bN/I1O5T32kgJpXJFGK2e6HE6WzUgZpfeZ32Y+pxZ47Cp
	ZGdZpmJ2TL2HwMbGhYofWfdJue25UBH77933XwWtBII+FbREdsfNKojl9N/hzt2aZIJQ23H3LdG9o
	4TZBQrD7Uhg6M7Lk0BiUeFO2KZCYCocMtsjVpEc/3Jd8WMbfWIXfsFGJaiX7veFvORoIiksSklzMt
	909F4iYzlEbOWVIHxda6VAthCKA6nh9R5uZXZ7N+xfF7WBtLg7BWFepv2ahKsO8lyItGpnXveD4/B
	embE+5fkHVUf96BXs1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEi3-0000000AJKe-0Fm8;
	Wed, 25 Nov 2026 15:14:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEhU-0000000AJ2w-3axL;
	Wed, 25 Nov 2026 15:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619662;
	bh=tBuZgwzt7+tIWp9kUOKRVQyHT1nAxNT4CFenV+1jQGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AoPuYpEg952pRBEfI7ge8wHcg98UqA/cL7JLli864A6UNuql3FWr4K4UwmGzMRgIS
	 QEQPZa87q3J6cOFRjAcxYHCPXUylcD6OeusWnWq5TweEfq+9ubYhhNEorL5jv8XaBo
	 K3Rx9z0Ln2FYImDawOU5qyOPrAfIBvblaRcP0FkaOpA88WxDdOt4dlY1H5zDYR9A2/
	 O2C3s5iXkRiQPqtXz4oV3elLyJU7e8gZ5TNwzl+S5hRp+u6/9pZy8H5rkaobWry2Bb
	 dyuSg9slOnDNxs7lnKOFyf7qAqDHenOcTUenyweIicrdICApbbkSMrAEf9MLNVj1Gq
	 Dihuv5YaXDqPg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C98D17E120C;
	Wed, 25 Nov 2026 16:14:21 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 10:12:01 -0500
Subject: [PATCH v4 4/5] media: hantro: Add per-context fdinfo usage metrics
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-fdinfo-v4-4-2dc73fad9932@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_071425_084028_F16B8120 
X-CRM114-Status: GOOD (  16.70  )
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

From: Christopher Healy <healych@amazon.com>

Add VPU981 hardware utilization metrics to the Hantro VPU stateless
codec driver, exposed via v4l2_metrics.

Update the v4l2_metrics instance each time a job completes with the
time it took in ns and the nuber of cycles reported by the hardware.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h           |  4 ++++
 drivers/media/platform/verisilicon/hantro_drv.c       | 19 +++++++++++++++++++
 drivers/media/platform/verisilicon/hantro_hw.h        |  1 +
 .../media/platform/verisilicon/rockchip_vpu981_regs.h |  1 +
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c  |  6 ++++++
 5 files changed, 31 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..2c136350d37a 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/ktime.h>
 #include <linux/reset.h>
 
 #include <media/v4l2-ctrls.h>
@@ -236,6 +237,7 @@ struct hantro_dev {
  * @bit_depth:		Bit depth of current frame
  * @need_postproc:	Set to true if the bitstream features require to
  *			use the post-processor.
+ * @start_time:		The time at which the running job has been started.
  *
  * @codec_ops:		Set of operations related to codec mode.
  * @postproc:		Post-processing context.
@@ -268,6 +270,8 @@ struct hantro_ctx {
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
 
+	ktime_t start_time;
+
 	/* Specific for particular codec modes. */
 	union {
 		struct hantro_h264_dec_hw_ctx h264_dec;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 3734ea701145..6b57343ec062 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -21,6 +21,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-metrics.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
@@ -90,6 +91,9 @@ static void hantro_job_finish(struct hantro_ctx *ctx,
 {
 	struct hantro_dev *vpu = ctx->dev;
 
+	v4l2_metrics_update_hw_time(&ctx->fh.metrics,
+				    ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time)));
+
 	pm_runtime_put_autosuspend(vpu->dev);
 	hantro_job_finish_no_pm(ctx, result);
 }
@@ -182,6 +186,8 @@ static void device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
+	ctx->start_time = ktime_get();
+
 	ret = ctx->codec_ops->run(ctx);
 	if (ret)
 		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
@@ -656,6 +662,9 @@ static int hantro_open(struct file *filp)
 
 	v4l2_fh_init(&ctx->fh, vdev);
 	v4l2_fh_add(&ctx->fh, filp);
+	v4l2_metrics_set_driver_type(&ctx->fh.metrics,
+				     ctx->is_encoder ? V4L2_DRIVER_TYPE_STATELESS_ENCODER
+						     : V4L2_DRIVER_TYPE_STATELESS_DECODER);
 
 	hantro_reset_fmts(ctx);
 
@@ -693,10 +702,20 @@ static int hantro_release(struct file *filp)
 	return 0;
 }
 
+static void hantro_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct hantro_ctx *ctx = file_to_ctx(f);
+	struct hantro_dev *vpu = ctx->dev;
+
+	v4l2_metrics_show(&ctx->fh.metrics, m, 0);
+	v4l2_metrics_show_clock(m, vpu->clocks[0].clk, 0);
+}
+
 static const struct v4l2_file_operations hantro_fops = {
 	.owner = THIS_MODULE,
 	.open = hantro_open,
 	.release = hantro_release,
+	.show_fdinfo = hantro_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..7259ea89adcc 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -28,6 +28,7 @@
 #define FMT_MIN_WIDTH		48
 #define FMT_MIN_HEIGHT		48
 #define FMT_HD_WIDTH		1280
+
 #define FMT_HD_HEIGHT		720
 #define FMT_FHD_WIDTH		1920
 #define FMT_FHD_HEIGHT		1088
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
index e4008da64f19..5a1d1e1e941e 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
@@ -451,6 +451,7 @@
 #define av1_pp0_dup_ver			AV1_DEC_REG(394, 16, 0xff)
 #define av1_pp0_dup_hor			AV1_DEC_REG(394, 24, 0xff)
 
+#define AV1_CYCLE_COUNT                 (AV1_SWREG(63))
 #define AV1_TILE_OUT_LU			(AV1_SWREG(65))
 #define AV1_REFERENCE_Y(i)		(AV1_SWREG(67) + ((i) * 0x8))
 #define AV1_SEGMENTATION		(AV1_SWREG(81))
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..fd3081242685 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -423,13 +423,19 @@ static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
 static irqreturn_t rk3588_vpu981_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
+	struct hantro_ctx *ctx =
+		v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 	enum vb2_buffer_state state;
 	u32 status;
+	u32 cycles;
 
 	status = vdpu_read(vpu, AV1_REG_INTERRUPT);
 	state = (status & AV1_REG_INTERRUPT_DEC_RDY_INT) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
 
+	cycles = vdpu_read(vpu, AV1_CYCLE_COUNT);
+	v4l2_metrics_update_hw_cycles(&ctx->fh.metrics, cycles);
+
 	vdpu_write(vpu, 0, AV1_REG_INTERRUPT);
 	vdpu_write(vpu, AV1_REG_CONFIG_DEC_CLK_GATE_E, AV1_REG_CONFIG);
 

-- 
2.56.1


