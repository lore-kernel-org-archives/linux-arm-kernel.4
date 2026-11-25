Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yxuX6N4U;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRBkmTDV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=; b=yxuX6N4UFmTBRc
	+YdMwcPomnLLGFSYZ5qQOz1Lscvey/P9lr/qRhy7DdFYPqUMfT0wBwnC4WMcIXY8fXeFFGlsOnrPI
	Rsy0bi4SYeQmPehdH54TJLpocPx/Pj5M76+oYn4klTCLjHMF5o8M5QqajsmTLhRSEAd5fjrQNN1wa
	9Tx2l7z8PBBt1UZ6A4EsZ4mxYBRRxFC7W9wbaQQb5T8EVDXTjfjzIBhT7KrKewnW42AIny88mFOxw
	3jxMWQgey2Q6RigWK5dONkKwKERHpXfbhatcXfF1pAYsqpUHeoYg0hkfD00RGOH3mwP+xa1bUJ5G/
	Wg9FOpUPTNXdmsVcdcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Ju-00000008qYZ-11kU;
	Wed, 25 Nov 2026 07:21:34 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JU-00000008qOl-0s03
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:09 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7141012c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591267; x=1796196067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
        b=yRBkmTDVpaW7I2hP6H5ePnsuOWvd1FJPa6VE0UwYIxP9GNmOl6389EAiun07HmM68Q
         cky9ka2PIme6tIgqlor8v3spz/pDyIqGcqStnva0F0RogMXMh6nb2rzP8Qo0v5RWkKMW
         uAzNInHCBdm6hpln1p5nk9uuVkq7ztcjUNwbH3xxnPmGDWWUKtvt838U7vV6BvnD3sYP
         p4v/R93sj+JvxdBdPFuWeV91uq5N5YiEPf2Khmufvuni15PMktdZEzqgau5R80sXXZ9s
         t734w+RlebFnkfkgAF2bKcG8f7Ahqv5E2RXtGjJSl1VIs55vrhAU0KS0fNiBhMj+Z40l
         nTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591267; x=1796196067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
        b=yMOtWIA5dF4s6TBrztNwvHWxPAcVstICwR8oYTHyz8ctQneaVR2XW3ZT5EDADZBFpT
         WAcezfevTuX46h2yi4nVxn074Zm8FDir8S6rtRlkQ+bX2eSxvlQgKe3VFJk7LpjMsTbB
         HbTWTN8CPevaoIXtjN9tNnYk/UNKBBSehmhbg72KVdzRI3ya3/WvWN3bbxlfs7SDXwiM
         kHLpA1O1l5Yl6Mg32BKp5eYpKi9FS6UQRydWU0skeDAJK2q/SY1XmN21df+bpy0wxwjt
         6IfDYcoLquGroXLwKbw82WQlX7ujs9JwbQ9pzqq/xBnMqk9OzNeBWQpyQ/ed7ZCsSisP
         71FA==
X-Forwarded-Encrypted: i=1; AL+hErEZWORQh21Rx9KW8+w+pJ8fH2O7BiRJjKmn0zdPPM5ILorePCnDb2R+3DXwU0EQnqBANHnNYJlYW9/w5A9lx6FL@lists.infradead.org
X-Gm-Message-State: APuU4Z8qLSb7DFLZwzVQG5crO2mgIuokP3L3aP2kbK1OR2WEbKPEp7rn
	lLUSapDUanGo+GA6Cei8/wBcZwjgme1baidTtgDfZgt3OlgmzTBElzpS
X-Gm-Gg: AZFdTZcEjIYQT05HlAs083EfpAXryeZeEEErCCAhMikfOgwNPpKPnu7l+yt0hogF22h
	w6luLynrnD1hC96ju72cLgpNHXGdIkxjb+8Ve5sdxk/Xy0yvtlb4YrF1nwMRvB6+W8OO2GAJdMF
	xV9NPHBOqaE3jM6IMMouxl4KI3pQIyAZW71ZVSadB0HhFUzCQvg4Lc6IDL+uqQAOsmYH533gNW5
	ll1lgo0U7VAvXX5K5SH34scWTuL6bDXdj48AxhDOrpt5URuYKgOiCzPEOUbaE3LHsCmPSVXMIZ+
	lDFXLkbiBTi/1lEIE0e7S4GhpqDcIk/LajtI2e4P2wJ9/Vy1Rx2fHwTrEZE/YPUJ4ntf7KjPXBZ
	ApEBrlJZV52ar7H2+jnF1FQnDOZTYpIv6kQY1hnwkBo2O88xDDSVXwpDAcnQXuBArGuTrq9sVts
	p5ivC+/x3OfizLzc9t51s5Ce1UPNaj1AkEDW2/T2PC9vXsQsVttiKzZdrKPlcW9I50aSsBeOmwU
	PLdsaG65GY88vOsNO1SvLejmBeCDIZjBtJRuA4gO3Cpg3KqaGFzlMl/9d8XK9fZrtG6J7+eDUuw
	5l/w68f47sI4U8t5w6+a5iAGHj10z4nd9PEaGuvWnue4Gi81CKc2F9JXThpw2dLF
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr17934967eec.33.1795591267072;
        Tue, 24 Nov 2026 23:21:07 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:06 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 10/12] rtc: pcf8523: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:24 +0900
Message-Id: <20261125072026.2997493-11-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232108_258782_F9202202 
X-CRM114-Status: GOOD (  13.48  )
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

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 13e37b7fb75d ("rtc: pcf8523: add alarm support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-pcf8523.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index bbd42358a..df70a374e 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -484,12 +484,12 @@ static int pcf8523_probe(struct i2c_client *client)
 		if (err)
 			return err;
 
-		dev_pm_set_wake_irq(&client->dev, client->irq);
+		devm_pm_set_wake_irq(&client->dev, client->irq);
 	}
 
 	wakeup_source = of_property_read_bool(client->dev.of_node, "wakeup-source");
 	if (client->irq > 0 || wakeup_source)
-		device_init_wakeup(&client->dev, true);
+		devm_device_init_wakeup(&client->dev);
 
 	return devm_rtc_register_device(rtc);
 }
-- 
2.43.0


