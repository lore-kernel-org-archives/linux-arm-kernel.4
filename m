Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029C4606B54A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ccb8Ud2W;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ5yCf83
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=; b=ccb8Ud2WXNynuB
	XlvnaWlhO6pATa4reiTBRzxUd3+vOAe8/pG76AWzD1pZlY/59b2Uh0fG3pHiA6bwoW1yngoWDDVjy
	lbI9UM/+AxfeAcZ3qXV74JrEJPyAGLfpzrD9TXiFE1FW35LozSm30oK0tWPyuWy/LNFGr3+aLsyGo
	0lKRR4jqE1kEQnXLA1aB7864a85rG3c+n3HlBSwHsorhV/jH/VV0OO+t7TamsIUA5WZIWg22RqjxC
	2d5ogXUcm8YBiq9c8+S6KZF8jk7Rdh0+G+9QZWsGjnQUN9r4eDWjPI0+O7OOf6tgVt2oXdIRgN0f7
	qkzSrRAMHJekQ3J6ZSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWT-00000001OMX-34df;
	Mon, 09 Nov 2026 17:51:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWQ-00000001OJR-2AY9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-492690dd5daso829672f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246667; x=1794851467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=UJ5yCf83UZGWSJfkappttdsCz4Rxf1mhJ89+erION8aX5kkkat7ONUEigZF2XFyI4R
         dPMrK6CqI8n1iWtyL3ZhPv3XboR/c7oWgjGZAZLbv5DjL5TX8wfDyA8pTIkExzwPMe5W
         xTXVNL5w8vvCGcACM1SMCMtz+ob97Uwf9m+02PjZOADoAYnFdsTvw08tn6raNm53bfpM
         sa9d06VYbtPqbEkRpbeBM8GmK+jvNz0oWP2opeBkpIm/jYkBdSZReQbM8tpDiudEKvK7
         hCblGImcbHVOxCcwzHGQOT6vyM3xN9wtOVVPQCdJNjWtAa1A9HVyXKbmItAjKY7Xtgxp
         tqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246667; x=1794851467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=2oMoFyWwsxQ8UkFUsi4Y5WCEZfMKU8qSWGFegyBNoXW2w6iMHlaeuR/LpoeM4/b60O
         JIqyCPA01vcsISQnV3+lJG4F+SozosbHboTWxAW7AhWzwBKuChFWS5qhXYKuXqeX/4By
         8shwQgsk+CB8CTwVgBiXuAdfsxWGv9tnNA9DyTDnIlz1JZ5yeSiFeYEpKHdzjutgbK0i
         /+HRHcztedBDDyMMe5BXdyGLHAtF1JKBdO57eB0kUmC398CKGkJn0YM7gX7Cj+D/4rvl
         sk/Z14m11su/AetPyRZDeFL8RQWGcTJWomZvO5SWHh/YnZYdeRqq4vrpHrq8ZHW9BCtw
         x25Q==
X-Forwarded-Encrypted: i=1; AL+hErGmEBrTciZOvPrgKuJ/vlknOjDtken5keBYa9oljvWqXAFgPDAqNryL5jRcydagea8xZtWeXRHElduZD8LL0WOP@lists.infradead.org
X-Gm-Message-State: APuU4Z+ardzc+0VIF5Y7fs4ufsV8dTSWsa7PjsTTMgGDWX83Vk4MN65T
	0N+aECblfmmfUQRhm/rqrygl+rcz/A5UZhgVJdugfFr8z5u9VkvKI+r5
X-Gm-Gg: AYBFou3KXcADvqhX8ZuIfiSEssZdv7EU6LbtA9/m2s0r6kMdE3aotxr5nngWM/axQxj
	OFIQPyiKslrPAp7BD1gjUbLrM7LsdY4On+MXr/ymSDjYnbOvNtFEzmfVdrPLVnQPk2etW0ETVgD
	fITBRNprw9y8XXC982T6Ezr/7VQoh+6quA87+7CinwoFf6KbSLa7cM2/nK1Rs746T5OoflWHS9C
	W1sb1QjBaWTtLPXy26GSm82777RlzCO7pGnCFi71XLeIjJE4uWwCaZkzc54lshUUoVRIcQ0Alew
	1Xo+q6AQXJCrsY1W4EutAT5jk6/y+RqNxdw7pAnpvDvNZECXnI+wTv2YJVK7dbNyR43mwRLKt4A
	V4HKs7zn3BhK2337GkJ+2p5BvrFNEXEvyNg9YOeklUff1X26dg7pRb4fygdCix+zFB8t1gaFCJL
	Upnl6eYO2m+M52xk8g2os69CIW4Ee8Z2ZP9bq40J4UKSCPzE6i6gyJELmfr/SdgHkjlCBP5F83k
	q2lwowcfz/Z/xp2WgfpXcide71C5Ap8ZYpyzCXnK7gBWOWpdI1TP6QYXCJKfPl3xIfs2Sy6lqYh
	etuCH2bzzeDJ73CTxbWU2TszygMgPsD3YAcLuouIGzaIwylI6pg4/Df5nBsmz9YgUUT0waIGZyT
	ygA2wPWdG5+QlvGkPx2lYdmGFOlLKKXQ0GlHWinamP+rapm/jb9V8SqHIewf9CKvYu2kyK83/hb
	kGEkoyH9rN/BEXYd62ODFo7/zcQcBcDVD2FfjPn2iT1Lk5MlRDx9hqhC+0hqo9rERJQDxs5MERK
	WOJWWZokxLDc6sfoHXF9qZssb15h70yoeMuAqiLrjXmhR5gC5+tN0gCqg==
X-Received: by 2002:a05:6000:26cb:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-4982eb0b774mr396069f8f.26.1794246667071;
        Mon, 09 Nov 2026 09:51:07 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
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
Subject: [PATCH v2 01/11] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  9 Nov 2026 18:50:06 +0100
Message-ID: <20261109175016.42061-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095110_744796_DA93FAFF 
X-CRM114-Status: GOOD (  18.62  )
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

v4l2_m2m_ctx_release() releases the CAPTURE queue before the OUTPUT
queue. When userspace closes the file handle without STREAMOFF, the
CAPTURE buffers are already gone by the time the OUTPUT stop_streaming
calls the codec stop() callback, so the per-buffer H.264/HEVC MV-col
buffers are never freed. This is easily reproduced by killing a player
during H.264 or HEVC decoding. Each killed 1080p session leaks about
2.3 MiB.

Add a buf_cleanup codec op, called from the vb2 buf_cleanup of the
CAPTURE queue, and free the MV-col buffer there. stop() keeps using the
same helper.

Fixes: fec94f8c9954 ("media: cedrus: h264: Optimize mv col buffer allocation")
Fixes: 0ee952c2f484 ("media: cedrus: h265: Associate mv col buffers with buffer")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_video.c | 10 +++++++
 4 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c4b1217c14b6..54f867949fba 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -167,6 +167,7 @@ struct cedrus_dec_ops {
 	int (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
+	void (*buf_cleanup)(struct cedrus_ctx *ctx, struct cedrus_buffer *buf);
 	void (*trigger)(struct cedrus_ctx *ctx);
 	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
 				       struct v4l2_pix_format *pix_fmt);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index fc54d993b11f..892193c12b2f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -647,10 +647,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	return ret;
 }
 
+static void cedrus_h264_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h264.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h264.mv_col_buf_size,
+			       buf->codec.h264.mv_col_buf,
+			       buf->codec.h264.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h264.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -662,17 +675,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h264.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h264.mv_col_buf_size,
-				       buf->codec.h264.mv_col_buf,
-				       buf->codec.h264.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h264.mv_col_buf_size = 0;
-		}
+		cedrus_h264_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
@@ -710,5 +713,6 @@ struct cedrus_dec_ops cedrus_dec_ops_h264 = {
 	.setup		= cedrus_h264_setup,
 	.start		= cedrus_h264_start,
 	.stop		= cedrus_h264_stop,
+	.buf_cleanup	= cedrus_h264_buf_cleanup,
 	.trigger	= cedrus_h264_trigger,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..6c643862ab73 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -858,10 +858,23 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
 	return 0;
 }
 
+static void cedrus_h265_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h265.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h265.mv_col_buf_size,
+			       buf->codec.h265.mv_col_buf,
+			       buf->codec.h265.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h265.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -873,17 +886,7 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h265.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h265.mv_col_buf_size,
-				       buf->codec.h265.mv_col_buf,
-				       buf->codec.h265.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h265.mv_col_buf_size = 0;
-		}
+		cedrus_h265_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
@@ -918,6 +921,7 @@ struct cedrus_dec_ops cedrus_dec_ops_h265 = {
 	.setup		= cedrus_h265_setup,
 	.start		= cedrus_h265_start,
 	.stop		= cedrus_h265_stop,
+	.buf_cleanup	= cedrus_h265_buf_cleanup,
 	.trigger	= cedrus_h265_trigger,
 	.extra_cap_size	= cedrus_h265_extra_cap_size,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec3490775..adc7f255d7cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -560,6 +560,15 @@ static void cedrus_stop_streaming(struct vb2_queue *vq)
 	cedrus_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
 }
 
+static void cedrus_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct cedrus_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
+	    ctx->current_codec && ctx->current_codec->buf_cleanup)
+		ctx->current_codec->buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
+}
+
 static void cedrus_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -579,6 +588,7 @@ static const struct vb2_ops cedrus_qops = {
 	.queue_setup		= cedrus_queue_setup,
 	.buf_prepare		= cedrus_buf_prepare,
 	.buf_queue		= cedrus_buf_queue,
+	.buf_cleanup		= cedrus_buf_cleanup,
 	.buf_out_validate	= cedrus_buf_out_validate,
 	.buf_request_complete	= cedrus_buf_request_complete,
 	.start_streaming	= cedrus_start_streaming,
-- 
2.43.0


