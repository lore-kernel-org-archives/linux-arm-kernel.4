Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F498606A753
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FEeVubvi;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RgDBohw6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gMp2nKVz+I6BoGQGvRzv66hb3JZ7XdiXU/KpflrSMGI=; b=FEeVubviNaBAUlGoQp8JlnLvq3
	FjzwjdI99K4A1dL7U+Xyx9wLC0XOZAxk32OizsQJtG3W2r0Hyui5ySncaVfQ9/EtX10jOXkcsmlzQ
	Oii8WRUezlaFbfjxbaX/FjogI8i7CzLF89fXietra1sQbo9XiizzYpr77U1yf1shd/DHzrBNTQ1Tb
	jzDodu70M4Zv6PWer45IyYJOYOWWF2Um7JvYvFgKWTBoP9f8BPQ0KWlzU24n77H0g3Gi5k4u6hKt8
	FUUNWGYMLZzbwykbFHi+xCsYlufRoy8JvP9XJPUw4q+l8PZ5PLAwSbAmYdi3u5iG+QB8Uov/bGMGH
	oZe0YuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlta-000000043m5-2GPH;
	Tue, 10 Nov 2026 13:28:18 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQltW-000000043kZ-2MOg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:28:16 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3137179eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794317293; x=1794922093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMp2nKVz+I6BoGQGvRzv66hb3JZ7XdiXU/KpflrSMGI=;
        b=RgDBohw6nRFvJ4tcXfd0er/rm6V/q5gr7t/XbY+37Xb7N4MPFtBxtL1DOOQatTaiOS
         VXY2KsvlsyGTMc+QFpZAQpsqYmwJT1IyrLOAzhYAqGP2YOoyKG4Dljl02ylwwok0qVIK
         R3Qt2212AGuiWQGxWV6TYow+ArMTWp0twRb7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317293; x=1794922093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMp2nKVz+I6BoGQGvRzv66hb3JZ7XdiXU/KpflrSMGI=;
        b=NKjUN/jVjeKxxuhWqUPF5Baq9Q/jsBQy3oLSei/hD+tZxC37ciA2R/6HFLbT4ESD4D
         AQvOABc/3c0GAZOqf29r3Sg1gu/JzNUi5gqhrlmEJzYtLvIsQ4he4g7vvpl4GMMuZO2T
         ODE5cJzwjeCjScO6EYlxV0EZ/8Aw3uO98PQulc8XMVTCy+xifzXRixrEZtM8W0t2lan4
         VYYk7/BUkICGrzkBWv69UO2TyJ/IyCenS6czA3rBIAivbSBNjlCfMU3/6KlmjhUrQ5P3
         rgJq6peQAICKReuKtc/SNmRs/t2vuKPMQqeFG6oGLMsI+1zY63ATIs5Rywvb6dtKAFBi
         L6sg==
X-Forwarded-Encrypted: i=1; AL+hErH0oJEO7wnKnGCgwSzTmMB9xsiAEOUHtwyJ2JszwZf8Qu0J+83zj2B0XlL62ez9DxzrZJhb6vRtWATEcdrWr8/Z@lists.infradead.org
X-Gm-Message-State: APuU4Z/bxQ5QU4/MLsg0w6gpbPZpbMYH2t2HaVt8HJT1bBuxQpa5P2qG
	n1WCPfM0gPx0lFAdDLwjAbdq7Ggu8Y+xfmFLXchY/q0LodZBUAX40qjngM4Xa9TYxA==
X-Gm-Gg: AYBFou1dnqhHtkRt3nOv00WKKQdCHI8ZOfP7YdD8mZNi95N2iywF6YdTOcvdAYnXLpK
	VdcauCbipum3ULZJApDFXIDgxkfHdWiWwR/zKAZcTHZNB9BwXk2zbStPSs+VzzvKjeAxEnVjoem
	k6PfNYnx1QU4Ml4SGmJCUpI2s6+d/IkagspzyNVTvYc+yh0E2s0YEiFevL4wcmeK7xNsYh+b9Ep
	KuKs4iI/0ufER+VjWngWW8dFGDjgPPonnn0RF2NWZaWcU2TLCqNDOHtJxMFXM+bJK0NI+53sqP2
	zKGuZEDP5ua95xP6MvUq+EZ3EqBmoPX8ARrjJffi5bmkF5QuXHnNxynQgbUCrlt8BvIWLPI1SRv
	DcfJmiMRUFpD8Uo2EcCUi8J+BV69TbxKWrwncRPWG8+8UMfaagRt6FNLCT0iNfAq2EAU9V5I+dp
	D3VZl+Zx0cQIqTI4gayDPwHFC4UBmqhNEn3NjdHChbrP66WaPUfjGO9PAU4mEkWxW10kvKg4HNh
	i/eYmigdzMCdClLQFVL3eAgw38yN8mVR/iMVpc+19k3YM+WrNOO7hCVcSickDEK+bXiEATRQTlL
	6+TJNyNhru5PyLUPqvLmGXAkVI0QvURwxkB01JeMOHhNhFLCPDZIc9LgvD8=
X-Received: by 2002:a05:7300:fa0d:b0:36e:371:8255 with SMTP id 5a478bee46e88-375197c460cmr2832222eec.0.1794317293244;
        Tue, 10 Nov 2026 05:28:13 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:d9d8:9bd:b442:5671])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-37520cfe07dsm7516417eec.20.2026.11.10.05.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:28:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: mediatek: pwrap: Use devm_of_platform_populate()
Date: Tue, 10 Nov 2026 21:28:05 +0800
Message-ID: <20261110132806.3119114-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052814_631679_92F42375 
X-CRM114-Status: GOOD (  18.49  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most of the resource management calls in the driver's probe function
have been converted to the devres variants. However of_platform_populate()
has been left alone since the introduction of this driver.

Leaving the child PMIC populated while all the resources used by its
driver to access the PMIC's registers have been removed or turned off
makes no sense. The first step in the teardown should be to remove the
child devices.

This change is more for correctness. If someone manages to remove the
pwrap driver, bad things are going to happen whether the PMIC device
is still registered or not. If the PMIC device is still around, it is
left holding onto a regmap that was torn down.

Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and MT8173 SoCs")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 90677187c3b5..fefe7a41da5a 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2592,7 +2592,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (IS_ERR(wrp->regmap))
 		return PTR_ERR(wrp->regmap);
 
-	ret = of_platform_populate(np, NULL, NULL, wrp->dev);
+	ret = devm_of_platform_populate(wrp->dev);
 	if (ret) {
 		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
 				np);
-- 
2.56.0.506.g506a7eabc5-goog


