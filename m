Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jOlvfQ/n;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gnlxj6Dz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=; b=jOlvfQ/nXm2Sts8DI8X6Ln7oji
	ZfvCyU7w43+zZrWFRmh9cP5EKOFS/2dFR4UuTLy3wBQPcDH0TtJUCduUMxT+82Fo3/WIgcnRbGpAl
	q9kGWFNhybF3JlUFAqFAD/VgatIPGB+XLGIFmWoxBGya1pgYTcs0V4rPjI6t045mRuCPPg6eLS+OX
	MXjxLcxrEYDL+SBtg6TTsVwjXU7TD8MgLAAIclreDzHj4PPlPahW0tqegj7B8ClXJ2BdI0Io5wJtR
	LA5yH6g7TK6LOfhSLmnWlC3HrYnxkhAyblR7RCdJbKiOApc0SJZzIa34PwUm2ULxMLQaGb+7lqFiU
	XboGgQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDuS-0000000A92C-3lzG;
	Wed, 25 Nov 2026 14:23:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDuQ-0000000A90k-1Y6T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:23:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so53453945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616620; x=1796221420; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
        b=Gnlxj6Dzq5Xn6jx0jMZzXOknDQeZfjJEKnJhkbEdldtIbbPinDEyJSe8bpTpTPX5pj
         0IS+1olH7xLwnOjbicDchalPuIfkMB9mczTRP4xWXnZHnVxwxb9LWuzoWD0heH6+iYi7
         iOzGbOGryByZKsUBncStpvRp8VIIxi+wKQyGu5Lwoach5e73dyj2877mxpBWWvRmE/YW
         rQ/96a1o4grdVLvLJZHApEfrGLTp76tYTa6bBf8DPDYxBY8HaBRWsdTQDal8+MPIUuw9
         xUHxVIu2t/p9VZQDbROfiaeLQPeTmbMSOLoDpyH6qEvM5Dzz41txJlLW+QCwwkm8Y+3o
         cvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616620; x=1796221420;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
        b=s203CIzPuzydR94Z0O6X9r+J1hv7tgPQfO65jbWdLxHmRcuGmF3PJTgBJ2G5Zj2PJl
         dD9Aomy7Wd4bNJQZz6JGoZdbjTGQYtJ+LezQ3+YAahvgsZ5euHMqvkU5pj6drOgqrm9Y
         mwjKLg90M8YynSaQXejmXiORYdKHaA8OAIPOZ+QSenPM635NxpZ+gpkwKPWos/IjSiH0
         c7AcM6mpXVU8CG6vRvqALMbudJzbVBNEOxOkctUquA+/Pd5Msi+wqqemv8SDqMRv8VcW
         u4cTa8xdyXzkhebK11ZbpwOquCbr5mPSPPJwDqv1XkcJTrrz5tTomlZ4bv9asjuN9Uw0
         PTQQ==
X-Forwarded-Encrypted: i=1; AL+hErErHWWjAEp2i3quaYaaGSJAzjPMEje8CicezWU/U3o2CdStG9evgkwx4eBO6FoQ+KUEvoccmZM3TVW6ENEhTFda@lists.infradead.org
X-Gm-Message-State: APuU4Z8Riazpgae5fiJyzS6TvRblKaFdV35g0oR3u3kl32sVTrj7e7H8
	JOIt7wNuI0G+x77Wkb9mAz+Y9wsMMNELMdaeLiL/85e9xw9oW/gw01oeMUlrRx9eA7RsikyH3of
	zBoLYq48=
X-Gm-Gg: AZFdTZfI0yKppELj/zNs0ZMc7eiyeT3AjOoCzG04iQmgK6jm/82nL1m2o+44wI4MD8z
	tuuRWH/TllbOgRTZaRCEO/9yRNefYw1Taw25jMEM8MK1S3Fl7sAWJS70OQLvgkE5YI+KgJ90jvS
	x4ulj1rv3JuMklktjh9mwDWgb5VkMRRAwGAesH9XF1ucErRYcvDXTqQSjGwGJ396VzodRwbcdFg
	k6QJ2DVJju1uckKHrv23/eATCc0OPpYxAIg015jWQIwsn5Ui1osEh5dmfByzUCTtJVtw5y6Y+MH
	NA3+hqY5BH9LQ+7+5Bd/SD/wqgMlb0OBKJaEpRJqsxuTZWYqrID+3IqCHTfx5iVLAUz0DrXJoB9
	rrMsIidLeNg95z90pkuVtD58UE7UU1rhnfB7PPa80aF+8kY6h4PPM1IJFpK769snyzpL3Etr8xj
	0nQl/oIrPZ2qSxdRRi4fDmpCbf2zY536477/nlDIncyGtNMqFlIfH11U/UYAxlIUjaptChx0jtG
	XclOKhT4SyNPKNFW1zIcN0ZroX5RUJF1Xk9aqUPKrSHvpJK4eLxxMjn0TkznGIdxXWZmstIJ+PO
	/LIxuZle4Hk7PkUB0XRDVXNbpqNzicrZmvsstO18CPB6XaA81aVdt+/H2n26NkLV8sOTIIun/zh
	rdGhNXARCYbnlUNAprdoWRkxOG7MfJR/yvcWoXaaQWnc=
X-Received: by 2002:a05:600c:848a:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb88813462mr315204935e9.20.1795616619785;
        Wed, 25 Nov 2026 06:23:39 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:39 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Wed, 25 Nov 2026 14:23:32 +0000
Message-Id: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQqDMBCF4avIrJuSscSarnqPIiUmow6URJIii
 uTuTe2uy//B+3ZIFJkS3KodIi2cOPgS9akCOxk/kmBXGmpZN4jYClo3H1Kr5NM4K7QdSDXaWNc
 aKJ850sDr4T260hOnd4jbwS/4XX+SlPgnLSikuGrsLwqbvtfu/mJvYjiHOEKXc/4AEKyE9qsAA
 AA=
X-Change-ID: 20261118-exynos850_adc-9cfe569acd8a
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
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062342_431772_51D0117D 
X-CRM114-Status: GOOD (  16.44  )
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

Hi all,

This small series adds support for the ADC block found in the Samsung
Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
development board.

Exynos850 ADC is also called ADC v3 in downstream but my understanding is
that SoC names are more prefered.
It also relies on PMIC 1.8v regulator which currently represented as a
dummy one.

First commit adds compatible for device tree bindings, the next two add
the ->read_value() callback and Exynos850 support in the driver, and the
last two place things in device tree files for WinLink E850-96 board.

This was tested on mentioned above devboard by reading reported
temperatures from thermistor.

If dts patches should be split out as a separate series and should go
separately please let me know.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- split the Exynos850 support patch into two patches: the first one adds
  the ->read_value() callback and the second one adds Exynos850 support;
- added an empty line in adc node before status = "disabled";
- Link to v1: https://lore.kernel.org/r/20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org

---
Alexey Klimov (5):
      dt-bindings: iio: adc: samsung,exynos: Add Exynos850 compatible
      iio: adc: exynos_adc: add ->read_value() callback
      iio: adc: exynos_adc: add Exynos850 support
      arm64: dts: exynos850: add ADC node
      arm64: dts: exynos850-e850-96: add soc thermistor node

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 22 ++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 11 ++++
 drivers/iio/adc/exynos_adc.c                       | 66 +++++++++++++++++++++-
 4 files changed, 98 insertions(+), 2 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-exynos850_adc-9cfe569acd8a

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


