Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8036606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WacwOTui;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOSVRVxk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=; b=WacwOTuiaLobaK
	BgR8Vsqqr3jpC1n+IxdwgS/E8OTn4cTmPh3Q85wZ0CvzeAuBpEkdc0ko6/JfsCcudSQCXKedvsTOE
	Ee2qUQttoKvWpFxYBT0tsxDjSap2PSiBxfLquabwmiLcnGCqzdh4ciQN0EVqDwL0RpC9p1MUfBW+5
	M5gmd/FCQkzfgUitHJR6S0kBDMDc7DNlvWlQBEB49Kh8JDiVC6/2nX7qsWdOmrTyihQtuwtZtn3xm
	2rlLcBEMGFsDkexsXQLMZV3BT7b8Abny2r+yaqdDevWwjZA4UF4Ii7tpORjFQbsndEzLB/v6kvmk9
	1PrgQLJcUMhzp1hC3cAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiI-0000000G9Zz-42vF;
	Fri, 20 Nov 2026 19:56:03 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi2-0000000G9JB-2MOb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:55:57 +0000
Received: by mail-oo2-x03.google.com with SMTP id 46e09a7af769-8459f7bc7c0so522007a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204545; x=1795809345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=gOSVRVxkQeDPKebIoc8PDVTDw5JX5+JU6hS9vgz4A6jmBN4Fs9Vuv9jKRHr1bwrmIu
         Rk2SclBUecJ1E19SW1UCvRD2OkIAMvd9Fbh7zEI+EyIQfEV+hk6vhJQtp8zc3krMqKpk
         yW0Shvq4jnMskQi69H3LisTsvzr3VCJsHSqgLbOAFdbkh3nTVAQVJzlSMCXT6PC2HwdJ
         7zxwkwxry7Y8xtYzn6Ddm77C44AEMXgr8N8RCDn64LCH7lZlIpf2mmOWhBXVxPZZLTx5
         kQAxWJYc6VXowvEYJZYgQcXqwZi46cn+9USjOgknNspatjk261P2PZAiOx+k4/wf6ecc
         8DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204545; x=1795809345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=Pncvydh8Jye/FtMzWRoWIT6Hd/sJnkpbmoYu++d4IC37eJadWxvYxZ0CqOy1MNjF84
         er/GtMvlBx+xRGiEpAMQXJK78Jv1ywoYI5iPMFYFnQ0VrYYNBNi5OnoY/BKEMNO18uPM
         RryPlkqxzP79TXhihFEjJPMppDIDz7uFiZkaWXs1q3EKM82m+2OnU+gzvl/BuPqqOiRL
         kr4+8SG2HNd1dHr0Dm4NcMUfZMvjAxNt2fRrrLGCXT28198UKHo4DbwPyHglst3ACfXc
         YYvelZXc5Q4OllUL/OIQ4nLMb4QuA79trprHWz7Ez0FBqM+Y9fzbCQ5LGJPUFqyyUIys
         qztg==
X-Forwarded-Encrypted: i=1; AL+hErHvHTHsrhCh68vtHjp31IwQJo8s+2NnY9AB4qbyF7fXAc19WXBjB9Be745JvVYESJ/M/jjJ3j2Xlr06QPnZGCyt@lists.infradead.org
X-Gm-Message-State: APuU4Z/VI55mOVkY6bxEmbBZEFcdR+cUV5nHeH3wvE+o31emGQJELa5C
	W7jeha9nv/XkrfMvP6QbeC/BeKQlJjDF3poD6lhhw0jQ/EKGYrIg4Ay6+9anunPNRga6kw==
X-Gm-Gg: AYBFou0VT0Ftypo9zAxMf8ve9E2Qq8m/yfb5Tu7OlPKJgo99Plso0rHsncUavGxUjBD
	qhYyrKCjfoM7Uj0ISc85oJN5bOVSeolSNo+iLF/DCLEYWjm353k8/pkNz63sCVlE1fja3mb2P4v
	ysWyOwKi7X9uo+/I0ufvmtW1LUoJASFgm+Vo8ZVA7pBmkjI0QrqekQdwWdu/Kv4p3uaa/+AXVnI
	UguKGNAye/dAppPoge4dZiMopqNnKxVwGnffGZPNqOul3RLL5uoRJbOSaT6OqlHf9utkmhZDrc4
	erP2qCf1hxRppGHvTBjsZbQIzsq7JYnCIVxEtGjajpbbq3mRpFL3/8WUj7P63/rhlqj7/4apUFc
	vwnnVhH/AwvOEjaWHM5hWqlMLvaTCSqGKH52xHhBAlDPDHvCcCHF3btw+uoK+Xp7s/HENovl6Rz
	C/0tQFJjAkC9JGHxCfGNpRdWqFa/wA+Gznx8CsfxYk4KhXucxX/HZXaWa4pxYNVlcDJBUElx3kW
	jW8WQCeFWAAsNK2EfMD6SwJqh98KXFW9fck9Wd7+jjGLq4QzI93nHiiQQTNWLa3qMn8zwuQR+LT
	+RzzzvwCzPPW1rkxEAT904Ix0OeP16Wi2EB9B7Xo9PdSnE3wO4HCKUfHn2Gl0SH6PQCLaciUn+k
	1I6ZeT/IUoVQu+zPEsTE=
X-Received: by 2002:a05:6830:2309:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-863152f7039mr4827356a34.2.1795204545560;
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:38 -0600
Subject: [PATCH 4/8] media: mtk-mdp: Round MT21C sources up to whole tiles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5J/eI70FCyDjB2S3myLsMuolgA4DStIsxM91Bga1384=;
 b=SqbifpdhBYdDKEWSD1Bg9yo3dJkJj/+ZjLhPLwuCFT2ajdG3xUkTtmCGEe0nVkbHMfOyIpOuI
 2jFrbzN5uKiABZiVVyvpT+MJPpE0NCPpLF9mPq4/OmLydHf+5NNUDB6
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115547_131277_2DA7A6D8 
X-CRM114-Status: GOOD (  13.35  )
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

MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
pixels, and the MDP firmware refuses a source of a size that is not a
whole number of them: converting a 1280x720 picture fails with -EINVAL
for every frame, while 1280x736, the decoder's own buffer size, works.
The alignment was 16x16, so 720 lines passed the format check.

Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
up to the alignment, so a source covers its picture, and the visible
part is the crop rectangle.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d2813890cceb..34d02de4453d 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -40,7 +40,7 @@ struct mtk_mdp_pix_limit {
 
 static struct mtk_mdp_pix_align mtk_mdp_size_align = {
 	.org_w			= 16,
-	.org_h			= 16,
+	.org_h			= 32,
 	.target_w		= 2,
 	.target_h		= 2,
 };

-- 
2.56.0


