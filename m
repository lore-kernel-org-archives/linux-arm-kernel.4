Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7561606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O0G9A57h;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNH5xfAy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=; b=O0G9A57hd0OEDj
	KwtUbQow/O2i5D0Dqjt88zsk1VWpIiSJZeXscUOxxJZTRXl/Y0I+0eIxlPzjqGVlVb0YFusm5QnDP
	DHIZMqG8t6RdkaWU4ICw67054fotsBxlE0qPwPPSiQ/sdv4Z64MMuQDF2Kt6M09EnMybAp1WQrAQY
	upOThjp5evjyt3YlNFun6P/QTB5njTygqJziJGrW1tMtn9GZ7bAbh5lHuL0FELDjDSQYpoDLZWuel
	jA+LL5p6XBZmh9PdrQcT8uWTVlp2cc0sG+IdW6ey8lQrYmtPZoDNIQOmjri1eGfEXGnFLgNuMXTzL
	0dWcd3gn3PaM1Q4RekZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Hh-0000000GN0V-3Kv1;
	Sun, 08 Nov 2026 15:58:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Hd-0000000GMz5-2mO3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:58:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e47347279so91602f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153496; x=1794758296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=YNH5xfAyYU2pdC0tlwXZ3dTBifOKkY3cdiyUnnPNVDPQKCd+CGaZSlyQ0UMt3LPdXy
         utiGvriIkVaVv7lGRSGexDTYS8fyDYuqjFNKY1RWDAL5/YJE9/QAFyqEqHetGpN6ZjLJ
         omKya0uF3n7OsSscJTifEXzylzCb1GyVoIwsvjkbeh/jBs+1RL7Kx5WtWKzXNw+Gi1x1
         hptzsOF5/lnWDII9S1emVaZQrQg4qfuZATiRl6uX0v97a1txy+bvsDd/BcDXj4MLm+WZ
         RqSFq4RxfYB3QsqJCdhqs8u+giyo7Mc7NQ585wiuss/T9xwlPdgERDLW1J8qvk4B0cHj
         3NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153496; x=1794758296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=2h1C3ilP6PF87kSl1HW3jNlJauluNeIacu8mOzZiEQYDwYDXwmsH5KfvqoKUJLxubL
         89XAsgBTB++A3hcgZiOlKNqaep/IUnA1XneC/aKTrYntVIiuHDyIDNOyvaPtJQQ/yYRC
         xwvzzA4zqNAoabnyiVp3VWdaS30luRAWzltxy/zTwdYoqaA9TMSBJIGB/xkPhgu/Z0fQ
         UzS2qzk94Lt9gzkuABUoMbEH2FOtJWg6zxWXO1/u+UR8Dmdsj8mn7H/8W8HPkMKAEJPJ
         DCiChMhNXpX7pRMe/f0L6agUGZxNnokRnrpM+H6JmV5tazmLoOPIYAbr09lbpC/xxWNt
         PqiQ==
X-Forwarded-Encrypted: i=1; AL+hErHpd/r+4bF8JPn/tNDoT1sDYeDLfPzc0Cyh7Hh33K3ykN3QhKgUgiuMPx+6B8FF3WDdV5aJXcoJpOnmOHPluuio@lists.infradead.org
X-Gm-Message-State: APuU4Z951OuIZPVwxlIz+iDWMJLGmQAnW6v2wwRWkpjwfG9X570fX7Is
	Zvc0TLkscSV8k6+AzKwdjFRPqoZVE96Uq3YCn7Uy3nvQMSl0D/Hgkumn
X-Gm-Gg: AYBFou2Kc06TTu05jPAALfgugeXfhgS8GzVXYrqE5XejM4Cm6ZRjFHzq5BPkYC+2K2C
	sH3dj4pLpbbkHosGFsR17HfLazK9GotkUN8Sw4M10h6YWxkCAC7BOl8wGS7G2tyyzOJ5L41lyOA
	jknUu6X1bUMrsZqR04Pwhr5CA+XsMIC2mXiAKVsiO69DC+sMn8ZMJDXArE7JnH3hlbwVzG9ZgQO
	pIwUOT9HumPyfK1dkOO3H0T0fxOCt2/UuvUEDm+U9+Otkn0wvJZoHdxiEICk057UB1g7zRwcYC5
	gLPxgLlb1qMxIzXcZGw0Rk3pb0/BjmSKhGdQBa564o9JPeAGQlY+OF4AWREd9FhpRU1b4q81Lm6
	/9dXN/40uR2cX7904WnFzY3u/O/Y8zzFmX4y6HiiclXBIgxUF2U2IY93cI9nC1IkYE6tcM0mDkV
	r/AnNLkF+mUrN9z+GkiY0hbY1j2nAoadUDBw9SWHOvQwr5DViKcz60VfETmJ+Q5sbVUpHIbbAw7
	Div+dnB7+1krdIIplb1xhdkyJV8pdcBVrygetFkEXLHynALnA7mFuG03oP8/C+Ov+IeSBHUy/qF
	AocYYrg99qurocRFU1Z9v6/AbqIJcAfpUlJYcjqkm2TBkVKh3THc8VGMPdhw0vw=
X-Received: by 2002:adf:e199:0:b0:48e:84e8:88c3 with SMTP id ffacd0b85a97d-49580830930mr2975816f8f.5.1794153495753;
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Sun,  8 Nov 2026 15:56:59 +0000
Message-ID: <20261108155702.361022-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_075817_735868_F60729D0 
X-CRM114-Status: GOOD (  14.16  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Moved unchanged from the B288 series v4.
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 82 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 1690b9d99c3d..cc3f62d3554c 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -28,6 +28,7 @@ properties:
       - allwinner,sun8i-a33-ccu
       - allwinner,sun8i-a83t-ccu
       - allwinner,sun8i-a83t-r-ccu
+      - allwinner,sun8i-b288-ccu
       - allwinner,sun8i-h3-ccu
       - allwinner,sun8i-h3-r-ccu
       - allwinner,sun8i-r40-ccu
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..c9b9eaf979ad
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI	52
+#define CLK_BUS_ADDA	53
+#define CLK_BUS_SDRAM	54
+#define CLK_BUS_PSRAM	55
+#define CLK_BUS_DMA	56
+#define CLK_BUS_UART0	57
+#define CLK_BUS_UART1	58
+#define CLK_BUS_UART2	59
+#define CLK_BUS_UART3	60
+#define CLK_BUS_UART4	61
+#define CLK_BUS_UART5	62
+#define CLK_BUS_TWI0	63
+#define CLK_BUS_TWI1	64
+#define CLK_BUS_TWI2	65
+#define CLK_BUS_PIO	66
+#define CLK_BUS_GPADC	67
+#define CLK_BUS_KEYADC	68
+#define CLK_MMC0_SAMPLE	69
+#define CLK_MMC0_OUTPUT	70
+#define CLK_MMC1_SAMPLE	71
+#define CLK_MMC1_OUTPUT	72
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.52.0


