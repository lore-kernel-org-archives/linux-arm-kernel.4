Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F85C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kahFrTyZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCb9O8hO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BDFZDF3egFNlLXDdV5WXPaKkWvQvZlsO3XV2abJz9jE=; b=kahFrTyZ5SZEde
	RFcQTxre0IBDl5YgPmZ6ZDxdC5wf3FCKvMqAz4iskvYNvRrVe81XQZHQo/E0iIaZQeG7ac4a3dq/C
	oeWle7Z17X8SXXND9r1MJdWtYBjET7/kjyjN3gPrFST9/G5NDuUW0IPox+ZJIIdHxOl2TxcfTsB0I
	kvNWMaI53+YgM6zCoj4TFZmGU6bZueXh2hYm2Y7fwBdRg9RwLpZDhz2bg9Cegp1eNDus1tsfu3KNI
	Yeo1uW1WzW1cILm3ihnevmmMp7cV7KgWhBwNxhLe4rCPtZNwgV1FPNKNdKfw6d73iCU63HT61LvFJ
	PG4C09hngB1u5mFIcXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtY8-0000000DSFZ-1SlX;
	Fri, 13 Nov 2026 15:50:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtY5-0000000DSEP-264N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:50:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8976965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585044; x=1795189844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDFZDF3egFNlLXDdV5WXPaKkWvQvZlsO3XV2abJz9jE=;
        b=hCb9O8hObBJ9/rjbIPQRv8niFpre2O5iW2LRvl7wK6qk0ddDJcuTgWOzxRelIXqUhV
         VJz+MRD9pHGrmRlVHGSPK4wz/7ZcG0xySRm9RK3sJZ+fKgyXkuhYikpMRVHxCXsvM2Nq
         JMbcYQp7JxQ0en9WGk7il7t24q22acobJzpzATpnYk6SR6aKKXBuvQ9xP3dA1y3w5A4V
         HAzSQt4ylTovQAm8AORvJWyjcTcYsmas8OOqZ61wutXGm74s37JXDN29cUWMJdp65gBw
         B2cQW4OajeL6glBqt0WzaT52UmDp8qfupBmuc/dCgrm/3HHxmlrUnshdwWuwDU4A6BGD
         sv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585044; x=1795189844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDFZDF3egFNlLXDdV5WXPaKkWvQvZlsO3XV2abJz9jE=;
        b=UxkqLa1JUMJ3gURw9Z8qqSdcjU52fyG3c5xzZx80cX5qhGIBp0vz+iyQribk/9YsXY
         3Egdl74XNzKywfBNCazdXThqc2YPAYVJSUCxUyjXOMePSP5W7hMsPAHLXA7t0KENnBxj
         ZIc47lkbrST/k6Og8hypVqu7WuHfvGcuHBd4ui6INaDSGD12ao/jJAu8Rn7/xbjgw7Et
         9/4vq69lH9qxf3NNK8hGjcUP4OWF8C9kIWqxnTMavF4k/nGcrnAaArSAtY057tqkUPPq
         5E3J4TsFp6XWuSKlc2MWExa+Aqn+CZ9VSEHUsOS3YsmpzX4RHIzdFx1NN2hChAvJsR/0
         yMDQ==
X-Forwarded-Encrypted: i=1; AL+hErFGXxC0pz6vcyTfTzMAZzNwLNWR+F6i1BdrMDY+s2Zgot1UOWQulRgUhFloL63T9Yj2LBl2gC9clHi6y2YAPi7n@lists.infradead.org
X-Gm-Message-State: APuU4Z/0mzfZc73o9+m5byTNC+cKQCElIEK4QqNjluyrydDG6tXn+xz3
	zFtnR92iTNj3PqryRB/TDTSF9+b3PwrKff+XLasRjH9pEyCxovT1T5ge
X-Gm-Gg: AYBFou2ZoNMhadxApvPqexxPToQT6uEYw1GRnduEi95l5x7Mq8Fv9g/qaZYBpulZesK
	i1ppow3WVw5bQfAtfH8BrxuGpfvnvBt4cXqlApOC77xWMqZ3Xgc+dqX5j2gyu755HinNfR/86ep
	ATHxaGDXwNXUNG4q0H22CXx+g8pP7TFh3BVQ3qMDvZb8T2Mh1CMJp/Md5P+PvgeAyYMzfX84WF/
	NwmVe9A/CS72n561FNr0nxPw3mB4VJmXut4+wDVS2d/k4NrBYsIghVsyXLId3EVRJ5lx2jUhd6l
	SDnilb/HnAYmzr2xbeB3R47gtk+YgAbMwJbbHJn4z/aQjOVPuy6Ux7qOFTyHvbE0pJCovq/ff7c
	bIfRb7DRUe27BKcYYZD3/xDxi99GIQcTLccvYOBQiw7D3eWJuzSG+3J0uEzR2uGDS4Oug09PM3T
	bC57I9bgzXPKcnqUJ8/KWDvKuuLY9KRTeEe+UU5BAsP94XNtZ+QUZIJAA2iuwLyFFuPmV5BhlKT
	Fj/MQdCO1uOnLoCc0zqNBYr4C99HBgz2uL1gMmBl7zSI9Igcecx4Q6bTAjVgTWvgf6V8taIjjmg
	qHgzIhUl2kgqaXO7RHIUnt/A/DgSOu+2xEl3lTrhL4KziS/qyb/xTzvMPR+b3gI=
X-Received: by 2002:a05:6000:4a1e:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-49c72ab0820mr6507111f8f.32.1794585043570;
        Fri, 13 Nov 2026 07:50:43 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm5518477f8f.34.2026.11.13.07.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:50:42 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Fri, 13 Nov 2026 15:49:59 +0000
Message-ID: <20261113155000.84703-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113155000.84703-1-pmazzini@gmail.com>
References: <20261113155000.84703-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075045_583741_272E7CBF 
X-CRM114-Status: GOOD (  14.29  )
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

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v5: renamed some clocks and resets to the names the other sunxi-ng
bindings use; only names changed, so I kept the Ack.
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
index 000000000000..48e532e44a12
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
+#define CLK_BUS_MMC0	34
+#define CLK_BUS_MMC1	35
+#define CLK_BUS_MMC2	36
+#define CLK_BUS_MMC3	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_OHCI0	46
+#define CLK_BUS_EHCI0	47
+#define CLK_BUS_OTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI	52
+#define CLK_BUS_CODEC	53
+#define CLK_BUS_DRAM	54
+#define CLK_BUS_PSRAM	55
+#define CLK_BUS_DMA	56
+#define CLK_BUS_UART0	57
+#define CLK_BUS_UART1	58
+#define CLK_BUS_UART2	59
+#define CLK_BUS_UART3	60
+#define CLK_BUS_UART4	61
+#define CLK_BUS_UART5	62
+#define CLK_BUS_I2C0	63
+#define CLK_BUS_I2C1	64
+#define CLK_BUS_I2C2	65
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
index 000000000000..8595e26ee0fa
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
+#define RST_USB_PHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_CODEC	22
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


