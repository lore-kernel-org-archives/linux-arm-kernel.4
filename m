Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33CD606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xctIBsLX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgjSjiPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=; b=xctIBsLX0jm86YvzHTdFSw81bI
	pO9a9tGNsZfPYgj1WDzD0wyELSyKB8JMVoS8UXHxdSDUivudfMy6BJPmmWQCnBaihOQanzDgkUAKn
	5aeK0PfLbnja2Uv8R+S6Ya5kzSB4GqJLyrv04AiJCyXNG5F3YsghtytSpu1aFkjL0FY4NSe0USbpp
	TPCAnNCedHXWcqVOAEQ+zd3Y2PQn3v2xxCoGLfjy2l55UzAI/aiVLJfBzwIiaQVOCK+fJ6P1o33eb
	OdrvVVJ4JjDJpHJthG0FvcDQW8r+Xb1AD8gGVda9ZMEjqWcyiqp9hFz453kQoT2nunnQvJLhz5/FE
	RC9HONkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTzN-0000000H8xm-1Kqf;
	Sun, 15 Nov 2026 06:45:21 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTzJ-0000000H8wz-3sId
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:45:19 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-55d2d380f6aso5668051cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794725116; cv=none;
        d=google.com; s=arc-20260327;
        b=PIJXL4Q3x3QOjvGArHFak0OpFP+sUgvvyJhyACYFiTFZjf5qCQKNHORpb6O9EpOKfr
         MHcArvoD3RwPqtFzq59R45epbT1iG/EN2sn2GsyNQwOeq5jrf8GOKPWhKsZ3/eCCGzUl
         4a+yNKPiWufOJm9GhGuxx1sgAC2c1cUy9FPhLRCku1bRVVy5v6hjO/KYyatGaspenHvc
         hfv5qUC5TTvFfHG9UyhMEF7QTUDVJDk50MJRs78J3Rz4xsJGfmc7TBKBwyJDjqoKg3if
         YmxctQfIsMssPG+xoCyxsvCbLXnlQrDqcuchQKB3AewHEYD5IrTG73aOSKLc6YHFO5UH
         gdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        fh=BgdkGHWk7cI1Z+0CIjeCkog8kKScLe/124AHcQBWu3w=;
        b=jtZTgJBUiNrdGhyLJP36ZvFY2ivSS05WqeIwkE6HRawvNmWcnlbvLZn3ZjjSyYpD1o
         D59qw5m03QHRI34JB8lSzHC8yrxm8DvRZwoZ1kYnR+vVGZhsJSA2CEfiYnK6/6CT788A
         4Hxhnf5r8m25Dr11krBZWi0itx5g9Fb+onGs2Kaj0ryE3a0RdzYc1vuy66gb9XYSXCny
         6cRrrq2rfbmRtIqCFR383X9J68XhFY6/KDvd/H9nzDbss3erejYL7exC6SvuMGPw6XDZ
         X/CQ/oErNpsxludDJDPFpnpKQ4DhuTYZWaqLuhEAmtaCVOursQ+yYa1TJdCnwcPGNsWX
         V6RQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725116; x=1795329916; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        b=XgjSjiPn4I4FWOC2dk37MgPpllVjDedkkNyeDbppNANdED6mxJHwcdGLNTfDNic6gi
         mGxfyEBtL7x5ABoYUXc0HIZDGS7P+n6l++LfXyEHulN0/SWrsZIgB5IGf8t3FVsdIBBQ
         aoRJnhQngO+Mqt7cnhIzMqGViVIIblcUD1mG4VM4gk0Kr6720NPFVBHChVuLs0IAq/3s
         uYsBcp/eoEnUIF92N20NDUjai/ftsUMzl3mkWS6yNEmM5RH7AjcQGHb8F8yiTS3Nr0uW
         3ih+DKRQ7CukaEfHDLhBpEhmkCSiq052dWDtugh8n40n0dypmxw+HbYHDmsLOlgTrhJN
         wdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725116; x=1795329916;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        b=ap846u6GlWKq6eTiLT/Y1gb+0jggPAmYvEDAlPymhekZg57LivJWuVhT2/cRk5lA85
         rvOOC36je105HDC39q6Mz78xjBf2AIoR2Ze2VulkqaFzZ0CPQA69DH2CK8iLsI+Dcbl5
         nDFkiBi9hpf2XRpFYZNKU5/tnny4Yh90YuNyP/h9xd6s5teUoJEgjujOhMGVYWnQ2d7Q
         6Gcjp+stkM75d9JozeEnW8h6FG1PWSQqQmes+OigNVEfIU/vrlkPMKxNYmFZLcdIZwAf
         NfJcqolQjxnJXakRvM7JHzpDGz2BCZV/J0MkACz7+FK+SIxqJDLn7QjXUBE/46I8iEO8
         J2VA==
X-Forwarded-Encrypted: i=1; AL+hErHl79DHEd3TiBmTfs56tQyYAnsMBk22jELKdM4TgOnP7DKQC+5hTRRnAfe0zQ8uLf6iJtI56iFIoIX3Z3UWhCl/@lists.infradead.org
X-Gm-Message-State: APuU4Z/odIjNAFB4JOKETeZkBZcNFWxLyc4tF82rzfcGfu8rxszdG9G4
	T1HaOojGwNMLaPV7JOQEcV+DVc0XrI8Wy8qyRDfCCSaxTdzo9bCu3VrpuOjQ9WCK4ptVliHRNU7
	F8giRs841SbxJ7eVunR2YbHbXsY5LcBY=
X-Gm-Gg: AYBFou0P9AtFtbm4qUjoxFwVkArlzM2FRFtoJsMa7WhajCZ/5FeehWCPD6c4W71bf7J
	xWlektJDYS8gVUXGHOPOXx7XNAAcqXhZZgOGbAA9estG6aFvHIcGYeJ3OIh92WB20JXHCnGDDPr
	BO+vF3YOjd9JqGfAa2Lh3jdlkJ7NNKGuoepOlp7j+lcG5WrQNLJZXNa9f8gLzl9COA28WqBW7fH
	alyRh7X4ueiMsJjuxYDmglfRkjXqbmd1GAJVPM8E7wtQvPq/YYe5av7h6sk9srjRZ6OllEDdi/S
	QkWkMFWRhYMR5ne++qhjNh4SGgD9aBWJigkVdYrZuVCAhyen7kzRy0Zt2wps2Hvhj8W/r5jBmeX
	WRg6+og5Tba10JV6er8lpKnA3633aAataeB4tqFc5ARgw5q1x8ocACYGdEJA3Sk6uinHA
X-Received: by 2002:ac8:5746:0:b0:535:a5fb:644f with SMTP id
 d75a77b69052e-55ac9877608mr106957761cf.73.1794725116540; Sat, 14 Nov 2026
 22:45:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sun, 15 Nov 2026 14:45:05 +0800
X-Gm-Features: AclHuK-2co-82s-DL-Ir9lk3bEMvqaIe8ZDqkSHlEPOMFzGbM_JIO5KSnIMrJc8
Message-ID: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
Subject: [PATCH] dmaengine: owl: Check IRQ lookup result
To: vkoul@kernel.org, afaerber@suse.de, mani@kernel.org
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_224517_979051_916EE11D 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

owl_dma_probe() passes the result of platform_get_irq() to
devm_request_irq() even when the lookup fails. The request can replace
the original error with -EINVAL.

Return the lookup error before requesting the DMA interrupt, so a
deferred probe can be retried.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").

Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for arm64.
No hardware test was performed.

 drivers/dma/owl-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 31a6c6e01a75..daea82718229 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
         * simplification.
         */
        od->irq = platform_get_irq(pdev, 0);
+       if (od->irq < 0)
+               return od->irq;
+
        ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
                               dev_name(&pdev->dev), od);
        if (ret) {
--
2.43.0

