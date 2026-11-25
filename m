Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53392606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nFdcmVVZ;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AAwrwMal
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=; b=nFdcmVVZfF2ZLh
	6Dg1+Ggm1Bc2/NRWaQ7FPoxiJbl4vQu5LpH/nMm7z2hZuk8uHxOJnH10gRMfr2mYbSMxBXzSEpQli
	RIgr72ldsP9Kp7Z0cfQ+md/WtYVdj5J3OviDoQ9tt3e5Tiy9xLWz5g0gcHOFqun2Jo3xyAVVQnwyn
	sXGZOg0bM7pVIX5/eNC1GZVep2WtuYr+osNHk5bpfJ0o7VPvThaXnl6VVp1j0Ml7oyV1+N0Roqxbi
	dRCWLwlAH5o3vxa7YuBrejBoebt/XqfUrVeVO6czB+KzrQcMMF2VH7DmChFV+HbGZjdvpUDG8p/RB
	kbFebs7QM4LtGRqwqumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDud-0000000A97U-2I5b;
	Wed, 25 Nov 2026 14:23:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDuU-0000000A92Q-21GK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:23:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4517849f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616624; x=1796221424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
        b=AAwrwMalXkbN6ECjIVICNlWu5Po+0ZqJzgOZADYiEtJPAoEnGgElIP7RC0+o7XwYTQ
         Oak+HAykBU8uzRsAkhpnsrfpJ0gHhw5lPx4M+uD0tryHtbT+Zq7x8iRK4OuDV/mBvkJ1
         lR93khD85QY64HS33fbkES0nm0Pa6kVrse8QTVKxr/uqYVUttdM70dI92GVv5edDt6H4
         gwqU8s92o9KLMHGqOtSL0qnYB9+T/1CeOdP7Y7zuVjFWcFlQqsu1Ief+wV4IItrdG0Jr
         BacTgMTT7NHxVBAzn9FA+NnGSX9nKm52xBYLIhCbdl5PqeJq61dP0vXcwp4Eqm1W1E5X
         kc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616624; x=1796221424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
        b=zhQk7LIFc6rFNVK2N4rHmTsYbNMum3dApd/5H2snRn6bCBUDAPOOLme1tMyUqU0LaD
         L2LLd4+VV0PgVjLc5vFKlfzd4ABREgpQhOQF5/I4beY1o7ulK4iFtHlpG9rtLBSTSzuU
         FBlHlsSE+Y25B4fxMF8I1WZXd71EdKN1TvsKzHMWfNTYPvo30v4F+8b+0XL5z6sLmiJp
         TqwmC5IFffv2vHnLFN4Y15vgSH3Jz6D3GtvForI+YmpHLy3acLWyP5KWb2yazKMlzRMB
         d/MzVcVu49/jnNqge+u+4ZoLBhZEzDRV27dkVszTjLVa/fO7yJF63D32zB66CAq+9JyX
         QdsQ==
X-Forwarded-Encrypted: i=1; AL+hErGiCwrHHfjAwpv/lUmVMkTVk4YzXpKi+EtoI4F4NoyL9WIeQ+L0oXW+spcFVmhhDPRQl5V0i4cDsMZ/daYLY821@lists.infradead.org
X-Gm-Message-State: APuU4Z9tlBtFKXnLZrVK/Q+gM5dMjCyY0UHm2eKkCCBDmDVQWq8dorqA
	PMo+fhw3rvbLnhq0gJhAY8n3/5jTZ6QCNtgX7GC9vM+DQabG0RqZNXXdxTEjzDJlxw4m6umucQJ
	RQd673aU=
X-Gm-Gg: AZFdTZfPS0HFML67thCWxg36yRMVJakTZvwOBgp8Bgi4yS5Q7myJe8GJkP9CgPh/+D1
	bHM3zRYmgAXn5K27Wf5xQbBp0CSFz0heGDIJZAH4HMoSKB0JTmY+rFLADMvLtir4WP4RIsmo4DJ
	Ubu7iz2yGKuC3DdRFaoOl3IWR25WpDpmdSMXGzWjXcsbNbSjAcXLMfG3ctAZ7HHbpJEV/dxGQYS
	Zy5Q9SoUPwMm2hdRTZbnU5yshqh61lxrIzZaQgdX6OtvlDSDHt8nHChOgKKBLnARIUMo6Nni26S
	bPp4924qgeHhoZkvjeuuy6MdKN6CW32Fu0dg/w3Z32fJP9+qkyypNlx3DHKA8g+CUgdnRZdA5oA
	lXLNSn5nF+sd4+SrKuWO04l/e9vW7a1o1I3eOhvhiyvDkZOD+4uC5amu3NH98QHnbrYCAUfwERa
	rqW0jveHSSO7rLICI0ndPsEzc57KhW+Ee/o/Mj8v3lbugp/RJm+lN2BE43apBiFqMHfDu15geq2
	6pirSmwBtBjFMWRazoIATf6Miq45KsFPz6XqBhBgIN8I2vnFYDnX9qc5ogdCGmMEkii7TND6TDA
	pLQp7Vc1lYndpWkb95Zlc2KLf/+D2qqec7KCm2X1G9KETyhRjor0/hkwOfZnxXNXO7lEvBSPKCL
	6QBF4xk0q/bx6EfrNKAPoNSVrT9Fr2NEyhvOWPQn9ekQ=
X-Received: by 2002:a05:6000:2401:b0:4b4:2ce4:6dc4 with SMTP id ffacd0b85a97d-4b42ce46e8amr17140435f8f.48.1795616624336;
        Wed, 25 Nov 2026 06:23:44 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:43 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:36 +0000
Subject: [PATCH v2 4/5] arm64: dts: exynos850: add ADC node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-4-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062346_551984_38BEE366 
X-CRM114-Status: GOOD (  10.14  )
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

Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
Add DT node that describes it.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index ace747fa80c4..feac3ebc4de9 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -354,6 +354,17 @@ cmu_cmgp: clock-controller@11c00000 {
 			clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
 		};
 
+		exynos_adc: adc@11c40000 {
+			compatible = "samsung,exynos850-adc";
+			reg = <0x11c40000 0x100>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
+			clock-names = "adc";
+
+			status = "disabled";
+		};
+
 		cmu_core: clock-controller@12000000 {
 			compatible = "samsung,exynos850-cmu-core";
 			reg = <0x12000000 0x8000>;

-- 
2.53.0


