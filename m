Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F7606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zNi6BOwP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8AKbIsO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B4YHsAoHyJKwkFBTxKLpr1lA7OsEShL43buMSm7NE7g=; b=zNi6BOwPrBygAWDVu0d/p6x2OR
	87JwBKYWS5+1eEE0OKWE5MmRozqGA7p3GSYXlRkAESbkHP0eviBqpPx6tqlbmjq9J7bnFojDVOAGx
	9kFqHQkuyx1tHR3lSH/UFc5oKpcL/NeOMhW//5H2hZDaMw2MEqqbahctxVfbSy1CS27lZOffCSoxD
	RskR6KNpLiV3c0Z9Jtu9EZw8T4pnHb1wvbKHjj4oi0+12xaJyk7RnNXNuGzIiUodEaaUziBHY8rjl
	9G4WPBHe3Fb7kUE0y3l0o8e8IfxzUFci/GkHEzbP+XiU7lxXVJwrTncK+M3fe6jyADiP8qRM8Z/sY
	QK8Nvd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi3e-0000000H0oi-1Q9W;
	Sat, 21 Nov 2026 10:10:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi3c-0000000H0o1-3W0m;
	Sat, 21 Nov 2026 10:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5735845CB1;
	Sat, 21 Nov 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795255856;
	b=FR7hq2yN4iJ6BzJZO150WFrBXvwutgsv+v4IN9s0IC+RUVwKyJ1jenKAyF8gub2qU+FN
	 HCT1zpfUyQNHOrh3AGfdaZBNti6FYsmwAut2rTfDw5GsUPlmm2g0/FcoruF/aX6Wu2zr4
	 XM2e72FlJM5tvZnXj+zHzAimz6GmhMQACiyz9LyUxGQ3JTQSCdiBy//T9yvOo3u9BeOb0
	 WHd4CyKPFnvLyij/muYEvv2mhM91rq8FVGMYlxMqFp6TvFWHMQgBcVINY9/KC0jJZaI13
	 ArIrQwH4iZfByQga8ztozwJS2gACKZ/v/4Aqxw3FA86rAoKpZSQrsBN/3o0q343JEiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795255856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B4YHsAoHyJKwkFBTxKLpr1lA7OsEShL43buMSm7NE7g=;
	b=JKEWiidVx9F1aUFaGF0V+l0DYbCRKEZ1ZOEjQrXu2zHD7yYx8hSiLuDJEtQrrMcdpmSC
	 UFrPeKfFv0bks1oEprAHq8cNPRHh5fnZxJSnxJwUyjr2LvbOzEq4u6rI35XcMxUvjI022
	 AClYrDTlZk0AyqgwLO4uLQZfK74aSIN5JZLG0QjS+7Xeq2R04x6voQR5Or2NnSU3cIUnX
	 UdICEmw5MWUfsOoLRaiSUfL6OfksR89mGLD1+kyGu+Ck7wx5+n2220Lu5/GBRUNCwTmlx
	 3bqo88iOA4TUKr0cVVpl6Uuj1/2ABTgMestfW0K0tC8GXvqMqjlJdA5OzeOWLoG1d9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 555201F000CF;
	Sat, 21 Nov 2026 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795255856;
	bh=B4YHsAoHyJKwkFBTxKLpr1lA7OsEShL43buMSm7NE7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F8AKbIsOYYhRu2GUIgxy695fHCbk1rNXbdQpuZHglQYtzSdKoLYIUb7zIb64Q5Hi0
	 EwAL+LyfcDSzMxQ9gEELjY3ZaJAr+gS1r/GpSGipiecUdgrORJ9qAhDWFcm6Wlhbm9
	 ZDG6EZvTOIaeLtEbsmNNVX5HvMaodhaxIk/VAq16e4alRMJr7zeAbYvoMtTNBTZQvY
	 K/cdMBPcSA8rLPm5rD5E4D/LaJVPs1tfoWsOEs7FNa5XZ5IDwIyoCh/NJiLbDQJinn
	 +1lO/I2QBPs9c9AKDVlRNjCFxMOJ1QfFb5/l17Mf+BHdsRFl2QrKySLSqfgFVECjG3
	 bjXW5+cnxn5tA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DBBDF4BBD4;
	Sat, 21 Nov 2026 10:10:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 10:10:56 +0000
Subject: [PATCH v2 3/3] media: cedrus: mpeg2: decode MPEG-1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-b4-cedrus-mpeg1-v2-3-95e4decf03fa@gmail.com>
References: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
In-Reply-To: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795255854; l=3799;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ENgCu+1MFMZtAJZUuEt0T+q6P9F/T+1zchxBMroIOiw=;
 b=i5C3tVNnGqk1IrEyGSmXdZ2XEwdhU7cGA82UV4f11t7RXP0HNEAvQEtdnKwP2DzacRy5m35Pa
 xZgEqCOj6eQAg8Am49A4qiLCCykWgl3+ChPpmm6D961m0tS721fJQu5
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

The engine has an MPEG-1 mode, selected with the MPEG-1 decoder type in
the trigger register, and takes the full pel flags and the picture
coding type (D-pictures included) in the picture header register.

Select the MPEG-1 mode when V4L2_MPEG2_SEQ_FLAG_MPEG1 is set (every
variant with the MPEG-2 decoder; tested on H616 only). A job fails if
an MPEG-1 sequence has field pictures, or an MPEG-2 one has D-pictures
or full pel flags.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h       |  3 +++
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 27 +++++++++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c4b1217c14b6..9c35078ef02f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,9 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		mpeg1;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..557e3d029318 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -48,6 +48,17 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
 	cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
 }
 
+static bool cedrus_mpeg2_pic_valid(const struct v4l2_ctrl_mpeg2_sequence *seq,
+				   const struct v4l2_ctrl_mpeg2_picture *pic)
+{
+	if (seq->flags & V4L2_MPEG2_SEQ_FLAG_MPEG1)
+		return pic->picture_structure == V4L2_MPEG2_PIC_FRAME;
+
+	return pic->picture_coding_type != V4L2_MPEG2_PIC_CODING_TYPE_D &&
+	       !(pic->flags & (V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD |
+			       V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD));
+}
+
 static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_mpeg2_sequence *seq;
@@ -63,6 +74,11 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	seq = run->mpeg2.sequence;
 	pic = run->mpeg2.picture;
 
+	if (!cedrus_mpeg2_pic_valid(seq, pic))
+		return -EINVAL;
+
+	ctx->codec.mpeg2.mpeg1 = seq->flags & V4L2_MPEG2_SEQ_FLAG_MPEG1;
+
 	quantisation = run->mpeg2.quantisation;
 
 	/* Activate MPEG engine. */
@@ -101,8 +117,10 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_VLC_FORMAT(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC);
 	reg |= VE_DEC_MPEG_MP12HDR_ALTERNATE_SCAN(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN);
-	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VECTOR(0);
-	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_VECTOR(0);
+	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VECTOR(pic->flags &
+				V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD);
+	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_VECTOR(pic->flags &
+				V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD);
 
 	cedrus_write(dev, VE_DEC_MPEG_MP12HDR, reg);
 
@@ -183,8 +201,9 @@ static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 	u32 reg;
 
 	/* Trigger MPEG engine. */
-	reg = VE_DEC_MPEG_TRIGGER_HW_MPEG_VLD | VE_DEC_MPEG_TRIGGER_MPEG2 |
-	      VE_DEC_MPEG_TRIGGER_MB_BOUNDARY;
+	reg = VE_DEC_MPEG_TRIGGER_HW_MPEG_VLD | VE_DEC_MPEG_TRIGGER_MB_BOUNDARY;
+	reg |= ctx->codec.mpeg2.mpeg1 ? VE_DEC_MPEG_TRIGGER_MPEG1 :
+					    VE_DEC_MPEG_TRIGGER_MPEG2;
 
 	cedrus_write(dev, VE_DEC_MPEG_TRIGGER, reg);
 }

-- 
2.55.0



