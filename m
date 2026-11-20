Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E9260A2603
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0SVI37dv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lps/Jq/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=; b=0SVI37dvKkSK6i
	hASMnZ4B1yBIDKy+UNqfLeu4cSX30nsxaw8V/uo0Jd6ZpbpB3YLwMw7oj9Ls9QfCOL79heabNmt4T
	kNChwfgNI+FR729qaTaCFKilQiZi2Zb+fxubyfFfOgjsOZ0+prN94usAmYUTJIiebJAmtSy48Vubo
	4ROM5zUwmb9XdxHBf+dm7XfmhlVt34JU5O26MPyXlkva45F8SbgOg+ZVWMySFfn6Z89bDxrAyBR2Y
	NqvmBWWYrWzbSm/dwB5gxrVHtyJX5zW9h0fuDSyV4tRaPbnpS5QMJNWH6N1twTeZFcgakntqYnHOl
	UIGSkMlFJEq2kYXm8zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi7-0000000G9NV-0Gxb;
	Fri, 20 Nov 2026 19:55:51 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUhy-0000000G9Da-3pO5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:55:45 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 006d021491bc7-71ad9f62e49so182674eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204542; x=1795809342; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
        b=Lps/Jq/vdtJmngnEQ4YfQflR+fFagWYCNmf/li7GuV/A63rHruiMHizCbtfFk7JNIN
         6t3BpOgMQ/YYSkWXdB1lEoc00RxiGkh4ewZcghB/EL81BOhgEZQGZ0fwVap9UF2H0ZWm
         VBoJxxyX/HNpog510TBgKMKIGBD0H+mavmT9pKSqL6hVRa5nppdao63Wz+iyVrUqhnos
         75Iu0pdZ0sHRh9kOR4HIiK2cFK3AxTxX4dH33ImGmHvjfvIkpt1QBjrnK4xN68Nd3o+L
         2zU+nCRvGgSXIh8YRIUokD+NesJvlaSTOCzRRDiLep6gl3zcaQmD5XX5FHwFWJbMZnCQ
         YcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204542; x=1795809342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
        b=i4DjjIpH70QkqfEjZ4hD2rqN2Jf3uSnEzLew/Uw2+URBn4rfVifsKpeTyianz/sFnZ
         kQGnucNjMc6KckJPVJZkCrn1mnGnZEo84Bfdgd4A3LjfRmgaF/HDeKY106hF4iare4Ti
         bD9PB60MfGDqRiwnQOEdkX9Hr8aMQ+AnxLXB2hKSLMU+PwmkjIIZ2okIBQkVU3jp0PvW
         DIsuZmH3VDRUcPcGpUSYFNIsSR13L4g3K9fZChmVjDH0fW6IxI/8wWDvhRP+RSrfYxOG
         wTbsW6NkF0ySSqOzT2VEqwBdPI7yTW5qv0Lb9z9ELPyg9YMYDlqdmjEx8jv75OeLvc0g
         /W9Q==
X-Forwarded-Encrypted: i=1; AL+hErHf6ns6Zp8R0nH88gPOyvJCzcZ4kNYa7F4AEVIbHMQEPHcnM+kWP+wdNj+I4BnbnLUvKaHyXAD9hZFn6wwo79zb@lists.infradead.org
X-Gm-Message-State: APuU4Z+s5g8XHS4krB+LopqsH3oKfo2Us+lrCbNQNgi4BYGh56IxeTPJ
	CT4X38LVMU7leUqo8eVe0rdcRZ3F+DbDZqzB3BkFHmLBbD2Qk+D8wwgK
X-Gm-Gg: AYBFou0DG/NmUlyIcaDFjbP/X+6D13NXDxJxqxZj85qSg3oKS7tmRhBeUuSPGJawKXd
	ocfzezuaUbuBxsgrvrnS2d0oXWmYHz7m/14qUXuulleQvuoLcDJuirFntBG3cSDB3mrgBSwnZE/
	Nztoh50jxrli221lU8fQCpuxHvFI6PQGuB0jVy0YeBcxOKhGyBLDS52a5CXF5281Q1uHI0S9L5q
	DfG1vmYXp9MJdzrs/75M8iy8Ffn0pfBTrF/tzIOx4zmqvbaSXZFovjqYYJfFKg7GT0E8wWxIyv/
	j/CDMJ9ycMayuqKYA9CCxfc9kWNeTGX3OV0e39XkSUfVZ2MNqq0das42+TCzq0xgXMoafcAo8zB
	roW1BJU0xNr9/btoyX2Vs9KE17lPR4ZC9nONoSPG/nmSIVofToTBidttlraocTpsXTfisjIKnd1
	qQVv6X4gfu7bQYSeWEEc8sMSrQabQKspYcmWvGDnHXa6CYRFhfUcgXmeuGmRLNCGXGv5lFgE83G
	k943IzXl6uDYvi9JGy4zc4viM7HprRu0yBqDm3uuCuiVVqnyYY45lGqzVzhQ3/N+UCQJXA4ZKzG
	SSLYD7WWUaDx038K06+MArV60hniV5aI7+vO6UYcsqB0x8r7exoSEQK3i8M8dEDrnUI+bBV7+eY
	NSNDuMGulzX7iocKvgRU=
X-Received: by 2002:a05:6820:2ac2:b0:71a:df0d:e9fa with SMTP id 006d021491bc7-71b39591da5mr2512697eaf.80.1795204541857;
        Fri, 20 Nov 2026 11:55:41 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:40 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:36 -0600
Subject: [PATCH 2/8] media: mediatek: vcodec: Pick an OUTPUT buffer size
 when given zero
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-2-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=2640;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=MdHaPFnIJfi7B9svaRku2VvRxyRKfqWOKsblgQ6Pmac=;
 b=RGnd5wD8UWEUd4ugoBRg/wBGw/yk6CJlzgxUEwHK4g+3osGkf6SAUebULJ59+LFIABjMwSBZY
 1O8x0cg4QqMBy/NSDP3xvBC/ASWTTTsiQwVZKrktw4UHLMREL2t+Wm8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115543_386886_FB8B1BFB 
X-CRM114-Status: GOOD (  15.12  )
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
2.56.0


