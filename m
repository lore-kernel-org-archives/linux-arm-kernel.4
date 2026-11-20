Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF6C606A6EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YLz/V8fm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OLQ5cme0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+N2r/iv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=; b=YLz/V8fm65qRkU
	6eMr4Jr+FwadGR1D5ldPbJ4xw1JdwvzrNX39q/h1iuyU+dbpxgayNa1FdDCffHQO3tIEvJFrpvHgl
	GmGc+S5ZixFWeD4t/GaUrSm9qHXkg0UaEYX3/YAzy+FGKD5yGDP9whZHWbgHaJ+4oKZ+LT/9/NNTX
	IShuF/DUQrW+1u6aklHdf+D9l9F1cJhiX2WNrQ7XD1PhqLmPyxE2BxCLSBCWGE5XBRE8xGASwR778
	z8b5fbjPq1CEHCCcZ/up9cVyU8y2BlVd5nzwadcxQ3xE+Ct4cylbZwgzVSgk+9HwY+mmZL+v92RTd
	8Li/0+dFNspqaVv+MHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiV-0000000G9kb-0mTZ;
	Fri, 20 Nov 2026 19:56:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiP-0000000G9eq-0T4y
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 19:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=; b=OLQ5cme0JS/npFDv/bDnKDz9ul
	7PwM+iBOnNMsWxi1mUko94JBI8Kk86ZeH7FPxYw1dfRzeuvNnJrR+pUb4OJLrcYBPp8RwbP1BXCW9
	pMIOanGNJyDVwlnMmQq7qs4SB2+QK34fJF/U2onLSPH8fsBswWG9eSQYSdMurMCqL8cfob7PdsAl7
	9T5FB/r1YmoGA7eDMpCyZ2ac6/ODX68AzVM027cjOkVNYYwdVqcWIWSQ6t4wfos5jNIdETXY3Bj3D
	m8QyzsedcCmgESGkyRG5t3kMrkE3Y83UmW0bx7r4KbCrX6O51Yg0aHVtd+le6/Q57Emn54aNPYZZ5
	G/FQBMeA==;
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiG-00000001ABb-2AYw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:07 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-862a50e0f92so116256a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204555; x=1795809355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=y+N2r/ivCl2YjYJuE1G74XEoD73emdiIQqxX58jsrvtvkD4JwsjlfznEYdlQPIvPRg
         LF1caxmnkTXerjaYqEIk/DOgJBScMMjI8oYXgiHs9Nw8G8g/c8hkTtmUqpAqX5qtHUzL
         GkyNf6DYHQ2WvH97bNPTzcckZki1nPBIiJyB7lWvsl5dd+qHXY7Ct0Xc4J/In+9mQH6d
         PL7eIehkxybwK9OTOegx4rodYtTqxIUbb8WebgN7saHQJaLceYldKK30gErSAy4/zTlD
         fSoyq5TWmskYDxQzk0PKEPKZAAZkEAGLp6N23MWY1KL0ku//sAFMcD6vw90PKf79ODWU
         nrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204555; x=1795809355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=BhfNWcqejMQfSjmw4ulUY0F7/svjFyr8VxyJ7yHrMjIJDo4qec2Q+wJ8IBXNwMez1i
         1MqIV0xuwNRlEidvfFrXeavWMY6O5VsOYyMc6VON3WfV1nnPwd+WoOiQLCdMMqysPICg
         stPfdS7Tj6dWZ30uOw8ckMNNsFLLr3dHinoJj0GVwMF9fkJ5mjh999o9G7AWCaRDGesS
         wcz0kJHtw0DEvV1w3BznJXs9cs7jBPAtYYcoiTwKCu1i3Ng8XYRFk2tShwQ2H9xEyWWf
         gly+Ho/LkVbMiN67hgUNkgElzyjcdEYyzb+LZVy45meaI9oEjahyp3BisEqLnL7CfWJl
         JveA==
X-Forwarded-Encrypted: i=1; AL+hErF6LbTE8CMXhEcvEpRSMhl5mhe7Ro+bd33T04WB7u6oxc6t49JTN81iHdW2M/2pwKsuVNiHUwN8p9LyJffIlYjW@lists.infradead.org
X-Gm-Message-State: APuU4Z8h2OpK5A1nvDOenRvBwU2DA6E3PqsKNOJZZtz+vdIkDWkrs0/W
	c2u6W+/j5B2JIG9DY1BGruYWigyY7okKx0UpKs5X3krc45dw0/mJ9s6U
X-Gm-Gg: AYBFou3Wg3irFvGTCNHZZiDuWAXPNKpiAfkq7voBzktgDgk5EhrvjvHS1dt9q3G5lHz
	VeB/ZoPQlDJoJHmvrtbnlJzVmsRJ4hedw97ArnIjTqRW3Ib6KCl9sAUpRDKQqJRQuDe5RgkpaPZ
	kChnSBqEfKcylFZkakLkXsYbMmp7wbt3tQ23CjBBUXwsGnI2BP/GtKrPTAs9D+hPKWYKT2ietz8
	nCZS1v1sSVFCScVLU3eI+ZdHD9Gjy8aWJpnHnbdVbI40LUweBWm1YTugEOrfN7fSO4XU+aKm3xR
	bNld+3iz4mrNvBsXCw8rhw7Rwyt0L5Yy40XpqInOvSksIX3QVSLwomtWPaSHMdOudJguObopPd4
	erW9WTMyILb3nBEBZOa+Y0hxh4G+8pQM+wqf/OH2TLwu9da3rtoSMk9Pjim4dYtV8GtzbLe87DB
	QJ6yytlRanF8DJYxQKq0ofJFInRZGB5Z5MynLF5ibvVut3jS64Mk0dUb5gVqzN/UFwjioEdXu3Y
	cXpgGWz2RgdHIqYuAb7yVTTbFxgB4nSMR0dNYjAyF/JABCjLLUiCEBEaOXFa3TTVNDObmMXhjZp
	zBvSVAOzQkhaj6yTH/5G8BoEuHCQxcKvbdOTs9CSRukGU7OziofIOOUX1qV6pY3NTwIxUUtLPZx
	zckefEs/aB5HJ8f+oa/c=
X-Received: by 2002:a05:6830:2705:b0:863:588:fd47 with SMTP id 46e09a7af769-8631565526cmr4713565a34.16.1795204554951;
        Fri, 20 Nov 2026 11:55:54 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:53 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:42 -0600
Subject: [PATCH 8/8] media: mediatek: vcodec: Refuse a format change once
 buffers are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-8-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1950;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=uxN8uWXPPsDNnitOTveJHbSyY9I0K+Jb1iUDHWdG5+A=;
 b=EgoxeLDbz0VfDWewlqSPzl6zYQWyndby+MOiqVsid5yzHe2cY8RvYuopyUvIg4MUWXFHgC1EY
 tUWmrjd4dQXCfC327gZfBpckWNpOajpETTR0BjM851h3zRyGb+5/mms
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_195603_100175_4BC8FC8E 
X-CRM114-Status: GOOD (  12.82  )
X-Spam-Score: -0.2 (/)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VIDIOC_S_FMT on a queue whose buffers are allocated sets the result to
-EBUSY, then goes on to store the new format and returns 0, so the
client is told the change worked, and buffers allocated for the old
format are used with the new one.

Return -EBUSY there, as the checks intended, and log it at debug level,
since any client can trigger it. The CAPTURE check applies to the
stateless decoders too, which now also refuse S_FMT on a busy CAPTURE
queue, as vidioc-g-fmt.rst asks.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 1223738ece4e..71db692ed848 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -493,8 +493,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (!dec_pdata->uses_stateless_api &&
 	    f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "out_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "out_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	/*
@@ -503,8 +503,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->cap_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "cap_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "cap_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);

-- 
2.56.0


