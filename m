Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699F60A2600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 02:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rJonEuji;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yii2Vdbg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=; b=rJonEujiGTachQEOQYa6+Ww5rm
	R44rwOIGjZhc6/hH0lL/ZH5nPNK3UqekB93I4K+BXufm4uBx2trRVTO3VA8uFqLD4QL3qRfYStLE8
	Wa2JtsgN7S1y01dI74MYhJwISQXOLKDx2IeP0pm1TmDwS9hE2yjLh23ruYnqN/S04AdReQjqxH7HV
	3PgL0/LaCaNl3bpMLVIhE3Hxo9FYXuJor0mEg/VQOwom1irQ7EYZVt6TfXHEjJw3v9dQa5/urtom1
	vG6iv7BilDq9piIYjWAmt+VNwxe82aWp6zG+GMFJMkd/9DnlEOTfG/tXmy4zse+5krTNfhi8Id2JK
	oAFrmjNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEgf-0000000DuQU-2A6s;
	Fri, 20 Nov 2026 02:49:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEge-0000000DuPn-12gn;
	Fri, 20 Nov 2026 02:49:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CC2561498;
	Fri, 20 Nov 2026 02:49:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795142954;
	b=pUbwlGbNS8XnxxQQABP2hpGBbzRr13SpGLT55t4pstmbdv6W4WcU/JcVQQHya/4mzU4n
	 DeGlo80WXy3Zw0DgWLyJnY4o8XFWKz/hFjyX9M/eQ9WieOKfxpqks7ZXU5JLXAz6BrqjN
	 ldrZR0OE2BbVKfmWY9TOrPeRyfqJbxyDhO2uEkIpt0GcfNPf7JzIEE6W05p0LBOgocH5l
	 TazL5ehk8QuozarIefhtQIGhQxe0oTrNHleDSXsKc35Le63ZeMrrjfUJB9XnO+JPaZLrR
	 1yjrNhAWLiK50iCqrn07/nsxqAiwjC7l4/240ppiOv4dBhSivaS6uihD+G8/tbH749Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795142954;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=;
	b=ZI14rviRUqHgBXZOFEKnDzcz1soS1sZh8ZRW894V6/GYGBiwj3gpC/93aP/1ohVX+agO
	 FH1wtCtRq7sFzmYpQvaOAz4q3G1DCI0c7XWBziBlhe6If/vaTYDCOe9AM5yA7g2gHzYez
	 BTahoYt8cgaklk82YdphyRyWsMdoFOP5JFhK/f9pTxeq/mpQkEUCeJ3rm7asDdsPQfMo5
	 bGyQ+kM0SXP3ZNTNqcTmO8qXqz/5eorysnQHHz578q5aPLNcM87Scohiw3oGQkzgC0m06
	 R35Z/GoZ09GqqlMskzGhSAIRAA6CpvEBSZDvyyugxbxd/9jMKPC09Owa6rIkqD2S3Ug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52AFE1F000C6;
	Fri, 20 Nov 2026 02:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142954;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Yii2VdbgHmH7xPvC66UeSorkqmdYVoFxzRXFnwtYtgc9C6RfdIclugQjaRTgi1fLY
	 DP/bhWHVJGIE6WG9+swcZbuGuBqEdvEuGBbAHlKAAstO5u4vzAcvYGD+ro63MtR3bI
	 fdqg7TdQRuGvPWuYEFV8CgTGWwSIkPDh2gyU8Ef25idA7HQ/zuAuVgLcxhASMBWFfb
	 kVhjZ4Pzvz7EnxGzUggBPpKVb+7iTmYGHYONVZz5oJfQvPAPNkUYcDkE5GtCrKjm/l
	 3lEsOWIWLL6ZTmCvd3GMenKqvDj4aKdNB3MOttadYWuhB9I++4Zr03drMLuqJb3mqg
	 yhxcu9qJrWlSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D158E4261C;
	Fri, 20 Nov 2026 02:49:13 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 02:49:14 +0000
Subject: [PATCH v2 1/2] media: verisilicon: Don't report VDPU2 decoder
 errors as success
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-vdpu2-errreset-v2-1-8f4ef55e6dee@gmail.com>
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
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795142953; l=1243;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pmz+6zoUL7toWQYosmuS4NH+xU1lJuYNQV3oDGrhPbs=;
 b=BDh2pWVPFr77FF11sME0qilG5geg/tyt3eY9phIjzcv/4CUISB7PCsPZP4ygzi15iLdIHKJwr
 YaT9K7/UxTpDfHsfEnyR6SoWgpMbieFVUIFumPnUFRY/RPZO7DmTGVm
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



