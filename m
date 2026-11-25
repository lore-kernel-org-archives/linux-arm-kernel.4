Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2373606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5GHMsnH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jm3VrU1y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=; b=R5GHMsnHF8uS8z
	VrqAYRZKbyQ2hOjrViDQVzPDGFTvD5I4F3ESDUNCQtyqfIQMji88dSl/BjJ9Ze4KGbkjEP3y9/KZP
	lOtF0/hy4ODh5BjMVxe2a2nDuIuUUUOCYg6nBBGL1YVs/RpLMnqIRdb+4H8qVNX9a/azkGQ/1frmA
	G0+ikXyN2xEgVuo9XJeNanBKw01IluxLp0jbVhnWq5XlbRBMoDef7Tyw0ZDWTIvA75SgNdTpyfyW2
	Zb1BRzkq9asVQtRq7cu7uveJAZu2akAEBLhoAcfLNvRlbKXnd63cBuxYYJVP/kd+aImPHBWALAgtH
	i27Yai4cWxY9SzLmPQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Jt-00000008qXc-3Cni;
	Wed, 25 Nov 2026 07:21:33 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JG-00000008qCm-1wcv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:58 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-386ab9ab619so6385198eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591253; x=1796196053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
        b=Jm3VrU1y1wWVp/hivDMUJdJ1Aw+7Hn0YXnvPQTeKbAB0J4oOr7Sh02OEWSXpN/4KcJ
         w933Rj7O0o+McAlbXZ+Gjuuuxx16ugD4ka9o9Q/bZjpRTGQYuKHBGGjKJhbRJoVKi1qj
         zHhYOkelscTqms8K9ydVK4gpkFYU5KFk0y0Tp8+V5TZDQ/YU0ESH0Z8EAqqiD6almJIU
         EhVWawhnetxqnNtnQ7kfTaFSbXkg0NzMWiR7SEGN+mVhFK13gKYDHn0yrlw9/nLGlj92
         3BOCni6KCPiXLFWErlG4ueeQoZKG5V0CiyCF1QqFIXfVpVdKKxpDD1Oc8FIzHrcKN+Mr
         4Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591253; x=1796196053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5F8HNE1pXchPLDdh5vD/VO4OIkLD+d4JqHGWbIQKRts=;
        b=iQ2vHnvkzptZz+us6e/kAGSuc7x+z1hwDIt19jzaxcFFrJnMsOtWth/IahktHlJR3L
         jYnw9YEHGQ8Dx7tUsCITSI6bORcSFOd3zMOzbtPlX2oIcCo785+yoOrEFvbPn0h/o4d8
         1fNiL8sPEvJR5JR/jiHuZqqONlWm8Jlu4MpcRI6sr3usWdYUhkk+dFSc03O/mNMC/hfA
         TDhiwsMRMqWXwqW8YVqoEpL6Pp4+WOquyiPl7BKSoFugbh0Zt2ixbFzlSzgCTy7/h0zV
         SjB+DQwQtJ4kEL4xViMzqsRrJlTEJe/NXwpvkXVTPAwZ+TnYDumy410WJY53mM7rL6ak
         ruCA==
X-Forwarded-Encrypted: i=1; AL+hErF/pvkTvxwD/6jeuwpuYqEzSdyBUNSPSOkBopG4toMaPfOFgB3xmtshnkSpZJ5C4AKnmoLlZDKBHOgpOqTvNegP@lists.infradead.org
X-Gm-Message-State: APuU4Z8MjmQeNiNwGrJWE2aHihlKZqDZfvhCfMCbnFjMRkQ30oJRNYj6
	egOjqdHiRaJLcebXJORcSb2aQqIBFobD9R6+9CNzYB1+9vFcvCbBgV0I
X-Gm-Gg: AZFdTZe5msO6gqMFUoqoYbdecoyPY0xnso2gvO6FXUX+f0IU6gV70XsQSgA0XZNncvN
	qKdj9+eqFT7lL5J1DvMzZTl/OaRC62iAB5HmLANPhV6vRdU1vhHxy3B4zbnI2agdqzqjYb+E4Y3
	V8nTNuKProuyCNaJkal3ABDxSNXcB/PNo5+xmrvnEe5zmauua2mjpW9e/qbFkgm31THsu34qYqL
	Yf3BSfz1vx9AnGaAHx5QG3/IsLLD/bNeX2t2K8nW3WPKS4l1xxviSRgvP4D0dozGoM8ZBJhQDet
	D0y8//XZv7zgWi0GHBWznpTmF24N1bwaqR0/wqTSGO4hA7E2UnV7Tr24M7RC9vVTu8OekEcL1Ga
	MvyfhYj2zFagTILl/NqTqAxkmxltm+SnjEltCx0O6WWJjlHIWg9LrFsIrsPzMeIt7Ir7aRvZnRt
	O3O2jlp8jIYJPBIeet8RH6nwnwiah8/mxx6Dm3B7u860njNK8/b35e29Qx4D71DjnjIMaS91hzc
	jSQdbI+pcDZfL/6/RhVhcXhVU5j3KXeplLIgQ8xgnk6dm/3+7YOqSyraElBI4OooOQlC3P9aopn
	dAmeOkzbodOLJc+/bo+KWsEAblpmzaEm54nTHbd86GT1WpGbyV12oiaOPtcbqgqp
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr16142558eec.6.1795591253408;
        Tue, 24 Nov 2026 23:20:53 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:52 -0800 (PST)
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
Subject: [PATCH 05/12] rtc: imxdi: clear the wake IRQ on removal
Date: Wed, 25 Nov 2026 16:20:19 +0900
Message-Id: <20261125072026.2997493-6-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232054_562157_7F36ED21 
X-CRM114-Status: GOOD (  13.68  )
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

dryice_rtc_remove() and the probe error path do not release the wake IRQ
set with dev_pm_set_wake_irq() or the wakeup source enabled with
device_init_wakeup().

When the module is loaded again, dev_pm_set_wake_irq() finds the old
wake IRQ and warns "wake irq already initialized".

Use the device-managed variants so both are released when the driver is
removed.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: bcae59d0d45b ("rtc: imxdi: add wakeup support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-imxdi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 4066e32b5..a1afe84d6 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -812,8 +812,8 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxdi);
 
-	device_init_wakeup(&pdev->dev, true);
-	dev_pm_set_wake_irq(&pdev->dev, norm_irq);
+	devm_device_init_wakeup(&pdev->dev);
+	devm_pm_set_wake_irq(&pdev->dev, norm_irq);
 
 	imxdi->rtc->ops = &dryice_rtc_ops;
 	imxdi->rtc->range_max = U32_MAX;
-- 
2.43.0


