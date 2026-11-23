Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C14606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H3MsR6nJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsotbfrG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JNW9jAUBmXvkOgGI+ui/EiNQfjcu4cOJrlbko1e1Y0A=; b=H3MsR6nJxKGIq+
	SzylER+tlQ/SP3Arcl5kMqMMJQSo6Dawo7AY0aixE3OO5Im9Btql0fbeLPaz48hPajRRzEpbTwUoB
	NZyqOWXij3k47Y8SlU4ITeoE/DwOxifqYT1SK9EZt9iVMxriCeahu+XZw0Z45eM3jKAFF+/GUkPRh
	FEa2MFZ8HkntuJsXDo7g6YM2fY0AXk6AwKUSKjF9YLvCaLJ+fQ5PshKr2aoNaB5hQitFzgbE/u+zH
	mlhti4mP7WFINmdY9RV1XrSqj6xkLodUgMUcbup85Z8tDkkTgm0y/E0dVQA1mHv4RlfH5xzlGy7Q/
	+8MPjZV2t8i3hX5L3xHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaEQ-00000004mWc-3lwI;
	Mon, 23 Nov 2026 20:01:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaE0-00000004mQJ-0dFN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:01:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97C17624D2;
	Mon, 23 Nov 2026 20:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFDE1F000D0;
	Mon, 23 Nov 2026 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464075;
	bh=JNW9jAUBmXvkOgGI+ui/EiNQfjcu4cOJrlbko1e1Y0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dsotbfrGeOlzM3LXOZvq1dVrlbv5kwj3v85bUIAAIMeo+wzSth6qdDRqmpFlY/oug
	 UggUto/JhbjRG2UgcvsyhhCTbVUJrFobLH4eXANobdoA0wZSdtrPU02P0nAJSyzE2J
	 Woej5Mi+nenM6kse0X0MWzGH0kRBJdf6DXjG2mMb/N/2AgReT5QPaYViN4Gou+pweB
	 neGUbC2VCcUZBIVTWzBZVq4TsZDC/ZVkr2oK2jGR8hJK9WHCDt5XYed4zTvfQwN2zR
	 CkoT89q9DI/KM2ESiAZEOGVY0x+HnPt1YZVnupjz7F358vrWGRalBGWvxrwVaJMOuA
	 ETPH8ESNo7S5Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Hartley <peter.hartley@sigmatel.com>,
	dmitry pervushin <dpervushin@embeddedalley.com>,
	Wolfram Sang <kernel@pengutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Wim Van Sebroeck <wim@iguana.be>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 07/10] rtc: stmp3xxx: unregister child watchdog platform device on unbind
Date: Mon, 23 Nov 2026 19:59:18 +0000
Message-ID: <20261123200012.502284-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123200012.502284-1-lee@kernel.org>
References: <20261123200012.502284-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

stmp3xxx_wdt_register() creates and registers the child
"stmp3xxx_rtc_wdt" platform device without tracking or unregistering it
when the parent RTC driver unbinds, and also assigns static wdt_pdata
directly to dev.platform_data where platform_device_release() passes it
to kfree().  After unbind, devres unmaps rtc_data->io and frees
rtc_data while the parent drvdata is cleared, so subsequent watchdog
operations or reboot notifications invoking stmp3xxx_wdt_set_timeout()
dereference torn-down parent state.

Register the child platform device via platform_device_register_data()
so its platform data is heap-allocated, and tie
platform_device_unregister() to the parent device with
devm_add_action_or_reset() so the watchdog device is torn down before
parent resources are released.

Fixes: 1a71fb84fda6 ("rtc: stmp3xxx: add wdt-accessor function")
Closes: https://sashiko.dev/#/bug/linux-4ddbfe9c-a03c-4a01-a3ce-357545121630
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/rtc/rtc-stmp3xxx.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index d79e282e3817..a5281b519540 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -92,24 +92,29 @@ static void stmp3xxx_wdt_set_timeout(struct device *dev, u32 timeout)
 	}
 }
 
-static struct stmp3xxx_wdt_pdata wdt_pdata = {
+static const struct stmp3xxx_wdt_pdata wdt_pdata = {
 	.wdt_set_timeout = stmp3xxx_wdt_set_timeout,
 };
 
+static void stmp3xxx_wdt_unregister(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static void stmp3xxx_wdt_register(struct platform_device *rtc_pdev)
 {
-	int rc = -1;
-	struct platform_device *wdt_pdev =
-		platform_device_alloc("stmp3xxx_rtc_wdt", rtc_pdev->id);
-
-	if (wdt_pdev) {
-		wdt_pdev->dev.parent = &rtc_pdev->dev;
-		wdt_pdev->dev.platform_data = &wdt_pdata;
-		rc = platform_device_add(wdt_pdev);
-		if (rc)
-			platform_device_put(wdt_pdev);
-	}
+	struct platform_device *wdt_pdev;
+	int rc;
 
+	wdt_pdev = platform_device_register_data(&rtc_pdev->dev,
+						 "stmp3xxx_rtc_wdt",
+						 rtc_pdev->id, &wdt_pdata,
+						 sizeof(wdt_pdata));
+	rc = PTR_ERR_OR_ZERO(wdt_pdev);
+	if (!rc)
+		rc = devm_add_action_or_reset(&rtc_pdev->dev,
+					      stmp3xxx_wdt_unregister,
+					      wdt_pdev);
 	if (rc)
 		dev_err(&rtc_pdev->dev,
 			"failed to register stmp3xxx_rtc_wdt\n");
-- 
2.56.1.750.gf70dc682cf-goog


