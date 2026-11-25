Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC1B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pm1Ecec1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSsMP4JF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=; b=pm1Ecec1TST1OT
	EpbNib0N0n8svtMolo0rkRpUqlXez7IH5EiOZihEUH8npAk2OVEfDwh46+qGX2o5dn+gggbwFpQq9
	WwWQbwF9M1EYrMceh1xNgjoKs9tRWtlniO90bChkhUIxb9Ir/bekXnXeK2wl0OA7y/ZKhByOlVjoh
	msQX4E7T8w8bsr1/U9XDgNBjTjLlU2kVSfy4v4k02UEQDH2V1WxBUM4acybe1dkcsxE4pUdOcz3dw
	BTbVOlOMZTlYwGuT30A39jmDNILbsUXyXXdS14BYpaG0Wv5kVc5Ib27MJxmukB/SIoN/c8+d4wti5
	Pbk7UEwu4gHsWJD0g+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Jt-00000008qXm-3YrW;
	Wed, 25 Nov 2026 07:21:33 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JJ-00000008qFO-1D2D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:59 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-38699cf08dfso6316342eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591256; x=1796196056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
        b=FSsMP4JFVV3R4r3gunHme/SbFPZn240xDP3jemfRe1ia0Jk1zKgiK8diWVHiQUKULF
         I7xn1nVWPwpSnrZe0XytaXH42DeJFWzgqQ3dB89RJS5O9jywCk7vA7lRPK+7CpcQcUQv
         4KYMY3fPG6hUwsfz46kf5YGOQnQFSvKmHSOkt7hT4+XpQFSDwQv86UZRl32lu0xRvgMK
         2kMunmIzFzrOIH/vRe5FEHg5C/UnA6V0OdeaZxJbMPAgqAhhNfBDfSkxJn08ry8jMnQK
         gdwQvw5W7q/eSQOFeS3G0My6H9P5fcbtUUjMKDOh6jvZ2j5a10U8SkXr5/1gTwgXXKLL
         xQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591256; x=1796196056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS57S4IRnHol3XR4gXWGEuCh4B3ziPP7sFo4bO43kVs=;
        b=Imlmn2/b7z8PvJtQsVZHw6gRBSLknc5kPbaZRnuXo4BsYugR/O8I4A8sdum2ch+xV4
         5KA6mnw6qJ6y3zXnSr/1PPppFPm0nWKHHW01e3Q4IIkLTe7+LfFBbgq0HXb12vRa78Ob
         HGH/Cjol5cGisikSauFHQae8s3tfTAxTWLY7JBkcp0eAxUpZ4+WoO2Fxzd263wxBocQS
         WQhd2hdCJHC529CVWM1KFu0apUm5rdv+DViKfJbAtXJyjSQGxAlMatcrWK2k5Z1hbjGS
         lyDBj4DPoQeJPBdKeY/tAK+FiHrjmdUzzsG4oR1yz2vfrhhgjdDfBFtSqRriy5Poa8oU
         +gMA==
X-Forwarded-Encrypted: i=1; AL+hErGyXuFYApFpTVhcUW4Iu1/lUb2EOy5+7QPkDYEjdQ0KLzfi2W+n0m36t8ew01CtZY8qDJbqrL8XuHt4xS2dANaR@lists.infradead.org
X-Gm-Message-State: APuU4Z/SNz6EfcoVt033cfjw1NsZj7CWGehZcMXt6HSroOB/YqHOKMaW
	LHRJ0N10xxLP7JEpR/Yo6Z434On5A4odI7OsnlhHFHQEilf6RLA7bkad
X-Gm-Gg: AZFdTZdVOZ9X3SvSvOUYKaknLtvwhMJr3NGolEzz1UCnUC1S6NdR4PJIrstL4+G50R2
	xHkkWrtuBudqzDdCbahc1/aecVfWHq6JZPl+ftXb5wgBpghVjFcFIN8C4+vws+Xf6x0iSziPmvp
	bzCZuoAVHc0wySqGVQxUDlHDq8hlcMx5uH+hR1Tprv7rK3rbuBDS4LVtTgpvE1lKYCcb5IAGtO4
	BCL8LrJljnBtc8J7mHQmBWgPEihBRqCFnoZIyFKQW5cqbp1VjodYauVtcUhLzFVTXwqPXzUt9Ps
	IJkMbnORkyWy4/weFc15d3vt8o2ZmHqOxKeK6IkPbVKNJnHC+El3SOnfJsQh0C2eehpELoSrID6
	o4eCVVMssXzwrhPg1rl9YO3e31kPTz7VAPO3SGiK6n+mgs3fi6B4haX3Rg1sZLKsAszoZ8kvT2a
	/EzkEVmUEsdjmcOuv+z23nuZYuaphRJgYhdoyNDZlcQyQiC11czJc7rKtLEn2Tlw+Tmw0XlaZBg
	+pbYxmMOL3RluCVrgeGW1HzO8tXDGacD8B1kGuJ4QjaGNo8zlHuO9QrgFienqjO69RZX8YovK3l
	5WTIH+qK3I9xvcEGzP/KQHiKXDCidHTPIm69XO38kGu82mvRe03TOfHkMKdtM/rF
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id 5a478bee46e88-386a3fe48d9mr12442112eec.4.1795591256101;
        Tue, 24 Nov 2026 23:20:56 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:55 -0800 (PST)
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
Subject: [PATCH 06/12] rtc: da9063: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:20 +0900
Message-Id: <20261125072026.2997493-7-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232057_908348_844A66FB 
X-CRM114-Status: GOOD (  14.80  )
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
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver warns that it failed to set the wake IRQ.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: ed17a2bcbb75 ("rtc: da9063: Mark the alarm IRQ as a wake IRQ")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-da9063.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index b56b9d9cb..2bb32156d 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -466,13 +466,13 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 				"Failed to request ALARM IRQ %d: %d\n",
 				irq_alarm, ret);
 
-		ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
+		ret = devm_pm_set_wake_irq(&pdev->dev, irq_alarm);
 		if (ret)
 			dev_warn(&pdev->dev,
 				 "Failed to set IRQ %d as a wake IRQ: %d\n",
 				 irq_alarm, ret);
 
-		device_init_wakeup(&pdev->dev, true);
+		devm_device_init_wakeup(&pdev->dev);
 	}  else if (irq_alarm != -ENXIO) {
 		return irq_alarm;
 	} else {
-- 
2.43.0


