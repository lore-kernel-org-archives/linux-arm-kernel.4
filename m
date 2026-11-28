Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2D9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e21DSOgb;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=JLb5pQ0K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=julNFQe4k6zvG3PDiUTDwkvcj7IM7hay3DWG4Qc4RWM=; b=e21DSOgb2r9W+j
	bJr2aAyw3i7Vk7U6Lbcov+I4sX9tknN7TQ7211CvRahQ8FSTtLvoh8JFcTg1cmkSPbFIvQMe3NWAh
	pPy0jyqzoGzFpLEwMqhyZHJTqlARPohHeDypSbVAIIhKlO59YJRHuAhcyUTH3BVITUuyWf1zg4eFi
	1y/Rw0mhMFnR5KCB8Ee4q0eUDizyZsIDdBMc2NCuwerLn97EwEImombmR1X4SqguEt+fqz4vMqEcl
	VC9rd2VIxlyASskSHhzj4zkWdsn15RgjIbZ7rJ0cnwPVwhX/2Pk+n26OmG7mr0zQIP/NsXbyOh3Gg
	p4dHS56VUp2UmJCSj8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqS-00000000o0A-49Cv;
	Sat, 28 Nov 2026 13:52:04 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIq7-00000000nti-3Edi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:51:46 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jcBXY6B4kzMlp8;
	Sat, 28 Nov 2026 14:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=julNFQe4k6zvG3PDiUTDwkvcj7IM7hay3DWG4Qc4RWM=;
	b=JLb5pQ0KgTDWTyacj+VJc567xDZ/4PgQK+4aFxKIKKXcGmectB0Zdc8JL0Y6Fp8zekPjcu
	n7Np65f+pxIaiXoXtCtvhS5Z7pAHk9qY4u6LrHdhUXQdLQPnt8L3XxfbO0eppgSXxIUm4F
	JrZta/wXS7wITA/vrT1pqrdVhpmZkkEVStjSZMSyaGG5C0JNOz2fCzGPJFjO3ZPVEY9MWl
	Fm3DnOspQngpS3E5YEjiwf7YbNdvrYjgOLexJxRDB4f6tHmmyfHzRkIjGqCWqeZlfWcO73
	8fAquI0yLJItwe4PCKrb/V4kRx+I7SjLooAnlrtdpoQ3iIFCwGdMeNLMLphajA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:30 +0100
Subject: [PATCH v2 3/7] Input: s6sy761 - add reset GPIO support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-3-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXY6B4kzMlp8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_055144_177808_EF647B1D 
X-CRM114-Status: GOOD (  14.33  )
X-Spam-Score: -2.8 (--)
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

Some boards wire up the controller's reset line. Hold the controller
in reset while its supplies come up and release it 10 ms later, as the
vendor driver does, and assert it again on power down. The GPIO is
optional, so boards without it are unaffected.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 drivers/input/touchscreen/s6sy761_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/touchscreen/s6sy761_core.c b/drivers/input/touchscreen/s6sy761_core.c
index 0e455060dbc0..c97e0091297d 100644
--- a/drivers/input/touchscreen/s6sy761_core.c
+++ b/drivers/input/touchscreen/s6sy761_core.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
@@ -100,6 +101,7 @@ struct s6sy761_data {
 	struct mutex xfer_lock;
 	int irq;
 	struct regulator_bulk_data regulators[2];
+	struct gpio_desc *reset_gpio;
 	struct input_dev *input;
 	struct touchscreen_properties prop;
 
@@ -297,6 +299,11 @@ static int s6sy761_power_on(struct s6sy761_data *sdata)
 	if (ret)
 		return ret;
 
+	if (sdata->reset_gpio != NULL) {
+		usleep_range(10000, 11000);
+		gpiod_set_value_cansleep(sdata->reset_gpio, 0);
+	}
+
 	msleep(140);
 
 	/* double check whether the touch is functional */
@@ -370,6 +377,7 @@ static void s6sy761_power_off(void *data)
 	struct s6sy761_data *sdata = data;
 
 	disable_irq(sdata->irq);
+	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
 						sdata->regulators);
 }
@@ -406,6 +414,12 @@ int s6sy761_probe(struct device *dev, const struct s6sy761_bus_ops *bus_ops, int
 	if (err)
 		return err;
 
+	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(sdata->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sdata->reset_gpio),
+				     "failed to get reset GPIO\n");
+
 	err = devm_add_action_or_reset(dev, s6sy761_power_off, sdata);
 	if (err)
 		return err;

-- 
2.56.1


