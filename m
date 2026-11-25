Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20124606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vztUccaN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVAZoKaw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=; b=vztUccaNiUfbPB
	+tSCG3/+w8yz24Gk6uhuP0pdQIo24GREQUrlRCHZ83kCdR/bsKB1pwhaWHVz0M4tmi1db7Ems8Gd8
	qN4AlyeNpsv6KzefMx1V5JZq2jpx50ihxF00BoDjvP98IgScBPMmgfFIwEOvOb/Zsh28kU1Lv/8Q+
	MoxWogEmLiqgALrY/8FHaJ72j4eTDmCmXenhsCLD5aQWbBaOtcB+YypL+CfohltjXLVX/k3sN2H/S
	bEecKm5JDQ4OwipqhP9t+xAyq9hzo8MqrkUyWro+J9ni46U9qgcWdAHSCaf7yjQfjbado8jCU/cH9
	GfAHV5kx1bh3fK3OICSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Ju-00000008qYF-0ApW;
	Wed, 25 Nov 2026 07:21:34 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JO-00000008qJt-2YXC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:03 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-38190551625so10862832eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591262; x=1796196062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
        b=tVAZoKawP5AdaJfVNpktW5y+Zb2ftu23e5HH4IowjppW4/mZSD8YKufLcVC7ho+Gl/
         WCeVvg0B0HJunaYgSJDtKNcOfhApo8L2vxMUQIZMXbuIxGzZhX5gIsVpPRE2d2cLeaAR
         cYq59QDbgBXSAyo3VEsAr9Qw2aSoLyILqjwkD/OIRRa6jzy3mpBDYV1WngSLCOiN/iV5
         EJ3vyUqSJkBl+ErMo2GqmYb43bp8CZviymgMqqZ+WC76zsodubjMKL6Yx6ys/u2KH69T
         Y+IDByVH/gz+cVk87kNYWVBKaEBbsgwNlrQm528VKMlFlcUh9p4iH1bFnTSfvxkNoYkw
         kw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591262; x=1796196062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
        b=bgw+HQIIfDvbs65dn9NDPyQd8wruF6XPPbOSi89Xo9OHddv1BYQ6n5g3yjWO03mhuH
         hC6A64Q41S6mGwwHdMO3AEZwqxUsu6e8wGoTcyal0Yh5BoD/lFm00RMWJ5yk50eh1//g
         DDGu0lP78oQNNi0HMG6g8tSvD8S6H5U/AlYMp5dFL5chUjE1uTE+BvlFimZGkNiellAm
         U5ZjsCfyqNmuQgv/WYHQ6eR0gxHFromX4wjHMIMyttOLPIAbUK9hSsePjWfk7hh5HM/4
         TlTAv/hxH8UVv5ARsU7onWF8/EjBRI8uPlp151iej8IeqQ2z2IPyDWW7jeHHNIJPdj59
         NvOw==
X-Forwarded-Encrypted: i=1; AL+hErExcO6QX3UQ1IFhqIvFC2iD9qw0lxuJR6DqvTcf+ID00YlxZCoH9QGVw+yADlnEUo/eb3gRgv6OXbtK0UKRom6y@lists.infradead.org
X-Gm-Message-State: APuU4Z/gSdgbB2thzn7HawiS/xOmiHvtxcEbiQ7W+Oh/fCEstaLmB+hA
	kWCLeIzK0DebOEvn3n2fOSvWeB4YY/wcYWXLkqd17RDO6kzaBrWOu4nZ
X-Gm-Gg: AZFdTZdTURzEStNEDpWC6RgQHy4yJXMjTqUlRwl1ZVl9Khe9piNzVIyCiEY7rk4X00Q
	3ItNh1z5zdxqVjMtP58FC/idWHPfs5Nm5qC0/sJpxaH4bV6CwrGiN8ZpEmdEgrIbDc2fPLJcuqd
	TZ9INNNCQyZZYgrgmSRSwd2WZpPC3ed7V3uUGIuusQFPXeB1QC1wyK0acZ2EZEdpuGykEdb7lot
	h3pur+EbHNZEv9firlIrprHnlttTvC/hjSvI80Lss2GMJHHxt9WtJbvGmWvP9ypSbfwzP20oN8c
	gaPBRErUaNdw6cx+bpMoYVqgX0NNp7OKUcd7mE29QAT6CPEFrpyUsVk2gWA4HY67pD03ITd05nO
	r0XevX5EJwcO5ASzf9kFfe2SlqtYI6UBCCDkRYbJGVKCglPALDbqn1i6CidmE9omjeYy2Xbcrrk
	LL23DOwNpeARF2P2B2jicAnP3nV/ZUlM1TGINdq6+n7avtIg3mgGRWj5RFWLyrz8LCbJeYTk+8N
	yQeoMAA++2XhQzmxo6i1oJErxpunxiN7FAHraIFE6Ozw9EYQgodWL4QD30Ae7djK/W/NogTrOdB
	PSC8RMc4gFWQ6xE9+Hc5gHQOIL137lNaV7S5CEUIsFFdRk2AHxZiQL5CTdytYRrvWqR8KU3l7vz
	voYlMtutmMQ==
X-Received: by 2002:a05:7300:f68e:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-3857015357fmr17092295eec.25.1795591261375;
        Tue, 24 Nov 2026 23:21:01 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:01 -0800 (PST)
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
Subject: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:22 +0900
Message-Id: <20261125072026.2997493-9-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232102_650882_83BD9D29 
X-CRM114-Status: GOOD (  13.98  )
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
IRQ, warns "wake irq already initialized" and returns -EEXIST, so probe
fails with "Failed to set wake irq" and the RTC cannot be bound again.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 3b2dc19ff9a1 ("rtc: jz4740: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-jz4740.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 32c331f3f..41501c9ed 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -367,9 +367,9 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc);
 
-	device_init_wakeup(dev, true);
+	devm_device_init_wakeup(dev);
 
-	ret = dev_pm_set_wake_irq(dev, irq);
+	ret = devm_pm_set_wake_irq(dev, irq);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set wake irq\n");
 
-- 
2.43.0


