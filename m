Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739AE606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5dqU0Ut;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOZ80ejq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=; b=V5dqU0Utsk+NPq
	03CfbsU8t6rDZlrCxZQafxCmrVDcY557dGuNQC9i7xirfu2SjdL7vHnA1wGnbzxvG9mQzJfoFvXDD
	m5T/CE/vYJ3eNz69bMjdqBQYTvXln+LxLr/bTJkqb27ba+dZe8ArKBQYhvwKYRgdrInio0OEH5qg8
	K/4lxZ51Esy8RsOcJQF0rSPkbc5qPkIO3o3hOsbRHdDr2mmxCjmATeEDvVSvhS31IJXZpthrshO+s
	zchEFB0LFDJX3KoztSr7UGAbazy77i2xGMvn5rKcP4cIp1R0vdC5CQJeTvcvGqgODLsJNYf1A/dw3
	z3Snz5S47e/+O41NHESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEQK-0000000AGbw-3Osf;
	Wed, 25 Nov 2026 14:56:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPq-0000000AGP3-3Fiz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:56:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso58297935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618569; x=1796223369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=DOZ80ejq6j5sMS1a16/EGGOskpkpFUCNuZnaVyxCqv4Z3UKCgcc0y4ehGneIJLRScD
         5OwwQOzOIP2/96B445saaNX0Ob/NWcmENV5Fi4PRjaWovcS98oVAIg6X6ESnUcrfT3dV
         CEA/5ODp7X63totzAV0IMwkM83VEExsTKnrAn2qB1l3U6erJSYPZs1BerAWPpsGOGytg
         hESCe6NHU6QbMlZlxsqFRAvBXBCFAa6CIvni30+l4GpRSviarp6hlOoXSK4GdHMJmS00
         EyY8wrgt81+Wq7Cl4gesEnhTKblD0ne5/9wlpobNPra9A9/vaxD9emtfDU8MUbWnq5a0
         wmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618569; x=1796223369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=yHdDaziH/xPhKiP96tft+NZmc+PQBCGXrR26T18SaXxqt/Fa8oo3c3JySSR9l8iZSs
         V/SuA0QtthmpaY37B5tTF3Qwb0foUj+6+NTRpvnLf96uUEK8ZKoW03cLkXv6iiTYgZpL
         54x2aNe3P+l81/uXWVL6rCD5DF1irsVzkd7Szxsmx5iTkzPl0/iOUac9b2HjzeKccj0G
         4UdwyLGeH67icNJc8h3dGcNEJWF6ZV+QhkTc95K083MISzh6FreMc5HSRmYl+iB79opp
         yvh0BirQV7hoodovIr0/nJCWGWsFxUDMboXKujcjGIyNyiSFTgk4V3KuFzM1tcFWteK9
         coHA==
X-Forwarded-Encrypted: i=1; AL+hErHin/O+ebHZ8bcgfPjbSGbtW3oBYp6rJ8ijcGZ+XBpLjHFhHQJXSckFQrRdvvblNHZ7iZQ3f4s+jpe9z62R4HNW@lists.infradead.org
X-Gm-Message-State: APuU4Z8GF4/75n842C+fIWArpl31sGgty/kP5XQepJAxQIbOF8wUhWhM
	Z67Ce4VbQZxz4fUuqP8iRoOJxpWvYkInthmf+KHSPiNvW/hsG7cikNaF
X-Gm-Gg: AZFdTZfLr1nLFfF+WRkQKR+f2mGLhuCJrw6AsTEYfdTJblBX4GVZdTU0gnXpSr8mKU0
	AKw/MbRG1b0kVRPeOqteWCvL/+BzNoMNWJGAa+ISM3I2dzcERYFuuVS2tGtu7rfvtIghqCkhM18
	gm0h/7ljIfkuZ6PKLrN48QUymQ9VM/zyAgTgX3bgKomp22t5LOkz1bHfd12kxn7UAEZG+5JvmVn
	ZAlqLm8B5hilc5eYviqk62XkLIvmlxCVDEBCsLIgCvLlD31YvffgeWhHyMa44wqAbcWsoTkNxmd
	qqc01p9Z/b/FGhj1ksuG/3rb/jmaofYgK7dpfyRqaObhl2XeEEOAVE9YZANTiWq5KquD5U00bUn
	EWt2ecYbaQ/P+E8upyEMXjTsWheL+BvDSmLt0cvl6R2YSBGBilQCXjzrdrfSrdSwVY+VsONIY0o
	/UvrJ9pC+oE233EMRyqBGIt6lal7u0bgI94DHuXqMNtgE828Lzn7fpYPFHCeFLzCCCQLBhy9HuN
	0225ziFdp3DGE8C/wUOCLn9ReVbAUBjoHnKLBMU2o9cTA1oL3pxlZgoFCKwli8k2mme61ZvMugj
	gLFY2PgdwTCbajsIMgZVZZaa9mp0ik2wWuaEvzcmiDEE0QYyyVESC6eoYUmJL9KHrKIuRi1+HKT
	YrYlbXmpxObgGqn9Yfij6MQZchpMGoGpKJfw=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr362757815e9.26.1795618568725;
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Wed, 25 Nov 2026 15:54:56 +0100
Message-ID: <20261125145458.2594179-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065612_956382_34D4C08B 
X-CRM114-Status: GOOD (  15.61  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

Changes in v3:
 - Move status = "okay"; to the bottom of the usbdrd node to statisfy
   dt-check-style checks.
 - Move maximum-speed property to device dts.

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..f93996e7321c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -112,3 +118,25 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	/*
+	 * SoC in theory supports SS but no known device (including this one)
+	 * has it wired up.
+	 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we have Type-C working */
+	dr_mode = "peripheral";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1


