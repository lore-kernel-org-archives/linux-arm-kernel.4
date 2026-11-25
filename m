Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+pBSMCX;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=H/wn2Dhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=irgmmItnIcv+NCSLi3q2cVon1bQLXokEs1Jc5hW5B18=; b=k+pBSMCXGGAODQ
	UNobbL3dhQgIVaRXa9bRzlHgIB6y/13SK/2hO8NX72NnNQH6SwzO2guuFNPmbkOSXRKZSWPHZk5PD
	T3o8kphcnNcf/66RX1edY3JOm5ICCnm5yoqCrbIbep7BiNTb7IfUxIvsH2YAdAibdWtYtDzBrP4Cy
	AzH9YFPgDuiTuhgo3JTbZt5x+KdlOFfZBG18OSCETc2h6XldspQGNrMIIKr3PSxhNDARZm1aNLDNO
	HD07uQ//bEb+RvRycvrI4/nYCSAYux8RVV1E3B2Y5Xq4Vz7CAI+pYVzHwl00kkLAw0tm/GdHy/WnX
	6g5DfCeBM/kCbKKr3CAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI0L-0000000B3W4-3wMf;
	Wed, 25 Nov 2026 18:46:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHzT-0000000B2uo-1Bme;
	Wed, 25 Nov 2026 18:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795632309;
	bh=AJIfwVf8wdiuFci8fQLP2oVwA2zvoSeP1nF8x4T09X4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H/wn2Dhh7v7Zb17P2TTy/8mcQyEHOVK/FYK4NmRuM8awgHMaqD7nfML42vzHB5Bc/
	 4pY98nQZy1cgrga6G4aq/uqYsQEOEtb4G/CdBWegNybN2lxR5jRu0XoVkMJ8C73AVd
	 HFnN0on24crH2BuFPOxKjJ1+yjQ5cm4Vg4Vf7COQ1DjEh89Qm9Nz+NqhgpN2XC3Zil
	 GmbrGY73QVb2DGd8I9rKV7oiPfblL6yyXjEaSGIQ7TMLJKr8cKxy+CQefQBKX6b6Yd
	 mCTrIRA95U1eMxEFz8zhHP23cheJI06XgWTpQkShfvMSoRvDs+gbKpLuJNLj5DYlco
	 KL+nwYGploW5g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6090917E0311;
	Wed, 25 Nov 2026 19:45:07 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 13:33:31 -0500
Subject: [PATCH v3 9/9] media: hantro: Add v4l2_hw run/done traces
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-ftrace-v3-9-1d1db48372ed@collabora.com>
References: <20261125-v4l2-add-ftrace-v3-0-1d1db48372ed@collabora.com>
In-Reply-To: <20261125-v4l2-add-ftrace-v3-0-1d1db48372ed@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_104511_548786_BC6CFCE4 
X-CRM114-Status: GOOD (  16.06  )
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

Add the trace calls as well as retrieving the number of clock cycles for
the rockchip_vpu core.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h               |  1 +
 drivers/media/platform/verisilicon/hantro_drv.c           | 14 +++++++++++++-
 drivers/media/platform/verisilicon/rockchip_vpu981_regs.h |  1 +
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c      |  4 ++++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..d5cddc783688 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -253,6 +253,7 @@ struct hantro_ctx {
 
 	u32 sequence_cap;
 	u32 sequence_out;
+	u32 hw_cycles;
 
 	const struct hantro_fmt *vpu_src_fmt;
 	struct v4l2_pix_format_mplane src_fmt;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 3734ea701145..54a078ac14e4 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -25,6 +25,8 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
+#include <trace/events/v4l2.h>
+
 #include "hantro_v4l2.h"
 #include "hantro.h"
 #include "hantro_hw.h"
@@ -100,6 +102,9 @@ void hantro_irq_done(struct hantro_dev *vpu,
 	struct hantro_ctx *ctx =
 		v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 
+	if (ctx)
+		trace_v4l2_hw_done(ctx->fh.tgid, ctx->fh.fd, ctx->hw_cycles);
+
 	/*
 	 * If cancel_delayed_work returns false
 	 * the timeout expired. The watchdog is running,
@@ -122,6 +127,9 @@ void hantro_watchdog(struct work_struct *work)
 	ctx = v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 	if (ctx) {
 		vpu_err("frame processing timed out!\n");
+
+		trace_v4l2_hw_done(ctx->fh.tgid, ctx->fh.fd, ctx->hw_cycles);
+
 		if (ctx->codec_ops->reset)
 			ctx->codec_ops->reset(ctx);
 		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
@@ -183,8 +191,12 @@ static void device_run(void *priv)
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
 	ret = ctx->codec_ops->run(ctx);
-	if (ret)
+	if (ret) {
 		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	trace_v4l2_hw_run(ctx->fh.tgid, ctx->fh.fd);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
index e4008da64f19..96b85470208b 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
@@ -451,6 +451,7 @@
 #define av1_pp0_dup_ver			AV1_DEC_REG(394, 16, 0xff)
 #define av1_pp0_dup_hor			AV1_DEC_REG(394, 24, 0xff)
 
+#define AV1_CYCLE_COUNT			(AV1_SWREG(63))
 #define AV1_TILE_OUT_LU			(AV1_SWREG(65))
 #define AV1_REFERENCE_Y(i)		(AV1_SWREG(67) + ((i) * 0x8))
 #define AV1_SEGMENTATION		(AV1_SWREG(81))
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..f959151b6645 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -424,6 +424,8 @@ static irqreturn_t rk3588_vpu981_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
+	struct hantro_ctx *ctx =
+		v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 	u32 status;
 
 	status = vdpu_read(vpu, AV1_REG_INTERRUPT);
@@ -433,6 +435,8 @@ static irqreturn_t rk3588_vpu981_irq(int irq, void *dev_id)
 	vdpu_write(vpu, 0, AV1_REG_INTERRUPT);
 	vdpu_write(vpu, AV1_REG_CONFIG_DEC_CLK_GATE_E, AV1_REG_CONFIG);
 
+	ctx->hw_cycles = vdpu_read(vpu, AV1_CYCLE_COUNT);
+
 	hantro_irq_done(vpu, state);
 
 	return IRQ_HANDLED;

-- 
2.56.1


