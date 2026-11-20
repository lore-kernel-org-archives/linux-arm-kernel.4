Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58244606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XriuHFa5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FenyOCU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=; b=XriuHFa5rGlKSm
	xvuC6p4EMYlbdhSvlmOh+t5z2glGR2niIyNDBudYTgAGCDLxdZVuKjRqGjdI0prTdI/Kd5uDR1Zj9
	Y8glAEF0EihW+bDgfshwQyQPsdXs4xc8Fz4qA/FUoE+kg20Doi1wMA3DeOWNujkhfBLgCV/4C0qtp
	zmf9fGBOZqFyC8L3ie/SkNIA1C/N+ykY7ldSqI/lr23naqY2OtfUm8dasnv3O7Rn5INerW6AmLotz
	viBa1TudHhWikZNbCWh4iwU/9TCUcxmkMC8RT4hHh8PGk+Uunx0Mf6c8vrSv+te9bnBwzSABFHM2I
	aonPlHDmp6TYqgg6yOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoY-0000000FHnW-1Bsz;
	Fri, 20 Nov 2026 14:42:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoV-0000000FHmC-2BmA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f00fc215f9so6508155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185727; x=1795790527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=FenyOCU95v2PNVbeiFZJYql8nzHJ1JdcSq5Rk1zfE8hYHhmdlh8DahO6uQIabhR65I
         FnSsaduKdXaHolbmUyCllg/Z69dsbpexYhxYvEtV60OZwupLkfp2Ee85UWo3Ipxa1QGD
         V0Sj0yeEQcoZCFWy7zQcWysMH+Po69HlkIu51+uh3/JXIwDLC6rdrI83gO1c+144d3t1
         2lnhaEvDdO+niC56L4S6zyNF2PM/VzkCC4+/kBZoVLHQwWplLPaHDSh9rHd0GTf/C0GE
         SanEgwxgJ2XuR5joustaDyYFduVIQwAwkEDcKTrsELufiwh4+N7FhDFo1+I++UmdlfXD
         hEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185727; x=1795790527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=j+L+QjAfuvERXcJsex53YafRgCHIEhDgwECXIeJfxVRrdUCSG0i//sZoJooKQld1Yh
         GDNEscsqdRImZKxBsemUaRG2sNLCfNlu7mbfKEu/7UzBx9r4JNmgylOyplvdomruiqTR
         MD119+L/0gDwTlNg4+BK1nQedBQCL4x/TFfrth76JUiiud0xblwsuYMwwSUdatasxdS4
         YidSScPOmZ52UeixmRX+W7extYQGYjQQl/LeFiOrB+DtQ/usBh/0OFkwmin5KgJIOEHn
         K5wJW9M67ln0m4kIBY6YrgORts8LBLX9M8tAUsliELKC4guMNhpKwOfkJyw77MPpbh4R
         Rdfw==
X-Forwarded-Encrypted: i=1; AL+hErEPQcfp6CKDRjGJCE2eOzx+q9XSYMijyqlWcMDh/O44yQouQ6DnIXBEvvN2awxVTF+1ZBiM+zHSORNpkTkObvi8@lists.infradead.org
X-Gm-Message-State: APuU4Z/OX8dk4q4y9VgdqdDqolJhp7pp7NmJIZAj7h4pINkRZmOqSbos
	UIm9sE+uSIqJ9WcKjxB0C2sLUx4q3Ei7UhXWgmHoDgYA5YqZPaOCBLlh
X-Gm-Gg: AZFdTZdmwcLYV2eJ73YaVwoQH7qvEDB+r8RIviv0BNuwN78Uf7Rr9f7DZI837gV7Vik
	Sn6pxDZ6u0oYHH63LCtOvUun5aqfNdgsYiXQdDNs8sV0FQlmTCmjJ9A1/1UhEjOZmkfpgqFXw3a
	YNDCaajnXD9cKrP1M8ipR/B5cqL/LgerIdfe5W5PnaSx62+Pdw7TIo9KXFT/KCcCsYlbx4YWGnv
	8Ftv2le7rEFKoG3ewSlwjJjBHYUv5irEw7V1JWnccmmQmJadNBNIXJpr5eeP0CcVPoCLNy7ipHy
	urtp82GO0TYuf2sSD6BJVnGEE8pTkYkkIYAc1z967wmak9wcizDWKFur1yXWhw9UceW5m7QnxL2
	h2arqI/k9KFGfc84DNcTosUjv0pSx07W0kKFCmg4pnuTx1mdKbF6qzubRIRgtwf1dsm+SUactOB
	CT5VigNW6DobLKzsAz5KwOmmXIM1MJBluuKdm8xLzX7X7MnATUhpy9krly1AgrZpcBh8gCEikoZ
	z6Yo9fk+hKGnsh4au5iaR7GK30UXx70WfT6jLoM72BI7seTbkUP7YaoVjugOvowTdXBFycuSypm
	YSUvEbmKQor5qOOkq44lLsafS7O3wNrT0kjWew==
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr37267005ad.19.1795185726811;
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:44 +0800
Subject: [PATCH v2 1/3] clk: mediatek: mt7629: move clock counts out of DT
 bindings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064207_615349_C3C0AA8C 
X-CRM114-Status: GOOD (  12.02  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The clock counts used by clk-mt7629.c size the clock provider arrays.
They are driver implementation details rather than clock IDs used by
device tree consumers.

Move CLK_TOP_NR_CLK, CLK_INFRA_NR_CLK, CLK_PERI_NR_CLK and
CLK_APMIXED_NR_CLK into the driver. Keep their values and all clock IDs
unchanged.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c      | 5 +++++
 include/dt-bindings/clock/mt7629-clk.h | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..517c43b19f18 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,6 +17,11 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
+#define CLK_TOP_NR_CLK		108
+#define CLK_INFRA_NR_CLK		6
+#define CLK_PERI_NR_CLK		22
+#define CLK_APMIXED_NR_CLK		7
+
 #define MT7629_PLL_FMAX		(2500UL * MHZ)
 #define CON0_MT7629_RST_BAR	BIT(24)
 
diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..cff9a02e8302 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,6 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0
@@ -124,7 +123,6 @@
 #define CLK_INFRA_DEVAPC_PD		3
 #define CLK_INFRA_APXGPT_PD		4
 #define CLK_INFRA_SEJ_PD		5
-#define CLK_INFRA_NR_CLK		6
 
 /* PERICFG */
 #define CLK_PERIBUS_SEL			0
@@ -149,7 +147,6 @@
 #define CLK_PERI_NFI_PD			19
 #define CLK_PERI_NFIECC_PD		20
 #define CLK_PERI_FLASH_PD		21
-#define CLK_PERI_NR_CLK			22
 
 /* APMIXEDSYS */
 #define CLK_APMIXED_ARMPLL		0
@@ -159,7 +156,6 @@
 #define CLK_APMIXED_ETH2PLL		4
 #define CLK_APMIXED_SGMIPLL		5
 #define CLK_APMIXED_MAIN_CORE_EN	6
-#define CLK_APMIXED_NR_CLK		7
 
 /* SSUSBSYS */
 #define CLK_SSUSB_U2_PHY_1P_EN		0

-- 
2.56.1


