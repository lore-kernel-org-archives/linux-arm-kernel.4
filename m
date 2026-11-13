Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0F0606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W/3i6VDD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNts+pLk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=; b=W/3i6VDDb9vuVW
	GyVhIYl5cc0sfij7u7bYXLMfLybaNUe2Fm09nDuIYgh20KDojOwz2d+fVRRrdVCNk5wY6j1mTR5YV
	nK5aDLSaxmQYAZqjGqGFSgseNMavL3SmVlVmhRBj8tnxLd++luxfsueUj+PTncEKymdL7DrqE206j
	4Dgtw9PNE8phyo+FzRBxjs33+K3Ep65b6+B8QnBA6xRmCc0MO7TRhwHlCii3i3YH5yrQ0Cktpy5bO
	bHIxWHmhSC8tjemwj5K+GOewszj8AHS8f4XoDXgM7flzuQfIgq9dtSaOOHVSUhZ//HjigRSoCDLyX
	5zBhDn/InSkb44EupXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRofP-0000000COOi-2Omf;
	Fri, 13 Nov 2026 10:37:59 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRofN-0000000CONv-18au
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:37:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8b5efadd183so867210b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566276; x=1795171076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
        b=nNts+pLkkgPop3T2C3uspjr9sIkvTYmvHug6aY5ptXfzfv1t7DLbxk4hTZoEHrFNxq
         nr7ffbqlhbKJdi/spLIQnbxmBx/EccP2tyA9Ta3/wnU5Npq2pDkKWOsS4ix+3sv4njMX
         cfgGJPx9A4kspz+TN0gf73Xu+pq+STn4qOF1ae+TqpcZLIbiAMApVGQPgpziphyhLczT
         47NOQCi2syYWSkmJNV/cMa8z+z5aySGhuNHEECgk5W8fb9jxnY8EvqDZt+Yp0ubqdFnl
         uIel9Xw2tcZJN0j6Uh0T9QhblNE6LzLuth4BrQgMezITmYiiBP201b4h/lnsk8cj1KiP
         WYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566276; x=1795171076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
        b=Ry98W0uc7LhGgchLtP5ks5AN6y1rIDsIhl3iPonL7pMCF2NB4Wduy2n+7Dc9fii/xg
         EHdE7TwMN9HQmQjdwAB/6wJwhmQMe3x88/QGgtB6gNpLBMAqDlZ/9qbtVZlvOpSj7tVZ
         wwkAdbuUQdTRn8SZpHPawKcdGgEkilQPWw4E7eZLddDp5ubsadV9xGcUtF1KJGGbA8qw
         UkGfjcU7jmOuJzHB39yIplcyBacyvhLUh0GdHwajGzX3I/WkFBrFD60vWWlHDBWOZGCi
         eYgynQP5CEl8ceZfRH0zZlIMTP4Go4qEf1V2FbkAus/eJXnIOdvu8PtaS7K/lX/Q0ZQS
         OVbw==
X-Forwarded-Encrypted: i=1; AL+hErHX1ZirfzAz1SST4NmnchODgxTVr7cVFp+tQJvgcTMv4RUv6INAdapMi/Nbk7KIyFZcLAJTwPOblTDWBJWXa652@lists.infradead.org
X-Gm-Message-State: APuU4Z+7CafO1K1eT111FlRb8JpHNfFKlw9VmQ0Hv50c/P4XK7dCm44d
	FZPmL9EMEQofdVQGsD0o9OX+92Mz+KS7KcN86vFwM3GOLj2BEjiW1++P
X-Gm-Gg: AYBFou0zBURNULXhphKY5ogpFarrJ8+o9AZXqyQmSQM6C9ZfsmXFd+IBfmZuazS0veX
	e6CKojowfl7vKF8eqeQ1GajFdG4Io0G7qJm1dS+ahudzqVyG2wpaAodNbmkXVCtO1OeHvOyO/aE
	kLD6cz+BbqqpLkI8EbsxkiRhk3oNLoch5COg35X7ifaOzNTNmmfDHwzxZebfUUHV2ep5ZgB3zFM
	HDnkLZ3ygrfhGHCnywXl6eyHA100R0DT8KdjRzsY1bevYvcVFghkE5iwfIauB26/IMRa5nY45hN
	wHgeC0QOb2KBrPsFq3NxdZ85zPZBao7syzIXGPHpRBKtAm1tqmVao/wyC3xPHJ+N8uZC+d0q7iD
	tzs8anmOqgGv6fiN9crIrNQu3bUko4STAfkn8r8hQm+7yVHxcKlKY+n87mbyPdJrs6ZLaD/4a62
	sWInh1meC8wYuo5TbtHWWlpyHMIJ842Lw1RIMPeve2seXS14X9jnlG126wFJRAQOs7gbiOrvFnz
	JK2V7MEtnj+T0anAeK3tYR8jaGfud9ddwuzsF13VaAlL/nqOQDYlsXaReVHCptwG/M/tWgRtDeS
	1xDARZVmsVQos1mf4gPTRVXUCK6v+wacqdNpNpz9fu3DJ8u4ujWt1Zp5Ag9k25LoeBOMfgCuJZG
	HV9lnFf8gqhS5G/xgV+01MtmwoeQbbGvEjBTPK4y4+rcb
X-Received: by 2002:a05:6a00:886:b0:8a0:2d72:17c3 with SMTP id d2e1a72fcca58-8beb619fbe8mr1640146b3a.15.1794566276302;
        Fri, 13 Nov 2026 02:37:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:37:54 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: atmel-classd: Simplify probe error handling
Date: Fri, 13 Nov 2026 17:37:26 +0700
Message-ID: <20261113103727.30449-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113103727.30449-1-phucduc.bui@gmail.com>
References: <20261113103727.30449-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_023757_348730_112217EE 
X-CRM114-Status: GOOD (  12.70  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for clock acquisition to suppress probe deferral
logs and remove the unnecessary cleanup label, as all resources are
managed by devm.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 6693bdcbb8f5..117c8e400184 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -547,18 +547,14 @@ static int atmel_classd_probe(struct platform_device *pdev)
 		return dd->irq;
 
 	dd->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dd->pclk)) {
-		ret = PTR_ERR(dd->pclk);
-		dev_err(dev, "failed to get peripheral clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->pclk))
+		return dev_err_probe(dev, PTR_ERR(dd->pclk),
+				     "failed to get peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
-	if (IS_ERR(dd->gclk)) {
-		ret = PTR_ERR(dd->gclk);
-		dev_err(dev, "failed to get GCK clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->gclk))
+		return dev_err_probe(dev, PTR_ERR(dd->gclk),
+				     "failed to get GCK clock\n");
 
 	io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(io_base))
@@ -593,29 +589,24 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	/* register sound card */
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
-	if (!card) {
-		ret = -ENOMEM;
-		goto unregister_codec;
-	}
+	if (!card)
+		return -ENOMEM;
 
 	snd_soc_card_set_drvdata(card, dd);
 
 	ret = atmel_classd_asoc_card_init(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to init sound card\n");
-		goto unregister_codec;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to register sound card: %d\n", ret);
-		goto unregister_codec;
+		return ret;
 	}
 
 	return 0;
-
-unregister_codec:
-	return ret;
 }
 
 static struct platform_driver atmel_classd_driver = {
-- 
2.43.0


