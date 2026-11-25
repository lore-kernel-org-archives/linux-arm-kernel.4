Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913A606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CmRYInFX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uopn7sy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z4bRGKH0kOHCjEmxIaCcb1feO+j2LY4X9/sKXGw0aNk=; b=CmRYInFXH3fj6A
	5Or9IsyMdQ10xJfY9mI7dYR4tLI1xCQ9MjsHK/iLpQhWKpBVt4/rpZxeawvNaFdWtuDU7IUVRsCuL
	RzmsVx6a8VnxitnE2wsrP/Ozlk4fuOgitQ3zJVK277B/ZBhqfdjtb/xV9A2+k0HD0HtUihY2lgH9G
	FeLl+bwLAwj0VP/RAVT3/OQgftiHdu2qqDY8WoV1jvWRwaxjh3BRaGUDd4800mdyH1qvsOo8tVLtS
	hk87JnMxKd2GnFsybrqe1jI8kE2nHFTmWgMFIIeETRd4ppksoeL2Z9Uy3DqcrKKeirKIiAh7LCmtu
	+uYzICDU6fTUMqk56Pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPd-0000000BEnt-3Bg3;
	Wed, 25 Nov 2026 20:16:17 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPZ-0000000BEkX-17Mt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:16 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 006d021491bc7-6f9b24c99b6so1924752eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637772; x=1796242572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4bRGKH0kOHCjEmxIaCcb1feO+j2LY4X9/sKXGw0aNk=;
        b=uopn7sy8ofsKd8JgTmJna8yLsR60qjxHm7DDesqHddJ7qNOVUzavjtl6hKM4lHw3ep
         LHF9WCnBydZGxJyrG7Q+yNcVh61W71f7qRDeTxvxavuNnmqjq725zYHp6WltFCP7tCOt
         qfnt7YppOsFmOnq3EZt5tA64o144cVGTtOG8i/Jas/7qMbkSe+Pl/ZEHY1Dkyd9xijN9
         HGLnthtjdQ2n0hZIE70DPHzxl32B9hN8awQsztCbgZFgaR0TifQUWe5s3mgYqzo0Gj5Q
         A/9LlHWOO88AK16F4YSb7VPkJu06zn5gUwVB0CCxQ1uZeS3oKvVZiQLuHQajNYtNRoKn
         hMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637772; x=1796242572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4bRGKH0kOHCjEmxIaCcb1feO+j2LY4X9/sKXGw0aNk=;
        b=l1Fq8RS3Jz+ovgYrtXK99mgtusK0Ods3LLxnDEAIeTOwrr04tnZkOH1f4k46FnfCnR
         n7ZiIf6YL+SigucbqO0mYnb/DGYnrIeRjcdxym6efxsXmprihKdrlt7QirB1taQmMt5s
         FMWpXxclXlqs0sKgkKm22VLkj2A043U0wryVa7gk8kPgk+HhILJqYrMEyA5EgTb/CxjM
         JZAphROZipcTlOEBD8TjZrKB0S/cruwQ22lBPvUQxOjbcEDWPo1bq334oxVViqv8k+Jw
         IsGYKo3VBEeUaksIVsEswv56cpawv/6zdfJeYL7FoA+4REbsCCJT4awzngV4nZprsami
         bhhw==
X-Forwarded-Encrypted: i=1; AL+hErGCimpupU9Jrt4SEakngZTq49zesRw0ZEiROPRAlqpkbsNAVkomlWSn6Y/Ve0kHezWJolpXBN2ctDq0ErxC+vvF@lists.infradead.org
X-Gm-Message-State: APuU4Z/yA37Z0HQivxjMVykAMksVCiX/+IKUSiYDdO5t55RW7e4oSMXY
	qpj07XyEHz3JFxTqOrCyJK2dy1z3OZz1eDxjBY/uirWWG5Jp/9DHIpLVdbL/irBrjexEKw==
X-Gm-Gg: AZFdTZfe4qwM7BXvEezrnNEoHBNyOEovxJSvrr6/PhWQ0pi/ni+oPJXg/lIE0nrJCLF
	/iGpE8ruWOiSZNLWPoT7S9M2piefoiFE0KnCKuLhzVEKJabM2BSArYEsLKwge4QnMMTa+JIZOcO
	JuWJtw2WnijoDW4074YfHuPh/TBPmRqDY1Y5cx9EOJos0QA2ZVNyKBgXiha48BZf3muaavWF7tU
	MjmXRxkAdvGD3C6FKpHJ9Y/eFuB/DRUR7gzRoxYw3BnBHLuF1N40jFl7e0g8wv+r5PS2bXMH6Kd
	iV2Mr/SXU5G9wC2TECkriDTOl8kuc9hORMkdmZZQGAho0tTGSVViDhkfgWstRn/6fMvxCcS+/G+
	MpUdQxPsd+T3Blq3G2E5v4O84hTJqIGsFIjArhkpX3vwH/oA1JKDQ2ezlKang+WkEmwd6GcrNGk
	PTkuo8bTg+rBMeBsbpeaVLpqeaYJ9ucwgNMamqNkpOP98kjKBxvKgR2Nr8jqlQaqBkErlTpDULW
	J3ipcutKAXC0JDxAsaYuMUHJbC0gwGsXZQfFZzCHOgpS6kvBKj35x7Sf7AvI4WJG6Lzng5OMJ4H
	sMvFvA7nmBn8WedVaN28V0VWs2f9t0DDOlw=
X-Received: by 2002:a05:6820:55d0:10b0:71a:fb0f:810b with SMTP id 006d021491bc7-71b394472d7mr10513277eaf.29.1795637772452;
        Wed, 25 Nov 2026 12:16:12 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:12 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:05 -0600
Subject: [PATCH v2 2/9] media: mediatek: vcodec: Pick an OUTPUT buffer size
 when given zero
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-2-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=2668;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=u6eyQBgm+7CuBxS3WF1G1ok0eRHrZUlhD6WNNdtOUQk=;
 b=WxRjo4KeMoOuIJ4FGG7qmX/OSEYiiQ/nKPUxeP722l1ZbSvJZm+x57AhtvqX1z/mF3xxpoUDU
 bvExabDNPlBDoR4kzMV65cq+97DhFM/aELIqNzQ/r+YfGM3mF0f31UP
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121613_344518_4CA2A05D 
X-CRM114-Status: GOOD (  15.95  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A client may leave the size of the bitstream (OUTPUT) buffers to the
decoder (dev-decoder.rst: sizeimage is the desired size, which the
decoder may adjust), and GStreamer probes with zero. VIDIOC_TRY_FMT
refused that with -EINVAL, while VIDIOC_S_FMT, which does not go through
that check, stored a zero buffer size. Choose 1 MiB, or three bytes per
four pixels of the given size, whichever is larger, in the format check
that both share, after the size is clamped.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..9339f53431aa 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -5,6 +5,7 @@
  *         Tiffany Lin <tiffany.lin@mediatek.com>
  */
 
+#include <linux/sizes.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
@@ -306,6 +307,11 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
+		/* The client may leave the bitstream buffer size to us */
+		if (!pix_fmt_mp->plane_fmt[0].sizeimage)
+			pix_fmt_mp->plane_fmt[0].sizeimage =
+				max_t(u32, SZ_1M, pix_fmt_mp->width *
+						  pix_fmt_mp->height * 3 / 4);
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
 
@@ -370,7 +376,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	const struct mtk_video_fmt *fmt;
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
@@ -382,11 +387,6 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		fmt = mtk_vdec_find_format(f, dec_pdata);
 	}
 
-	if (pix_fmt_mp->plane_fmt[0].sizeimage == 0) {
-		mtk_v4l2_vdec_err(ctx, "sizeimage of output format must be given");
-		return -EINVAL;
-	}
-
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 

-- 
2.56.1


