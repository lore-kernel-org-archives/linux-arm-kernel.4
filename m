Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 02:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SrE6uENf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aL0qb6rB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iTSjbrq786fqfXSMIohgj7aM6dRY7IeVnB+W9t0jy1w=; b=SrE6uENfC9P4hNGUQMBW+g5wlj
	pqCDZVLjJ6qiTAiHMWPYl3cuUQ4bUM4DP5S1gLsKsDbADjZSeRkgsGx0ujgSGfRVAUJ0ahYWsPeGi
	Re45jpoO5FjQ5W6DrkC0oS3apoypXTb50lYqj57+hOBO7Wvs/C0I/Z/5/b6XMHiXbeyE+eALs1c3I
	bTpUyuil9I4YmTleg6TJNixS10RvPA3O6KZsHywump41x0i7u8BYjwuX7D6BUm0+gufEr1zwcFqBs
	UYRHxu6NioF6W/NuDpwZNLfoMxmVAbAZwTzt3Qp9lnxQGG2DjimjDs5bQkwwPB6jBVaUlknXHf8t/
	bmL2+ppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEgf-0000000DuQI-1XS1;
	Fri, 20 Nov 2026 02:49:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEgd-0000000DuPi-3Vy4;
	Fri, 20 Nov 2026 02:49:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 455B446846;
	Fri, 20 Nov 2026 02:49:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795142955;
	b=FpBDRXrUoHlLUzB9p9UTtO2RwHORlWFl8ru1GaHLek1OQ0epJ1d1X4GTcCS7a8u4P2DP
	 x16lOySvY29C/nyPcurPNGHLidvTAa2+imrYGDnASIabwiE2gqVjMJYQ/A4tYyJ8eYUqG
	 T887nwclqglA400ffMH8QyoRk3f76/BEBHMCBfTlWX3+BVpCGMparACv/HPj3UQ4deQN7
	 MuEiHngGXXhLgUUZjsVESfqm4ByjobkMbKSeF9Z3+92jU35zxUYgkVWpUg1H+WX3FeEB+
	 E/WKGyb62fn0hlMvcZl6DlVSl/idyVQsvK5nHDfoWNEpmmzndYtOHvGIM/Mb+Mt3YCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795142955;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iTSjbrq786fqfXSMIohgj7aM6dRY7IeVnB+W9t0jy1w=;
	b=p5PyhLLZFVx7EnIMgjgLEhxB24BN1OX0MtRFH4sCDQfaBZXugSqcyAzNWZtZYTt/gOH9
	 sTjCImocKUueRLKvmMQ0o4OIe56YbTFCaa9IX/nlnIM6+aexAPGUSrU88jTbu5CDxy2n+
	 jMLyXsLA1Msy/DuDK47FhPDBYIrhlc4b2QkiENSuSh8SV4XTMAyTzJo56YbDi4RrQQmfE
	 w/oZqiBCZHYs65akpL3SnqD+WTmyutYarIEoyp2glql0iS1hydv0+MKJ+Hy1G1CMkCYm2
	 vEiC+Nr+Dxi7hwLIrm/zLGpH0ywlBPt3muYH179S1TrqDltPzk1GUX0w0lJhw3+RM+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CDDA1F000CA;
	Fri, 20 Nov 2026 02:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142955;
	bh=iTSjbrq786fqfXSMIohgj7aM6dRY7IeVnB+W9t0jy1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aL0qb6rBqedllN9rJmRpUFYfkfJL4u7ZISQEOCjKIz5rpWEapc2G/0gwJENRznWUo
	 Y/SLaMaeTp6x+XNJNyUtQSpv/iye8NkzVtNVEB/cHqFdLsCuyG9M9AH8/zDU7xRf8I
	 Zagzmb8EAoNvabG8U4AU0HlwPfUxN+ysWUJHr7UTmUJpw2B+fswB3pBlVPYJvYd8ww
	 gn9b0KICSRlO0poWDd63AqlwSdWo0kkSUEiyRSuRQUSvgy4gngCqUK0axakEsG8yT9
	 h+IPLJtOGjp9Cwu/hnbxrG/Rawh4kvnwvyjdXv1kMnAfEQJ3fOKtLZAwcbVtJpF/O0
	 Azv2mxumSR3IQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EAF0A49565;
	Fri, 20 Nov 2026 02:49:13 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 02:49:15 +0000
Subject: [PATCH v2 2/2] media: verisilicon: Handle VDPU2 decoder interrupts
 like the G2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-vdpu2-errreset-v2-2-8f4ef55e6dee@gmail.com>
References: <20261120-vdpu2-errreset-v2-0-8f4ef55e6dee@gmail.com>
In-Reply-To: <20261120-vdpu2-errreset-v2-0-8f4ef55e6dee@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795142953; l=1849;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Gwmav0vXYvboC6SZF2cZ5MvP4EV6g8AtqTAmBOmxEqQ=;
 b=6Y2MEjZ0evCxQSdbuO6rAczeh7bO/kLU1f3RXNMxvrg3CnbzAXF4SeVS8JgjjNyFOo/+mGP2m
 xtTJQC5n5YbA6Poci/HB1SreBUn0mckYF/CW2GjtarN+5UFg10DkbfP
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

Do as the G2 interrupt handler: ignore interrupts the decoder did not
raise, report the error type and don't finish the job while the decoder
is still enabled. The decoder disables itself on errors, except when
its input buffer runs empty; a later interrupt or the driver's
watchdog then ends the job.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 4bc1bdb41c70..d20f295b43de 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -391,10 +391,26 @@ static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
 	u32 status;
 
 	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
+	if (!(status & VDPU_REG_INTERRUPT_DEC_IRQ))
+		return IRQ_NONE;
+
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
+		/* Still enabled: a later interrupt or the watchdog ends the job. */
+		if (vdpu_read(vpu, VDPU_REG_EN_FLAGS) & VDPU_REG_INTERRUPT_DEC_E)
+			return IRQ_HANDLED;
+	}
 
-	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
 
 	hantro_irq_done(vpu, state);

-- 
2.55.0



