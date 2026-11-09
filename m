Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16408606B56B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lwagufU0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwsYJzGy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=; b=lwagufU0/cvHck
	pJyklfeG/cOUH8awAoT/vbfj/InaD4yIFi6E901P7hAw2OlKomKsLxb+uyGgMc13/Why6A+KJQrv8
	ZyMjNn/OeDqLkvDMHLZ7MZ26km+V11kITVjgEUfsJMW6Tf+e9zsdZfveOO186JFwZ+gisRwwWuU89
	xkX7yg6cPV6xFO9uEQUIzP/XpbvtHTFJB0ZWgnl6ruQj1LOZomBrUYMXffkFWOtNUE+DJhShgsoxS
	7z5KffjxQ5tzXk8rIn/54s46mhc14f5hSilG/hSko/jeqlrEvFDIeJvlpqRgNTOwjjFKTmnOnW8J8
	r+3fkW7W4Qzvhwqrr8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWi-00000001ObA-1in8;
	Mon, 09 Nov 2026 17:51:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWT-00000001OLN-3adC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so12054855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246672; x=1794851472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=cwsYJzGy7FYwSP1Enp0WeAbbUv2zoPwWc/DGgEKRcW0dNeGPtSvnjLItp+82czhklA
         qsBMXO1HMRpc7xYZQdPLiRsjXh1JNhbpIr2kLVhr7MPb5W0SeT9lKRj2DbkXgh1P2R8t
         K8GThfihw5CHgGqQ5qOVaZN433yBDbs3UzEjrim+DHgS8ioDYsDpy7WfqRe4ibQmcUM+
         WPNE+URz/f5s7i3DgmNdnQRiV59MBmJA9ogZBv9pFRuBVpS/49SomZGwZXM3hrDep3l7
         MavwOzuiqKnCfiuW3v/o1IZ96NHkwn+5lUA/Oe5eG7ErkAmAIB6tXy3LYf0b7yKJbd2u
         Hz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246672; x=1794851472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=whrAEuP4X5AUVrlXrqd6rY9i8eLNor90AFxxPuBFuqhLJQRMIBoMpqEJ3G0ozza3HY
         fW1Q7+2EvxeNmR/IyNb0BEipJNTvWjAldpg2YDibmgiPEHwfcLeGAxWsClWAcRmqm+w7
         50e8903YimUdTd+BO0M/QFVPZ4rR1x5Duw8Jf4Qkk4d4birVHQM1apdBDmC7sLfxJWzA
         lU8fbrUYYI5DYFAOprHe1FqjSXE7dUiRPtUi48XhEpJHWOuCscA+ThY6jbTbKm8pai3Z
         B9FLJUw0jizpeyXe2fVT4OsAbntZS7kXi7WoNMwwYl2moyewmlmJlHrO+W5xkPhE2hgC
         OiGA==
X-Forwarded-Encrypted: i=1; AL+hErG4TByE250ifT3vvvBb7Oj0zb3lCV4wbP6aVBNkiENDV+qNBgpnOtMNTINxTQAzrx8dqvmSMOLc5tZlhAFbiYHA@lists.infradead.org
X-Gm-Message-State: APuU4Z/M3HxsD+slXrt0mzbWtwoRg0JxN8rUQHPXLwsqnzcZuoaJBY/g
	m0Lb4w23vKx4Pmhk756z3+GUgm8wEidJ6ULnHbI/Jp9zsu3SuiRh9C1X
X-Gm-Gg: AYBFou21t3XbcOhJG/8pJYYd/f04hmcsKWjrs5C4t6g57poKgE5+osg2lQTjXNfwM7M
	8x168YVjuF8unXmx0cx+Eg1l3ku7DM1hHCMUdU73B2Q6V3cIM3dh1pp6x02FuAx8Qu16jCmvSrL
	fCRtOGAA0JVpGIZ7jz2jrWMSvzo92CxL7QrzhGskLFt3aEBExKcXFBSc9WXcralMPu4ricN5PN3
	9E7Ko9iIWfaYgj0q0+7dKv4naXCGBEfLc6Llou8DDx2kQoAhduW5paNAYIz1+Q2Agjpruv3h8Xu
	E0IGeAgmlk14DNIHyqSS99BFg1dWXHWxPtL8oWJ2BUM/itFZmWMKunTv53ZGDV+vtbEH93HYxno
	HF8unk3nGErn9h/DKIUCHBtsEgKvGntJv3XoIyzMRbFhr0FH8cUaAg3W4+nwJHyC/1lqP/ekbg3
	6v5I5ZReTNpyHzlZpuYlcA3ld2w35SNfque426jCz/JUO8PUZ7fPfOF2knDn+nytAgtzrjH3ARw
	RCRF/bHX2YiX5U39UT7s+n7WCojVQ5ROMvztRRVTKP1rtndCNqEdwRMQMpY86PqdoOg4IHTLf2E
	MUP4ncwpAQ6wTQewTZZSwkNCpNW4WVwVSKwUnSbFxtnbXHM7Pr64pzDXZBA3T4B3fNTvQJnMbFB
	jNP2EVgPbokgJ6+EU1GQQbUxR74qN6rwY/23eLnj36lpAfONrZnp7k4dWXXYy2j56cLldf8bRQP
	aHfqYo7vBny56o8gBMGL4h4waMwJ8jaoABZS4bCI/V3HWicKdVkwpumE1UbQAzR2yOMnpQQRWU7
	Kez9ZXiZSNVRDV/DP/b5W+nh1Tzhrc1EiV1JfuvrFaVKp/0qk4=
X-Received: by 2002:a05:600c:4ec7:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4b963c8591bmr96421945e9.15.1794246672153;
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:11 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 05/11] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  9 Nov 2026 18:50:10 +0100
Message-ID: <20261109175016.42061-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095113_932918_4F4F7E98 
X-CRM114-Status: GOOD (  20.76  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c2318521d7e5..572e70a94b3f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,11 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		pair_pending;
+			unsigned int	pair_dst;
+			u8		pair_structure;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 8252a47994aa..315b0e5b3c88 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
-	bool field;
+	bool field, tff;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
 	}
 
+	/*
+	 * top_field_first is always 0 in field pictures, but the hardware
+	 * uses this bit to tell the first field of a frame from the second.
+	 * A field is the second one when it has the opposite parity of the
+	 * previous field and is decoded into the same capture buffer.
+	 */
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME) {
+		tff = !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+		ctx->codec.mpeg2.pair_pending = false;
+	} else {
+		bool second = ctx->codec.mpeg2.pair_pending &&
+			      ctx->codec.mpeg2.pair_structure != pic->picture_structure &&
+			      ctx->codec.mpeg2.pair_dst == run->dst->vb2_buf.index;
+
+		tff = (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) != second;
+		ctx->codec.mpeg2.pair_pending = !second;
+		ctx->codec.mpeg2.pair_structure = pic->picture_structure;
+		ctx->codec.mpeg2.pair_dst = run->dst->vb2_buf.index;
+	}
+
 	/* Set MPEG picture header. */
 
 	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
@@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
 	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
@@ -188,6 +208,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	return 0;
 }
 
+static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
+{
+	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
+
+	return 0;
+}
+
 static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -205,5 +232,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0


