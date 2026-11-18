Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kmjyW3Zb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxJc1BME
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=; b=kmjyW3ZbKdJ915vObKSwEIdxHG
	6gAsLbTjq4OdmTL5T2YCQ4XT71prMnAdRKf1Vm6HiYDlqwm1Fzkb7v17Cpz8ay8oZ2g3MtjFKlKlr
	uO1HwsjqzhA1vTe1D2Ou4E0ANs5O6agB/vMeiXGQRnB6/DY4GuguhEoYD6aRvzcIJmMnFnDbLfdTp
	LmjxWixcX10Z0AOiAhtzg/h/iVLQJi5XzxwAbSoGJQHu/5c42E/c0aMlLoCoZtkQB8vjxI3aGe5mZ
	imHFqdEoZ2VbKyBR4qs369R1x6AcMQ78Ap1ql1yzOTwBDr0PQkUkt+UAKGzzFVxkuLZOWYpCnMbgT
	eU1vu7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTb2X-00000008Aw5-3Hiz;
	Wed, 18 Nov 2026 08:29:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTb2V-00000008Avj-1pwa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:29:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so538708b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794990550; x=1795595350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
        b=jxJc1BMEE9kok8+esd8ActOh3XjVYCfNOkhxiKIzjaWFwTtShTrt0UZ1p6RrMX+mx9
         3SVbznSOIM3PVzCIij6hD67DVscfaxd/R3iVVX+hV6H2OoazVy+f46rxFcOjF5OCXQaD
         9pcPsje9/mSduq6QeLIN6NCpZ5tFj8nn31RDrjfpB5zrzu4oooZlWgMO8QN49yleVWCm
         DNpK9nYXj9ERCUqO9yZusLph00AremIOpV0zZFVE1/FHfIQNxzmjATosd8aEeJicjj6j
         RSQj3eE3QkGGkHJ9dzhnWa+Em33LQk66je52NPZQxVtp1ljPpcFePlX/rkfDVKrt9QOJ
         m2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990550; x=1795595350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
        b=lZTjff5kOSl8XqlVzIqbFGohptQXIzLLxBdWwYP/12qzzwaqar0vgW4W4h3rBhh79M
         DMrxdk4AObRvs3a1l0npXlJuHuYdGikP47RrGQHxwPRlqh+ZqY3HSjPCtYWZBBoHGHYi
         D3YgQQYA+raG2cNVg5kve5evHyKgJfB66cNZOazmQ1BMjUlO1bJPO2tBNb6kkEEHbw1i
         uCWccI44DBcuzFuYZsZGDoGrWFOSpH78gcx6MzRWDdFsHtHq+RfG7hJYda/hcvbDeY4O
         vcIT7H0R1uVAfwYrZmZsf5vamWKYpJREQV+TyRFgNTzu3x7mCN0F8OmKB0MRGr8c9Vzx
         AIUg==
X-Forwarded-Encrypted: i=1; AL+hErGsk4XzwvpKFVg5CMtuBncvymTh3gweU81KHS5tg0irr5gGbmTOCSzZtRGGKaS1XZy+LSDWFwCur9MDa7+vRPu0@lists.infradead.org
X-Gm-Message-State: APuU4Z9rDHS9ZKFiXSFGGrsfdNdb1NeFL1XywU+wfcIMC4yTRfd91HOi
	YjAw6mZASumK4E3UJDO5Xhtbgc/TGag5y2jD14GBjdi1Ck6xBDAhybDV
X-Gm-Gg: AYBFou2IxssaD936Rp3Uj6W6kgkk5CAPZE2lDNghJIQ85eY2kJA/O386DDY1jq2uipS
	dINkco5aBBjQOXDozJ7stovaHohuQaG6XSNegPUpTGFhGNijPJHmHIVs0cUzREvSmnGkpBIYKZI
	LHEoJ062agGSyWw+fx4c2g4By6bVtxA3bvbDVI9MQFFixyT/maIjJPQzoDUacWBuLhkIYQoLzwG
	MwuXjqroSN5WAXgEcThsZnnylEH5jQfuBx1AX4Wg6P84kaG114KyTq1grPy2pmvxUufmcwyK4kn
	I8FBkiq4zFJoj+6gd+WRMZ4FhkAGlvUtvDJDGYkpG6MLphXKfx7XRErGDjZbBX691VYFcPKvpS1
	cdsYLU2qKTeVkei6Ab3oCp1RmVsoTQivjamPokAfebrF3mya+jCIrFPSomUrg/M+UsnQGEAJH34
	g2YZiKEtxWFplNA9jqW1yvs4HietYGW70nchZ+f895bG7Hb5Nn104roVjZDnQ8Pr2r/nDnsfmCl
	a+UdG6bS8j9CBhvsk8Hbt4vENJMt1B4gFUcbTFHTlme1985TzcEAKNIwA+mFUcbAK97hFC2c9jQ
	EljbKQAcmWM/1JZavRrqvTxHxlqQuieStYVeTySLmbri4BxnEw==
X-Received: by 2002:a05:6a00:1da0:b0:899:5183:acdb with SMTP id d2e1a72fcca58-8c5d0f24a1fmr1572117b3a.1.1794990550197;
        Wed, 18 Nov 2026 00:29:10 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35db4esm784426b3a.35.2026.11.18.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:29:09 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: =?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] dmaengine: stm32-dmamux: don't resume runtime PM under a spinlock
Date: Wed, 18 Nov 2026 17:28:53 +0900
Message-ID: <20261118082853.926607-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_002911_500299_BB105B76 
X-CRM114-Status: GOOD (  11.85  )
X-Spam-Score: -1.9 (-)
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

stm32_dmamux_route_allocate() calls pm_runtime_resume_and_get() while
holding dmamux->lock with interrupts disabled. The runtime-resume
callback stm32_dmamux_runtime_resume() calls clk_prepare_enable(), which
can sleep, and the device is not marked pm_runtime_irq_safe(), so this
can sleep in atomic context.

The lock does not protect anything here: the dma_inuse bitmap is already
updated under the lock earlier in the function, and this second critical
section only wraps the pm_runtime call. Drop the lock around it.

Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/dma/stm32/stm32-dmamux.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 57318715d9f3..890328b3d302 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -139,13 +139,9 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	}
 
 	/* Set dma request */
-	spin_lock_irqsave(&dmamux->lock, flags);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0) {
-		spin_unlock_irqrestore(&dmamux->lock, flags);
+	if (ret < 0)
 		goto err_put_dma_spec_np;
-	}
-	spin_unlock_irqrestore(&dmamux->lock, flags);
 
 	mux->request = dma_spec->args[0];
 
-- 
2.43.0


