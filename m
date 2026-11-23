Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4BD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L6rXzxov;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OmbUjRH/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=; b=L6rXzxov3bhNva
	UmLKDGWNGMhNDOhBAbhVsvitcqlD5CCijdLellUplEbdc8xd08XwVB38qJvqlWIM0eb6qGxAIy1iy
	yMAgokf0v3notpe0mkBjFQAxL+I7hpwn33O+arO8hU87d5nTnCsSuW3BAfjBANBDTlRqNPJRUAF+n
	mPij13efKCPOrm0k3cwG3WyQxrVJFnOiAI/mot97LaJkwAz1x4QlYr/4oGjuteEP2lX64zGk0s7F+
	5wRvI2kcSpsy1uLlBehV9BCnf/2jCH+zKJPLvIWeGazSqtQi8XxXmr/2XxDAVhCDpl00bhegtep9N
	mlMmY+vBZl1Pzz/1t2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTg-00000003qNi-1SsI;
	Mon, 23 Nov 2026 14:57:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVQq-00000003omA-0NtB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:54:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dee593f18so3268122f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445650; x=1796050450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=OmbUjRH/Nh48LhIrbfXxQcklQxJSfa7Z6ZnlAh+g9PhihZoBUmgHI20xlXBunNWdWU
         2nG7MFbN+bdRQoPtg5yPz37hONF8Zmy8zwoktLsbRyl3s3TD3Tcd42J3bxizGbcQDDjk
         h35aUvutWCrjRKFzzS+QCorUOiVJO1ZlDQ3rchEwxol0iyJNtVZ8CWmx63/AdTwhKjVC
         Ydrm41GcuCE4N4dABT9q6qepL7EPt16FgPFLALti2SDCnsfo187P+syyULRcdeuhRAqv
         IFPCI09CLjACvnMhT1eUcNhyp+tt0jdrJdVMx5dH5GSWbdoBhcObBeib+l61I54+RepV
         W3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445650; x=1796050450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=gU4/pCZv60W4XJwfq2PK4e/8U3zz4HJJ/eGwFSVYOfHzr6rrQ5RH78C46mG+XfFFGa
         uKo6fkbMKpOenBvd20awByF7SizuxRsyxEdxott2aX0ZJp9Hn2Jx+/0+Rbech8z51hQ3
         HNN+ruVj54vFC5HkSJ7Bb/etPh1a1ZzJijWzOpX6trNTfpviuVL77OeCvdOiDbHNntnN
         vTkj20Mr4D8jNbFwJOHE+sJvas50gfBBQE+FuCJO9WiquyWgLr4PuJX8lfUs5WSafQ+i
         MhxAiwJS62OYnFePKy3hev1POyXOY+U1qXPSnG0zViwAPH4i2IATekcGBNU87EZft/hD
         nDZg==
X-Forwarded-Encrypted: i=1; AL+hErH0iPTm4CGJmaYj1MIPWkYJJ3QwdagUI3nbjevq5MW2NLtZdwESsG40n3MFKwGwcaBfwvnM0hsv/zvIps+FM77f@lists.infradead.org
X-Gm-Message-State: APuU4Z9DlJXw8zMQ403Xo4ekEn9Sg+QJ1/fXCHGhm9zVhuNj30RUO7jp
	D4lGt28au3VX32+2uHnHtxdKleZ3lWS27Mcr/TLc4s8deeuz+9CK/nP3mqRjGqihf2Q=
X-Gm-Gg: AZFdTZcNEk1yQ221CTKo8Ov6PZfx5rl2NMwXlhhGTZD3rhYL+at01Rrxi6CN0JtAA1S
	10yT31FRebQ34jCM69vGJptvGhtljCdYIMPO5zGwwJwMazJKj1MgIB9Zu3eDADg/Ef1Wah3URcV
	s+w82lxatnRv59cBYrRhatUwwrxkbbvMNUZiUP+IrEnM9IRV8XT27z0pUAHg200EFaKxqZ+eBKG
	nxIhw9WPsG3g8/BoVTDSS1iQhWmfNGBSmBYYQCLroRT8Cjg5Q2WuTrEJGHJC4gSun7I5BUk7+Vd
	7lwGR7k7KGp9kul/lzKGJzW87LNlkIcLplmLeMzlYBTTino6F17REAcUB6juklBlcdMSO68mxNY
	QR3lQKwqbZT6jPKKltTiLGBG1lGvn54n7al801za9VceLP5xq8Wwl/08Zv5T7eugnZ16ufpxyjg
	RbPLSu8E2/1HE2SdIovWZYMzsMQ9GH0zTF8dSaCblH/i9Hkkhach00ugJeY2A1WWiLdi4WF5JDV
	8m82T/eta8xDEpmsVvKL3uQpL675S80KIxP7cY1ugs7Gpm3vcnCfUr6WGzXXJpfHFzylbghN9rp
	qadFq0y/if+P2kpq5amoZS6ONmY=
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr16463654f8f.47.1795445650449;
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm23615057f8f.31.2026.11.23.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
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
Subject: [PATCH v3 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Mon, 23 Nov 2026 15:57:06 +0100
Message-ID: <20261123145728.29082-29-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_065412_160742_6EB7BFC7 
X-CRM114-Status: GOOD (  12.08  )
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
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 9 +++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..97a4b819c01a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,15 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..b7d7623ee9c8 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -483,6 +483,9 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			/* DREQ 10, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (10 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +516,9 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			/* DREQ 17, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (17 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0


