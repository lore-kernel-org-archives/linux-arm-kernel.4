Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D84606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PE7uM2YD;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jX+T78FG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=; b=PE7uM2YD8ZNiX9
	oqjC9CwTFpP30URI1OIiIRkU2VF3UUpOD74wzAYBYV/Vyiz1RyMGupoIGomWmM3E7rSIByaADExEG
	k9nQrXz9nhArNmphlCZRm4pUBe4y2SEgRapaHcUeWeh6rrQozLUNPh5fQr3F/eFkr+DL6Ig5UQ+KG
	2jpjhQXVy2ZOd39lgqDvZ8dZmWU6erVMmllvEgAANndeUd3IpQJcNGu2D/fzr3sUATGbWoV1OSrOJ
	0NAu4jq8OoSIPq6yP3/LRb50OFt1emDVraVIc12gxTrJNzhZKV6G0vKGL+BcKOw7/SfCL8gDQvo04
	tyAFfIiazZ5nwmQw6iwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4p-000000036r6-3lET;
	Mon, 23 Nov 2026 11:19:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4b-000000036bN-1M19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso28889315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432739; x=1796037539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
        b=jX+T78FGiswDnd4T2Myw1wdzCPoYrYD/QPMLRyA4JMqthxN18srFqkEWYcsm7hRfa1
         dO4CnU55WSf/bDXcl2t5JJ2RJON0a2I8Tf/9v+nrdq7ZYlGHujZA/iNuhjHETLf27W17
         UCiSHfOkh2Ed1WH+l1k5MM2ndn4BbwuMi96DMJiQ18KwxZqn4htcxUhSiMj9v+qfw0x3
         FeAEdkVfFgaCEkp9Cw4Ff+XT05YijALCgeeaAtDaWPPaDsF8OeykakigkBFz795eblsv
         tGldqXtMqt7taUGmBVc2NBSZ9zKKJhNC2/B8UOOm0B96W9HT7hYg5fJj/k4Nm3fV/y73
         4v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432739; x=1796037539;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
        b=EcaXXb7r6TvzCOsxdrk/OGMihTtLMsYEQk+UKjsx9k+xNydE4HZiK6BYoCXKOzNHjy
         vTz/+V8ae7CqCVW0UDYMGSj9OWUQWEywyp6h5LtYlTC3gg8wnC7ftPScsWH3KKor+oip
         kNSyJ4MerHf5YYLB6tJvImQwCeUQoD67QS5cXIRRE25j4sfEUfa4MihvHjeZMWCqTv5R
         cwUkOExnwPGTemNYu9Q9wPkf9SgUeKi2ieAWLjYRm6hgtFJ5xpSGEwB+O0i3iB/EBgy9
         L0EbGtcMMjX+wSOFHiK2s1+kupXvimU9SIlPW48zYxlmKFk8erRbAWSQMmUV3Pl4f39C
         u9bA==
X-Forwarded-Encrypted: i=1; AL+hErHBRc3jvixxtHmZ+kHocY9iKYxuumkWzsUfS0hOXb/dSUiFaArg4iFHfYbKGs8pGawH7zIOtCKSr4HkOkTq2q3s@lists.infradead.org
X-Gm-Message-State: APuU4Z/hBvFO/+b/ItaUTcUsu8Qhq7OFlMQvjVUfgqeJdfDytACPv30a
	3ReeDEKJ9uUxZDxiXcgaljFZg6NcdShJnLNYVb5xX8AUfQMyBX/xRvspknS1VosbFMM=
X-Gm-Gg: AZFdTZdYt3KhpOkq/ByhR/afCSi9fJMn6HGmMoX4aGbJZ+bT5L+qRb3JiMomFJADpJy
	WEW7CmFvEkvgcy/5sevRhG2KbFnaMYAANKwwJ/+3lEF8Snpl+jCg4ha9+hLuhXR9eJvTe/rB0sg
	Xb1tnML6l3ZnUR5oKThSxD4SpveYHK3YR0cqYbdHCakRV639XgA3vpiEX54TxZj68s6hwj2J84z
	atMdL+OJ7x09KuNodefXDnz/KZBK4gI+oujUG4DLGv2QOD5DjqJpolukzSTi6MARQVFTE2h4SjE
	qxpzGz+X1udGSlEEuVrvuxujxJUEfNqhwM0pQ7zK3oypb84NaENVAi7KQoBtewwxQVsaWDNA+La
	HMfZWplVVB7NiFiL6i3CABKN5ujiDFaN7mTbc7jM4lVXTBOHnnTWy1TdOpr6bPOsc9NuI5qSAL7
	jjjeIhr7Qc53fzv6N5HYQYNMGq2CcVnABK3zKg7jcCRCMFwDnS9pJdtB79gX+lbfv1H0MWUxfwt
	bCa9cu9Qb+IFQU3VG89LwFklUbjZGXUwBrhf6JfJhMPEq3kFyIOqMKIuNX9GRyzeouiduMRB8UR
	mqO6gwi/1pZMfq/kAxicT+bOzPiBsJ8a2nU3TzqaC1KBEXnH6EYxr6N5I+j/hAOaAyKGYsMOwho
	Ws8wRyjRRhHLJ5fQg
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr221401195e9.6.1795432739420;
        Mon, 23 Nov 2026 03:18:59 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb85399e2esm393577795e9.7.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:18:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 01/17] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Mon, 23 Nov 2026 12:17:59 +0100
Message-ID: <eb63d4f97f6ca7b02843ae7f847e05f638da7244.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=exzuZn6/A2flHssSAn+wVJWquiw1+beBF6wV3QD1uzg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDpWobcWgfJETkKzicHPb9yb1Q1GEbAd3fRS P06FmSW3syJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg6QAKCRCPgPtYfRL+ TqnRCACB34VmkH/Zrf4kcZRTb8jyWXVRlaCXFu9f9mPWr4O6yveUz5kyugfZc3cc6JKYSC8vT9M h6MbSNuPXyVYUUJjlfyqfnF1pRoQ8FfnOZmfxZI+nkx03Kmw58dG19VasOBEvWJD0WkluRQgYiO MtH4WUtCqLkeMhZYh7GC6xhdAKG0F0FHALVNvjHkpo6UyyLBnlAIK+U0VS3kgXZS5tsHdrCuE/2 iwH5uL2w3Hqh4F0/jCuAn+vG01VkNGmISzwXdH0emgTbs6DYBGBNif/mLlcXhAmzlYp97yMNJB4 2TeYN7/s/DXqGRTGr3IE6+cxSTfuGBgIp/4zArY6PUnkZtXb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031901_378145_B64812A8 
X-CRM114-Status: GOOD (  15.60  )
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

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

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
index 14b18dc38058..f21d5689561a 100644
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
 
 	pm = devm_kzalloc_obj(dev, *pm);
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
2.47.3


