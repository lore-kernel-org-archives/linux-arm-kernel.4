Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB3606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fMSGeV1K;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0bjvany
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=; b=fMSGeV1KlfAjYz
	8FgDYOPvtK3TGEkYSRr61StzhBkczMwrELIaWXQT7yiUnGnUgSuNlWEDmRB28wROpvqZ4wtuXsKCe
	/OokQP+uIbK2UpHUE+/jMLEo6ElCY3kiQ9r3N+LCf6Jx24ixH3j1EXQ5Z660L+2tnv04RHfz7zqyD
	rOUwnF6KuexvrOvJC4/NWAXscScAO5TJDQNrm1SxyeS3mGA2pg4xvWNPq6cin5yhYiDpKvPht9cWi
	XT92qRkGV8KqnpD9pYM4WF68D+Zs8WXeUacvLbViNjcSOlt+eJHdf0bG68z45adZ90svGGzye9Vg6
	s3QpOA3HBmKvnSklSZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWi-00000001ObY-2imk;
	Mon, 09 Nov 2026 17:51:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWV-00000001OO4-2lNP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4919a880834so756010f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246673; x=1794851473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=v0bjvanyHMU04tmx/s09zRYBlo5xx5tpQvI24kdEl9+kuWDRK8/H67whjeb+EOU9OK
         ydvGntswWyjL9mN6KvG+6AjxLT4Vu6Ar6hrDsMw2TaNePnkeshiatk4w4AFCYtTGEPCx
         TVw2RSZQeap65s9qYMpG5LwY1UTylWWEOtS9MUy2cBLBGiQKYmriMUKFcqk3GD0c7Jjo
         WFqig7JjPfYX1PeLfG56A7ZWp71Hb3uN7gkiPoPA1rQ1ojYadshY7XCVXydzIa72x3rk
         OkCUh8cC3eSZps2uCJM2AUd15XkSvbkbfjnCZsDEZIT+MUfx+0S7nygSfqjLMcxhqYqJ
         cM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246673; x=1794851473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=kOWFpcWjf6Tse4naqEv2Y2lysuk+6Y6GNibkTAU1bOuSCoewMxhL/G87UPHAqLm+bt
         55nywUuIidB4OoM2WNCfX8j0YH3xEUuWGKo6bjTodbfymVCawSrLEjG18WclQ8iCUvOp
         DvZXpeUtt/rGVt4lQB2+HYm5wzUTZi+2R1R4kJx0OrQyjkqjk73pdF66aWCSl5zhkLS+
         EnJLh0UYI1HQvBf56ZmSa6PcIzASJhvYlr+oxshQAZbTGl+B78oFYC/2Bb56+OtF1y2V
         +smS7Tm+3AAfoT9sI+VQgJy8PgzfLz2vmXDK5UPpHZgsWOnKIL03ENEE1rGsWn85V/0k
         DAZQ==
X-Forwarded-Encrypted: i=1; AL+hErHSHobXrSV0TWoV/+jp6ar21c7gx8lkpalHZGf6F2BaC8c5nXsxkBXN8Jb5AuM4829NPDJ5zzfyid6M7if+Cgv1@lists.infradead.org
X-Gm-Message-State: APuU4Z8zG1sq6qQexo8FNf1sxl2gddRYs8jjHIfpbo7A2jHOXivcYEPt
	KIt9VHXw1Z9r+UL38lul3UMGw3EiVIWRpk9uYfFJ+8XhAGSNPxFAVhXF
X-Gm-Gg: AYBFou3WMn/nF+aDgafcHZ1H0E9A4KQ6YctuWGdS8SOQGKUYHGfKG5NaXRyJZ85y8tx
	FXJNSIVXWNDlXVgHxMaTVwAZX9BnNCYZHxWPRiauOc0pFjYE7ehtJM+MIL0QTJJsauWBo2FBiq4
	qk/x239ItfA6A2pC9T28NhfDQllbZAnLAeEgbmV/Q3E7teXgx+a6oO/kBMV2+IPAJY5rVdsX7/E
	waESg/BhMxwkvO97YIeX/jhQYvrKr72YJ4Y6UO5J9hkYUAZ7H1+UhgLvzduLtABdlXO9IqL/zsz
	9P+1OyTlg32N/uvFhdeH3nuhzjJTZAiFjOLh4e8hfd9DC5HP3E+b0156R8tWgTKXzuq75jL8xgd
	OXypx0uAKeX3A8U8zoWW+JbP1FJyVN8MBQezBQRbEdrOs3nKZ5DcMzD/EwhZ9FIK3dE2J+9tPNZ
	wuIq6e9Ml6G92oyfCfL12EYBcGd6kPqtpn+rM9RR/clrvFleFNkgRiq9l97dsSp0s89iGhE3LDI
	C1vC7oi1NlvxVFg5FKjeSwSj3fuSeXJ4bpmNrvQ0GcAi0T9UTUfWq8B5ueJmRGzoCxDb0F9fu1A
	raMBm1F/cuH3JHdVBqE+YCPXTN+Dsg06Lh5WYUZcsDAMZ55HGzaEJABcjzQ2ETkzE+XFDonTwTh
	5UOROrh5yGc+HyC7VHW7YVVzyd6uhq+jxbs+mRJILvn4XY7UfQpIkvxELdQ8Ic0UjkhbKuETjQe
	Lq2fi9dsrOcQnDAvMrqNyyACw05TJooEYBnEjyHeYTldGo8oj2Ak7zTacZnl+x8SuueHM04DUHX
	2gQW8kXNTaND5JnaaSY8pWeJPOno9x8w6mbHnXBiLwOS+W9D2Cz+VzPHQKYQBS1mplUN5gl
X-Received: by 2002:a05:6000:230b:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4982b28a797mr485950f8f.3.1794246673337;
        Mon, 09 Nov 2026 09:51:13 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
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
Subject: [PATCH v2 06/11] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  9 Nov 2026 18:50:11 +0100
Message-ID: <20261109175016.42061-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095115_729915_E4AD4217 
X-CRM114-Status: GOOD (  17.69  )
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

The second field of an I or P frame can be predicted from the first
field of the same frame, which the hardware takes from the backward
reference. The driver programs the backward reference passed by
userspace instead, which doesn't point to the frame being decoded, so
the second field is predicted from the wrong picture.

Use the current frame as the backward reference of I and P pictures,
like the vendor library does. Also fall back to the current frame
instead of address 0 when a reference buffer is missing, so the
hardware never reads from an invalid address.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 315b0e5b3c88..9bd7f3ded83a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
+	struct vb2_buffer *fwd, *bwd;
 	const u8 *matrix;
 	unsigned int i;
 	bool field, tff;
@@ -149,15 +150,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-	/* Forward and backward prediction reference buffers. */
+	/*
+	 * Forward and backward prediction reference buffers. As the vendor
+	 * library does, I and P pictures use the current frame as backward
+	 * reference: the second field of a frame predicts from the first one.
+	 * Missing references also fall back to the current frame.
+	 */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
-				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
-	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
-				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
+	fwd = vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B)
+		bwd = vb2_find_buffer(vq, pic->backward_ref_ts) ?:
+		      &run->dst->vb2_buf;
+	else
+		bwd = &run->dst->vb2_buf;
+
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 1));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 1));
 
 	/* Destination luma and chroma buffers. */
 
-- 
2.43.0


