Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2/Xt8ckM;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KfdyOWPf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=; b=2/Xt8ckMLjU2yC
	oauUyQjoF3+7ZubfWVgJhsXZaJKystpXrLVL6YJ3qRTFXFNtV+IZXj1QWABQVaVsSaUON+4c+IJq9
	3MZeXFuiwzmBtILdfn4hlxJlS9LCf5+Gt5QXeFQg9aG5mSAoifxj3GPZT91rMi0qlDNvpVMjHFDel
	S44H8QVRltIUT4bu+1NWu9dsXjQpHjfzCJ6R9V7WxbS2xMUMAq5oeENzu1R8WzUqHEQhTO1LgnUHB
	59ZUo/CatAPyTSu3ouG1yK/wCJfENpmipY392gY4lmg0GusYpnZPMqeSMg0T3A3FsPuChm0n7imRu
	HM+hs0tag46skPi4uL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy5-0000000G5ID-2Cze;
	Fri, 27 Nov 2026 12:22:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvE-0000000G3Ux-1xTD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-491846221ffso7072802f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781963; x=1796386763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=KfdyOWPfSlHKJtRbcUIEODARA0/tWg8MxEgQKNkFgzGNjbFuhpnGEiEPGWwkXnQeYC
         f8zSCFnFCnGyvF9w5BjQUoGoGB3P9pCHSU/PcC2v+na4On/B4Wi2WErrGARGmnmOUelL
         3R5MFGFrtejTG3zwUhsaTCRZNx4GV9LDb32h0V/VnX9aJWBGhQAxeW/fh914RUm7roSQ
         ukxeeiDFO+O0d1hvmqWFHQLiuGTv/2oc3JBSuuX5iT3HIxCqqBWKOQ7jJ3aPtviBScsY
         NITzN9CV25WErnMu7s8fUtrrc4wljJYRBaGKn7Sl/OLhE57gQZUeSu0hDasecRXBwRhP
         2wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781963; x=1796386763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=khKc9KRFmKfV2yT/WdnYjORhkT+H19OwqanMT0VWhD0Q/ZuLvRfLwwsAKpD+/pLWpv
         qlPlkRDcHjz41fsusCgOzq1UY7XvKCeNAO5OhaSY6UPiwiWiZSYm5p2mjxmTeGDZAaQ+
         JiSNv9apXssQaPN0IHlguK6YytDaGIkBCmVERGHkn6OHmOMtfwNkgnmLW6D0wYlpbgiG
         qFfDQFHYCtf7yjb7PxkzFls8FpiYz1ZnUbpgQ4UQlajPUxEq73/ovmE30gtrln1GBo2f
         oBIDZXwfo+LCRQ0T2DevtDWr6WMik+e7ilQRcNrmZ4EeBrxUuru6Pr/M90gg5OAe9jAa
         BKMw==
X-Forwarded-Encrypted: i=1; AL+hErF/cBfd5+Laww1ePpxEsXFcNaIsxhBjOqFxptvh63qCeNIJ3dGsuW7mY2qaKSAJvR36rl+XVj9GQZtrt9XdXDg3@lists.infradead.org
X-Gm-Message-State: APuU4Z9kBNzb1UC8YB112uWMlrTDPlr5ug9UyLFTr/iA82IKCtS5nkon
	7LVUMoy5ej0g2MXUWSs02N64ZrUIG3X5GZ7N1Gma1kwV0O75jFkf8P5i6fReFq7U5xM=
X-Gm-Gg: AZFdTZf3CgbP1Z0HjGgpS4fMuhaL1faZqwHDed8JlHbEWI6A54gGJfArsLEE1siPlO6
	d3R6CIZEs2lrHrq6+mmkQSgyWIvs/QyvOie5rZejMrQNNtio4H9CtOTdG2rxEhxBhGp7rT4GIvK
	1C8Derw89+MsNJWecwzESZOdxmFxcG2b6HZybvL7B/AFDFigGXV1Iagc6lK+iQBvrlJr/2pYYC7
	144S3ZBCM5fHDiI+Y77FXwEVhuNH/zz/GIlTnTHAJHjw2fklT9RWAoD1ar2MTyaG9/iudfWVWHE
	bSZwWfB888heP4iQmku1a1jNnoFBFbeyOGgl3JUyaGfYFnFOFzGO0IYLn58Xw6mWZoc6/Ra7/51
	usx7mcXSIyrOycbbRVrMSoK3U11kyv0TiiEZHYRRmfjQOzGJe8gBHFilnhoOHlWw39rhxOk6dgF
	ZgRElnvmfWbNDD6nOpJVzEdwp3/BopwJHA6JY2Mv/tnLaTM8Z5ZUy3rR/Zdmnjj1eJFO+jeBLKt
	9UByfR3ILlT9fT6Ht8ZgabEpz8fBGCaOXDAeDru0PSVLHRp2TKKZye/7oNNsMO2gXlFkBvK7Jtw
	I8K1Qs2v0NJcYpXSdKtXE+9snR7O
X-Received: by 2002:a05:6000:290b:b0:4b7:8363:682 with SMTP id ffacd0b85a97d-4b7836306d3mr23949156f8f.16.1795781962728;
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm48478454f8f.31.2026.11.27.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Fri, 27 Nov 2026 13:22:18 +0100
Message-ID: <20261127122236.4976-29-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041924_522986_28513386 
X-CRM114-Status: GOOD (  12.68  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The HDMI controllers of BCM2712 feed their MAI FIFO through the 40-bit
DMA channels. Describe them, so that vc4 registers the HDMI audio
devices.

The DREQ lines of the HDMI audio changed between the C1 and D0 steppings
(10/17 and 12/13 respectively), while the flags request multi-beat
bursts, wide source reads and the AXI priorities used by the downstream
Raspberry Pi device trees, where these values come from.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi         | 11 +++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..80073bec01b2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,21 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..bedbd7a359f6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/bcm2835-pm.h>
 
@@ -483,6 +484,11 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			dmas = <&dma40 (10 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +519,11 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			dmas = <&dma40 (17 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0


