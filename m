Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E2606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XkRS5baY;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aj9wkuf9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qKStgZwQURkYirvMcrFHgwHoDBXf4cbgorTNw0h/b4k=; b=XkRS5baYjXg5ox
	e2dXf8fc07lDQsWdw3SqTW+sK4lQLZSQbjdrWK2RJ0dlNVz3dLDAv+UQANwiDrDdK3ZAnptIfPNg+
	LNaMEpwlzIT+H6CgMQoW3iiKFbW943ubSS78E1LyNpc5/YvY3POHdPKGglj1MiLr22WspLIneU4ow
	cXrXz5M95nmebyBhGhY63AZkPhEPhRB4ODTbla/sdTjkySmg35+2BVzrHmkdbRV0wyJOIa/eL+vIT
	RnvGXqWNLBE+AnnAKoXfiaP7Llm66zClVoilCYMULEvifkVvMenJur1TVchS/9KIpB205ddP9/pPQ
	Na9TkNv2HS7gKTRBf77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEiH-0000000AJOT-25Ln;
	Wed, 25 Nov 2026 15:15:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEhW-0000000AJ4H-1vQk;
	Wed, 25 Nov 2026 15:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619664;
	bh=5g72xFrgHxlQSNw1j1WuF55/AYxuBWjsHHYjMfQDYv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aj9wkuf9lqKu+f5419u812EMh28XnoNsfGJvUFwP8/PyrXU8UHlROx8S8P5AOkZLD
	 qjF2ChkzEV7tKkOa3soEGl7V8pCpXjUNGDlYYEIxzWUgtlEf/fjH34Fs+GjM3B3Rlk
	 PpMEstdzBNygwlwnP1ZR5QShTT8ZjZhPkQE7tjQ5NSgLyw6q1aIoiCukU+15TCXs4O
	 d2f220Ixri0oQB86PWbRas5C0EOMe1K8JG3IejK2mLPmXyGVyDZmXCZfo5jJYNVdRV
	 D8vDBebXZ1ie3VLfs5Z/y+AwJnXmI0dmviKUdvcdnYRMPwQvswrxVExHIAUE9tx2wh
	 kQdUkM8D7g/Bw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2480D17E130C;
	Wed, 25 Nov 2026 16:14:23 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 10:12:02 -0500
Subject: [PATCH v4 5/5] media: rkvdec: Add per-context fdinfo usage metrics
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-fdinfo-v4-5-2dc73fad9932@collabora.com>
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
X-CRM114-CacheID: sfid-20261125_071426_662823_458C24CD 
X-CRM114-Status: GOOD (  13.58  )
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

Add hardware utilization tracking to the rkvdec stateless codec driver,
exposed via v4l2_metrics.

Update the v4l2_metrics instance each time a job completes with the
time it took in ns.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 19 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5250dd59df2e..4c9c80ac591e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -25,6 +25,7 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-metrics.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
@@ -1094,6 +1095,9 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
+	v4l2_metrics_update_hw_time(&ctx->fh.metrics,
+				    ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time)));
+
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }
@@ -1174,6 +1178,8 @@ static void rkvdec_device_run(void *priv)
 		return;
 	}
 
+	ctx->start_time = ktime_get();
+
 	ret = desc->ops->run(ctx);
 	if (ret)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
@@ -1304,6 +1310,8 @@ static int rkvdec_open(struct file *filp)
 
 	v4l2_fh_add(&ctx->fh, filp);
 
+	v4l2_metrics_set_driver_type(&ctx->fh.metrics, V4L2_DRIVER_TYPE_STATELESS_DECODER);
+
 	return 0;
 
 err_cleanup_m2m_ctx:
@@ -1327,10 +1335,21 @@ static int rkvdec_release(struct file *filp)
 	return 0;
 }
 
+static void rkvdec_show_fdinfo(struct seq_file *m, struct file *file)
+{
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	struct rkvdec_dev *rkvdec = ctx->dev;
+
+	v4l2_metrics_show(&ctx->fh.metrics, m, 0);
+
+	v4l2_metrics_show_clock(m, rkvdec->axi_clk, 0);
+}
+
 static const struct v4l2_file_operations rkvdec_fops = {
 	.owner = THIS_MODULE,
 	.open = rkvdec_open,
 	.release = rkvdec_release,
+	.show_fdinfo = rkvdec_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..590e213bd800 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -157,6 +157,7 @@ struct rkvdec_ctx {
 	void *priv;
 	u8 has_sps_st_rps: 1;
 	u8 has_sps_lt_rps: 1;
+	ktime_t start_time;
 };
 
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)

-- 
2.56.1


