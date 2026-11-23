Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C0A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=my/lLsoO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhPxjSkX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7+UTTu55kRQmUMdXJ+fvljsspj1Aytx1XWkYCAQNT5E=; b=my/lLsoOagGBuF
	TgRSXxiL0KGYXTcYoYLo2ghaGoqRh6MurRYR5JiuMJWqfSR5E3dGpqfjBrn1g6E9O1Sb35H0ws2If
	S2NonLBLSsMaP4Rg56Opn4d/ZroeUwenEEOrnpmmMT+jsrHmSUsiZ/qn/y7qseExP4q36F1/OYF7G
	gB5hc0YLL+gKAq0Ko8juNtoCObxbEhpX8NDV48NAIpck76uzSowToCjipBNizCpHWoFDPNgzDiE8m
	ZQFSE9JG4MW0cOVs9An1+OjZz0VKe+8SBy4rwe9zpJdGbyyd3CYPmdWC9s3v5GD+EuT69OU+CFzto
	MaKWsIKP7O+mRt8kNp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO4O-00000002Q1p-0Sig;
	Mon, 23 Nov 2026 07:02:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3b-00000002PrO-3CJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso2288185f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417300; x=1796022100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+UTTu55kRQmUMdXJ+fvljsspj1Aytx1XWkYCAQNT5E=;
        b=HhPxjSkXTQ1kPa4jkag1cCjVoCCg94Rz7O+ka7R2nWPk/jpicJzWPMPYaN1pFM6V9O
         zF3H6SpM7wZXmIR5Bl7ZVn0qXdBAehSVjB8735UZfblfPoJWsKzBE9845A3Kwwk8hyix
         t2eFG2atAca3Lh6NOd6gH/YoIio58BG1e09IpZTn6MXD9Z4KAsa0jF+MIZF/RSJKNkFK
         nvp2urm55ayEmhZ/sP+wUjOoedOj93m2LiBl2MO/XbtXaWVl3lZuuDzmMgB/GO9yFkmn
         NbVMHxTcDf+5bD7NatgmqkP/gkT6Wzix1fxZyiRr/4piL9D7Rz0cjJg9f/gjMdi/6xiB
         4Dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417300; x=1796022100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+UTTu55kRQmUMdXJ+fvljsspj1Aytx1XWkYCAQNT5E=;
        b=mWnvL7sHCQ+ogQVQJW0Ghm2ukxMuazprsXuF4ANzGKfWuIFZp83KP8lPfHtyXADITe
         xAYXmJeabGUIY6qFVsY6NNP1tpDW9kKOw0j47OLHncE9VvZrP7OslMzgoYm9f3Sh/Vcf
         6p6L5bJXEmVQ9iijP/lyyZHFDzOGLXJhXAXFkfroio88Lupp8Cu7dGoauuBd2CbaC3Da
         BRyesSBkMRYMEd2v99adjzB+qsqVElM1Z3FukegtvmzS6I2DK5k5Z/jzBldxpgdYvIoY
         Byw5agjriJxtcZGfq2gkbbcXamaf4/jQP0KYVyyX0KJBZdY8U7Im18F4XDhUhM0RNbWy
         gAsg==
X-Forwarded-Encrypted: i=1; AL+hErG96ef3BnQwha6LyF1xoad1080E28tv5D4U0175dvxwEAq3Usx/Wi/D0g4d6z1zkdkv4sOXPvgW++W5X3H+P5s4@lists.infradead.org
X-Gm-Message-State: APuU4Z/0UETqjJ7LIf4AkSd6B/0EGBL/wqHiIaG5jLYWShRg+7km4Mle
	FGu+BHycN8An9OhEEGy4uUWLvHKtob4U4zFhGdZtPFZN5zVrCOir3x0X
X-Gm-Gg: AZFdTZfchC67rl2b1j8K+oqrk3//PAvAlARW7t9lNGn2RgK/rcBRU3VvMh/MTR0NYid
	XoSjD38NIPL9C/CJemlDgY9QTEY5ffCiSf1UFXS/D9DfFsV0ieuRdust9waLLRxuwieI1mOz1cf
	NDAaoiu5QPlw5HDRv8KssbmP+GFdzejfiHOuQYXs74lr9Eit+RKLG/NSn+A5ptTTHKpfotEY+w/
	ryh6ygcxoGVw4Xd9jnR8LXL5t9AtRmraMYZ3Wih+D7GYAaiVI1nlHMMo3vIPWAcBvTp1gOu3avi
	YgydkBAzm82+N1dcUiIt0rAi3StLNmqk0h5QP1VvSntOfN7M5IW5mi97UklJlFdfmVSb3m2xp24
	6DZd2Y4VmRnMwA2xjzJyJV1RpoD3P7qC1yBk4rRNFG2lNpyvR3bxtWN/E/Lw+P009OIMHfOqPHl
	6qswpbhu/NFL6taKoNRyPhrv4LRe5h8FGeicTsfxulE4kRoqBmAQ88W6P9fdz1J6BCzuTMzQUq1
	pWZaFfVNbPdZmqHdoA9YuuHZ9el0yg6udtzhtNgRr+8KWPB7l3GIiLBUmh8dtpi01ziEXdYW/SI
	vEyhG9Mc9wFj6tt/j6zQMgeuZ2oQ7FYoBUBs
X-Received: by 2002:a05:6000:1a86:b0:4ad:d65:aaf9 with SMTP id ffacd0b85a97d-4ad0d65afa1mr19754515f8f.56.1795417300486;
        Sun, 22 Nov 2026 23:01:40 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:40 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 2/8] iio: adc: at91_adc: drop duplicate IRQ allocation error message
Date: Mon, 23 Nov 2026 09:00:55 +0200
Message-ID: <20261123070101.53868-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230200_856876_3252FFA9 
X-CRM114-Status: GOOD (  11.85  )
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

devm_request_irq() already logs an error message when it fails.  Drop the
additional dev_err_probe() wrapper and simply return the error code to
avoid reporting the same failure twice.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 9ecf8ca362f5..76000486b17a 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -1074,8 +1074,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 				       at91_adc_rl_interrupt, 0,
 				       pdev->dev.driver->name, idev);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "Failed to allocate IRQ.\n");
+		return ret;
 
 	st->clk = devm_clk_get_enabled(&pdev->dev, "adc_clk");
 	if (IS_ERR(st->clk))
-- 
2.56.0


