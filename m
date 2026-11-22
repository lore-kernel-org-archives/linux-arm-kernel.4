Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6E2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JVPHzKwH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=03LXSTCL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7sQ15HfMbTEZX/7ho4424kJ1+Lm1T94EL19j/wJnx9Q=; b=JVPHzKwH1xHiQynRNUA6HLDGhj
	D6OEl4+NCP/s4xF+otOC/2c+apHoRLvf68A2/SG09neIwWXObXteaUGX7obXvR2hhEqCAtMsDXmu2
	EBtssrFxdlGXAv1l8gdj29Uy7t7kWe4Cmqclz0oKl5xQCaLgohgD253jnsk3EVdz2dw1fp4hjL9M4
	I9hsa9xoXxxMv15Z+lnJ3TBnM18cYFspjrQpt4xsbYpSAYNVL9dU2SQCGNN9Hz0KgZ0DuhVfWqUOB
	dEn3NbgcyusLp1u9c0LgIhxACf0m1K/O0P+AJDkvhbe/AL0NTUOQqfu+YisqJbSkIrqy6Bmihhu5i
	8YKvCzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2dz-00000000qsC-2Ok1;
	Sun, 22 Nov 2026 08:09:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2dx-00000000qrr-1EI7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 08:09:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f04244c3d0so19277325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334988; x=1795939788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7sQ15HfMbTEZX/7ho4424kJ1+Lm1T94EL19j/wJnx9Q=;
        b=03LXSTCLzb1+6sT+qyaJe6+QtN0C2YXCEbcUeRjN2MkLfKW8o782nisVaitH1LUYLx
         sQTob7aTAhq5+dHCaYWy7157moeGlypd0gJ3KUquLOqM4KvWrrX00vHp3L3X5K1Kd7Jd
         SN49VX9vys11zhg5brlHSAgAHxsDj8d4r8HYnpOc0uinrSTA7YGFJ+7ElFCc/8hOUmxV
         geHNZSCZVey9v4mPYXNvGo6AAK3NalTYiWyBdY2YtHP3AoS6ckpEolCpsBwDYlnsenwY
         RiC3ajrk+0IOLtP6uvCqjEeEF4F36tz+bNf7XW3VhmZWr5qVrp8/B0KadLSOzDfKwo2l
         ZrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334988; x=1795939788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sQ15HfMbTEZX/7ho4424kJ1+Lm1T94EL19j/wJnx9Q=;
        b=sEOZNC6+ILak+KCOVyi+Yw/e6PMq861DYngSSA5YbrfqjivAJIzv/wTddkDkwCUCsa
         V8HRQ9V0zgSKQfncixPuOama0O1umNRNE5XWmn103z5SQoxW1/54JByl8FpMYeVw5Uvv
         V2aL0YzLp2YuMi6hyyB8ltpjpNlr8dUhr/3huQi7IIgqULEQMVsn0I/mq1mqj6F2Qpy5
         atmpV8uVcjQ4YaW3D8+lO9WejTczfugZgypgACy42c3Xr7RyaUWMbfv2lmU76E9pADuS
         BGLpI5hTaopVXsW0VUk9DsAfeWroKAACYW+MKvG29vzMt1lZ0+dM/5DSyp9+8dvBbk6Z
         i8EA==
X-Forwarded-Encrypted: i=1; AL+hErEV/cpmIXkwVz1laZs9gsrBl0xqeiTzuCwoTLdOpVuIosT2Lqjt35b3wuw1slt7hZvF3d6G3H7DgxnpEJ4Q6Cnr@lists.infradead.org
X-Gm-Message-State: APuU4Z/GPJyXMcnm3zLbgD531vxmOEnP4lMI33YUsfTiMD6fdsdG4ONu
	FAACKgahup6BebcJAAziRnsH6gVs20ycdHqv52cJHj/Bj9uNtZHjWrPY
X-Gm-Gg: AZFdTZdjMd5p0YEaZtk4GtBay47jZphQrrwLes5FtBTs4vOG64bZTO4O2JKo4lKWVfY
	PwqKHI0JUl1mmnyMEmwAp9ZyqT3s9SoVnVj8aHAxmT3AGo4cFnSpmw/1HBY+51zDrOIUpScXlzF
	vohPvT3zkRMNJrg2IVq2B4clhZTu/erRloDN/6AoiLJtFnrpUbrs/4Hfpqzwak+fW3sjSNPnx/0
	sw1aLpV3K4ECUq9rWuW7wP8AfzVT2Yx2Ad8Xds/+vpZC4rSm9YlRkDXX1vlwoavIERah8wiRT1W
	akVAGluwm/Qn/ysmSEraR3mVa8kSoqliaTlB/JvhdikqVBRmp7FOnKXxzgVkYcycGcLi5FBHC75
	MsuuznbJ8Hrdn1NRcLFAiK6cybwOiq8TgGHOFf6OuazqNQPnDYsjOyixRBm6K4njhye07lM3k/3
	rYMiXi1rh9YKSepPSL6Y8SFmQtjqGhpZQFTcAYDEQSK31ivTkyVgIlKbot3G3bwZkBot/tTfAfQ
	pHch+d1sgbYrqdSFxOgUuduaTuq6Cm7xbHIGJrDSXclVctNnx8aMtLuSkgGf0ZTlDog1r3MdLX+
	TckPjtxskbBt7ciUY5YZ1h28+jzttc7QYyzHdpoTVHYL3p4iFA==
X-Received: by 2002:a17:902:ce0b:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2f03f11c934mr89527635ad.24.1795334988319;
        Sun, 22 Nov 2026 00:09:48 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm35915865ad.1.2026.11.22.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:09:48 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ulli.kroll@googlemail.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: clean up trailing whitespace in cache-fa.S
Date: Sun, 22 Nov 2026 02:09:46 -0600
Message-ID: <20261122080946.167126-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_000949_358047_F343F391 
X-CRM114-Status: GOOD (  10.68  )
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

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/mm/cache-fa.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index e1641799569b..236ea21fd128 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -8,7 +8,7 @@
  * Based on cache-v4wb.S:
  *  Copyright (C) 1997-2002 Russell king
  *
- *  Processors: FA520 FA526 FA626	
+ *  Processors: FA520 FA526 FA626
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
@@ -29,8 +29,8 @@
 #ifdef CONFIG_ARCH_GEMINI
 #define CACHE_DSIZE	8192
 #else
-#define CACHE_DSIZE	16384 
-#endif 
+#define CACHE_DSIZE	16384
+#endif
 
 /* FIXME: put optimal value here. Current one is just estimation */
 #define CACHE_DLIMIT	(CACHE_DSIZE * 2)
@@ -202,7 +202,7 @@ fa_dma_clean_range:
 	add	r0, r0, #CACHE_DLINESIZE
 	cmp	r0, r1
 	blo	1b
-	mov	r0, #0	
+	mov	r0, #0
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	ret	lr
 
@@ -217,7 +217,7 @@ SYM_TYPED_FUNC_START(fa_dma_flush_range)
 	add	r0, r0, #CACHE_DLINESIZE
 	cmp	r0, r1
 	blo	1b
-	mov	r0, #0	
+	mov	r0, #0
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	ret	lr
 SYM_FUNC_END(fa_dma_flush_range)
-- 
2.56.1


