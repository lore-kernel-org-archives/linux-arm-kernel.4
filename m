Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B424606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TlEnd2EP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YaqlgaPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=; b=TlEnd2EPRYQW1ZcfG33wDqbgze
	YN5Rwrkt49vSo1FdNZdgXKHozfQKo9M8YvMFt2XqQVmnI1b8fviO4OVAQWkSYSHt749yhGmqQUIrC
	kb62GqzYUHfe89NaacijioLyFWsYoEyiAKR4JMzGvPUHWq2qoNmduieaKTsFnN78W7cPTHTYf83sL
	E1MrjfrVZM0INrY212lgajUQv+MZBgo8xzzKWdBxJrU69aSN6h8vnxPSVNj5tcK365BhkfSRNtrQO
	yijkvKHePtQj6uEsmx4fVxIPLN4Sd5FyVAkpTr57YJaoKm58Q6DCsBdl3e/f9fnX1PTi/eoKjBFnC
	rbs1cdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLZ-00000009fAW-1eYw;
	Wed, 25 Nov 2026 11:39:33 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLQ-00000009f7J-18e3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:39:26 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1b3b4944a0eso4228056c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606763; x=1796211563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
        b=YaqlgaPBjIMCkUb6RUgkS9zBOtjKS4RahmRpx3K/AtxKsk8wUYT08qxIm39Bn/QkYn
         HSP5f1RkuRgpm7gR3PmxKcgoaqe2bPKKRS+1MfTqZ6U97GS9567OuJSsbNoZ0xErvM2c
         mkEGMsq4DJhHnNGtxo9rUnfo2P8VOTZwQPv6duoEjr6V9yRuRkzXf4WPoHsFES8qWznR
         5oqj6OJywf9ZXRdbBToHlMYyOTHzel9c078pjMRYbkPkdPciVGwHpy/8Y6AbX4tB0pM3
         EZDpu7fNOBFvDUsF+o4FVT+mbeP4j+bv6VsNYA204CmZxyxAEj8LaoKUjjtSmaNzgTR3
         DdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606763; x=1796211563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucIqmBM6KN9EminbPJZhmBbHA/CEHwAxdNotG8ANz4Y=;
        b=LVg8ACE7qE4wZI9ZF6nLlgbQxBV2jcIsculf8sAIF3WPhwG40LxIattuGbyeZ9Q5wI
         qKtoNhx8QoyQkL5NP1Q4YsyzRJFQ62g203VoA+7ZttQFFZnubNfy67Z3dVghFRFYpMwC
         sF0AVN6y1znTKQDRqNSCCxxxOOZyVORtaqxEnHYnB0sqwSDtJD4rYJz/FjSKfW6CSb8i
         ak/Fag9DHAo3Yd83Q92SZi37ihjqCyQJn1SVGxZ07/OjFc3eZsKkNPwAO+yDCKQ1CIs1
         gKHU3eb5MALYHkuJuWvY9oI2tCrfTeanpySnfBHyrnh1zqn+z4hwKDqL2KbTN6royojc
         Qiqw==
X-Forwarded-Encrypted: i=1; AL+hErGcXVWj70WT8VvjdXhbSDCvYvw0jYQCyOfZIItoHU8IQlS9cG3HDrM/MV0PoII0JQRo8RsRe2G4wkBT15vS7x/n@lists.infradead.org
X-Gm-Message-State: APuU4Z9UIAR3pYoBDi6l+VqlhBxNOB18Bkj2+ONDZeBoqnKCziBYZTQH
	18Z+RDetJR+/T5BS74JH//e0VI8NC7gL8onDg6L/PT+JYHe4CaC2duUhaKWbLGuN
X-Gm-Gg: AZFdTZcXaRy8bmeAK8QD4sChFggAd6UPJ7/Pb4hmEZpTsWnYS01As1XrrLyXxgATin6
	YwhuWxPDCE6s2MHag5dLeBa3T6oxK/vfb8BvAjVJRUm3QFWBPqiC4wYWnEf8dpXYYQ8nWKJgruA
	aBhAipWGpxzc9pemP+cxzuh5ikAHIxFcyMYTlDMUu44dDKSDa4QMZyBiQymNzHwDrm3kTcePNmO
	lYBR+BvTK6AU3Si7rYQN8sSQgq5Ks0y8vVVjtIfyzdcUsDghLSw2J6sNqzmyzLBHY7Fof/H+q7a
	z/zaSTQMRMIC3eg9nlxQmwrM5LwlUQvT5iv5uhRfvei33FwfQ+kcrDAH1h7uW+zHH+i4wGSDKOO
	ETBW8jrLFaxhyhL/D8QSVHnlpHZF21JzesWZCS5qyg2kVgHGONE3oRQKVfG90uG+yc1hZew9Ck9
	Noe5/cjpPiloy6/Lzjc2mHRW40n/19pSH+0eEt4UprE10lF9VGAKcSn9kRZOXPHaQHV9sJppUUv
	W4V4ZrslzhcpiHTFAmKr+AyESawVlx7thKYlu6L9FMqF+sfsRzbW2LcyLp1AMc1O8VvPZ8Mlr+8
	jBcHRn/6WXeCGK6fGmtVUIX0hzYtVXDIY42Ky2s0/4CGxyo=
X-Received: by 2002:a05:701b:4502:20b0:152:9e88:daaa with SMTP id a92af1059eb24-1b55690040amr17444087c88.36.1795606763346;
        Wed, 25 Nov 2026 03:39:23 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:22 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 support
Date: Wed, 25 Nov 2026 17:08:42 +0530
Message-Id: <20261125113845.297658-1-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_033925_115361_F5DDF1AB 
X-CRM114-Status: GOOD (  12.26  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree support for the ADLINK LEC-iMX95 module with the I-Pi SMARC Plus carrier board.

The series includes:
 - Add ADLINK Technology vendor prefix.
 - Document ADLINK LEC-iMX95 compatible strings.
 - Add device tree support for the LEC-iMX95 module and I-Pi SMARC Plus carrier board.

Changes in v4:
 - Correct alphabetical ordering of the ADLINK vendor prefix.
 - Remove non-standard USB aliases.
 - Remove the ChipIdea USB2 controller configuration. Hardware testing
   confirmed that all four Type-A ports on the I-Pi SMARC Plus carrier
   board work without enabling this controller.
 - Remove unverified SMARC USB connector comments while retaining the
   DWC3 host configuration and U1/U2 quirks.

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 138 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 628 ++++++++++++++++++
 5 files changed, 775 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1


