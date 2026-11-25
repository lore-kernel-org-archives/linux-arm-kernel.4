Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A01606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shkw9mnQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3gogIN8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=; b=shkw9mnQbNCvUI
	6R6CC5qQMWYPjWsFDXyUfODOz6PU7T2IpH41AAfHms/faMz7zOsJ/dhlsQRXg+6BAVdtjg45RmnuO
	v8Vh8SWwwwPv4zdr80j2w+m616vY6m3fjmWurcBINj4Rubv5f2ZBdyBOhd92UHqbxEr56/3SuAs1c
	j7nRJMAZH/xAQM4j40x/8rJU1ep3Z+fWKUo/aXBAt02SOj0it7UX6Zwn/nPTdILyH22dKothdtQx7
	aBp4Tg0oJvnurnX5ij6hiYyRqrGW4Fdn4gEGVBvK+YOC40PAucE23Wh74YUHcO2JIwclQ0FiYaQsS
	P3FtJwVWu88i19A4s6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQx-0000000BFbC-2ZiT;
	Wed, 25 Nov 2026 20:17:40 +0000
Received: from mail-oo2-x00.google.com ([2607:f8b0:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPc-0000000BEmZ-1n0b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:18 +0000
Received: by mail-oo2-x00.google.com with SMTP id 006d021491bc7-71b2566b798so598019eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637775; x=1796242575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=O3gogIN8wtVR4p2J9dvTRMttMAr7HddCV8T/NDmppMzkLyqB0SGhl4dchGNU5Pw6v7
         rdi0mRn+FKdl5Hq9DoY2yVY6ms8sNR3fBArYU6Z5GE0luHYbqGJZVxUnIg336dJRvyh3
         DkZYZubC0GedXp/R54LMBJmLa5HHIGVHyx5bTMt6WyU9jlNU+9dkZ3X4rNOv94DiggaC
         86v4oUOJPd9ziZDGA+zazz/tBS6KrJ/1cMSdF84dXQrDzodrJR+S3rMZ9P5WnOBSzkEW
         FYjIZljtqX/ZlCtvS31f/Fnt2TB5DcttTO6oOr/K2wV7aozZfnmWgkUKfNFDyrKCvFnB
         6CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637775; x=1796242575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=uuRjc0YagDHzZpHGdLp4IRg5LbWLfbCITZBgqx/syKhka8FmoOo1lrAuk/C8qcpH4D
         EwqWrhSYZRSut+RNDLRjURGCMOq9fjgrj15q8ONF9Mr8LghIvLzQJ3ntWoXYVizUrTtZ
         lSQE9baZAkLwYgLC0zsyVCSlBisjbQjdPhb0lBPmJyGIC25dPv0x3b+DR1IghHl2Cj2y
         hjJPhd3EGVJj93MtKQ/0qtx7Jrioi6jwxnGIduYKMA3CXzyEAbdhyP1ilBuDtmjjYhOZ
         pJRGteF49v0nNqA9QUFWkHUvI3ofnCXyIXMv+lh5CVP+x7ql3HSRpxv3HC+oZ97QoQGJ
         Lhqw==
X-Forwarded-Encrypted: i=1; AL+hErEH92aQ9gQgcbhA8qQy1FOOoQToOd5O1TFHBhj9iOXi3oz6Nq5sdNYCFVSIhiH8Iv4/ucaFuIFOmBevX+FNUst2@lists.infradead.org
X-Gm-Message-State: APuU4Z+B4L1Dp0Bo8R6GqwFuHvpns2MQTQohd1At8O66nQpmMYI7YrI+
	Uh/RjYYFBy7YvgcjQmSAa72KoIdAr2pL4jh1gVK9UZjUghyJVWMrEej6
X-Gm-Gg: AZFdTZcwDp0fUXHpKEqUurPuVX0ULa/lBHWW0ZBqahRIXyNiUefrf1kPwnITQGDdJZ+
	0URrJjxNublBMmp0XtVIFvCvhggy46PvEMXDDurF+/ktp3QRw1n+pJtmlmS2C9Jg2rasY0p0rjK
	tWLeJZWtLgXLXpHYvRKZauqJWANniCH2k4iup+JJNEIGqf566o1pfCHloF14tsJ5+/yrT04usSw
	Q6xq5TgRy8vvZJGnICYb38zHe9nPMbrrdQoCALzfjvFC2POxpWYAy17lrRWVLKyp05F9XGLxtE3
	BXcmsoBy6S3QtkAgSCSO4EFF3X+v3R+igLfnWpedTH1DtugJ+ybXqzQrscn8cY709nZVCCkhnhR
	01gtVa7sF4vxYQZ5eNJqBfbQwTgGyFPTAWcymeoPrVtgVu+zvTph2NNEBQlExJPXuaeoS5nblAp
	FHmI4VY/adnW1mpjn3eXeUBSus/2LZR/6CN2FakrWhHWi4XBd51zpB66ZY5KlaR6ZY0usrYTLkq
	B4BB6ix3AdCMn4v+27rkkbM2qNaAWR5fb5Te/SZ77WuDLrZK/Y63RF61rrTQaPkA4YF/+XLuO1j
	fEKwpzUEAsabo0YmBMp7CnxzSAoc7gNSIX1kesmAFq8nRVjOF6P0FL1T
X-Received: by 2002:a05:6820:169e:b0:71b:79df:90c with SMTP id 006d021491bc7-71b79df0a27mr2553155eaf.79.1795637775644;
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:07 -0600
Subject: [PATCH v2 4/9] media: mtk-mdp: Round MT21C sources up to whole
 tiles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-4-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1332;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SML+TmgHSjoTNgMjQurRhuTtIXSo3udus0sid3UwpCI=;
 b=O6W72FlbWN4LuV0iiRLk2CkaYM593a8j+vtxu/b4eIoC58xSpkFVNzhRcnOAn6Ev/MJIHE5Hl
 IFgMC6jS43GCBp+hiHRxs7WXkGzOImAzk9Iax4nRoP1wVzh7g3/DYbS
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121616_486739_BD77444C 
X-CRM114-Status: GOOD (  14.28  )
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

MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
pixels, and the MDP firmware refuses a source of a size that is not a
whole number of them: converting a 1280x720 picture fails with -EINVAL
for every frame, while 1280x736, the decoder's own buffer size, works.
The alignment was 16x16, so 720 lines passed the format check.

Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
up to the alignment, so a source covers its picture, and the visible
part is the crop rectangle.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
2.56.1


