Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F01606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BWfqaB3a;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbuJOfoY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=; b=BWfqaB3acOa6zn
	MbB/hMO9gJjwgm/u+TktGxRK3T23mRJSJjdD0BCT8ngO+IftjDLqbbyuUlNtEVurDFWeaW4AJM3Jd
	MYvOdlWg565KZbSdwK0AGpVhZbsYj9BDZPJWdLuJiPTbIYQf9mCNrkK7uzwJiq09De/3kr34dvjQy
	pcV/5X9ugXUiAZVvDUDdCQcMQa+ddrEhiYv/e/purdi/tGsusKMdZkuyTOxc5S/2BMVaxbebMk2VA
	jYUii8JxdJc5asyx7vXVCkb8Kdz3m9QDnLrP54RfbdgXbHRv/MeG4E51/AGvGIFOgcI3h1MPuerH1
	fKnXVpU4K6ks5kdvSxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWk-00000001Ogp-39Na;
	Mon, 09 Nov 2026 17:51:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWc-00000001OVO-2AN8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-491971ac844so1146611f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246680; x=1794851480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=xbuJOfoYEGRygsSCM14JMFjDNadjKwq3qsTZhQbBY5oe3S7c2qTqBa50y//1DtAqko
         BTDdcPMPuvnU39dL73ddN9yEP+jYGcLBia5jW6SUcSqkWxE8aUxIfueriI9zSjPfxF84
         3RWjzZx5oGF3B/d3vkVcYLLaPxvEznVQOvi8IEfIE5kfuSIHvFBEMN0BQl9eA+M2MVdg
         t5ikma/LFLYO3oUiXZV5ZsSxEdieRv0EoIRqvi7oRfOtRVskjWF9SkAymYSRtPskN2hB
         inGeKA8Wp9zZpIPSpZDmSrXAmGFSvvSXpJIxu2VTDrGgDzS/WPepOlsfHv6HcwXQpvYh
         +k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246680; x=1794851480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=tfSR59R0LRUosFGyQqv8ZyKg5W/4qHiGxnbtA8Vbjw9juCRnbp+NnubOVYCctVGYbo
         lhYtEFraqkp+ydzikhKSxbYLAGWwwPYQ6VNCJbDIdFQWQ+Hqz0l8k07Yh35vWR8utjS4
         reziLDloIET3Q0H2Ea5Om3Vk4WdDL+TtbF+9BGj6yWn0/9bXxxN0UNH/EWwWqEQ3MEjc
         z1ExksMFewNHywwz2hmOBrIN1hftvAD1iEcvvCByWLjyTSBDiIncYYSx6znWAupnqWlL
         uxehHBeBWypu4sl8txewziAuXGJsRhPqZe3fFXLGP0D5f3DR1A8vg6w1GCAplpInZw3u
         sqsA==
X-Forwarded-Encrypted: i=1; AL+hErG82lefplISbExvZAt8bCPRQVKHpsaga0WEklImGujs/EK8XkZT8e1HR3xNqjORPYprkP4UrLqbxpjt6Sybs6pU@lists.infradead.org
X-Gm-Message-State: APuU4Z+kmdEvA8ABwbj+oT+RmIpxt1Pdx16oV3xY09V9bFXIfmJ87XRY
	F1x9uO/hS4a6iTUTkdWgo366By1wBr8ZqIrSuF7GRdW/wHWC6sYU2TiT
X-Gm-Gg: AYBFou11+t5BQNLNLbctFKqLLfc7QhssykWneqIPRGoDYyK4uKwdoyH2kmYENPKX4B/
	/ryiFL9b+QeUcPSRUP+HdvWxhdAEj88cb5vSuNJLFNOgqXclZSXVRvkUdQRYF/F2EoN1z3FIV7A
	5iMKaXCc72L4BcCP5wqgPAUgf7qogShqi42UuXQgga/jsyUx/NJQGtuWRdDfDIP6SNB19MMbfpZ
	aciffjOuG9MAeQIWii14HoIVJNfAfVxwxOuBhjrdUt5UOc+TBO3pj/tSr5n/aCOaC+w47SuJVZv
	6PCRXogUxgWBuDxtyAS7iPDw4CTnPTh2poox/zaiGTt8MIOsLwGHgxAbWX1tbW64DXll6nz7N1a
	LBW5M5XhZtpJ9VWN0StsZ4iaqOGPcNA91xLlI4ZI24/CNqNa6hyv+CzmRhozDAGVuzdHwgjqNjJ
	r39EaafFTw7IELIdXM505Ms5a/fe7q1a0F4iXCXWcFb4mWm6htLubaOoWWFAbS5DZc/ZM/AWmtw
	3EI4WNtqp7r6Csw3RvFAU/hL9/Tcbl04J++4d1prBJvltZiYRkmw3voN31zi9nHVSd422OEaldw
	l/agmHuGWtwpajVLULrcFVuvawEftynx9imVizsB5hrHzk4DMVu7O9PsSZBPyMl7YzgG2tfI3nm
	PLlS5YrAyT2gfxZu2zqPo/RJKAMzCKbZQxaXbxDQnU3ZHNyGL+NnbPistbeQokk6oATg51LK7Ij
	16YxEAT90UMu47FL0ebHXA2Y5P91TCkcr++KyY89vYXPvX6gMxcwwaYWt5Mdk44JPFubjQzduZF
	wz5n6F1UvVXZICysn+hVRhkxVdhtKkPYzPO/IrmtnXY/xO6zkg=
X-Received: by 2002:a05:6000:469a:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-4982f968989mr173933f8f.31.1794246680224;
        Mon, 09 Nov 2026 09:51:20 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:19 -0800 (PST)
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
Subject: [PATCH v2 11/11] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  9 Nov 2026 18:50:16 +0100
Message-ID: <20261109175016.42061-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095122_586533_A2BF3EB1 
X-CRM114-Status: GOOD (  17.05  )
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

The buffer sizes also tell whether the buffers are in use. Set them only
once both buffers are allocated, and clear them first, as the codec data
is shared with the other codecs.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 67 +++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 78efd3938c77..e26bbbf2e55d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -156,6 +156,13 @@ struct cedrus_ctx {
 
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
+
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} vp8;
 	} codec;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 84bf18fd231d..bb32232d37ff 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -669,6 +669,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
+	if (ctx->codec.vp8.deblk_buf_size) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
 
 	reg = slice->first_part_size * 8;
@@ -837,6 +851,11 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
+	unsigned int deblk_size, intra_pred_size;
+
+	/* The codec data is shared with the other codecs. */
+	ctx->codec.vp8.deblk_buf_size = 0;
+	ctx->codec.vp8.intra_pred_buf_size = 0;
 
 	ctx->codec.vp8.entropy_probs_buf =
 		dma_alloc_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
@@ -852,7 +871,42 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		deblk_size = ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, deblk_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		intra_pred_size = ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev, intra_pred_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+
+		ctx->codec.vp8.deblk_buf_size = deblk_size;
+		ctx->codec.vp8.intra_pred_buf_size = intra_pred_size;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, deblk_size, ctx->codec.vp8.deblk_buf,
+		       ctx->codec.vp8.deblk_buf_dma, DMA_ATTR_NO_KERNEL_MAPPING);
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -864,6 +918,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
 			  ctx->codec.vp8.entropy_probs_buf,
 			  ctx->codec.vp8.entropy_probs_buf_dma);
+
+	if (ctx->codec.vp8.deblk_buf_size) {
+		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+			       ctx->codec.vp8.deblk_buf,
+			       ctx->codec.vp8.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
+			       ctx->codec.vp8.intra_pred_buf,
+			       ctx->codec.vp8.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		ctx->codec.vp8.deblk_buf_size = 0;
+		ctx->codec.vp8.intra_pred_buf_size = 0;
+	}
 }
 
 static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)
-- 
2.43.0


