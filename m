Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WNkKk51O;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ3/fYKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DSqP+Zr9m0+4cRuXqQzsW+yKYGuSsncKqOmsGZULKn0=; b=WNkKk51O/vvEmMn35iVz3/00Qu
	/kURBgSMDghtfCGQ34krFLwGElWQcaah27jrbRF7QsYtZkjlZetpfw2eK45SweIP/uYQI9AiGUkAP
	XBSxi2t6tK5ZNbk+053oQZmmbMo+Z42mPO6Pgrm6IXaOBt0GnBcPuQfnwibS47zdoFR+qPOczxhJN
	+S2HkEbTc6Qc6f2yy83Cd1PGVcGEcxX7BhJGLmTAD8RK66la3TrAd0F5BDXL36J8K2Y3ZM7ZBbfq0
	zRDrRPkQuIqtYO7WkNNkYaUUwTqf2xPIVzvzpnfMFJ59K5tpsrP53sSarpZFQG7QvQgoinxaO32hX
	fqt2PjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZYQ-0000000DMyv-36b4;
	Thu, 26 Nov 2026 13:30:26 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZY4-0000000DMt8-3oUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:30:19 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-38190551625so13613734eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699804; x=1796304604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSqP+Zr9m0+4cRuXqQzsW+yKYGuSsncKqOmsGZULKn0=;
        b=SQ3/fYKSq+KLsxBiT5PsJ7MXTLHcecjn8v2WkKr7kiEi0ZDZ4hxltl2Nt7R1tjZrMl
         fD8BIQhyrLLb53drl/enYdZaLkmcGoGf0IqDLmvhx/WMqarDlnU+SkEWJW2MOG9giA4F
         BgVEafMlld9aVKRewFG3vTYXS1lrbRvRFoDYOwi12SxScphEOAFZ7bS93wm4r3f070uY
         P4N4fVVJEUpxjBcCHSapr9U9Bq7X++Z9hSHlhCr18goA+ig41SPgdzxNBDuOUlqiHw+z
         4QZpefv8D0QphDGM6w15ff+mGdxBlRRfKi3YwgQFVn8hsMc1b3WZVrTaRuZi1bUFKN1Q
         BbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699804; x=1796304604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSqP+Zr9m0+4cRuXqQzsW+yKYGuSsncKqOmsGZULKn0=;
        b=MtQzd0CMIuZ1H+ShI+yLmZdp3uNcEnu9sqitMh0cEcEOkgkdkeIzAat2SaU9iTFRjN
         WmW7WYAPYYBncS7n8ter0OiaXsKm9rALkxm8SZcPVWb2dEYF4PAIUtkVAugRPYebi3XP
         75oNzMDWJyyxaiF2Y0G8JyiRRl3yhPsLyzTFUBYyu1ZucYCOAa/4ZpSdANrl/ZvjYTrJ
         HZxk0RQ576JeSjS/2o7u2RVoC65pb0R9wjfyfFzwjbm+Izq7HtzmGMrIe3ttuAWhw/G/
         GV/GaYgGGAjQDXQ9/6Qqr6ra/+cWS+Qczk158jZT5lJ7PqqGunJGfvpvUbHzvVnwaHvL
         doHQ==
X-Forwarded-Encrypted: i=1; AL+hErFS60otaD7u8Ag5r15CeUUz4JO7SGUdHiEfeqn00SkdQpmRpblkivhDxvaJ5T+XmAn3C+mRue6jlEpVJA4Ps2p7@lists.infradead.org
X-Gm-Message-State: APuU4Z/BHRYVXDaZYFz6pMGjw5Q/kKtybEt5o/bapjiM107rlsZ/mzjd
	g54KYlN0AnuCev422Zlf9zSR4naO7hFdK83z1OjbHOvwRSCb/nwIGlivaMAOo2U5FQ==
X-Gm-Gg: AZFdTZcQfBmHAwD4LQ9YJVIYpviTV4YWdD3CdYKdhRuUAot9XbJsI0n2RkOOKmZ3J9V
	Ce+Vw0lY6CeVpaFT6YswfaYIb/xj0Q8Lo7wu0R1yHIkbJ/xZmOHtSI8vq8sWSv0zI/QoxwCSCP7
	AHaIli+C+Bw+KjWDCZGgAkNHuCqnW8g7Z+WTOVGyBEXOTQES1bWHUN6SyGz0j8PnXNmzNx3K7+a
	/hpdxtQrOfv6xEU1JR9l2o8N9bV2x+6I7HzmOgu2iEhO0gyPnbcoIiEjDyq6VygH2I18N5/eHlI
	N0pUlSZIvLUug7fuTd4LOH8+c8Fahrmy9hHSvH6XTlttY4X6YI5GwDwG9hA3d3IlLyVWsOeUbox
	e5Bca3tT2AhsaYMap6XxKmS5kDn9C1rcdqIMsmTfRkpeUX6QqWE8iAKKzksCJA/IZWH9fUWSdgU
	z2y7cex0qu8VvBcxcMq0B24G26Cj43b+9TEY14IzolkLKVF1bOYeq3XcTQqACLNvPeiMAne9/AG
	JWSdCUPi7Os+ubzq9bOC4f+nviu1PIm4A8SuZUwvq6NZUlregEahF7ZAiSErrZ5k7FIjQmAT+8I
	zvbV+RuznQJw3eeprtzlH+AiNynb8Q9wYBtMm2Wvw1wdE+3W8D8pOZSzU/DYkv3y3B3QFy8Qi4j
	NigFRLasGJRQv
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id 5a478bee46e88-38648c1719dmr18979641eec.37.1795699803763;
        Thu, 26 Nov 2026 05:30:03 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm71811250eec.26.2026.11.26.05.30.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:30:03 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] coresight: tpdm: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 21:29:57 +0800
Message-ID: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053004_997574_2F391C6D 
X-CRM114-Status: GOOD (  14.31  )
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

coresight_get_platform_data() takes a reference on the fwnode of each
output connection's destination. These references are not devres
managed; the core drops them in coresight_release_platform_data(),
called by coresight_register() on failure and by coresight_unregister().
tpdm_probe() gets the platform data first and then returns directly
when the drvdata allocation, the MMIO mapping, the dataset setup or the
device name allocation fails, so these references are leaked. The nodes
come from the base DT, so this only leaves their refcounts unbalanced
unless they are dynamically allocated.

Get the platform data just before coresight_register(), after the other
steps that can fail, as the funnel, replicator and TMC drivers already
do. Nothing before that point uses it.

Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_CORESIGHT=m, CONFIG_CORESIGHT_TPDM=m, CONFIG_COMPILE_TEST=y; baseline and patched coresight-tpdm.o, no new warnings.
No hardware or runtime test was performed.
The paths need an allocation failure, an MMIO region already claimed, or a dataset setup failure in tpdm_probe() after the output connections were parsed.

 drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 102b8b7edf87..07e19c1a94b6 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1404,11 +1404,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	int ret;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	dev->platform_data = pdata;
-
 	/* driver data*/
 	drvdata = devm_kzalloc_obj(dev, *drvdata);
 	if (!drvdata)
@@ -1444,6 +1439,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.name = coresight_alloc_device_name("tpdm", dev);
 	if (!desc.name)
 		return -ENOMEM;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	dev->platform_data = pdata;
+
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
 	desc.ops = &tpdm_cs_ops;

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

