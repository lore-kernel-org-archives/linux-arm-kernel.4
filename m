Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57526606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jMhFSrYF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZO6RieLE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=; b=jMhFSrYFeOV66O
	t30YXGrMAPwXuUOWFzToEqsl/i8GCVD6ubZPLI3leDTUbg23BIhJmp1KuMG3YHaDwBSjXEMJqEv1L
	ekMlQk2c7Q45C8KyND4upKUnyd0IWXrrvL1tNylyo4Snm7eQgl1+ktBnPP8Wtk1UC0qa584XQENn9
	a6EgXGgFM9odNQecBpZTR4LVxj3kCseWjpj3wLrgKlf2z9QKqg5SCxsH9bd0E6YpckO89ZNh0iYu9
	ES6WdYy09wXjhUXPdr4m8wGDC1B0Cw9EMaUS0hl1qa4PjezjznCLiQ+hpk+HbFgEaPN/kngmnONPy
	H1FHCYY/mOcA0x9s3vbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JG-00000008qDU-1xAN;
	Wed, 25 Nov 2026 07:20:54 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JD-00000008qBo-15as
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:52 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-38190551625so10862598eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591251; x=1796196051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
        b=ZO6RieLEoNOoJAk2aWVF7h6ZMaU8ADSJ29wOd4CCIhQ+Eq/lZXZK+sHITf72SpHbAv
         wJNmBUHJL58cFU5ls8pD9T3/1UJ6uy1yUN9ELy953X045qEMhRWcDAwOkqcjnS8MdGxH
         DxSaWYRP/Y/OaQq4rVWsZryidHerfeyXiyILNd72ScaKg93Klk6mIhb0rxoQlfInd2Zw
         e/HI1K5Xe4FMMYqss2NoswBiVt13hN5wVsL7tVUvQjjd6uivebcOlmBlruJAvpeeBHw5
         5HlKfsArkyaNqXjuJJP6YpQ2eMk9lvkZPNwX6QKOGYyQKPH4CPEVk9X9aCklixLTDhNu
         /6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591251; x=1796196051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGK2H2xiYDiUmvolMkB/QNxXM88jn7GQua/KqoQPV70=;
        b=w66MVjn8KhQ9TWK1Hd3AFqNNwDB+3zMCzCurUul9vh2+3t05IxPfmN0UWWsGooRuDY
         496wEU/oGCV0bkjgD7UzGtoK37vOrN+FQ17LCleHtP2dgIkrBOiA3CJVdVn07TdofuK5
         JsQRsIAWdAkEt75PvnJ0ZvTDsJohSopiFkTNerq1a3LSt4YszbRov02mYQBZqtIF7yAh
         kdX2RwBrlH5sn7xzYaGbE0zKjPQnATH+RJRwJrz6Gen6VhflSEw364ZZ8FlXu+emwGNR
         kRNR9vS0uQX8lwFRRmqh/poGpzQwrjC8SDgZ+ChX0tMoW2cUjZ/b2LA4Ayq628wsT62I
         e49A==
X-Forwarded-Encrypted: i=1; AL+hErFrcyPS59BPYFR/Q5mJIbQQHrUedzMs91zu5XBtdhWSn6nDlZxwnUcaHjSe+4vjphLxYsiNZu0UKAdcaLo5gzBs@lists.infradead.org
X-Gm-Message-State: APuU4Z8sXtcIwhx7Az+ulRUYZuByPTHygKm2wFxfufNSHDJyQaVGzAjd
	OdNm44w95fAScZhU17/w82+hYUfoOE+hMRfdlYGotWezi6NinJ81Ugvi
X-Gm-Gg: AZFdTZfGNYpV2orZakamVvxWuN04pkiMJaFOmcs707RNvbANMibdWGaL/ASQo7Xz3G2
	ZdZSTg50g55cVSRIYgVvQRuEkEbn3vDP+Ftrb80rbKJbDML3mGfOLxkoVkEwqzwVWXptv9rgqYn
	TG/ivmswLelvpsF7joQF5Ze4PynFjAH2y4+6AhWmkFT4rfSXYAKHmVVmx8ynlBmOhYM0oAjXKMj
	cN4BnVMuPoP7WGGi8wkEOdICsIbpARl8VmKyTFnd0vdM46mqAJpcYJGrePooSGVdHxYkiJ/Zs2m
	popu1s+PC9dYsxWtXUC9Xs2ii2K3Leq4ai/vt8P4pg08y9nwEKPUN9NK2aJkv5piM0EO7O5ybpP
	urWCfl0TGjXZcH4r1qGftfqc7PWQbCdz2v2IdolkdiSHykydPpv/VuM5O9cCWW2BEV9FckeodR/
	ldX9wgTeGDRhb3ot2Z1zVcl8SpplPvbPPFec31eud/Dx4XPYhY4vJqsMUXoMNik+btZdUfkbEAY
	l6w5Ux9daMSksf6IHeJS7dKO1G4Nn2QmbNqGgV5lM9od1lFLZpk4uvWPDIW8eFpdHarOA8qiXTW
	3u7yfL/az+YHB5+z3uZC7dcVntir7Cg9Rm51qmCT2W/Yu7gvXjWJ4RPinNwt7Lgz
X-Received: by 2002:a05:7301:6e9a:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3856f14b9edmr16647445eec.11.1795591250594;
        Tue, 24 Nov 2026 23:20:50 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:50 -0800 (PST)
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
Subject: [PATCH 04/12] rtc: mxc_v2: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:18 +0900
Message-Id: <20261125072026.2997493-5-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232051_303176_8AD5C699 
X-CRM114-Status: GOOD (  14.02  )
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

mxc_rtc_remove() and the probe error paths do not release the wake IRQ
set with dev_pm_set_wake_irq() or the wakeup source enabled with
device_init_wakeup().

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: fbc5ee9a6955 ("rtc: mxc_v2: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc_v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 35a18b75c..fe3a55b00 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -301,8 +301,8 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return pdata->irq;
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+	devm_device_init_wakeup(&pdev->dev);
+	ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0


