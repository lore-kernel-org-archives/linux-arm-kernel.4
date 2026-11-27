Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B992606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FnCRWAIX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTjKdATR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=; b=FnCRWAIXOnQ96J
	QHpnXpaLx18UzMxwBTxTBvSkaQtizpTlT60OEPFPSdjHrzmyrFIPNfplu6TV5UVXFVKUGtr/SFDjP
	Pyb8YVdhbkOzk4HlWIlYtBjQG5uYc6grG6F7d+VG4Gzxzkb77keEfvMjX678d/GS3EDt5zwEPJPVS
	Xl3dVLHs5pi3vvI8rxeymN86JzFcV+duLNHMUBprwg2+6+I7Yev3EuXVjKD3ATCHAqP6P34mxIiMd
	BnpJCzY0Zp4BdW6lhNaCzf4Acx4sUC2G1Bj4fsMpybI/K5CODwwreusz68N0Uzw1O+EalV2syCaYw
	ff63Ytr/jc5TENbPzYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssE-0000000FVlH-0d0Z;
	Fri, 27 Nov 2026 10:08:10 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrq-0000000FVbq-0lRz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:07:47 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1b5786e099cso6735270c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774065; x=1796378865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
        b=PTjKdATR3YFp93wUepAq0s0TTiFEh3048XMP6H3CdvVHnIHPkFiuiySlD4ligZd9sX
         08D/zwk+WaIUn9U+VQctasg43wCZxOffOrUNRbRScimGyBUGjvz2dErqafS0f8/i2KBB
         /KP/qZs9u5P2XsUPZ3QCgQGIXbmar9aRxinyCqFq2bIrt1JGmiLrjjvGcDQdfDrFii8g
         1JfrrJwFnNyl5RHqQ+q4G0zOfVz2G8jOlI4E3cBB6OOhJv9I0kI4CWssq8ymgaLP9hN+
         Lrg2CS95pxJ258lon3PglNvtKB0nUpCV+qp64pfI5qqrSzZ34wplvFgY+vT/sq0Ausd6
         CYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774065; x=1796378865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8jFUXiwbtLGEQsPs14IigckZt/ak7fASs6vSqAKnVg=;
        b=Br9prrmNwCq5ZUSdL97Nl8OM99spYE/iWFJ45GGsa/VkK7T0KtfzBa8J6vHsF6Mil/
         /PDAMD9W92XJFdoxcdyaZzhXKKDg3FgDbEE4gTe9w3siOf7YPv/x/rxrmc2BhP0/DCLM
         S90tOiQKIcbI+lgz7hXxaQptkt0I3qUWxeY1PHTDQVvdb28DI2M3IUOU9WXPYMGyAsaf
         L7kd3+xxjCgiaDVr6Avc6rWZW9j7qpy+B9tUvohtB9IcDxt6liziur8qo/X/63pfbF05
         5YqccsHRKi2/f7LV4h7f0vIHjuLzJxPJJ1/OEjXx4NlIBa4UhzWLThQdbBkAVJM/oNi6
         o+tA==
X-Gm-Message-State: APuU4Z+AwSoqcL2HYIrzqNLl133J3pxrzqQ94cP9BP+c6Gw34/hpoA/W
	OxxBFKgXou1kv7E9v6T5U+vQ5UbRN/4PawRXUb7FjPrfa19vqY44ra7V
X-Gm-Gg: AZFdTZe4Vw32sXNvVMGGGzYuguDeQcYWq+pqOuYYFyNDBrVC3zY3SNqRMDwcCx+om48
	xN614VDtz2EljTPoC+/qaFULKO407Rf0tLnU08eVaNAtGbym/s1Lssfs1b9Bdu5o2in12tjFqVM
	+IPVtaxnPm9mmzOE9PXfCMVJZz5Nzmy/3VCLeveiH/FAJKIfdIUvHizPBVVRdQ6zB98RrxpfRh2
	kCkrHitkaqDOMVmMVYeIZx7yZD3eOgFpCZFx0fX9hP5JjnK6YL3uDZjB2OiUW5Xta0iHgmWoEAf
	7RXbM9fGVPHvbDSiN+hQuxvvs/aOw/yBq02MTmWeo9KH5zmtldlWXsuTLzLGxx0oZg2+GV5OxBo
	QjhSkn9glHxYvkMIPJBVUfMJqWvTex5qEEBcVVgivR3frRLFcXbkcKq47LTp8Y9h2rSa5YN8ZYW
	VHZU1DBeN6XLYrp7ct9dkgeuvxupModNhytdHMlE+R3nmlX/8bIIXLzoa4HI+0uLT8Y9gtKTEp0
	XuZQJGRJznvnmvHjQXUVxFExJZgxnI6tP2th2wM7X861TIT/24P+jZvnPijSt1Slu4yUNbrSE75
	P7G4Q6l4duvOmZKU2k006tuQPutXHog45ulO1Ob87gj+UfgTormo
X-Received: by 2002:a05:701b:42d4:20b0:1b5:43d8:b82a with SMTP id a92af1059eb24-1b55689e7b7mr23163707c88.9.1795774064568;
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
Received: from localhost.localdomain ([103.177.252.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm62858991c88.13.2026.11.27.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Fri, 27 Nov 2026 10:06:45 +0000
Message-ID: <20261127100645.3564-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
References: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020746_232558_DBC9A82D 
X-CRM114-Status: GOOD (  15.21  )
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

The driver currently ignores errors returned by
devm_gpiod_get_index() and continues probing. This can cause problems
when the GPIO provider is not ready and the function returns
-EPROBE_DEFER.

Use devm_gpiod_get_index_optional() to handle the reset GPIO as
optional. If the GPIO is not available, the driver can continue using
the internal reset mechanism. If GPIO acquisition fails for another
reason, return the error using dev_err_probe().

Also, check the GPIO descriptor for NULL in atmel_ac97c_reset(),
because the optional GPIO API returns NULL when no GPIO is assigned.

Fixes: 5f10e84934e4 ("ALSA: atmel: convert AC97c driver to GPIO descriptor API")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/atmel/ac97c.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 234549e17351..3ab6ddb3259f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -670,7 +670,7 @@ static void atmel_ac97c_reset(struct atmel_ac97c *chip)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 
-	if (!IS_ERR(chip->reset_pin)) {
+	if (chip->reset_pin) {
 		gpiod_set_value(chip->reset_pin, 0);
 		/* AC97 v2.2 specifications says minimum 1 us. */
 		udelay(2);
@@ -743,9 +743,13 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->pdev = pdev;
 	chip->regs = regs;
 
-	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
+	chip->reset_pin = devm_gpiod_get_index_optional(dev,
+							"ac97", 2,
+							GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
-		dev_dbg(dev, "reset pin not available\n");
+		return dev_err_probe(dev,
+				     PTR_ERR(chip->reset_pin),
+				     "failed to get reset GPIO\n");
 
 	atmel_ac97c_reset(chip);
 
-- 
2.55.0


