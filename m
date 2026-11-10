Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC9606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRFQelbk;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1iBl3oIB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h2FkN3i3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=utibFfDFq4bVa7w80q4m2c30lWgg7YBiQK/do3c4QEM=; b=BRFQelbkKMMzAK
	FhhDm1i/VS4oJc1Ms1di+qWC9oiGrFYpTeRrsFuReqUWpbTWrpWoFWbVpQIc8J+miFIRWSSLDjwEe
	7yHahJRya49gXAaxTSsCsgzmwwfWABH351lzKVouvimj8rYu+h9gXlv8rFVd//19XedZJmqnbpSUz
	EdVdv65LuxZcDtwf7T4jF716dTEE/1uJGvcdFRz68tvDwH76nW6giJM+oztfdReef2bzUNxkqTXeC
	rkvmpmGRvysuZj5Z9pO+kB7mGg0Aums7TqZ/uypymQ/mPfsx83xEVjejc9BVgcbBpNgcKAcN9PPyh
	UB2GB40kK4kDoDjV3Omw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQooB-00000004YRT-2s5j;
	Tue, 10 Nov 2026 16:34:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQonZ-00000004Xu2-3OcK;
	Tue, 10 Nov 2026 16:34:19 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794328455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utibFfDFq4bVa7w80q4m2c30lWgg7YBiQK/do3c4QEM=;
	b=1iBl3oIBebO2xP/W7fAturiU2IKNz3RcgkeLfUlPyV2UabBgnFsf4pxS7GmGXD9yniZjxH
	1jWLjXMyRKZH8Iy8kijihnueHAYOl9Y5hrKs9kmyWFAS8sE4urBCwKmEY2jnO5baXYxyom
	i60KgxWuRZ2GwXHR6+undBdDJejmy4ZXbWNFgocnlX6wVyniOG32qroVIYqCYP3If3h8Zz
	F5QddStcU1iK7vpieNZCIgkh9OBnGOF65rlPBOALpy5uDE5R6tf0kOs+lBglT7WaEqPbRK
	mK3iCvpRdhvvvZNOUUUytFlUHecApeGpabTipAaf4Z0QSDZ6r253qah3wQb+rQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794328455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utibFfDFq4bVa7w80q4m2c30lWgg7YBiQK/do3c4QEM=;
	b=h2FkN3i3pUkdfQgjDFMx9LyuKnApG2uypRUqNiLBRrSIpfdlpr3AY77U7azYqDhqIVljBC
	J7h1cDhj1gYtzbAQ==
Date: Tue, 10 Nov 2026 17:34:11 +0100
Subject: [PATCH v8 12/12] firmware: raspberrypi: use drvdata to register
 rtc driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-otp-driver-v8-12-797e0577d414@linutronix.de>
References: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
In-Reply-To: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794328449; l=1263;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=GviQG78udImKkh93JAYuiO3wqf5GT1E5ZSWcEvo9qAI=;
 b=F9cRIXUnkrG0EopmOUfYjNlH1Nh7iPM9RQOdhWLfXOYcGG/r4P3TqmZh83UfcuugsPCeNvBMn
 imlNJELH9IwAS0JvPrEbsUNP0k5VWW+Ir0KQ0NVkFkANFWEW4OIn15u
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083418_012727_A73ABCA0 
X-CRM114-Status: GOOD (  12.69  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There are two bcm2712 steppings available that are not compatible.
Therefore we have "raspberrypi,5-model-b-d0" and
"raspberrypi,5-model-b". Some features of the Raspberry Pi are only
available on the 5th generation, e.g. the private OTP register and the
RTC clock.

Use the newly added fw->soc data to decide whether to register the rtc
driver.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/firmware/raspberrypi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 755f845754c1c..0cf893eb8b786 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -237,13 +237,14 @@ static void rpi_register_clk_driver(struct device *dev)
 
 static void rpi_register_rtc_driver(struct device *dev)
 {
+	struct rpi_firmware *fw = dev_get_drvdata(dev);
 	struct platform_device *pdev;
 
 	/*
 	 * Check if our model of Raspberry Pi board is from the 5th gen
 	 * as the RTC is only present on that model.
 	 */
-	if (!of_machine_is_compatible("brcm,bcm2712"))
+	if (fw->soc != RPI_FIRMWARE_SOC_BCM2712)
 		return;
 
 	pdev = platform_device_register_data(dev, "raspberrypi-rtc",

-- 
2.47.3


