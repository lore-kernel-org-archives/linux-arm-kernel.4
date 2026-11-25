Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27877606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xwNxMa+c;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JfBvghJJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=; b=xwNxMa+cgUWFwp
	bDKPsldssWQg+GNH46CptrgSzN9s0zNN+flOzt5jztDojRjkmADc7OwDnYPoD+z2LrVfYJzv72JOY
	I7oDwkoTMXKQeBsHowNRdHbrZ838QY4zwtPM5ydYlS3161OqRIn7oCNYSIJaVKP7Y3zyuG5bUlqja
	1Rh/7B/eGa9OX91UHYOKvIdO4vK81g5ZuieV6/HIm2YWhjhzdGm9WfjHTBxeI5kjz6OlXLbh6/QIx
	NH7vl4ggw+zMhkza9I56GIV7TUmMty+VPH8F1NtdvufCSDDf6B+Bu59w4SL/qyQXvdsF6WzO4F14x
	i70qeBsAlpfqg7OfgZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Jt-00000008qXy-3wSI;
	Wed, 25 Nov 2026 07:21:33 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JL-00000008qHX-1uMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:01 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-33fb4680717so13915753eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591259; x=1796196059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
        b=JfBvghJJfgxVK5JaK3NNxrTeSXq8dq9o0zWyoEA0priNlJCRszuQ8+1w7K+BCYvciy
         ghodGlLEXJK8Syl4tUpA6b9Jp4lnqhk/t24xbqxB7uROTUVQXQMb+7fkOz2SCBEDdFDT
         XMoXTVT4TPZMomdgrIHZ+y+72iGI0x5K/JPDIX3PHuWYBWm2n3bJ8z+8U08lyvwqJ+nS
         6eCR9BvhkZFTBdcKdCZvOPv7FHMuxUmTcrsBai1xkhtf/u6QhDRbdQhg5uqjS0AtA0W+
         RbwfCFgBnWNHBPRV9eBEandb29wBPJarmatIEu02kptvMUKHf9qo++2u/a5J6zjOIl5G
         njig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591259; x=1796196059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=28HBpc6z3pdJfLP1GsH9qqmR3YhVH3gJc4zTD6MNBjI=;
        b=AAU6b7bz9d0s/5ITleaXibpMyO4CSJaFsy3dEnCX0K0aI348iPcbHAzPqfXE6FcXFj
         b/lh8FEuehB2cXppevT5kQpxBE5+xPzNKKw5IvV3aKL39FSsABdPCuGbfXed30DJdPXb
         LI7AD/NlVZA7M0gxvdNIJKPCZmEMLiJjaNALXXA3WBP8dEDWEPX3mEFXSdD4KCkvQ3zG
         8PjaKM3+ru0BomjGcV6DwgtkDgn9GtHAxz0kDp1CIPBP0yEhbfsDBEtrEFHvuP3QD9HQ
         Q+RP2rrs2ny4Sc2rrWFAyquqxKglSQdbciCREI+Egkul00873H85kAJlLsCw1zaTBBbf
         F8Dg==
X-Forwarded-Encrypted: i=1; AL+hErEq42YPbJ27BnKoMs9Kh6lk7AhOz8rQmCDd0+VXAA6fUtzaGCUdUjAedZ4ifg43NkeSjG5x7h8rnCCGbf5gaKff@lists.infradead.org
X-Gm-Message-State: APuU4Z/RvtgSfQ9KJYpiG3EbeshhAbGIvIN+1aIr2xvzxpggDmI2we4o
	616isSU/PEgW6uE2hj9gs4gi64DQNlhQOPsP4Qd5K4R4w5hWtFJ2V392
X-Gm-Gg: AZFdTZdrns9WZPiNch3g/WnX0p5CiWT6o677eeL3ZQ6ZBwRPqFVb9FDqeRg1q+VARgZ
	cFqCRmZa4KkFVQZ7uiPoodC7A7350S/071TAkRZBRbzpxuZTw1dhi3dAaVX6QgVCOXluNYhPgCh
	p0T5gxNhLMxbBhgd9+YapjBEr7U+nRs08nfpiY35AEdggDFwGnej+oBbxk1Iv+QiS21nCa0L0RK
	vIJGYfNtr1Fgfg2TeHlChs99oOwPrfX2kfBOyr1iZGBfKxcz4iBntF07RGKuWwEDiNmrcZ87ygm
	quzX3ywTV2pu2YISQ17KGcEojsiaBOZuV/GCi7zZh8OzhbQXMjSpADjkD2TR26blyovsBIJ2rga
	AcHn/Rx90Uxykfk8COenO9IivTekojIsIARFWBvA4EZ21F5bBQ6ZrMuP+V3pftskCgMzuqkhJdH
	NK0UnbUpVIAz24HbAFgry1LnJlWK1gflqy8qyTVoGsJCxGij3xxNHijS4CsoZgW5F9mkiiQQtZw
	sNju4ZsKR8EH84n83BpzLsQ22nsBSljTv5aBHr42su/io95krmbB0/qskSJt0162UeMTafW60GE
	3AV2SEF+KlYEQwusZqfCIcvV/Dn2DWxtcpWYtLHibF9Kzk+5s2Y0YlRCq1YGFfyA
X-Received: by 2002:a05:7300:f68e:b0:383:d3d1:f31e with SMTP id 5a478bee46e88-3856e94760dmr17054999eec.6.1795591258774;
        Tue, 24 Nov 2026 23:20:58 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:58 -0800 (PST)
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
Subject: [PATCH 07/12] rtc: fsl-ftm-alarm: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:21 +0900
Message-Id: <20261125072026.2997493-8-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232059_512379_ADD20670 
X-CRM114-Status: GOOD (  13.72  )
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

Fixes: 3a8ce46ce15a ("rtc: fsl-ftm-alarm: fix freeze(s2idle) failed to wake")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 5473f697d..565fd0df6 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -281,8 +281,8 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
 	rtc->rtc_dev->ops = &ftm_rtc_ops;
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
+	devm_device_init_wakeup(&pdev->dev);
+	ret = devm_pm_set_wake_irq(&pdev->dev, irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0


