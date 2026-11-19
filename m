Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8888606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IpyMFDz6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XEKYy7xH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=; b=IpyMFDz617Eijz
	gpbmdRWx62sCXyurCWPl6K3nq9vOi+foeXbRxeDqyFYvCysRxU4gIEzARglsFQ/dfr2p9CD6mpAsQ
	2ZQ7BJ2jRxTBrw/g8FGCTsTviWOvE+lu/o40ieDIbwvqesJjmVqEDCaYvKpSVqzU8Twp3Jz9Sk7Du
	lnkVSqgBbZrFiMFBxuWC6UwR4PebgjwMYZmyD05QFkj9fYGKiUF6Mbg6tB8f6FIkwnn038OD7hFwL
	p6kA/mZVLYvTK8DmYFCYFdJYGgBo8T59xs6VsDeblImq0nhmu9/ZJMHr7gLApHStyc2s+FA+MMw6T
	WL/yRRsG5SLWheB8UrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8EW-0000000DHzO-1X14;
	Thu, 19 Nov 2026 19:55:48 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8EL-0000000DHtU-1SMz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:55:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so56037f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118135; x=1795722935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=XEKYy7xHejUoniEwvVJjbL9HLpUx17PbAUxmWe9apP5DKhtGHeUDgDNzlJRl+yf80P
         zEGUFCpYD3I56qhhp0FGBgiGxtLXRextEUqMvEEmDxmZSjmWi81gQsezparixzSq9KR8
         mMJI2aT4ugoLS5nknf6B9mLJxAD6RoVnleKBpIXH0fIOXbyhafb3hGH5w38N4oGcHMxq
         snEmlgG+E2fQegFEwiofwpcA1g1GPFIU186w2bbAK1K0vZJQNtk1YV9alm7pCVGbRqiG
         IXI/IIomuxhouoAwXxhqrGW2L0j7EGncom5kkp1pTyGRAvFmplNgdSEalDTR5g7ACjB4
         EQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118135; x=1795722935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=UFuJFzuP9QvC1O0tjwzhllLKngPYyTRuQ3sqGXqy8BWAr/NiR99g703x4nz4Ng1foO
         JPo/WhIHm/jCnhFDtWbrFGyJdBj6kEDD/ZHucHiaNiDL1ITFEswPptDDRsVwilVzbShF
         1fUZzWZAT/en1yXkw0i5QGNjw4WakyONKcW4oVdTkS15pzrtu9gGhEnQtyY7FVlv0CGN
         Uq8/jhW6gGH8o86RRAObDfDGrB/G0h5mbk4UU193C3HDu9mZpycPOH73mX93f0Jy8ZvJ
         N+k1GGEbyMKjf7gFhjf0o0mW143Cp7C4n31789/dT8KsakxLfP0pEiYDQgsEhAtdJZhE
         iqfQ==
X-Forwarded-Encrypted: i=1; AL+hErG5obzs1NWOrJAEwxnA5aCpodbXNobythLiPjtHPiaHuEbim4J84kc7cg95gv7zT3oZRGZZ8TKP7VmH7W8KgzbY@lists.infradead.org
X-Gm-Message-State: APuU4Z9O0kUXq7CyWr4xjiqno0s8wdP80mX7gpDWhC+Rq7bmA+G12di6
	QptiXhpDyBIEsXy/CoRy5+MNvn1Ub7f7j2jy3f2DKKERj2YVgkA4lO3E
X-Gm-Gg: AZFdTZcg3yw289jzcpRps+Q83BkOg91Xsl8TFdcrr39YEJ/ZqEEtLhsknbYmxwzqtPU
	J54Ji8MbVfNk1D6U01Wt8fGIf/3t16vXuDJArY64wJlF4jv0oLUF4Tr7zN/7STrwdvhFk/dinz3
	HiizDgPXAzD9TTMMWjXWrj2hwpAy///WlTeUwdfMxdl09KoSO4zESWONvS4miaK6qhLmqZWhBeU
	H89DCxh8x7uSiHFvjfokwvYV2inv77lL25RV7KvLB+Eu3tie3Bj5hGDXy4/6JPYzCPpOhezmjop
	4IDqIWjBXz2zjE465bQHimK8k0rxZu+auaiNcpP9a+33F/jHsUBK4mToG6tsv5Fi3H0meXcZzrc
	JTj10GtvE0pIfWNUJAIq+yy7NqTf51abVbEbFahI/eDD1YB9FR/diBKTiBI9G1tifiPIrzb4rTH
	Vk++NDtNuEbfMcZzsjfPBYGeT2KrqAftgZNIft8B13m/7XPEmLAuHJJhIsSawirsK2BqCfTdqrE
	iHAVa7HfK1kSybc22MVNWpLOnVA7xMq579/TSxeAts/EoXP03dxsMmBJAq9zKCVEww4eOD8is17
	oWMpiFG3+35P3p1y+iG1xQCAzmLrZJEE2X6kzaGOlmSMmzSYqe8XTcSvqUUUF0VJDZ3YOjLl5Qa
	PiiKSOzuKNGAL/ZM=
X-Received: by 2002:a05:6000:186e:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-4abb225ebacmr959607f8f.25.1795118135348;
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:55:31 +0100
Subject: [PATCH v4 2/2] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-hwmon-da9091-v4-2-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1hSNXDBZPA8BDKMuebBK+XYMMCVqHzsEva
 /o+P2IReHGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z9geD/0X0ve2bjnBdQk+E5KD5v8e5ClnFtyUX0zNo1Vy1ASx7d+hZGYSZl3S6mrafmpH8PZ9i9c
 ZOnN+f12gku/0Rhd71Acwatt582FJh3m05WnP1WheUOYRvoK0i9dnq/DwqxQluxQ+DxmVaVA7ok
 /xwTa7RTWR5CsphiAWErORUkwGoBqCI17ehfS93G93VV4sk29ikcTh6Ln7S5kBvmY0jyA7k38DR
 160GuhLuZeRwstADN0uNRc94EUUp5mJ6083fCJtYYKiFg+LCdq+6c05J4+u64i9Tbi51cWCVU+9
 3eaGym/X9MjkJGwamT/D51h2vhZsu1Jg2yxUwtZqr2s7J2qbAoE5qij/LahYeeg5EgoQZatQEL4
 j4vneI9qwgBLbmJfT6j4+z7B/Dt4elLYNFYkpUxCkxucmP4J9lnRNNYVJ7jodpnVTB0t5vg/hzk
 QVCz5pBZE2n2K90VyJqqrdue55VXYvEiCTkefeeJmTl1khz118oH9hDUo7fkMuNuFA5oQG6/guf
 qnbmdeumiaS0qyGylJeHOCylE8qgbLy3CZTn3KBHFeUEpRxQ1oYLLxlsx3uQp+2nfVjcFUQzOVI
 9TGMT1Rdf2yRzmW0lFm4ilpppSv4AOwcMUmpLyydPLQkLjKyQdzoKMEIQQwol2ZbH2nYpHiGVWz
 rBTXExGi0YTV0VQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_115537_443869_7B1CBC5D 
X-CRM114-Status: GOOD (  15.18  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Register the raspberrypi-pmic-hwmon platform device
on BCM2712-based Raspberry Pi 5 systems,
including the BCM2712 D0 revision.

Store the registered device in the firmware state
and unregister it during driver removal
to ensure proper resource cleanup.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 68512224e3ce..a694ecc18f9c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -34,6 +34,7 @@ struct rpi_firmware {
 
 	struct platform_device *hwmon_dev;
 	struct platform_device *clk_dev;
+	struct platform_device *pmic_dev;
 	struct platform_device *rtc_dev;
 };
 
@@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	fw->clk_dev = pdev;
 }
 
+static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	struct platform_device *pdev;
+
+	/* Only present on Pi 5 (bcm2712) */
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-pmic-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return;
+
+	fw->pmic_dev = pdev;
+}
+
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
@@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev, fw);
+	rpi_register_pmic_driver(dev, fw);
 	rpi_register_rtc_driver(dev, fw);
 	rpi_register_reboot_mode(dev, fw);
 
@@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	fw->hwmon_dev = NULL;
 	platform_device_unregister(fw->clk_dev);
 	fw->clk_dev = NULL;
+	platform_device_unregister(fw->pmic_dev);
+	fw->pmic_dev = NULL;
 	platform_device_unregister(fw->rtc_dev);
 	fw->rtc_dev = NULL;
 

-- 
2.56.1


