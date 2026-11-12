Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F268606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0731nArB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gw+r7B9d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ASyAY8bq55NxrF7Uq8dDNoQgFuT+3SFZsxEh9sLLHJU=; b=0731nArBWWAhA1Kqdi1CkTngw5
	FkcBEFGuaOwTVf5lo2oSBx8pbH189V4it7/IqULw+nbhs3ujZAs/wcDVn/z0i5e9P29Ok/n8pjX0K
	VDoGaTQOlknCZ1XSDnwnTQ9rq+KwDieXieIwNj9vS137rvnVR9li9ODvIuGXUJmtgfLaBnYwJfEip
	Z9yz0GjMImtQFkS1R+S1Fy61VszttbmEivUVrL9IsCeuI+77xJr1PR+7MycUcj1TihA6u2+cu9jgi
	Ewv1S3xSKy1+91Yu5ncsevd9OSuzPa1B+abbeNu37/TPiVD0WNsFlEyWOgp478Mj4jokf2Y5AOxS1
	kZSKHpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQCp-000000096zy-2lIr;
	Thu, 12 Nov 2026 08:30:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQCo-000000096zQ-2mUR;
	Thu, 12 Nov 2026 08:30:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BF3C47357;
	Thu, 12 Nov 2026 08:30:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472250;
	b=ELgYtB9NMQv2Dw6gmLeOGxT/8to5mkGwRCzM20yNcifoJn7642iavtnONY/LkUy5A+WR
	 mOAc9nlMQ2um7zNb544n4Emn3/6dTqBSaW3QwG6gcSPe+DkH9or12EnLLsb0w7zhT7WkU
	 nEOlug3ZvDG4y/KTflXs7AfaGbexTMTTXkNjgLNO9wZhjyd77BeNa9wXtHt4uWEXiWuGn
	 QOE3uGis8+TKXvw1UkEjQqm7cMq7zDJB+jct+SsRBQn2fEWieV/6Vg2h+RuRh/YZhsxGQ
	 noPHtLbNyNXeYLJEyrfDonl2Udhy8ouczrgXO8UxZ/5/6y+Jj+sa78HTDrG2CSj/U9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472250;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ASyAY8bq55NxrF7Uq8dDNoQgFuT+3SFZsxEh9sLLHJU=;
	b=o4vzJJ1iavfj1JbfDvRGNHDTxNPHvjihaoORPy9jnyL15QgL8CVLBfuNk8guW7FaWw7Z
	 +plSxY7tzt2rzwTg0hNRox3mTnMUJkiU6OchJIKO28MkGypXuoP0PWMc12syONVEmP+nV
	 A7i5cM8jT3qmCvrCRk6Ux0TktBN+2Fa1pbG/Kg/ptjMruzyp/d+z9X+qrd88eXfRAJWR9
	 E12/LpCmxJNl7VxxGQDiI50JCASMZM4pdtGlzJ0e3WkCmUXUK5iHdTMSXT0ipt0L2oAKz
	 Dtr7f4igrrqmYsD7LQeGr+A4yGhZEwz+TVx+J1EleagKC85xlVWjW+hzWuVYQuGgvNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97D741F00A09;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472250;
	bh=ASyAY8bq55NxrF7Uq8dDNoQgFuT+3SFZsxEh9sLLHJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gw+r7B9d+uGfx2+SWHJPBSpjGRD/RWGoAP3Pi8peqQuIaYONEgHcC5NgUWEw0G/mt
	 YR8miGCueGY6VUf/bNvBJ30rEntrQhNptY5LmSM/32VKDarnWeg8ayquHIYtfN3iDE
	 gkDEbE7MfvgKYFeMtexJeQ2G8ay8wIxSHJPU6OvbeEyKQoADLzqEP9vkJGV4JN5Sh/
	 ox63LQk6ZCX3Wtnujn1BREPMk2x3VyUSQEm3upF3Jgqzp0w2Fv8okIifZWisH8X/ti
	 dbUb1chbjz6DVwgnDx8rbNEbWyst/zuy1kFQEAkBKRvj9SclUgFdDfsvoNEZaIMqMa
	 Mj+AQWad+v8hw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2104449381;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:30:49 +0000
Subject: [PATCH v2 3/6] media: verisilicon: Enable the Rockchip encoder
 interrupt again after a reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-hantro-robust-v2-3-18561fd48838@gmail.com>
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
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472247; l=2118;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=/pdV5Ao1nfGJCAVq9CfIzOPUMn8hmIXBimy2UnM/Qpk=;
 b=ft5+zd+VMM7oNCjDiVVEWeZlc3SSoAWnTT6gIEqUHrWWoRnoY+fjjX7uOstpMkkQs3JCHDa2w
 y0Ch1+HeEICDFvreFFH8syfHKBG6uUPEluWPx/0eyl9oBMCcxhBMFAn
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

The reset operations of the Rockchip VEPU1 and VEPU2 encoders, which
hantro_watchdog() calls when a job times out, disable the encoder
interrupt before stopping the encoder. Nothing enables it again: the
encoder run functions don't write the interrupt register, only the
interrupt handler does, and it no longer runs. Every later job on the
encoder then times out as well.

Clear the interrupt register at the end of the reset, as the interrupt
handler does after each frame.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..5d4e46bd9cd6 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -475,6 +475,12 @@ static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
 	vepu_write(vpu, 0, H1_REG_ENC_CTRL);
 	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+	/*
+	 * The encoder runs don't write the interrupt register, only the
+	 * interrupt handler clears it after each frame. Clear it here too,
+	 * or the interrupt stays disabled and all later jobs time out.
+	 */
+	vepu_write(vpu, 0, H1_REG_INTERRUPT);
 }
 
 static void rockchip_vpu2_dec_reset(struct hantro_ctx *ctx)
@@ -493,6 +499,12 @@ static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
 	vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+	/*
+	 * The encoder runs don't write the interrupt register, only the
+	 * interrupt handler clears it after each frame. Clear it here too,
+	 * or the interrupt stays disabled and all later jobs time out.
+	 */
+	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
 }
 
 /*

-- 
2.55.0



