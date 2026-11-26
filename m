Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HhsCIEa2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMebsQLU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3cNCNBFvY4O6VcT79LqZrUjKztBXaoAwqXMseCQ/dyQ=; b=HhsCIEa2Z/sNJkOFbA9/CiyQk4
	8WSo/a/EChorltXyIU4AP4XoMUrjKPZgm65zC6e5BBKZjVq+q3hK+t56UJSrv8D34e6GAfKbhM2RM
	tD+LX4fwkisimSG8aM/hHglzBr91PVL7ipX++sJtBUCARHGndPx0g5RcapZLIyXDKCPl+WdCyT15o
	si6LdQTh7qyC0F94N4qlh9tLDK1Kcks9S3sEmGLmHfCSuYead9wsG2O+DGTN7WCiQiT7J2EEYIKyJ
	H49cSdJRPqlZFELcuLOBLY43jHeGkaXLbWbIK08KRyCoP295JCOtH75GYEIxExBO8XyOaHxZiFcmp
	MgimMW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXGR-0000000CnvF-3y17;
	Thu, 26 Nov 2026 11:03:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXG6-0000000Cnh1-2ol7;
	Thu, 26 Nov 2026 11:03:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD5DC40AA8;
	Thu, 26 Nov 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795691001;
	b=s4+xcPJR7yFtBxhhaFOiRifIuXhm6fSkyw2l2hbm99TuQkrXgO20nWYOPGfgi5Ykd5wj
	 zn3sSSdJaJuKPWEwUGo+kEQ490FEgLULzS7T4+3DSW8ouO9wQYA0S7yzOFwj4Y0ZYvx2D
	 3gCrBMayn7LXCDln4DmEvgtZhMo665+syZR5gVzXWoUknzDOIrM+/0rJlV8D8BIO2UhLr
	 uWT+RtZwxlXNghBSWu6wQgVKPceS1fH31Gju5HKtcCXS2Aak6U+IAr/TbrcO6KzRLHchL
	 3RZu8H+N11FZ9TgK66m/o8b6GXGM4eSzQCa0AlCmvqZbBJhpPdU4ElylGw3s0ln+PLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795691001;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3cNCNBFvY4O6VcT79LqZrUjKztBXaoAwqXMseCQ/dyQ=;
	b=CpAKfZJnS1GgMccZkE5qkqdQkkpevGC+eaDESxpYBx88/v16QT9pYbph734ocPz92y9T
	 ilRZuZr8IT5bPDXW8MUtpkya9fqtFsUteaQsOz8234dG7t0hRy3T9QPICDj3uPcxCqUa6
	 02npN+3E1PBsbCCea9W9vxU57m107eWZ/Y0ekoftu/g2beNGHRxgLvus/NwloO3X1aKdb
	 KUpsEvJh92MkhiyhBJDnMVLWLlkyyrWD5u7YMO851eiBZPRtizEUGGrcUIMVzGd+Ms4qx
	 tqDKYqyNK3R46Ul5Xh7YOhBD/0YgbbLTvncqCKnWsZTwDYQxIT0W4A3r2yBKTWi21gQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57DFB1F000C6;
	Thu, 26 Nov 2026 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691001;
	bh=3cNCNBFvY4O6VcT79LqZrUjKztBXaoAwqXMseCQ/dyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VMebsQLUXDZQ4IAHcm1Q9hmaTXvccxJQm40sUX+MjHsqwcxuJiJEMO3WWf430nM2+
	 SKBdJ2YTw6BC0GEFQRQpo9rP8vUVQO56N9fqnTRSTgXZGNdk/5RsuR/m29fhYHKTMf
	 ZnXJqMIqPZDcrHjBwSOjr+/YJNLnVCKI9/7gDb30L42COhb9uZ3ttQmgIN3r+j15Zr
	 GGxWkQ7Mq/J2pFsENFgz8eW3HVdbJ10XV9hysPB3IIwHUQRsT9ZRPXKNxZQTtLf8Jd
	 S6niibDwYPJJJVidLiNObnBLpa9cfQTgPGQUwcTleRdBJHcDyQ+HG4gMrmPgRXEXjZ
	 FNUDAeD5k/uUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D4EB94D461;
	Thu, 26 Nov 2026 11:03:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 11:03:06 +0000
Subject: [PATCH v4 2/2] media: verisilicon: Reset the VDPU2 decoder after
 an error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-vdpu2-errreset-v4-2-a955b1c8b119@gmail.com>
References: <20261126-vdpu2-errreset-v4-0-a955b1c8b119@gmail.com>
In-Reply-To: <20261126-vdpu2-errreset-v4-0-a955b1c8b119@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690985; l=3990;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=TORRPWXC3iBgtHVwjl5GcrAeI92+toU+vqsHJf1bUUM=;
 b=q5SYi+x00w+QhyqAcfCqPAUb8vbpICcWTRhLfaSkZboRS6ZSlxE+icwYxvBQbjK7XOZ9xVbJy
 wsdbWt9z9ZxBBmQV209az8OsZcNacxbuBs7Uqh9p1WQqUQD6RTBuWv5
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

Ignore interrupts the decoder did not raise and report the error type.

After a bus, stream or ASO error or a timeout, soft-reset the decoder
before its buffers go back to userspace: it may still be active.
If only its input buffer ran empty, the decoder stays enabled; a later
interrupt or the driver's watchdog then ends the job.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../platform/verisilicon/rockchip_vpu2_regs.h      |  4 +++
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 40 +++++++++++++++++++---
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h
index 49e40889545b..d11c84a18161 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_regs.h
@@ -347,6 +347,10 @@
 #define     VDPU_REG_INTERRUPT_DEC_RDY_INT		BIT(4)
 #define     VDPU_REG_INTERRUPT_DEC_IRQ_DIS		BIT(1)
 #define     VDPU_REG_INTERRUPT_DEC_IRQ			BIT(0)
+#define     VDPU_REG_INTERRUPT_DEC_ERRORS		(VDPU_REG_INTERRUPT_DEC_TIMEOUT | \
+						 VDPU_REG_INTERRUPT_DEC_ERROR_INT | \
+						 VDPU_REG_INTERRUPT_DEC_ASO_INT | \
+						 VDPU_REG_INTERRUPT_DEC_BUS_INT)
 #define VDPU_REG_AXI_CTRL			0x0e0
 #define     VDPU_REG_AXI_DEC_SEL			BIT(23)
 #define     VDPU_REG_CONFIG_DEC_DATA_DISC_E		BIT(22)
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 4bc1bdb41c70..69552195c974 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/iopoll.h>
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
@@ -384,17 +385,49 @@ static irqreturn_t rockchip_vpu1_vepu_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void rockchip_vpu2_dec_soft_reset(struct hantro_dev *vpu)
+{
+	u32 val;
+
+	vdpu_write(vpu, 0, VDPU_REG_EN_FLAGS);
+	vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
+	if (read_poll_timeout_atomic(vdpu_read, val, !val, 0, 5, false, vpu,
+				     VDPU_REG_SOFT_RESET))
+		dev_warn_ratelimited(vpu->dev, "decoder soft reset timed out\n");
+}
+
 static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
-	u32 status;
+	u32 status, en;
 
 	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
+	if (!(status & VDPU_REG_INTERRUPT_DEC_IRQ))
+		return IRQ_NONE;
+
+	/* Read DEC_E with the status, before the clear. */
+	en = vdpu_read(vpu, VDPU_REG_EN_FLAGS);
+	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
+
 	state = (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+	if (state == VB2_BUF_STATE_ERROR) {
+		if (status & VDPU_REG_INTERRUPT_DEC_BUS_INT)
+			dev_warn_ratelimited(vpu->dev, "bus error detected.\n");
+		if (status & VDPU_REG_INTERRUPT_DEC_ERROR_INT)
+			dev_warn_ratelimited(vpu->dev, "decode error detected.\n");
+		if (status & VDPU_REG_INTERRUPT_DEC_TIMEOUT)
+			dev_warn_ratelimited(vpu->dev, "frame decode timed out.\n");
+
+		/* Buffer empty: a later interrupt or the watchdog ends the job. */
+		if (!(status & VDPU_REG_INTERRUPT_DEC_ERRORS) &&
+		    (en & VDPU_REG_INTERRUPT_DEC_E))
+			return IRQ_HANDLED;
+
+		rockchip_vpu2_dec_soft_reset(vpu);
+	}
 
-	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
 
 	hantro_irq_done(vpu, state);
@@ -482,8 +515,7 @@ static void rockchip_vpu2_dec_reset(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 
 	vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
-	vdpu_write(vpu, 0, VDPU_REG_EN_FLAGS);
-	vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
+	rockchip_vpu2_dec_soft_reset(vpu);
 }
 
 static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)

-- 
2.55.0



