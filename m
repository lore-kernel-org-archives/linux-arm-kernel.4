Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IN5fGodU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mgHFmnGC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=; b=IN5fGodUYqy4j8hjX4HNG8i8tV
	WB6dvk8nQNhx3cx3jCYo318ksYXdfJqNWNUYZRvlw1KiwkB2wZs5WqdIZVmNExkbQdwuG2r5sgfv1
	c8pxEqhPDA3viDL73fQEPupE0I5mQNj9IhMRmIiMoOtMWxbxYi9q6u9z/sigWy1eG0fK4k4iEx9hu
	OEhxxEpHI4WyLJTwOkS1ZrBPVqdnogjceRMT/hD/A9UhyH394xIcbqkOeSlFoBx7bKQQmVOqgs5P+
	DSPTMor2cRKQFrFFxCrrOxjjuhJCHp4hIgbjyz/XdzxrEW2aPm/5rDNGc85uLwPwzeJ7wqqykhNv8
	LFLUkI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXGd-0000000Co3b-1XX9;
	Thu, 26 Nov 2026 11:03:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXGC-0000000Cnjg-3nAY;
	Thu, 26 Nov 2026 11:03:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAB3261215;
	Thu, 26 Nov 2026 11:03:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795691007;
	b=Vo1ZN57EBLZLeC8cR4R0qHGJUg28kZVgt6xxin+mLyfQEoKWMafDJ8eBmCpqWa1LuRCi
	 wMs2m81Kzyxvd7ecacyg9P4xkf+NHOnUFcvxcZA7AddbjNPphZ6MFOqGto4ZexqO1Awuh
	 sIFM1gQ5JIG6sh5vGOQLozf7Ck0955Gv6D30G0rpckSTqzKB9QshQFlEnBaaGZrhrfZSS
	 bpx/jR6aiN6Uu2MRvfpqhzcnJOXvD+u/3SltVd3W9nYpEaNgp1Nn7uxUo7VykMlCwN88v
	 Hna3rfnZJ6fFAU4ItGWqPi89J7RUwOjkDHUC7aHG9o6TE8KOqruQfRwHE0sLR6YwyWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795691007;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=;
	b=xWy+/vLkaEEkDn9QDsbnm5c+8tdkE9hMkXEF/GP8i2vDGw5s+E7j1CH+bzjtEzL0sulK
	 hMo2s+3QgTrDrzm2SHjI7PqH9pu7CNv1NnmrjoBBEVF04YWskJe8RZ2a7B8nNUW5Bp8E3
	 Ca7KDOvB2TtQcLUcimBsZSCHw/gT0YTL6cdYn/BTJrkT1ymuJIH6w3t0o586s3NX74Ml0
	 nrMgQYWGnh4X8fkIkydrIhaqZzmKX3t8MmK70FLWoijnnd7251ALB0VGBOK6uRiSw+Eky
	 FzudkqshWOYBcyXMAK8ZQglNo2IO4JnxYTLERKtr/FVCzt/zFym82gaNeU14cUk0edA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DF6B1F000D4;
	Thu, 26 Nov 2026 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691007;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mgHFmnGC7fACOy3Hdu0uvWmC3f785tjie4DQG42JrxsnvaZnbxCiGbCEQqCaSpX1Y
	 Rv1dHnMlbW3OsOiJUzKeGRqtEAAIkE8Im2u3dFaVUW4vAaFsoMqJBwXZhK0T0jKyCH
	 Cb09stwzT/6/OvsD4xO13jWduYnSN5vtPMsBRoP8GBaKtWAQPoZa3adb7W+qe/LTFE
	 0Pc0a75YBXqldRH59ZP3KLTY6Nfv74/xhuB4FtTv14L3mh+GiuABIX2E8uufabUrZZ
	 M2WH2scfjyVtY/HbwD/8j4TtkYIIyp+Plqba0MBufQnWT2OjLB2KP5BEsYkvSyXC3b
	 nQtRwm55XAj0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A79524D455;
	Thu, 26 Nov 2026 11:03:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 11:03:05 +0000
Subject: [PATCH v4 1/2] media: verisilicon: Don't report VDPU2 decoder
 errors as success
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-vdpu2-errreset-v4-1-a955b1c8b119@gmail.com>
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
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690985; l=1243;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pmz+6zoUL7toWQYosmuS4NH+xU1lJuYNQV3oDGrhPbs=;
 b=DEStn0VuMYYalnHWXWiI2Ci1QtGZ6l15ksPa6fkPcn1hsRLbbnfxPxD1OKLfrvDfivHlC8SCF
 pS6PcqzgSR5BxKJAeBSFE4ZSfKWOlJbjGR2JmWiSdaYRJg1dgnUvek9
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

The VDPU2 interrupt handler completes the job as done whenever the
decoder raised an interrupt. DEC_IRQ is set for every interrupt,
including timeouts, bus errors and stream errors, so failed decodes
are returned to userspace as valid frames.

Check the picture ready bit instead, as the G1 handler does.

Fixes: 879dee56a40c ("media: rockchip/vpu: Add MPEG2 decoding support to RK3399")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..4bc1bdb41c70 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -391,7 +391,7 @@ static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
 	u32 status;
 
 	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
-	state = (status & VDPU_REG_INTERRUPT_DEC_IRQ) ?
+	state = (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
 
 	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);

-- 
2.55.0



