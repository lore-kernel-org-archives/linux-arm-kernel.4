Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A89606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h0cYaI6M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuoEWMoq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=; b=h0cYaI6MYeqLSY
	47FRSIbYON/w8IlGFbNdFx9HdvTd5ifcIeyCkOlQXS+3A3cSv0xITRK4+Vg26hwSEVQORKBfBMJ6R
	z6amPHDl8Xk9yevkBJXMsSujFZpR+mXLwB7Wi5QxEB38wSS/F/247TnqNaB2fxe/XWZCJeqaxuZAO
	fE9xtLgBJniO+49U+IbWW53cimhbev9M51cLJ2vXhwDeVCGByGOuKYwIXs0AKpE46TiBffJSDqU8j
	2BZ5b9snBPYJx7LzubQgwQ2rp2LPGfut3uqZ0J+3vsPu3CQyIRxsoB9LuiOT6akvr8bV5QeZB7b/A
	QoofQOVe2hkb+B+QezYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQb-0000000BFQK-1JC1;
	Wed, 25 Nov 2026 20:17:17 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPk-0000000BEtM-0QWn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:25 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-71adbc33a72so1842138eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637783; x=1796242583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=JuoEWMoqRqN1CFp55JofRMtJUlb8LRzYKOnPsu59JsCDdizBc05vTTfYV8ivT9lY+H
         aQBIOOJt8ERl3bBvsENc6VieoQAV+GXgi//bOJ3UGbia+3UtaxagmtiQm2hhVxmwWxXL
         cuJt559q7w5AM244AghvCja/XoMZvgYxd1VBcDAvO91gpV0saZQDRn3iaUwjU138K0ny
         ZoNdHMU7K/Q7Jt9uDnp4LHPjG5hp6hkF0OFddqh9+vKJEgfkdhRy5S/99CMPgCwTOHve
         1a9hhq1a9yuk2G2hWCNOBKqD/nZ0ZV+fGBuiVsyvmBxa4xYFNi3qt09Yhf9R42ZT4Sug
         lhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637783; x=1796242583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=O9WHPglqUx+zbLT85uE8XNtM+FqOdxUz231PA5veUpdic6DTaCSOqytI2ZU5r9STwT
         do+ftqO+eXSvWyRuvUpFKScIEuXiIkzWQfneTx1OixyxhsPX0lHIQ/JPFx1nMhK9zWFv
         HzHMHWCKibfZI2iuzxFzfA5sMmWgM2qUovAjElreHQfAwZfgN4Hm6zYsCM8K1RFbHUZK
         uuvCQFviwgByBrtcpy3Sl4dgLNX8P6R94rB0Bq/eCtcDhpjcvavmslcyy//k44V7jGFb
         DIbb0ud2p5ugqrY96zy64RdyCEdjQ3njwCeMxPeNzWyW9rFiMBiMB6t/FQ6qffNYSYcK
         goTg==
X-Forwarded-Encrypted: i=1; AL+hErGsIbFAbpYeiUQSzpuAwt/bmNj6uIqP2Sk0+gZp4k2S2t64o+Rk35Bp2/gqkrkihCfNcQ8HPHKVitOG/XgVPndH@lists.infradead.org
X-Gm-Message-State: APuU4Z+hS0ixzhjs0bVnq+/EoYHhFMOdZiWF10rFrsQPvLifUA4KQad3
	md+ZLADh+ANRTsKS6aXqxa8BL/Q9RfZQg1nPgyAJd72lzIEPJqoI1lCL
X-Gm-Gg: AZFdTZcg2OU611H0rOSjXsZJwHPot6Fag5rDz7dWablkaRhtDg9TqxQAYETyGPRLYSS
	u9gl1f06Sh9AlR0NGG85acgLbViaZ/jGC5LEzgLhlLv58eaVvfO7UCPdgZVm3YLMryp+xURlq51
	BtE+KQw7VXbcucVQUCZbE8QLgbXMz97PPHOGE7YxAGEAueeUP+GdoOFwTi8CqPuGx0DK3vIT039
	jcdVLbihwGoeFC/r5OGy3lyd+Jyb0R2C6qtWr77yYAaHWE/hDsTFoza1iD0oaASPE6PQAe4R2/m
	Hl/Pd28n1cTdxdf8Yq7Pn61mASDud5lqfIJQ+wY9xL6uDXiJCKu3/SsWrO1EiRBQj7rxyLV/WG3
	KTV11huHa+hCSlrkhI9BfqUg2CxQHDmXMOS4Trn7PBbNmpZEa/hzEc9yR6ge1kaR1wBjR3caHdW
	fiQE11D4ylp4WUfMo1f/wF2LtD7acVSVrR0MuR0V5DDJywZ/zz7nDlUc9Nmg/8FD5Rd+26q68B2
	aBaHnjKir1GLvkGy0xS/sR4VZ4CTE4IZ9buhu3B2eYsz8THU8N2hkU+Meo4ZQ8Mlk9lWEMnySPP
	VW046ckiJiJiepCyVRqmRKT18+AU/HUaPJ36a2DXCt3ArKZFdIJ6LkQz
X-Received: by 2002:a05:6820:1c92:b0:71b:7929:cb54 with SMTP id 006d021491bc7-71b7929d44fmr3615961eaf.38.1795637783065;
        Wed, 25 Nov 2026 12:16:23 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:22 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:10 -0600
Subject: [PATCH v2 7/9] media: mtk-mdp: Refuse a format change once buffers
 are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-7-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1974;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ToIzGemh2HZYfPM+0fU+WVM5fBqJcWgALuaETYVwNso=;
 b=YyKMx+idzrYsHi5C/jJHDCr8A4+FV3/lteY93PlNVBFkvn2Yc532M5WpbprdE0h37qx239ObY
 NbKcfOxO94bBh6twJeOGkYBw44Fa9nxQDmOu8P83mq+1flUeTlwmTUz
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121624_170367_CDB3D6B4 
X-CRM114-Status: GOOD (  15.07  )
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

VIDIOC_S_FMT stores the new format in the frame before it checks whether
the queue is streaming, so a refused change still takes effect: a client
switching a streaming CAPTURE queue from NV12M to YUV420M gets -EBUSY,
and the next frame is set up for three planes in buffers that have two.
And the check is for streaming only, so a format set after
VIDIOC_REQBUFS can need more than the buffers already allocated.

Check first, and refuse once the queue has buffers, as vb2_is_busy()
does for other drivers, logging it at debug level since any client can
trigger it.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index e0627127430b..1be0f44fe1b2 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -698,6 +698,12 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 
 	mtk_mdp_dbg(2, "[%d] type:%d", ctx->id, f->type);
 
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "queue %d busy\n", f->type);
+		return -EBUSY;
+	}
+
 	frame = mtk_mdp_ctx_get_frame(ctx, f->type);
 	fmt = mtk_mdp_try_fmt_mplane(ctx, f);
 	if (!fmt) {
@@ -706,12 +712,6 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	}
 	frame->fmt = fmt;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (vb2_is_streaming(vq)) {
-		dev_info(&ctx->mdp_dev->pdev->dev, "queue %d busy", f->type);
-		return -EBUSY;
-	}
-
 	pix_mp = &f->fmt.pix_mp;
 	for (i = 0; i < frame->fmt->num_planes; i++) {
 		frame->payload[i] = pix_mp->plane_fmt[i].sizeimage;

-- 
2.56.1


