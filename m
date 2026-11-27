Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eyEZw+vZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bBLkCzAy;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VrtlySsR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=; b=eyEZw+vZBr+4aU
	uyFN5g7/myoS6qap7ye9/EWtd/BcyzqU7jxnxBS14won+mdxw6TToVxtDwbuTNfD9lsG39JH5ROcp
	9SvJpL3ov2mtbo8n8CPspKVtUmO9Cml29O2NwWSMSb/OBTMhOrEKwr5HdzufiWlGzG4xOHv/kaQMw
	K0hdEBsJ8O1Pv5sbLk0pfgf7pgmFMaSofS8J/2YE/qHPpdTPggBNU3wCfs+yPCApwCXHxECNiNRT5
	ckwpFhQ1Sh+JAURl7vP1go6dx4x2NSxDyczVK15s6iESlIanCCBdngZFElFzoETED576Lqq0U+C5W
	f1SHk8otOxtuQUev4Kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuy7-0000000G5Kf-1UD3;
	Fri, 27 Nov 2026 12:22:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvE-0000000G3V1-1Lyz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=; b=bBLkCzAylhGXd99taFU8RyoKzk
	AOfbTrs75tKQfXEm2ewuv5v2GpIutPHvxDGZARGroDjN0m+g1edBxIvX7FpOhl9UCWjjr5wVxbG4a
	1NtmmTOVmx+vmQeHn/P1WVkqsZf26aBTLS+MNq8B/IW/PUg3Hw5q1Y7bASx+SrsS2okzoVMi+PaVo
	cJAvHq1DaC3sbwGe6DonVbz9SwNXMauqYREQuPQev97Q+2hfeDbLXzVj/p2UQMt9ZR+gurzoHUcJf
	vmsbt/cR4uQ0u3hfVmG1HHsbMo1PzPE8m/hyi9JJh2/OKlrZaGVRk6U1b5cBAahdX7VBDVp9Ls8Up
	aPSW1hcA==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuvB-00000007h05-0pKK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:19:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5733561f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781960; x=1796386760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=VrtlySsR+9gAk1rt+XyXIz8ZfqbHJxQL9DqcEUZwFR7+cvyk6j09voKEHRp86JwyHi
         nEbsCcWEzj88kXOQHu1mkM504lXZTI+Pw3fplirdwCBtridcutSYvUJzFlI2lWUHH8bD
         vTQUjeg/rLdXymfBOWrp/PUsWtLIMw3rf5Qt2mnejJeMUVUzVQqiYio965GOTkQKrcAw
         PAVzq0NyS0qAF5WQ48lmfzSZn1Y3zylT9slBOFpX5MNwdoNh7FTee2PDG1c0S/lWtYjj
         bf63CV9ceA2HiGPQe8JWG5ClJhXYgPZ84/HZyHxnFvR8k4c4rRo2WIcSxkczeJ0zUfhO
         DLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781960; x=1796386760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=PSFR9gvCsl2F/x3CyGRyR1fDnKy5nZmiLCp2e1795WijKYMV5Xd2XqhoHy3hG68UiA
         YuQuTLDaRb+wnv9ak24NvCJhxrpj7g8NjyXWTx5k46YMZQnb7ZkP7h92Q2lTG9K+/UOv
         r/Ebz2GymfZgacYWeTrt2YmSWZKrRuPPaL1HUv6493pw5iYxJMqtDYPQXM92skI0q988
         QNeT8Ra6ll7HjiWvPW+Ee8/TWtACfGo6HMFmjZy1C3mGibdSrrdq/lYA3+ZAzZ0uGhDc
         lXFAIyhtXEi/hDI5rHlYwVIxv+ndEsFc30d7MMabnSOcy4FYeRFNyDkRh/vSE94k84jo
         5WLA==
X-Forwarded-Encrypted: i=1; AL+hErHul3NFdKTOWZumPijdXHP9Tezdbl7CL5mxeJlZu7sQ7cjTGk9M/6hKRr43k39HcO0V23G8w35mbsLwHb8HgB8D@lists.infradead.org
X-Gm-Message-State: APuU4Z9odxXFg2hN0tlMoZzLpBfxRtetgTzLY8QWneI8dFuTAt9VjdiP
	YFRWf4eiPCaNFfbkLJ0NgjnsvMXkpGZ43dSHCkN+MVMCVV4kT8KsgRS1w2TrLczG8DA=
X-Gm-Gg: AZFdTZdWbg69Gdm06Ieq6Rb/LsFkgRvWF7kzWY7ROs9KrGJn+TlYVncK8JCzeeAq5+X
	EeNlDGjBHmsUhWgxfl1zJf1IoR2Zpsg21gEJr5TvARrzawEpQdDjyv4mNcS1LTsxf7hvtdUo/L4
	v03aYMzyMrTkGeSBVRwPHM9R3SaiWWGZGNWjNIWAfSDT6MB3wn3BQnTpl8GDyRd3ZlUVwdk7SuD
	qst6h+wPEzKalBY5gbYrLWVBTTYckdOIo0UV6C0aYFzxnvQ2jK+qfdfLzhZPxgRmxTOROJ0o/TB
	ZqOLNLrZCKTXbnS/DfhzwdDfHjomiX+VpuVAItee+6ov2WiwmHUTLkxFwezZKDZRQjwvkK3/Ww4
	nLXIZHkhFDj3NWg20I6mkO6UZEOaFcKOurvSVdvcBzKwhQPRN38l4MiobEMqAOKEgEXuJ2Niy/M
	6KkPqBZaYOtn6HK+hh+1hHCoiCK/0Jxp3RtlT6q93fwCD1GGZ+1xxUcGrr9NyDEcwO4zqYypr3G
	brYVUEq3S0cZt613BCyEa8DBXOX6LkToXItZ6M2MB88bTfMUIx/+cKmkgKyX44enj+uqQU3yqEN
	I4RImCFk74KqPq4IYdtCHhRfqrMhylG6vDFX92F1Ya2fVuq32Q==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id ffacd0b85a97d-4abb1baaa3emr48985418f8f.13.1795781959788;
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm47186924f8f.52.2026.11.27.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
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
Subject: [PATCH v4 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:16 +0100
Message-ID: <20261127122236.4976-27-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_121921_158251_F1753780 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -0.2 (/)
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


