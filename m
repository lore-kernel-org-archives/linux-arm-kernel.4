Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZYNrMiW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zE1cCYsk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=; b=RZYNrMiWvYjUoi
	ARUyQPfnTg+o9ZiYOEgQ8FIWHgj/dUe+2MLxPULDUhbOrrevKnqhyLyzBrTPrTjyX00pDnGSvNZvd
	fjrmuiXZcRlT7Wa2pvrMgg0/pvrsIPrLP4rcGkdJ7roUACMY/VUMnXSocPrUiDwFDrFc2r1o+GC9n
	50ZHVxITuhMuhwD5doWCzv/9A9MHVNX6ZCAHK/vBuhUk/beRZqWpAkf/RBETND+c+x1CHYamJzswa
	6KsC4b3nv+8d3gKPLtGXGsV9PKeKqkaOZZktxP0AT23QrvIRsriKd1mc2BV4bolzniTfTyfQ8duvm
	bODRsSqM90ZmosWutUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDi-0000000EJje-2XFS;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDR-0000000EJRg-2Pmb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso39812865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721588; x=1796326388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=zE1cCYskKUdEQyys1vCFZKOig5lpDUXPQFr1WmbJvyyE+Ox32DMNHd4Q42+FfdAFxC
         r63Ew9OCew22wv1v5Ns9z/I5A7J0Ufp1E1W0dVKnYGSwaeN7a8b228WEhqTDRExJkZiE
         i+2GAHojbJIbkcZLl6H2EzW3k0rFNFAUiokdUeyUQqnItltZ5G4An1jiUcYF3nIK4MqY
         Mybn7oLYHIgeQuhcpWCwdO4JjCLRAmfk07O7HBF/BtFa1sTpfmYd1lp+Dz6t0MZyMQVZ
         gdYc3hxtJCtWMz0x2ysmTdhtsn+lpAqNW40E2oMc2pTVGDhtR+F7HDdlO5QzLfeLLolp
         HgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721588; x=1796326388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=r+mM/boEudkAVUHMicYnEfsIU/NrenFVOuhb59JP+WCGDchbYRRxZ87shA8zLnzcNn
         MQWquyGlAG+Z2+5goUvF3ES0cPmS13IFtmQg7lnItqExF1pOBz3r8Y+soOHTHZ0ctcAq
         gibmEXQooUprkjI5SMLMqhSjkYmRfG3DWkZN4rdl5cepXHX7TLx5E/xT2nh2l4g7AL9t
         VD8aYzlOnjz5N8bgyDb+OKNKLQqy6v9AN0h5lxyala+JQxWy+E/EPQUjNuJ86qhrMuUH
         8QXJmrfX2W4wQ62XUmwAQ/bIp0TsTaMc3iZamcvGsAgLCxEtt0cbQ3J4P530wso5qA2z
         gQ4w==
X-Forwarded-Encrypted: i=1; AL+hErH7ymduNOMdV6QjG06MmYY7GyKkoffUCASAiK5/pIbH3C8WPcOO+n6k0rAHnMo3pGxiWAldtnxA4Ur2jsSVRZLb@lists.infradead.org
X-Gm-Message-State: APuU4Z8rBoLaY7uE4DtqjjJUHJeIy0KaSxvFkkqwNcufiJuDIwIckVoT
	JqT20emTn6dVxtbI4gj1wP4tilJv6mHOJwk9iAV3Mll0HX4o+J++dbMD
X-Gm-Gg: AZFdTZebxvOW6AiBSFUPEGmVU4F1LQTck+kQgigoKqW9ZZDgIdviGaQORDiR757bf74
	64slCm/NlFmvZ8ex3NLlwi1g3kW96eEBSN+Ide+dcSsrlXpO13UE/kYkwqV1PdvFsngXxLnD2Vi
	aUBfaEaX1Ci3ZW4muu3LRqLHyZNvfk3EbDFqn5bCrXz0cVJr2peppab9TV2MO1E81pS1YjFJ8CY
	V/oV/yW3Q/rd6pC74jjqEWax3TEatbXds87tYxDZJkR707LNo1oT0/1h+LP3eWc6rSNrakBeRsr
	3ajMbGfbQdd+bIuO1gJsMft/CvXkLleEiwCYhRp5EeOtXDytvNWG9XX6rAVAHZ5R6sgBeRbFt6Y
	HBYNOPFDDX+u73RCdNYu5zC7ZglIuh+SsIuSv9t/ww+UH3BhYOYicS/qGVG0Idb+MoaqxcG8I6c
	M4Vn+4Gjy7aQ1Mh+4cYVE4N0CC7Pxrd0tAHrqsQkCIGEijP0Te//wf23scg4zFGIw7Xvp9yNAu0
	l5bX5pJhrIU74pZVmaDPJegGYf2qHzKdBT33m3x4bnLO7b52WxGzR9c9tLgbi7s2295ngFtCs/z
	1jWLZzlA07Uz/KHHdtuaQPrFF71kwZae2Lmnhu2ersXn2g==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr457062975e9.32.1795721587613;
        Thu, 26 Nov 2026 11:33:07 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:05 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 05/25] crypto: amlogic - Remove clock input
Date: Thu, 26 Nov 2026 20:32:21 +0100
Message-ID: <20261126193241.1471372-6-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113309_629081_04736C4A 
X-CRM114-Status: GOOD (  14.96  )
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Amlogic crypto IP, which uses DMA crypto engine,
doesn't take a clock input.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 8 --------
 drivers/crypto/amlogic/amlogic-gxl.h      | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 24ef7d5a5607..37224d75edfb 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -9,7 +9,6 @@
 
 #include <crypto/engine.h>
 #include <crypto/internal/skcipher.h>
-#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -267,13 +266,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
-	if (IS_ERR(mc->busclk)) {
-		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
-		return err;
-	}
-
 	err = meson_allocate_chanlist(mc);
 	if (err)
 		return err;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e0bc5c39bf2c..5149dc6e9f60 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -91,7 +91,6 @@ struct meson_pdata {
 /*
  * struct meson_dev - main container for all this driver information
  * @base:	base address of amlogic-crypto
- * @busclk:	bus clock for amlogic-crypto
  * @dev:	the platform device
  * @chanlist:	array of all flow
  * @flow:	flow to use in next request
@@ -101,7 +100,6 @@ struct meson_pdata {
  */
 struct meson_dev {
 	void __iomem *base;
-	struct clk *busclk;
 	struct device *dev;
 	const struct meson_pdata *pdata;
 	struct meson_flow *chanlist;
-- 
2.47.3


