Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C93606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBsiAA6T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eufm2dp7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=; b=WBsiAA6TCUc/my
	fKyfl/A/LCp9uL9FR/RAKr4Uc5pHr8yxCaO7JL8Fi+OgRVAdWwKz7uOpT/zL+ZKrS2c8rl8XpnteL
	rq6oYzukQXYy0UDAY+WavJFbHMg/qZBMawkPB0dvWZA6nd5ibQyus69gonCQ1Ps/MapYJQc3uO+Ps
	+ZK65YKbzTdso3ya3p+M2h9WmZlwAMMijH/cpgItvD5Zq+bTVEjAB8OtyNuGYsc0nETfoQMwhcy6C
	ogI3bjABk90uxT0MN/8OV8ZCU2Mcipa5KMnTct6kUMjwa8Gu/OOzu/Oxi8RSBO8mLvh0a9tj2o4eU
	b9vV0sNI6ugV2bv1kJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQy-0000000BFc1-2HYZ;
	Wed, 25 Nov 2026 20:17:40 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPl-0000000BEuq-21Fy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:27 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 006d021491bc7-6f9b24c99b6so1924823eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637784; x=1796242584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=Eufm2dp7/GQWyXLuOT8FqRhPvHq4FfedGpz72ZujN+W1lmzAXC31fRix92W2qkCKh0
         z5anwCMNXwFeJWK22YRlF024d4eKdvWgCxQFhT9k94JRK5igf5LIcBdG8kbqX/JkGi9B
         hqLUXEmB1qvs4T2nwNDsPPN+FJDC9qoUzMStti3ogREzmiV2kGkQiOFgtSpdimIAZWkd
         UG9WFdHChuXwRz80S/PmHpY0AqL5MkiIH1fFA6UC/UOvLuvYW6goxByRF14Y7U+hDiGH
         2h1HJS22v4OqJiwTuOKKp9u4ODdsuObkza2NX66t5HJi8iwetYK34pXUaPlKG0VneES+
         keaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637784; x=1796242584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=BkDjUilMlOV9Fxja1IEeIfCLpxM42UKoYsKFDP6qrKhpQSy3pqgh1wZjd97ELyGOdA
         59LMD3ZCR3W07jV8J03NdA6xvw3MShuZVTgRWY/mKhrHIKBAwxZsIv0QXhzurKCrjeZo
         CGQDMkrjkq5a+dEvCqDacg14n4RJKmE6OuBQkigabVZNCblwNXlb/Wp38KOPBHls2Zsl
         J6ekaQiEstegvXpe0ecx7kh4easgzOdOKQrBPInRcNVsA5Go+JXJr/GEvzNUAUOqvpve
         QaYhK7JAiNUllL7aLU0DMGGKOsYPVZMoQJwFIG+D0uCh54wdTJPRCuk4TbYf5mfUBlCI
         iplQ==
X-Forwarded-Encrypted: i=1; AL+hErF9rDpXcohD0UpbFIgQe49/eZvby8KYHAb1gW2Y1u00uOds38NbWN0bTzqBdeRn2jTy6Rtrty+SLjrFuriheu+Y@lists.infradead.org
X-Gm-Message-State: APuU4Z9DEBi4zGm7Ek6WU/TxbJFF8ObUkNK6kTpkMjQpMGLEBWgwyFHJ
	LFKknAsAAnYANRvFVk9Afiq+PVywPibTUMdCKwZK7ksVwQVN/w3zLGX0
X-Gm-Gg: AZFdTZerBmX/qiy7ybl2QgeIceSKIKEU3nn7fuj1LYsx+2CejyyRMLhjJCb4UFgKcoG
	5DuR3B/A0LBIP8y4vil/FoNyjy5HgtxuoV4A4gutJjry3ccb6NWr9tj2Ymhzgma+duyf7CWymNo
	m0auINYxyKnWC7Uyq8CQco0ZuNMa2hu4VqIOIGhZlwEo2kI68U1dIq55VgE114QKfiE94pMupDN
	rtQTx1H9xb/Ukp5qikuhCfqOIJ7IU2rI/8yPkrJTfTiB96xleANerv7EtKrKSgzb2095AVqd/Ou
	3BY+UxiTjaeYdLQEeAUe2bARS3gNqXrEus9soQoSvCB0jGKkmpo/4pq/di03Kl/ADr+DlW2Q0aF
	EzsaucPp3Pu6trpwxSIJNiXNFfH3TViket2MiIzFL3nrttB843X42cf4amiQ7cIGJ2JJ5SFNJDS
	XrVYoGH+XfaZXEzC+Eu+9RggEE024zXUPcBu0qvZp63W8rHeKCXbhN4NIW6oLrMWp7Uqb86dfys
	BVPJBUvJmUda5/fxgO/BBjzK5amoeOkMN4ViiOptzrYnDpbMMilILOLOsK6uCs+xqMa9xfF13S8
	YehEjMdWWUCMXaxhg6Bf3FcLojeGcDqZOLg=
X-Received: by 2002:a05:6820:1387:b0:716:df3b:e940 with SMTP id 006d021491bc7-71b3944022emr18067391eaf.16.1795637784658;
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:11 -0600
Subject: [PATCH v2 8/9] media: mediatek: vcodec: Refuse a format change
 once buffers are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-8-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1978;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=z9CNO4bCWGYjNQTDYVvQNuOaV1YRFSzVKYh+7SCdusA=;
 b=GzF6pMC0GCPOHve0CXuogF6oQG8hAnVLXT0K2N9Woit8cMr6jKke65a0sorZ6u3wiUe6HkT/F
 jNzOTZp9VN8A/BhNIpxCSQBMnSCT8Z7NjqdpvTXjWKfxIN/UV3Apuw0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121625_535081_7BCB48DA 
X-CRM114-Status: GOOD (  12.74  )
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

VIDIOC_S_FMT on a queue whose buffers are allocated sets the result to
-EBUSY, then goes on to store the new format and returns 0, so the
client is told the change worked, and buffers allocated for the old
format are used with the new one.

Return -EBUSY there, as the checks intended, and log it at debug level,
since any client can trigger it. The CAPTURE check applies to the
stateless decoders too, which now also refuse S_FMT on a busy CAPTURE
queue, as vidioc-g-fmt.rst asks.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
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
2.56.1


