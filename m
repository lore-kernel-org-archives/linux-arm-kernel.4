Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hm6LeQyG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OUEbEfrF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=; b=hm6LeQyGV4lw06
	uDtRQLOMtJcJX9c5nL7mBUL8rB+cCYVqLIbPtYncG/MdiE2wpsQSV6GYJQval9p5MNhLpDDh/qnQh
	6XQ6AQWyWNjBUb71gcLlJfMyk/8LXZN5VEGRHvFu0Toxiszog70dFFUMjQj5nzu44CixKXwDDVunJ
	5J7uYPKW61Nkyyk6cndr+wWqyhHDJGsEoK4QmeOgfzQe8cppm+FJ0YNow4Ctol+lrmR1Kz/AX+QLd
	vbxKmgibBPLlEUH5uTo1zZ4PQH6U+ZiXiGN5deD3AJh0ygsC9iMT87dgV2SbgPtu+BxWz18HucMnW
	7WGWPUG3s+cnlVq1LZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2oL-00000005ujL-0WLm;
	Wed, 11 Nov 2026 07:32:01 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2oF-00000005uem-1PcQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:31:56 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-36dbde64409so6030439eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382314; x=1794987114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=OUEbEfrFwjRXh/3W9X5a0ype6YUmYlsExWRoCIgFVEVWRvznYGh/jKqf36LYfqjATr
         T/Ss8Mv2IUGIM9/tVCeq5JpuCDID62ZX8yX8oPu7OrGm/VXZQxaztO+wjWFGBzArB0z2
         51bj5V2joHnzCNXFQ5oV6YQ16tCcGihZPOXj93OBTjuy9TuJ47grzInTsy0BGuxYDinf
         QmppONFaujzwAKA4MnDyoxff3YcbesXdiF2knfKQzIha1oSL+rrAdUQZG85KtNtWTGwc
         jVW24zr6Oq4HPArHVUb/dBkd6XWQH+bSAOOOF+BTZoQIrxI5f0/WcicMmHdreOHLr6lC
         xE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382314; x=1794987114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=u+6bt21qi4UePGJZvrPikFlbYRiG6y+rlne3RM3klUNaNbIfktyFdY98+xEI534PIF
         xep9/E6v/Y40Oq7lEH/kVcYzhjPlpKRC+AoC7AlhtkfYI07T2DKpNwSIK1jEi4Zi1D09
         DHQzfflDTXBSBic8vetvY5JuYeoUb4Zz21zLY0BIvbvvT/u/0VEkhs7zB2gdjsiqBe37
         O1/cHyvCLvyIwCQQ/l7xV/D9p4xO5MflR2pfSYeuFJNBjzHJu1AdpRhpHSVOsh62PbrX
         3oXwvGThrmfqlp9YmVJijSDkh5U6RBPXA/hCcQlJLoHMJMy0Fdi6FBKlnUqyXeD8k/W/
         CwEA==
X-Forwarded-Encrypted: i=1; AL+hErFd4MX+SviPeIFcl9iYqXq+jDG8++1WP7OUmm3onrC6CCvBlXmEXUo7PcsO+Bum4lsx5jacaWC7WLeEaOV5nySK@lists.infradead.org
X-Gm-Message-State: APuU4Z+3Ljj0h8lQTToqN29+UOuMOiKNDWf/Z41zbxKZCVdRco9sReWp
	K/mukwpI2g/Ss9ItVGPwn0D72v8loUS75e5OboKIZIZEph8DHcV/YDif
X-Gm-Gg: AYBFou0MGfk2c93/uwFpaRHlMsTJBfoLMNuSi0GEQoBQ6GOxjYISwkYC3lGltTNipc5
	oiO5txv2+d98Psgd8b9Nzx1trldtsn8KLDBM4Q34FNwgYqLdpCeYMyb9/dLsot9b6hub+uhfJAD
	thLVP9wPnBls0iiVVPmTnD0e1FeM/1vaElNZ/Ziy7gtT0cplrQaoSwLls2DiJg6VvASX+6Xb38l
	WA8c2sMZguLFQyQhf3T96f0edOB4dFQFgUf+wEoafx9WFTO0RPsFsBL4ggxpyaAb7h9CEJpEZrA
	2tptw7St0OcXU5rn8D3yVnTrxL/V9/vXGMEZKvETNzkxoqKqIWg4BM9jPTOwLgC7aFjQrghsrxQ
	JYH1ZXZ7LG1G3FooAfhKb5KDnJk8csom2yuoNVb9hrA2oIivnDCCrbx+AASHnhZDZh+XGiCXbVi
	9RnZqI26zME0qdSSf6wBfp8eGBy/RvfWyZDD1ihIJ5Nl/v90dwdEJvh45C5iyiRDgf7oCIvJuLc
	/PL1YhffSyUjY0nbrsIwbL+q7g7rEWW4woxYdfQMfrmkgkUztvO7mmQmj3n++LjtKpvj8xY76iT
	r1fOLbZR2HnE0gX2QOW1frPKIADmbuf/Dc5a4LsKpECq+KrE8c56f+nOswfhuyk/NFhjeLh63i3
	IFDCiJHaS1tV0q9jz2w==
X-Received: by 2002:a05:7022:8b:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b3c036359dmr1596278c88.25.1794382314148;
        Tue, 10 Nov 2026 23:31:54 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:53 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v9 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Wed, 11 Nov 2026 15:31:36 +0800
Message-ID: <20261111073137.381966-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_233155_379576_D399F187 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0


