Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FBA606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y6tidXOC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTXLqfSk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uP6f2xqQXzq54FxHQMZJOGM6VDsROKZT+DhRoGkRjNw=; b=y6tidXOCfUgTCz
	El4rkU6ntDDF958RSBXUohC1fPKI99L4icX3bZZtj7E720FOXLnqU1JftowPQfQTMJgyBES43eVEG
	yga+z6nECo/KYOQH/LZvmrVQOACftY9Pjl7EAJwjCsnnVUuZtjPguiybdwyVywfw8F3bwdfLAuHOj
	utrT0mctEzKJXSx303cnzrLFPV6SI6JL6fvk1fVOr1Tf/NZJXOMcnhUBhLcNx2/tYhfIgfhLxVuAK
	sE+nWrtHse2FYbQuDtr3VEixnEKTHqPooa3FaaTa9gWdmi/IjvkqpzoERyp1fypoYfR7OGw6jpnvm
	88OopfuUH2sL7cHVloNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7L8-00000008rFz-2Y1L;
	Wed, 25 Nov 2026 07:22:50 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Jy-00000008qdb-2ZDV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:46 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-38699cf08dfso6317032eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591297; x=1796196097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP6f2xqQXzq54FxHQMZJOGM6VDsROKZT+DhRoGkRjNw=;
        b=LTXLqfSkvZfPKHYgCgfVJUV9cid/oRqkG0b/0NLlk01O/D41EeP5K0cPQfUphUAZOY
         YVNTr4W1VJlxFy3QWEJlCv4jlK/ohtM7zxT/oCjMKBEPymP5J0AdwYP6zrM+ftk4xKHv
         noQyBW07mhShFt3CqcJPOnjdQc14HwHTnKQnkMiidr7AOKRueRYCOwt8XmpubD9/83CG
         9v6O83dONeLSXsbNh8nqu5jwwasDRDZ2XSd+gz5lN3Pg3xIh88fP+ezHmiN9hZfmnbmr
         e39wvnkQvYyGeQFGc+jTIu6XNzE5sSHPJWA9l6nRGrq6B5KEZ3YzCbR/YtEzrtQ2FS5O
         3Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591297; x=1796196097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uP6f2xqQXzq54FxHQMZJOGM6VDsROKZT+DhRoGkRjNw=;
        b=G1tOyo8tzXjvDnsptc1WGEaD7IRnhDUkcG6EgVgn4LzAMyMlwdLtyRUuyGfwz4S9W6
         nG+Mx/kIIE3IBNW0iGqt4gnECzsMhPlZ0QWFKCpzTb/SSzxaRtK1od9tAzd/MkZoOChC
         3XNTe9XS2hMmjjOdFiuLihJdpT4UYSXovOn8EPEAPLSweJETaGgbrUJMGM8kZ5xhHmVp
         QLOA2bvyKCDPhOzLoXrcwTe6SrzEi/pIhoJomQAaLAoOmuweSqe3aaWAkmGoK4cAw3da
         xzqTiwvquutH41Lakd4MqM8+WFms85feH4CjrFnYC+MCQA/LCn6mV3QFK+tWUEYdpT+X
         /4Bg==
X-Forwarded-Encrypted: i=1; AL+hErHuJ1kZ+Ou6AIw88p3lu/oL+yDXpTdhCnAevdozDGrHF+aGyTRnLSFHIwFuOgpBGwvUwAlFwxA8DKfnS1tNvwqN@lists.infradead.org
X-Gm-Message-State: APuU4Z9VWuEPRvaRdtYkPOzylHvFuAkkCBNVXyCdm8qHtN6okNRmHhvU
	TLG7n/pXY1NXYrVGkD7xNquRx5JJV2/V5F2OeDYPc32wbw2CxxOyGgGa
X-Gm-Gg: AZFdTZdkKiABYPQM1NBnr/cJSHl9FTN1H5zhcGKbtNF64RvMRjikJITLIbj5QXUHz5W
	/HafI3sl2PIAqIzqFMqFZDu8zlqbp/nZV96hpgWfXHvTpzNFU/VIaBVbyhQ2mrrQh8lojf+7XwD
	GfqY4uksgzV6U1BtpJEnoT7qmm4t07ijkfg44Es/3VXV6JFPc10TKGhLZMMO+F4VZ1rbKu6YDx0
	dG2wC7G6h/zB+9TMsY0mKzl3k2h84eHV/sR9AZk8KoFV7I0svxKo2Y8pOTWCyRsn+Vc3lPu8MSS
	GpeL4kprgGpJJCn53Zlkat/ANThlCXawaQ1XiNmLZGiiVrRIM319e8sm/2eoH/855LE++r0ArNy
	1jgJ2UtAo7o3MXTKW+DZVDEIgQKNO7RHXMFisMW8c7Tz/lDs+cA/iVmreSp+/S0aTKQZ5nZgADO
	CJaSMOtDrdGTq3SuZiBYBoxWNa94auBqNONnXvG9P2BgU5OeEpP4gtfnqXC25egCRQLY3mdbZDt
	bYUn61kLu/eXOSUdfUsUQzOIB2JgOjsIDc6g2ZUuVbUlaL3L/H9OkW9UgoDCMw06vSpp/2bAWC4
	zehRkVNeK4KE8KVJKXoiknkqpPqYynezBj8NYW1EU64he5tiuHG7EBioXVj74BcBUA==
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id 5a478bee46e88-386a01fa8d8mr18967962eec.35.1795591296844;
        Tue, 24 Nov 2026 23:21:36 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:36 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 2/3] Input: sun4i-lradc-keys - clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:23 +0900
Message-Id: <20261125072124.2997511-3-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
References: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232138_717796_900414B6 
X-CRM114-Status: GOOD (  14.76  )
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
dev_pm_set_wake_irq() is never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver warns that it failed to set the wake IRQ.

Use devm_pm_set_wake_irq() so the wake IRQ is released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: b243018eafeb ("Input: sun4i-lradc-keys - add wakeup support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 05983db3f..eea04d27e 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -321,7 +321,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 		return error;
 
 	if (device_property_read_bool(dev, "wakeup-source")) {
-		error = dev_pm_set_wake_irq(dev, irq);
+		error = devm_pm_set_wake_irq(dev, irq);
 		if (error)
 			dev_warn(dev,
 				 "Failed to set IRQ %d as a wake IRQ: %d\n",
-- 
2.43.0


