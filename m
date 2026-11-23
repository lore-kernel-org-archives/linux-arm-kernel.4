Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iCQ0PSdG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMqwM1gE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BaHVj1vymyANMIuaDlnAd/LpWMipmRDfZVKqcVMgeBQ=; b=iCQ0PSdGIHr2AM
	d4MUNosT5Phb9EauA5RRYMRtlpLcYvs1ESm7SowJXrAokwAqzSXLD6QlI2un2+IsM8a4m+YpRk1Q5
	kI+EPoLqVKZO16I7L72HpOW2SV41klSPjDgWZVedwfP4sXDGt8ajq/R9LMs1BfJcnVApAVuDqyAwt
	vB6uPNOLM2nliKFFSqYcgU5ROnAmpXlnZmMbuXHH26xKWR/zge4xN0Lg8+MUHCa24rHW7xKY0OvAG
	MF5a7mUN2ZaDpk2Hp6Ivb9oBbW/QOYjJFLY9UgEz2yHFYM58JSP0AAxlVZYde9uDPDx5bO/0HsPV0
	DdeoBsJZt3DjbMMqCn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO4O-00000002Q2N-1b7c;
	Mon, 23 Nov 2026 07:02:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3k-00000002Pri-3dem
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so21600805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417311; x=1796022111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaHVj1vymyANMIuaDlnAd/LpWMipmRDfZVKqcVMgeBQ=;
        b=pMqwM1gEb3O7kqIO5FcXG4iH2PSzKRbA23B+9szYv5TqpLH3evDmVDj/FCRHxzuUoq
         WRBaXoSgNTm1lSeUsHO0QlepqZKlq9/nWs/iK5b3SosYj5Zl9A5ikWrQ4HAIjATIvfUT
         fJ8rnZhb1b3xRC+N0s4Yn7RtQvAwRm/e3fqRMsGiwDhcVZCPlpc9hmaYzXBMmJjU+biD
         pt+8xQcNpzlVaF2k+5eBNGS0GJoikd+stNONp6h3l16AyGBLUgQFTmVIX4OWmJ6fJ2YW
         xi8+9BcMrWTq1blFQIsriVs8PadhpEX+MWeGhU2Iy8ofMqInKxR5zU1/3ydGbWCA/XJa
         cekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417311; x=1796022111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BaHVj1vymyANMIuaDlnAd/LpWMipmRDfZVKqcVMgeBQ=;
        b=raySCCOe9bh4wmS+85tLcpTLPGra2uuvjHaLx5uvOvsNLW4O3BtLnIo/Dj7kbV7p/D
         1gXw1a++IRKMojWqxVxtDmAkFoja+mH6M+1WqgZ7olPcrdSxWfkY5Ofkhqc58Y5HoDca
         kk4BfUW9MCLwzxHd5MyFKLR5ahrNCKikQZs9PdgGoFwv4VoElyIT+x0fGDGF2mL6sg1j
         PfyFPev9ye0cO4aLedj7qYAEEJLAK32cR4yHZmkEgDjW38XmbBuOG/68khu3D6Tq63V6
         XeCX4jZ2cGP9g3n51+lFPYZFRXHmu65seR5eLPdnXPHzqwCsxGMVTyDhbJjknD/68yUN
         QDSQ==
X-Forwarded-Encrypted: i=1; AL+hErHgR5QClzCDr0xyh+zyKJuFKDTgGQV554oOTIuQJMGj4jiqnTlTWBKCg2W8Dk5ufKNE1CoNMPSShVfxIPHxyZGn@lists.infradead.org
X-Gm-Message-State: APuU4Z9sDqGEiPgUt0cHcNjr+NbgpOsc6PbHpWtFI9yc9LK9E2nNnzEe
	aErNOCCCFlLOhF3rMK7FTsaRiFVPEpZg/s10WW4BMartXDX2tOR/IwB6
X-Gm-Gg: AZFdTZdvxnySqgVgqSm6ze74XKi01ATbM2yo+1tEP33YJirUXLtW9XX1dL1ttGXwMbj
	lfuN9BOx5sQbN0hf7mvOn+YpEJCdlIqq0I2FGGOTAOFLg06d+Qsf1v9PqvAhUtrmf4A6eo/Cb9C
	RXNcjLCVrYBVN6VfhXP+m7YluRcHGwZVjTsnG9Spad7Yl7aLA+ICvABxpAiMbG0sv26D3rcu35S
	q+w3pqIpuxAmlCiHc05RSgjPgaXiB6UqQK7pzmQt+j/iigbpRvtNwkhhZ2A/WrO5BT8hp07BT49
	Xw25tYHhAK0G8jxtY+XwK+rHJXJCiEn8EOR5/63vB1KXd2goMhcvfOHyD/8fsKw9/YV8efTIf1U
	e6CHSBIu4NChmKWcy5IOuBILSVQ/x7ZQzD+DpBDUVrU8+f/RAZk46l/iIbLuEf9i7rMDNYAY+RA
	BJjrcCUj98/+WwENIIlLInVof016MFl++9XCvn9R6Yn8Fma+C/PYpOrKBrINkZO7bg3mqLI6160
	uCC5Uhsl+3zPN1v4M3vK0hTj1O/Ko3Opc9Hv9R0VKjzakEO76TNYEXu+83LH63zu4voiDUtAAkY
	cvjTNLNhHPNbW8mSXBUjawpykORsoDfdTuPH
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr213919275e9.31.1795417310939;
        Sun, 22 Nov 2026 23:01:50 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:50 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 4/8] iio: adc: at91_adc: convert to device_property_*() APIs
Date: Mon, 23 Nov 2026 09:00:57 +0200
Message-ID: <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230201_455426_16F8F358 
X-CRM114-Status: GOOD (  18.90  )
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

Use the firmware-agnostic device_property_*() helpers instead of the
OF-specific property readers, so the driver does not depend on a device
node being available in probe.

Update at91_adc_probe_dt_ts() to take a struct device and read its
properties through device_property_read_u32() as well.  Since the helper
no longer uses DT-specific APIs, rename it from at91_adc_probe_dt_ts() to
at91_adc_probe_ts().  This removes the need for a struct device_node
pointer in at91_adc_probe(); as a result, at91_adc_probe_ts() now logs
against dev (&pdev->dev) instead of &idev->dev.

Drop the " in the DT" suffix from the missing property messages to match
the firmware-agnostic property APIs.

With no OF APIs or struct device_node left in the file, drop the
<linux/of.h> include and add <linux/mod_devicetable.h> for struct
of_device_id.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 2a378540837d..b6e6fa77c782 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -15,8 +15,8 @@
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/sched.h>
@@ -790,13 +790,12 @@ static u32 calc_startup_ticks_9x5(u32 startup_time, u32 adc_clk_khz)
 	return ticks;
 }
 
-static int at91_adc_probe_dt_ts(struct device_node *node,
-	struct at91_adc_state *st, struct device *dev)
+static int at91_adc_probe_ts(struct device *dev, struct at91_adc_state *st)
 {
 	int ret;
 	u32 prop;
 
-	ret = of_property_read_u32(node, "atmel,adc-ts-wires", &prop);
+	ret = device_property_read_u32(dev, "atmel,adc-ts-wires", &prop);
 	if (ret) {
 		dev_info(dev, "ADC Touch screen is disabled.\n");
 		return 0;
@@ -815,7 +814,7 @@ static int at91_adc_probe_dt_ts(struct device_node *node,
 	if (!st->caps->has_tsmr)
 		return 0;
 	prop = 0;
-	of_property_read_u32(node, "atmel,adc-ts-pressure-threshold", &prop);
+	device_property_read_u32(dev, "atmel,adc-ts-pressure-threshold", &prop);
 	st->ts_pressure_threshold = prop;
 	if (st->ts_pressure_threshold) {
 		return 0;
@@ -990,7 +989,6 @@ static void at91_ts_unregister(struct at91_adc_state *st)
 static int at91_adc_probe(struct platform_device *pdev)
 {
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
-	struct device_node *node = pdev->dev.of_node;
 	int ret;
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
@@ -1007,32 +1005,34 @@ static int at91_adc_probe(struct platform_device *pdev)
 	if (!st->caps)
 		return -ENODEV;
 
-	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
+	st->use_external = device_property_read_bool(&pdev->dev,
+						     "atmel,adc-use-external-triggers");
 
-	if (of_property_read_u32(node, "atmel,adc-channels-used", &prop))
+	if (device_property_read_u32(&pdev->dev, "atmel,adc-channels-used", &prop))
 		return dev_err_probe(&idev->dev, -EINVAL,
-				     "Missing adc-channels-used property in the DT.\n");
+				     "Missing adc-channels-used property.\n");
 	st->channels_mask = prop;
 
-	st->sleep_mode = of_property_read_bool(node, "atmel,adc-sleep-mode");
+	st->sleep_mode = device_property_read_bool(&pdev->dev,
+						   "atmel,adc-sleep-mode");
 
-	if (of_property_read_u32(node, "atmel,adc-startup-time", &prop))
+	if (device_property_read_u32(&pdev->dev, "atmel,adc-startup-time", &prop))
 		return dev_err_probe(&idev->dev, -EINVAL,
-				     "Missing adc-startup-time property in the DT.\n");
+				     "Missing adc-startup-time property.\n");
 	st->startup_time = prop;
 
 	prop = 0;
-	of_property_read_u32(node, "atmel,adc-sample-hold-time", &prop);
+	device_property_read_u32(&pdev->dev, "atmel,adc-sample-hold-time", &prop);
 	st->sample_hold_time = prop;
 
-	if (of_property_read_u32(node, "atmel,adc-vref", &prop))
+	if (device_property_read_u32(&pdev->dev, "atmel,adc-vref", &prop))
 		return dev_err_probe(&idev->dev, -EINVAL,
-				     "Missing adc-vref property in the DT.\n");
+				     "Missing adc-vref property.\n");
 	st->vref_mv = prop;
 
 	st->res = st->caps->high_res_bits;
 	if (st->caps->low_res_bits &&
-	    !of_property_read_string(node, "atmel,adc-use-res", &s)
+	    !device_property_read_string(&pdev->dev, "atmel,adc-use-res", &s)
 	    && !strcmp(s, "lowres"))
 		st->res = st->caps->low_res_bits;
 
@@ -1043,7 +1043,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	/* Check if touchscreen is supported. */
 	if (st->caps->has_ts) {
-		ret = at91_adc_probe_dt_ts(node, st, &idev->dev);
+		ret = at91_adc_probe_ts(&pdev->dev, st);
 		if (ret)
 			return ret;
 	}
-- 
2.56.0


