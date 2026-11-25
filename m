Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE39606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZiwD195V;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GaKRHzAD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=; b=ZiwD195VM78Ojp
	PJR5WbMpaVwxSPj+5tEvfLHcZBTSY3UmaNVvfHPVjsteAc52GkOJYBQQuFZNIHOEWF947ThLhbSsc
	yCbbWVJcIG2IR38UHPbJhan+NkZHOQ4flOG8Z8OIypeSXle/tq1BAaSyxtKBv6zPD7d9OeoeneQSd
	DIyoy3HwaezGCDXnyazxnYmvmxEO+uRu1SUt6iHbzoCX1/ff5uBHgTIrMQiooTjNvJ0RSX/MlYNd5
	0W6irCLe6hk7/g3YfFFef/IehslPa6K1FXwqdwtjDJ2q8gLr/RYWOBIdykhH1r04k4glZyXh2MJ+h
	lWUzAWgP/qj1K8maRKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JG-00000008qCy-171P;
	Wed, 25 Nov 2026 07:20:54 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7J8-00000008q9K-10m2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:47 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11667749eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591245; x=1796196045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
        b=GaKRHzADmlcMFOclBoaG6KvVen7HhPEYpwuDoFq2lrydgo9SG6iS8FlsQMbc5izB48
         /41QgyMChrzqYaklFy82SN1UZwe7DdTbYN/7qqFmAOmF6MXGBCgKg5+YxXcz0/RymE1B
         mEMaR4UARmEUKv9lVMCmWRXJT6cv6OTgQvRqwmNX4lafK0GD2HfEE3OFq0v2YWRnBWoy
         9EN5IiRt11wkaa+TKC1iPwPK8OhoqF+bx/BADs4woVnU2DH75RLwlGDuqOR3CYUfPlk7
         YmdvFDI9CBwgMnSdugg7VvrPnYXmpCklt2db1nD79S+vZ7LNk9qmuQbAlVGOY6c3kdSn
         iGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591245; x=1796196045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
        b=ePCdxnaKIROsi8yl+83yIetX9gNm8qnia5/tnyWG1O5riepFRXcVHTL0BphJMikhc2
         Y92AtII5ckEvFtJ51TJ7vUX1hi7BmAD+0EMvzJooKejqKAgi1TcITV78uJFba8nED8wZ
         ASrSjSpsjKKdRzrZbvFUbGawqmGiZCZ2fSgtJDMNDvCmu0Ufh+Hpgh+H4gPtmxE8uMdy
         415ukpN5B6Ao4wpZMtKHU1d4tyELItOcdtvxBlDzr8lwp8L1P6Ic2EWMutFvTP39OQY1
         q9LLXOcCdeUU4/uVGqnp/d3nQluhVDZvj5gNk19ChAx6Zfk/gUj/bxOS+6rUNirrWatZ
         Y38Q==
X-Forwarded-Encrypted: i=1; AL+hErHAMDSeBr30MMynj3uOhGHEusUTUcGWWDzkYO3SK39/xNQ1E+Y+WxdtW1UzIppDiypukMxxie2sgW1EaVlGmsTx@lists.infradead.org
X-Gm-Message-State: APuU4Z8MuUkfHOIZIWQPuw3MbZ2DRl8cVyUg92nFD5WhM62tnNm2zqlz
	h04Xx3Oz7ZxNSOeGE9L4TUuMLWNcdIv4j4qQGgKeVHrllSEPhBuip6dx
X-Gm-Gg: AZFdTZcq338VdXZN1EQc4ewyGlH4VngDawma7MjEeC17bHbLxN9zcCHUZer+x43u+o7
	TZOpAAMz7bmyEXXtio4kujkd80jH1VzixvNhV0WV48xYUqwxjS2Z8STMQAIqKJbggUarebTPHwf
	OXydQ12nMLTIuQOnKG7ivEg3BbtwO5rWezFSAYAQd/ZHKWq+7CgFEjg+cuac9dILSuhIBlHPeL7
	JrYX0Px60vufclk19x4A2Z6noiTpCfuIPYa6B6POpF+7adFLJwvpSxH5tU+1z1LhWkzelTJqw5x
	0RS5pvfJpq2ULlggZu/QBUhx/IOYIg9uxKZCrsWFiQ0cIS8eXRvoWX+LTGy0B17nc21+hY2SZ6O
	lHQNGfJHR1r8VeZhs/PYXqP8DwJCQk4YvK3nGLK7Bo/UW4yv1i5mVCfSGTjMezLbJzAQ8loYuen
	seJ+qHaDkIca3qMammbLf+Gz2AH6+8RJqpg7+6HJyVSS0ng10I8ATB+ka41YGVJjr257w1wm11a
	7kAO9Ccy9rEuFBJH1y/QLzpAqizi0DNSZajyBk4HAU4t3r3R8KPP80ltEEi97xLMsMswynH5ARW
	IcYxPTzo2a0qm6Qd2jraPM3vaxyGd2HWC7UFq0Oo0NMVZPSmFfhPuvVRsFsNG2W3V6E7uHQ36Ji
	9UoOSTWQfnA==
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id 5a478bee46e88-3857180d3b2mr28249889eec.38.1795591245029;
        Tue, 24 Nov 2026 23:20:45 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:44 -0800 (PST)
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
Subject: [PATCH 02/12] rtc: mxc: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:16 +0900
Message-Id: <20261125072026.2997493-3-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232046_283184_EE77D0B8 
X-CRM114-Status: GOOD (  13.74  )
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

Fixes: bc0e731fc289 ("rtc: mxc: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index f91b0994b..90b383896 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -377,8 +377,8 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->irq >= 0) {
-		device_init_wakeup(&pdev->dev, true);
-		ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+		devm_device_init_wakeup(&pdev->dev);
+		ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 		if (ret)
 			dev_err(&pdev->dev, "failed to enable irq wake\n");
 	}
-- 
2.43.0


