Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F105606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iyuiuwle;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGHPlM3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rMMXxpimWD9ofCyboRprDPWf9DrBJJ1w7n/6Xi+aArM=; b=IyuiuwlelGJZ2fFtjYGSPb7rEc
	J6d+f2Xsqr+BlgyEbKS+9F5k+nYMqQCTrfzBZOBO6aG5g2KZb0VomwaOd5CYY2iu7NC1gkcEzN86I
	aFJUEkJli5d5lgGupKkZHQr5e9oVOgpu5ehMb2hXumShRyutsmHVT71zcOKpMM159N5P8+UMNj6E8
	XV9v/PreJHQIge2aWwAIii25sp9ha01GST4e5A1X0UdVPWIqK8Hl73nnQBGw+fUmRg8XEKG4brXtx
	tSre0/S2Rf3lSsowSrT575uWmVqAPwLuFw7ypp0qatzMUQnX2GgbUTrPCIQTcSDILxvo6200lQBCf
	i5pKGriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWdy-0000000Cjue-3NSH;
	Thu, 26 Nov 2026 10:23:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWdv-0000000CjtG-2eL4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:23:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a440c9e13aso429340f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 02:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688633; x=1796293433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMMXxpimWD9ofCyboRprDPWf9DrBJJ1w7n/6Xi+aArM=;
        b=wGHPlM3PiKJ+ihz9WE6WwEBFwtSyOuthDRwUDArws0GaL1VXf3UdWPj30z/VvvLMwn
         1SqDOCRB+2/iR4fdx1MvVxEjWjW8G6P4uqdZ2sVa15b8R4USBS9Dob2ifoy4SaxtdFxV
         QbA+KZ8B03KWQQjjqwG3g5xkNA72wT0CnvswG5RZfBnnHUTEmx+j2/azQvoMCRu3PXPv
         4IdpdczJ6tGlZFLY8e8U3tUMogd1OqWikayYL5tfU52LFDdwnSkTwnwWa6aMW+uC5Y6e
         J/LgR2nhC62JU5m7g14kiASo2gQL/rN2hW179swATNIiH2yjhH5UBLFu6H7oaLRWap1m
         nMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688633; x=1796293433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMMXxpimWD9ofCyboRprDPWf9DrBJJ1w7n/6Xi+aArM=;
        b=xJDqSAInudIz3x6NykxsjJdfwMx4kMoS7wTrGSwNFmvtYJgWnmxrtyibc5oEsOWF/y
         WgeqovU/hox7kHc6N5iNexM1YERba5C1JkAf4c6ol9pfNyM/gOBaqdd+a8S+2P2LjtHt
         pSQRGMt1shp7yXnuR7xVgxuyGQhzbcGEVI4aNt1EX/O2e6dkaR8D7FYQvKrCrIXunG/a
         qYd15qQflkJx9B5OU1SqBwaew3o/vy3wcXndKwR/O2u1UhgBerKwYRk3J+tRFoWwul4H
         ZPQH/4zIyO/mxcNt8wXvKPnMb7VgUnI0Ml9gqpmkvFrk7TloBQl9+6p3aIPV5i9RyfWc
         Or3Q==
X-Forwarded-Encrypted: i=1; AL+hErHqjbv/xJb9UZ4Ne+r5l7f0v8+YdJgZwKerHvVfOsIjgAKoay3tVOXZAPhkghfkOGpmm0LqhBLCz5mn+ZYi0fAr@lists.infradead.org
X-Gm-Message-State: APuU4Z/+qW8down273IU2ABd8+mK3FMgsYMfQTWUs1U3F45NMkBIm6VH
	r4QaIHKPacKRa3DZEG2DzpHjBokvpfNx1FatwHmN+neKg68fbBTE3fWg3Is9bPDG
X-Gm-Gg: AZFdTZc2f9aPz008183UcFukJ7El2PRe2He93HgSt9arPIDMsgK/bdaYrifuPYgl1gp
	Oc91WhbG45su+koHSkzx1UrPG8LC4+Gw6vHTpXoTdsKrB5+ErU4Hw1Ve0uKnhodUPLyWGNAOS6D
	SmaYD1P3NylEdzQpGlkLsy4uQLD7buZxu2/u3L7xTfLPVmBBi4oDaAVLsOBSJLaMXEUpBD0Wm2j
	L5jpg+lTFomyLF/2O/8+iYHRYISi6ZppMgfqCLWy1MKnW8BhF2W552FpnHCJ4x4pT8Dzd1tK+hU
	gcOGy5gOwPaDxsrcdNmLOdP20ciD5N6mb3b6Hsdo6pkSxgXn+z5IGBQVWOG996BsSB9kqdQDvd+
	Q8UZKEOX7kXOXWE9VVZOr1XjjbKS0WuyVj/Vtk7oIpwOasMuzvOaJ/ECoqvxon60IDQWGtzRnBy
	OKCeooFZ3460humGK3jcP26nUD2I3NLYwcCGHO6OcZE7zAtSn4J6hVDDy8+aYLIGQsZyOq+1A2z
	oCoRPY15bu3kFeR799ObwaEhf793l3zN72CVdCLxmRiiUwbUWtp0IfbCjMq6uFMFeT2a7YWLM8R
	L3m2/0adXPYWE+JPWjmYUfwOQY2AYYwLPWGOecb4dQ4MG8AJg6Gtu0WEG8LaGPBpWeH7b3+nKB0
	lkBcfA7VAKhyfbqnN88o=
X-Received: by 2002:a05:6000:2f87:b0:48f:bb47:3d68 with SMTP id ffacd0b85a97d-4abaae41e22mr39403565f8f.1.1795688633319;
        Thu, 26 Nov 2026 02:23:53 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm39802210f8f.52.2026.11.26.02.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:23:52 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Kevin Hilman <khilman@deeprootsystems.com>,
	"G, Manjunath Kondaiah" <manjugk@ti.com>,
	linux-omap@vger.kernel.org (open list:OMAP1 SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: omap1: Fix request_irq() leak
Date: Thu, 26 Nov 2026 11:19:44 +0100
Message-ID: <20261126101947.28547-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_022355_684412_81393BDC 
X-CRM114-Status: GOOD (  14.85  )
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

omap_system_dma_probe() requests one IRQ per channel with request_irq().
If an error occurs afterwards, probe returns without freeing the
requested IRQs. As dma_chan is allocated with devm_kcalloc, it is freed
if probe() fails. If one of the allocated IRQ is called, it dereferences
dma_chan causing a use after free.

Use devm_request_irq() to make cleanup automatic.

Fixes: f31cc9622d75 ("OMAP: DMA: Convert DMA library into platform driver")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/arm/mach-omap1/omap-dma.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-omap1/omap-dma.c b/arch/arm/mach-omap1/omap-dma.c
index aebe5e55ff60..b0b46e7ec6b7 100644
--- a/arch/arm/mach-omap1/omap-dma.c
+++ b/arch/arm/mach-omap1/omap-dma.c
@@ -800,9 +800,9 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 		if (dma_irq == INT_DMA_LCD)
 			continue;
 
-		ret = request_irq(dma_irq,
-				omap1_dma_irq_handler, 0, "DMA",
-				(void *) (ch + 1));
+		ret = devm_request_irq(&pdev->dev, dma_irq,
+				       omap1_dma_irq_handler, 0, "DMA",
+				       (void *) (ch + 1));
 		if (ret != 0)
 			goto exit_dma_irq_fail;
 	}
@@ -820,19 +820,8 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void omap_system_dma_remove(struct platform_device *pdev)
-{
-	int dma_irq, irq_rel = 0;
-
-	for ( ; irq_rel < dma_chan_count; irq_rel++) {
-		dma_irq = platform_get_irq(pdev, irq_rel);
-		free_irq(dma_irq, (void *)(irq_rel + 1));
-	}
-}
-
 static struct platform_driver omap_system_dma_driver = {
 	.probe		= omap_system_dma_probe,
-	.remove		= omap_system_dma_remove,
 	.driver		= {
 		.name	= "omap_dma_system"
 	},
-- 
2.53.0


