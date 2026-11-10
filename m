Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD860A3802
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ou8daOeW;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FRVm5ei7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=; b=Ou8daOeWQCLNJd
	Y77MSjJ+GR0HldbyegJ2BkIQbYLcsmOosywRstYo9jHU0wRDAx0XD1uAySux6Wh7A3ZnMJhta+S1h
	njGCD9dcnGq7KluszvaQdWfPdgLOaFyNfxNzbfTZy1ZHNNDjN4xkx/YVEg5KH1wpkD1ruJfj1hQr1
	kw2vGfcUA3HIahGV8+nXpnf3RNhB4M1eBrBv1wZnd2YLw9b62UbLma+Aoha65cNF0DzBSfjG1Bhp9
	1x7zSO60/cPR0Cl2iOVjEn+hTnEZY0wt7JcWDubLJexJ2x+WJ1q+u68wdjDWIT5+9+oP0rDVGPxAa
	gnH/2b09L9DQxa+t/Mrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtop-000000055s1-07OU;
	Tue, 10 Nov 2026 21:55:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtoj-000000055oX-1B6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:55:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1699621f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347747; x=1794952547; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
        b=FRVm5ei7e6zMWjci3X8t73aayh3+GoVT1YcBpDa8ucn5g/3+QJWRck0uqkmpIMUV+H
         KPWyn6EnHwCoATDk7PoHslQSuOA6ztWDcnR1UebuhusmKa3MFCYBbwB7057uu4EFDSbQ
         kTpqbX3QQKKMJCeMYFunP2O4NCWNt/bdH786dGP/j1EGgKB3hgaBit1/dP2fEDHIF+ZZ
         jfmJkhtUKknMniN9/EIQ42lvCuJhmAhRkgaC8d1zS0C9et/PM0zHNRCT0zwqF8M9vDTM
         MfFxvSbkpyOBEinAUfl0P1V5R8fcmYXm64n4ON8I+1JG3EmBoGDPTLXOwlo7eeBEj4l/
         VgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347747; x=1794952547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
        b=yat3zH9UulGeFlo17xqd4V3YobfgvhioVKX7O3dCu0Qgf81fpGKaU48EUxNQX+n8ut
         KcgT/KCFJVtFFQ2tjZmtdcla43STeflTXbRKRXbsTxbElKdh8LOr7a0FKBcLS3Ew1d7p
         f/tk5giGvzTfWjTe22Kl77FOaQJEFRu7UNsFDqJoXg+lxn1be8WYXC/HUVFzzjD587Dr
         V80BQbiA64Gva3oACkUnOgy1aFgGDFwc3EFNDScnxaUmNyunwd4F3l9Y8bBUDZpuQfF6
         x2WerxUmvPPitJZK69wgiSEgRMvLqeng3rnPbsXTFvFVGcBobehTgfbjg0bV4aLXj4DH
         CKYQ==
X-Forwarded-Encrypted: i=1; AL+hErEAVtOwv7IrkObYU8fuTNW7G+F8B3yBLhzP5bVCCX0DhHhmO5b/6k+/ATfjyl9A99DXAsCDZ/Wzfmd5W8jTMQT1@lists.infradead.org
X-Gm-Message-State: APuU4Z9vSx1x65/3fMoghjWEmKuIgyzmXkSmqMbgviecpxkXi/PINwQi
	ouxgZEBt1J2diIkzc8HNXSrJvQv7PCAVHG0xBXBRj7UZevTfnY6RvFetUUrK0hNY1SA=
X-Gm-Gg: AYBFou2hvZntBsnaRImxT/MWPIRsWT68lhYrN5qFXTOwAraYIduR+Kbm9CDAOSmk5UP
	IbyIV8/6XYZibXm73rTW55sfnunpHjuqzTpwfzMCP1cvLLsWlMixwtNdjy4GYhEoSQp8xFKwOwK
	hwrAtqRfFzZZAnIstXrUnSb2h3UXUJ2thnAXW9OiHHBAl+xTGsVUj8w7/Psp7vOfqKq1iCPoVYA
	333JxHcjijUQzFYgXfc2gIB80h0IKz7G8nIF7A9sy1oLHSQsrViJIDGDMBeKNIfAGtnidefoHCb
	THtURtJyHPYE8xEy+dRC0v/Z12k2y4rHfzPTpoB2ZSgHXaVPrbIqX28SEFVBuMn6/HuF03QwMeX
	bspJ4KQju8LPt/XxI02gnbjVhGneSpPP/YG4G+iE44mvDd/6+D4SI9KBD8haLzWKjUbx0fsoOb6
	zdIIYayGXbdxrBcnwSJ5Rt0nhtE3XxQIBO/8Avn04YDxZxJu9lVHNU2b4RpGDQec8noOEA1z7Wi
	qiy/wtJrrB8vUMgsc/W3vZ60+wNUkoSzBuQ+f7dCmbUWtvSFgqDIwORrkKgfozNELmqsT0uYtKA
	/vOoDKPQMwWNpcY3DJ/4FrxewNdp2jCRvA==
X-Received: by 2002:a05:6000:22c4:b0:488:823d:5086 with SMTP id ffacd0b85a97d-499c096bfd5mr530611f8f.0.1794347747383;
        Tue, 10 Nov 2026 13:55:47 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835d2c05dsm7160201f8f.25.2026.11.10.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:46 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Tue, 10 Nov 2026 22:54:26 +0100
Message-ID: <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BVhRr6erYdr3wFkjbzEJs89tzl+sRAbty1vb11mdCc8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KVWt+3x735zZE7d3XsVM+Ir1QvYkRsw/GQV AkuwK9+YrKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSlQAKCRCPgPtYfRL+ TsCYB/wKlHgDWs9WbgfoPzex63S+2tugmXVK7KqaQrfxk+uogoRgx22NJCTuQEza5JqZNvFsSs0 twOEXeOfgMREGY4+lHrUyYjk7kC0P4zIhVYdO835/BF9lK1Pdc3PMKVkwdnujeRur1xT5BCwfdk mtghQTqpD6Cb0GDwB/4n4QwirZZGZAsccX6I3WrkOuvibweAhGBy96Vf8U0e1WKnNl37Ou2m4/K Zbl5MJiV13Dvajw2inFrhe0wwMSC0kpa4ImetQsXmxRV00fR8NnvYNncgOZxckNxwfu39q7tXB4 pk2tgDKioZu9PFekQy7YjE0QtRZvqBa1SoD/LDTV411HWeNo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135549_354008_7A184E0B 
X-CRM114-Status: GOOD (  16.51  )
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

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 9e8e3dcf4bce..87de35075419 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -69,10 +69,17 @@ static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 static int bcm2835_pm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm2835_pm *pm;
+	enum bcm2835_soc soc;
 	int ret;
 
 	pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
@@ -81,7 +88,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
-	pm->soc = (uintptr_t)device_get_match_data(dev);
+	soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -98,7 +105,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
+	if (pm->asb || soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index d2e17ab1dbfc..f70a810c55f7 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,18 +5,11 @@
 
 #include <linux/regmap.h>
 
-enum bcm2835_soc {
-	BCM2835_PM_SOC_BCM2835,
-	BCM2835_PM_SOC_BCM2711,
-	BCM2835_PM_SOC_BCM2712,
-};
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
-	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.56.0.rc1


