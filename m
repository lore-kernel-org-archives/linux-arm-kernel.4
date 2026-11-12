Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE1606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycm6+xrK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/AikTTX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=; b=ycm6+xrKenSP47ioKqKMxLNjv2
	vLbVPZz0XAFTz3V7Es7/gqVug/PhkVohofmLC1LB7BQRPeE0cnrn+Ur0SaGhy9904z3BRavUAkar2
	MZJw4QzTG5pkrihuoP6iFie9fSXcMfzsks4/hwvSNlLrF6Lo5YiYpJutGw7cwTZ6LlcGTgjPz0yEi
	oHJZk4kEHBEuwBKpF0Mo1OQ2OcY5zxYumgqCg+JA1HLFZz6uKdV21Y/PlOtf41UYaQTYJvTdgz8MW
	p/92S2jcmzoAqvPLMQ84iekwqch1qFHrPYJ+YYQ8KPDPa/xQeFghn/0nEHiDqnv069yhWtyDY0zaW
	8GpmzNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbn9-0000000B2Lx-3zjf;
	Thu, 12 Nov 2026 20:53:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbn7-0000000B2LZ-3i9N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 20:53:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so2215675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 12:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516784; x=1795121584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=c/AikTTXWPSBDQLmLIV7s6Yk+chexARo0KA1jiFjeCPfWQkganf7vShWWyu6ClCOKP
         O8NIahnvBX6OTzHmSy5mhSsXHzGEwnPGvYc/Bj1x/gACU3Cce4CPD1fxrFKpab6cdqSX
         fD9GQJlATaz3ZWqlwhyR1ccrtwOq160B+4HJcwgPD0qFFF9ZRSLtI30EJmDVFkQ2omn+
         YTs9ma923zsnO+jqDGVG4lHOeJy0/28WqwfT/mN3zItqvqOn8eLqKIaZiWBpnhLZU9Xn
         qDc8tSJ701UzTefMkg21jMkpGPOLt0xLBYXGmXF4Ze4ltYhjUOMY9+lB9Puz67bHumPc
         DUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516784; x=1795121584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=fetaBiKSePR+LgWagL3/TKlKThWZ1+MKqi3h/GIiLE7At3xf377MsSgHg3fxuNfoyA
         Z+KRVIrDOXNdLABpQQAWcgJz3HD5sFJXYY+p0DZgp5uzqGQD4X9cJLP6qTNFBGfcHTp5
         69b4YX1X+3l7lx6cs2BsHnOZiPL4f77dXEJ1zV6dZVFR50pY7ckHiPy3c7LvIRcDB83M
         6nntQpBRYXqkwsLjOZaLZzKdhBAJp+Rxjrgl14zs+JzKteWkgoEtWuw432rakzcFLMy1
         8+wasIbCYVcwBk2GAvM+caDCGf3dLsxkacq1sxuMnW7FGAMkxm/cvvA8cQV6VSEmuxmm
         lw9w==
X-Forwarded-Encrypted: i=1; AL+hErGl1JfiCcZDuphc6QIwxdfAfLql7LwLdlYenpE04nVFN9RqdoD+24ekIInS4cnnHy7kfkxSbgixPSN4T0+4K6f/@lists.infradead.org
X-Gm-Message-State: APuU4Z+d1Ibmv4jqRHvJZdgWTPysi602l3Z31p7OrcPmdFpayO/vJMdG
	AQ7k2TgwLWp8N4Um624xvOa4fRxDWry/vgr/AYWnljQMWYmdrIcKARj3
X-Gm-Gg: AYBFou1Tc2CTcZ7lsXD+fOOi/hseFO/TLnEQdOKX7QbZbGJYd5avu0InXStoCUC7JCv
	Ee4U7Kk0i62ACXozepUa4+VYQT80jFeb6378xUqRQK4yH9uL97ut0D3rDc5HQ39J3xHHrf2skRw
	aF/10X4umID6wCvjcElgkGny3a/r1Gxj31/y7lFF/KFhEhVwKtd6BsqUrtQ2FFIqF9+75D/33Bg
	RoWIJxEEDAmEVk9cR/u+wKsbXBg6Rp8NoCvcyj+LmIarQguogNSS72V5mOl/yEsxvy9xkyzob4A
	cmNxfxkMs+GW4z5UklAwFnzDb4/J6K6K07kSegytsH500QRnu+ZM8JalzqHkfGOe6dHS6wcHy/+
	zujwxbRBFkSM7A5H+k8qQH69IAw6VO65lyy2GNtgRAhXt/S4Sy0klNkXXbgWcHwLR3vEzXj+Emx
	bT7kf8hp5QVj6gFIT8j6lRXnTxWK6X+snYertL7x3yDGl1Xzyr/vUXoM6dAn52VTQlxZaCb4koI
	9HBNtufm6k9Ezz9RetKXY0C242kH7Xqb06wfOtHDUZzWPBsIb3bfKhZIWnRDBsq+XnIGKbRhR/1
	96zKJ/meqE30iKuymvv+XuoxNh1m2IeUHUIJQD0Me6SIfr6Z0UatJVwTySjwsdU=
X-Received: by 2002:a05:600c:46c5:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb55a9b453mr8505215e9.32.1794516783607;
        Thu, 12 Nov 2026 12:53:03 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:02 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] sy7636a: power the panel only during updates
Date: Thu, 12 Nov 2026 20:52:26 +0000
Message-ID: <20261112205228.42630-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_125305_983377_253B2E17 
X-CRM114-Status: GOOD (  12.79  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead.

This is based on regulator for-7.5, which has the rest of the series.
Patch 1 depends on "regulator: sy7636a: bind to the I2C device directly"
there.

Tested on a PocketBook Verse (B288).

v4:
- drop the patches applied by Mark and Guenter
- patch 1: keep the hwmon name (Guenter)

v3:
- drop the applied patches 1-3
- new patch: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (2):
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig |  1 -
 drivers/hwmon/sy7636a-hwmon.c        | 35 +++++++++++++++++++---------
 2 files changed, 24 insertions(+), 12 deletions(-)


base-commit: 89b552ff49551960b9e270feee888a0298a12d94
-- 
2.52.0


