Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AEB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d/IqwCHa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ACuynL9Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=; b=d/IqwCHaVcN35o
	jUVVCYQPsYKm980yqGgWu0uckHZn6rIqzlR9slPiMF3LI33jkdEZfzCm3EtMzeEJ1s/gkERgzSRzg
	Hu+HOrYJvMHRZ/NNiuFMXyYpR+4PyGP7ueGiAIj8Zb1wOoj68x/y5pUA2anxoLQPg99LeV1ve7VUC
	hev4M4C78HZLpTFJNNwHzq9Nz0caLKjEqDqBk/4sgINst+iCenyR4lwTATU4GmNqIeR8x2nQAQ1Fh
	M2YKOwvetjSPc6tx7xepAcm8kpcvH1RJZYZlGS9RAe5JnGRDp1rh1kBnJ00w2NV9IVbRGWWkvqxJT
	uqoMVnj6M+VUFVta0Rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Ju-00000008qZ1-2Nw2;
	Wed, 25 Nov 2026 07:21:34 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JX-00000008qQ6-0DjO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:20 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-38644aedba1so8322026eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591270; x=1796196070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
        b=ACuynL9Y1tzT1jJhXEzjj45LFHQ9ux+O/wtKJFWwgh13WzcywhDV0V4hFbUVr0xhzS
         RfPFR8/FBCYlLJF1MIGx/bcLVsoyB/XkrIkWAYwYR5/BdYlEGSl5t3HBSDPn3wWKR5/3
         MlL4YqDig5YlTOikQ+XzTeG/4JUjJmilazXeyjMo9AZOeYH4DqKuGQbXAuwN8MXpH/7z
         IasTAdrTiuWzMAeWgPJRbgk2MDgK5qKEjKTOmko8h5YQJg0Wj/R6lDQHdXtmi078Jt2Y
         iqhnUM4NRfGUEQSa7Bhtdosb4Zt44AhPJT0oz0vTjZ/5cSw2btZjXQEWMFQqDOyfJXGN
         X+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591270; x=1796196070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8GSEEYgk4hpHEtSF34GSLfYJQCwCXCGgSvUQtVjSv8=;
        b=it0MsYX+zqCL08RUFCkGjpUUI+Twqs8csJzRo51C4b6bSo6eLgP+gTx5pl28yP08ye
         yk5sfaHc+1oHfxhMTp3CkxlUkH7+ug7upUFGb+XYevYLJTAw0aEw2x1os3N4VMTrbNdu
         mfp0R2Mvm+Vsn3EmP6Zpf95A0ATF8gc+CTGVh45KvFD5MvkrFStGWm2xfy8nnDQiSZoc
         ZB4BpmIfwh26MXsMDOcLmwC1s6J3WXwvkjNDSeJEmsJYkPvUPkVISTRTJ75sxGEcufXv
         KWLpXHz3jlL310/vqsN3JxJm3UizHBk67ZlomrLIqxMNDmjAt0zak0PSOw0YIfpJ1KH7
         7Sxg==
X-Forwarded-Encrypted: i=1; AL+hErGBTKQdXu36705MRfC/bWoUhiX1+tla5CVz3BI+qMRlCBbDDLNiGkvcAx1O4I9hkSB35Rm2EZPeS2oha4TvFJzx@lists.infradead.org
X-Gm-Message-State: APuU4Z8oz996BfM/FKZEWqUv/eOoCq+QVTs8WywnxyrusoOuZhSHTstq
	KMCka/uJkQB7W0x4redBPI5CHV6gK3FkXJikzy8UM3LA78IPCw2GygXD
X-Gm-Gg: AZFdTZeGfc+qhB8xnDVJA4bOTYP95thcqoaU76jyBdtZxxt3uo11f8HH/s686mYioc/
	CEXbrk7HQ4osGm70GFzf1nfTtEgaFXj8nRMl8t06KJeRBdYEyekfYMA3uuDUEPGcsUEVxeeht11
	6efd3eydl5sv5pSSNg3n26oUB+hxZUFdwe0Vrl4eHpyTh5n/Xnmkb97N1q11QwwMxpV2wd+1tHn
	TozvTA3N5AV1opjdk82BfIn0CstB2rxXx+iaKT7OBRbsQQJOtcYh7axsHsPWxeFK96MLDAtlSI8
	kxKZyV8t+tKbUBolHvi8d/9JlnB9HHJP3X2sa7p5zU+jdeBSClHgMhXcB4Guj2daJCNahgwUZs1
	qPrJl/eR7bP+5Mr3YqAMVdAAzf6BN1cfKmOWOoHBl7a1m7fMaW5vq9jjhJlSF0RsxtB6N+ttgqn
	ouA+cyHCMghzbUx6FkT+Ar2PeZHDS1xd8m5KQ8PYRqaeQymayRzE6YZG5RhF3lhBokNLl+Z1oQJ
	0AFdaBQ8HYSgUhN0SrqJex3IhioN4aNwiWQAUFb2/dAZ/o4y+xfnPa79qNouoNAEc8LzQkuTFIg
	f0cZbZ5soYXYqRzg6Nz1mU1t5X9itQhlRsRWXvKvx0G7N60AnHKCYWWvEnW+2fN0kLl5mlFKj3T
	eou3VKFpGhts=
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr18522481eec.19.1795591269843;
        Tue, 24 Nov 2026 23:21:09 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:09 -0800 (PST)
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
Subject: [PATCH 11/12] rtc: pcf85063: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:25 +0900
Message-Id: <20261125072026.2997493-12-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232111_857827_52D9D0D6 
X-CRM114-Status: GOOD (  13.51  )
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
driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 05cb3a56ee8c ("rtc: pcf85063: add alarm support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-pcf85063.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 819648619..909c96e5e 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -704,8 +704,8 @@ static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 		} else {
 			set_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85063->rtc->features);
 			set_bit(RTC_FEATURE_ALARM, pcf85063->rtc->features);
-			device_init_wakeup(dev, true);
-			err = dev_pm_set_wake_irq(dev, irq);
+			devm_device_init_wakeup(dev);
+			err = devm_pm_set_wake_irq(dev, irq);
 			if (err)
 				dev_err(&pcf85063->rtc->dev,
 					"failed to enable irq wake\n");
-- 
2.43.0


