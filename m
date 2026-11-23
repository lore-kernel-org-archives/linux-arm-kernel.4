Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D356606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pwh9wpOy;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=U4sWkFH5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=; b=Pwh9wpOyaSd0CQ
	RQ8E/M70klbJVs1bF6o8xtcywHCRBs4eQFThTTOYSzPvorPBR2WD3y+lRaMQtDKYhluv6nfRTSHw7
	aaw8ECSN7O7es23vMHW5IsPAbquAYqbt9Gyc38x7MsHv0V8uf+5j/w4X01mEQ1AS28dy647/NfeuQ
	2NXg5nhsjPt3hjBK0EINaR1C8Fe9rtVfuzQhv98gmZ64CnIcyl3tTwldlFVPi78Wow7a44b1ZUDvU
	S0ljM97s5lqhJKyRYpX6UI8bSqQk9WCtdqU6/q+NOh8yMMcrYxr/mbq03yGyQLANYoy4tuf40lGPr
	5dSEjeu4TYnqly7j7I9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTC-00000003q1r-3GqN;
	Mon, 23 Nov 2026 14:56:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQn-00000003ojd-3sOE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so42644415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445648; x=1796050448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=U4sWkFH5TbSu1ARTdLyRvl9qgs5403/kVMU+3Ca0XKkOmso6C+UepeqPyVg1BI4vBB
         43K8onrztYLjB/QGw61bjvSIYazLVgbyDIciFkFBbvKRbnClMG05JrdTzhfnwxTwN2JV
         bVqLno7/xtjGCfzKIdaBSBVd0nLkmN18JNZgkTDZqA4YA/C9ATNzTvVX3PPf+QWRds2r
         EV+kZzzpcUawyBT2j5nycD5kqq1+8jxzLOdrekZYCPFNjvETyLPs8jaeerg80MDqLCPL
         TVCw3lOzobzAUiQBt6ZIvXLOwP99/S5p1uaVRXINjazTbp03CDJEtXVx9jr0nax7WumG
         nhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445648; x=1796050448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=TSejD4yf7k7okVHWeJtg/+rO/Ll9iVNPnJSI37s3DERlnbeF2bDeB0e26PCh0rrF9i
         eqjdgwk2VOl4JfK+y3nfhrbA5ZcQ49X5k/tLS3kHzefl41nIJ5l5NJR6zB3FWTgLj7m2
         aNp7kaoql4ppVXOA4M0CLFSGntfGfHoQuKZ69nezq9DLyPuvFFzddaS56QadankL7AdI
         5Ii0GV45Z7vH/vH1iZH+l6zqRCnvSKfbitAp4pY4KW15iRDy0eaoi+irgQYYAXLtGizf
         UAzOP1IT+r8duLxkX0cngDtwhCdpA4N03I3jXERqic7452OV5je8Ytp4LEFeD8ArSAlL
         BVxg==
X-Forwarded-Encrypted: i=1; AL+hErH6AEk3YV3EE9h4sgTxOUCoxjIWKgos6CPqj7NO3j0UsZ/gONOh6VKngVjgXV7UifJHLI6iweURCKOi8Zt9ywqi@lists.infradead.org
X-Gm-Message-State: APuU4Z8lxebr8jht+u4DZSAtjKM10sd2x8SflgVO04MKQkGSnI/cUhQf
	EVkeBVEOu4uNr1bugstQLDjBnD4B7GD0HhiPLBLpN/oeSN8ejRnPGJ8Y0zBr9GNIs/I=
X-Gm-Gg: AZFdTZdCWvMZGKsKa+uelqoWnCaYTw+7seAM7aAAz45A9z1KvGrmj38puPJOC/pko2X
	qknylE/bYUF5+xhwyAcuzmCXycz/HJzsItj/TdEeFwSwpjuFmK106/jA6Oys94NMMUShEcgfJdG
	tyF7tWoKuN6akZXMjriDJVg3tUsqspXxlJyuI5V3FOGOI3/pbvyArCUKl4hpshLqCOQvufsfL3B
	gKhZaCRACUPwlEa72Z4AtibndHOtwpuUiP6aOrc9l4FDrvcg/t2QM4mVYXQPLPRPRipRzGffb3H
	ZeY2BX5N1OKd8BhUMHHke1/sh70ziPlN9vWR9jxE57EnpWxpu2fFawyoY0yqftlvNf9ihzDjV12
	ucIlB/nAcY1KIqWB5JYv+FVbgvJZ17EZeCYj5W5Vi2L9TfH795cpcLN4XPMeW5HhGRwXgj7JLd3
	ph3xFgOFd/KOr8rnF4f56GsDCmBlzUIdyn0Xm5sdDFdyo+8hqkuSrT1fbqc+zAv6YP1ayua+T1F
	q83ymchLa3Lf+TG0LZL4Z8fpicBbu908u58DZjP1Ha0O6RO1BLU4mTNdYpIyWDQwpjhMAX70EoM
	iP4uCCm7BxL1iOc7tK5wwWz43J+zMj+dixINjkVLJmUU1DVV
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr287799025e9.12.1795445648030;
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm422624865e9.6.2026.11.23.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:07 -0800 (PST)
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
Subject: [PATCH v3 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:04 +0100
Message-ID: <20261123145728.29082-27-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065410_024314_7DB990C3 
X-CRM114-Status: GOOD (  10.92  )
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

BCM2712 has six DMA channels (6 to 11) with a 40-bit address range. Add a
node describing them. The axi bus already describes a 1:1 translation for
both the RAM and the peripherals in its dma-ranges.

Channel 11 is used by the VPU firmware.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8..7ba0fc540257 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -676,6 +676,26 @@ iommuc: iommuc@1000005b00 {
 			reg = <0x10 0x5b00 0x0 0x80>;
 		};
 
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x00 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x07c0>;
+		};
+
 		mip0: msi-controller@1000130000 {
 			compatible = "brcm,bcm2712-mip";
 			reg = <0x10 0x00130000 0x00 0xc0>,
-- 
2.51.0


