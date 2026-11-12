Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D16606E988
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QMDmgyc6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOQw7D6L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/0/KMUceZYkpX3iI5TTZHsnLt8eSuwicqZLxVh4MxS4=; b=QMDmgyc6G8Uc7MSNL9Vp/Y/S2T
	xwf+zqXLkpaieDbdsoI9ZJ83+ANGmYAfL0Ja8PrwPbTmDL03IvGUm92lJynAIBd+RBo1GZHZQdrCL
	cUMgcf5PBV8vKIEGPtUFNaxiABbHbmal+6uDMtekXf+aE3Fq1Ny8tTNh/kTkGw0c64ki9zqCkbEfi
	1BNUdWK4bB2tgsEKg1DYVXn8gSmUiTTKIKpeBxlHMlYgZFE8okvmx/w2yddgPqK1dwxPH1kxOhOwB
	meBbdMUXkUbi5TKXqNpbntAKFoGAhZRKEHw/qQDkm9WaSrIx/4sKiP0Qt1GepPLQQmhxy1LF3GeXM
	MIuxkuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQDJ-000000097Wo-1B9d;
	Thu, 12 Nov 2026 08:31:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQCq-0000000970U-1oup;
	Thu, 12 Nov 2026 08:30:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F48D47115;
	Thu, 12 Nov 2026 08:30:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472252;
	b=sh1ldbMQ7c2XWkkZ8nNVcnfQSbJ7nKAKmjx6j8yvIUTt6EfTIE9yaUo8+3VC/6bWrKcT
	 vZJ9R3ZsWXObY6r/o0szw+Nvx5nJ7wS4Ng1FFGIxF96Gwaip+/DnbHW8HsPlNNyUJbiyD
	 Y9C1B/YzuzzFBkBT6E75AeWuWFcWKfbokavUJfGZfxa0T+FVQnG9460SYEgrC3zwL2q/K
	 5I1g6/+M9q8F4YPk2YytCUhCTMut+pBSFn2nK+ghS3c7FG/WxHuCESGfX9SOrtoRHdmAd
	 G1CxyCIuluYGn6tPLlut3F5JL8oWh1/Bhj+VaBpHFrAbSVIRyPwrhHZREQj+td8grlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472252;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/0/KMUceZYkpX3iI5TTZHsnLt8eSuwicqZLxVh4MxS4=;
	b=PHABhSqGpvnVTGpF2tN4G7WQrX/uI4jGZzJ5F4xERyJ2L3zETR9Z+WLI3ZCTH+U5ALbR
	 8oBnA5jSb/cvvYON3lUxHi9XiccQUPSm4ufYnKg9PxlXoYU4Zdh4DxH/Ru3fl+9HEG6+b
	 n0UGj26HuFto2nekhEdDNv1KA2RuHc366HoT7YIuEZCrO+nMbWkq7bLyrNriZbhd/etLF
	 KAnYEI4iEJEx6uE+Oaz7xQmvUv8kTP+L2KL7VBaxyZ/hu0ZyiUD8kUydr5x072/zDguim
	 LXD9Xs8KdAZg8r9BzFh2z82e4qoy+VJ35sLDcUEMRg/qtm43DI1qoS+FVqd/5cwmkTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACD5C1F00A0A;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472252;
	bh=/0/KMUceZYkpX3iI5TTZHsnLt8eSuwicqZLxVh4MxS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NOQw7D6LgmVQJIROcuj5se+45+BEG1g8d0du3oyNT0DTTYvAnciEdTUx0JqL5dF41
	 /C9HhjihaodxidivlEELhbqVfiio1jNBq/mdDOXiDMi1hwxeEuFagqSpPiV+rwXw87
	 jHy/4AOjJWy76EiuzU1sBP1GofdCDHgvZACGphZ8yohqyeU90BCcTSM0n2RZdHc6nH
	 H6wOEYnwlADcrWAeefpRg3Zlqt6xPLJ6JX9W1HeBEMg4sXFQWM92bH9wua/5Bul2EQ
	 tNTHETTsJslFL2k4sy1vmanMuRVXqtc4129Bki877H/T2J/BjeXREJqKrIYiOSeLut
	 w+nEfaCNgWNsg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3571D49385;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:30:50 +0000
Subject: [PATCH v2 4/6] media: verisilicon: Reset the Rockchip encoder
 cores on timeout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-hantro-robust-v2-4-18561fd48838@gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
In-Reply-To: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472247; l=3574;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=sjPXc3bh+wQfDnjkY+OSXFCX37DqawhQ7n2w7c2kMeI=;
 b=X9JO4sS2hnPO5AlElG30bo+AuIkk+YdlWqzzR6TgWIaYh3W4kX3RfhK1An5Hn7XdWa+zhO63t
 DNeTs8qlFkoDgel6eN+fQZkrni2wMDv5a+axTloX71BHl9cCItMiz//
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

On a job timeout, the Rockchip VEPU1 and VEPU2 reset operations mask the
interrupt and clear the encode enable and AXI control registers. That
only stops a core that is still responsive. On RK3588, when a VEPU121
core reads an IOVA that isn't mapped, the IOMMU reports a page fault and
the core never becomes idle again: its AXI transactions stay
outstanding, the IOMMU can't be stalled anymore ("Enable stall request
timed out", then "Disable paging request timed out" on runtime
suspend), every later job times out as well, and unbinding the driver
can lock up the system.

The driver already gets the optional reset lines of the device and
deasserts them at probe. Pulse them in the encoder reset operations,
after stopping the core through its registers, to return it to a clean
idle state. The clocks are still enabled at that point, as the job that
timed out holds them. This is a no-op on device trees that don't
describe the resets, which is the case for all of them so far.

The Rockchip BSP MPP driver resets these cores the same way, through
their AXI and AHB reset lines.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 5d4e46bd9cd6..114010d6a5c9 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
@@ -468,6 +469,33 @@ static void rk3066_vpu_dec_reset(struct hantro_ctx *ctx)
 	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
 }
 
+/*
+ * Stopping the encoder through its registers isn't enough when it is stuck
+ * on the bus, for instance after a translation fault in its IOMMU: it keeps
+ * AXI transactions outstanding and never becomes idle, which also prevents
+ * the IOMMU from stalling. Pulse the reset lines of the core, if the device
+ * tree describes them, to return it to its idle state.
+ */
+static void rockchip_vpu_enc_hw_reset(struct hantro_dev *vpu)
+{
+	int ret;
+
+	if (!vpu->resets)
+		return;
+
+	ret = reset_control_assert(vpu->resets);
+	if (ret) {
+		dev_warn(vpu->dev, "Failed to assert resets: %d\n", ret);
+		return;
+	}
+
+	udelay(5);
+
+	ret = reset_control_deassert(vpu->resets);
+	if (ret)
+		dev_err(vpu->dev, "Failed to deassert resets: %d\n", ret);
+}
+
 static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -475,6 +503,7 @@ static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
 	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
 	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+	rockchip_vpu_enc_hw_reset(vpu);
 	/*
 	 * The encoder runs don't write the interrupt register, only the
 	 * interrupt handler clears it after each frame. Clear it here too,
@@ -499,6 +528,7 @@ static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+	rockchip_vpu_enc_hw_reset(vpu);
 	/*
 	 * The encoder runs don't write the interrupt register, only the
 	 * interrupt handler clears it after each frame. Clear it here too,

-- 
2.55.0



