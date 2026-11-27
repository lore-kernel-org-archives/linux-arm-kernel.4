Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28263606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wgy6ZZlz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZvDL6aV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=; b=Wgy6ZZlzlvatWwSHKkSZNxavQn
	SUvRz2DIAUO0hd1kJsde+xx/UbdypYmI8ViO4NP/WdEvviB+ag+NBIiQZpDgWRKbiRFdLUbu0+FLx
	KhwA3sQZG2ylVGwvB6FQoZXoTsZuIgxKFXpv5HNJ8mId+LJ9dK8OzH39ZndQOdCk1YPAmMPwHXduR
	LajY/SatSKjob9C5bljrqG8xLqEqmmOMeU58oMogJoVq2tQWcu5bM6Rey/w0gQq333hXP6JnhTQ0f
	KRD1iSRy3JhQiw22GaPj13mUk/Zlw0sKwcX5V1rpAGBqFHLh41OTRGQdY68h2AXarK8JEzUg0wP4R
	x5qN1UvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWscb-0000000FTx5-1rcx;
	Fri, 27 Nov 2026 09:52:01 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWscY-0000000FTwg-1500
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:51:59 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1b5786e099cso6716549c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773117; x=1796377917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
        b=tZvDL6aVIQ9zFfTpNsPLqI7lLOQVXbP6+q7hmRYw1CHx5zQpHqhMLExthIy7FkRLMu
         TquHge8GD+EO2VWbK4NPUJQD4E4HhtejDacbDOo1mcm1bqw8Rai3W+yZXb6ID/9BJoz0
         oG4FJ7DGXm8FdgAIejhKYciJMd3m1rrF3mHxHlFtgtPtSg8qo20tn5OQlwAp3golMKM6
         oGPAdY0SS1PgLO1W/gtifSuNBs1WwNUPr1eoy7Zk36liOnVs1PQBqPMMlWCvUwiBmWWK
         hLl8LjXsWoKFgzeWrjpcJY4EjLolmwdOzqd+g65sTSZIjR6sY0DG20QvRt3aX9XNPany
         jKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773117; x=1796377917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWPHJy9iFbePXvxdAN2Vzrm7k7bmXFBAq/ZLtmQXYUM=;
        b=Ts3zSQqLkWvpApkG15BLDNdzcJO7b8Os2EzomKwtT7Vr9Ro0chSnmtp6cDJtetNJXg
         IUGWBL8/fvQYe7pmyMfmljCzbxrHP2/xKUX2WM0x4ubYMzRVKIZP+VlXbw6MudKhm6qM
         BjzCfI8uP5/6ImwWMUAlubX8IOMbadiws75LlulRJU/iYqULSpUnkf3+ACksLyXRxUf5
         20W25FRjQVFbqpLCeAFDET2eqhmJDixz0jYpT8ZiR9V8LNvjBI8Yj5my2n1QZjp6Lied
         PrVKKU2Ulct7qv6/dnuOYBqa43H2rAP2l+p7sz/yO88+Rdcuu2KNlIjEts595MKjx+Ym
         MVEw==
X-Forwarded-Encrypted: i=1; AL+hErFQdZLVWNWCSIsAdyGARGQsu8FKlFmJs+xtOjbeq03JaeNDKTRrY47yXMwx4mi4UAM2EULtNvLgfFddRe+OSaDm@lists.infradead.org
X-Gm-Message-State: APuU4Z8CsCc8gHJjpLUAm8TGyFm6TLLHShAcIwNu3pUL1SjBsPBvJGMB
	t6rf88NMDaKenGwAFJgorhy3gkWDeItK1GfPuBl+oEMe5xKuJ/VRbV/i
X-Gm-Gg: AZFdTZfC6bntcr9dnzXXFrkMxjm/uIlnx958Z+uUMsMqR7jXN00TNBdTYti3VlUOwTs
	b2xwhvS1SZJWwGFL+rBwuyIGnSNupuLhspI4hcEg4tauxB5pZMwwahxgIwn6G0Tohm1wD6jfF0U
	2vTrlsHG6Wvs92F/qWkaaHZit4x4aPS/8MSZuRhxfraF6eRgR+GynkVg93PIy20ETU6OCoZhMpG
	gwpO14JVQwlEfiw9Gd1XB0BiU1wgRVfrwmJ3b9o7vS4ZfughwXEyeZjQ+RP3jVODE5Peqw2Udtx
	PtyB52Y4HcqunFKg/DypJTUhOPxDC/mmi20dSpv/LA9d9tVR4spcpsxbaPI3TZkgrd3XJuQV2/z
	KyftO2hChKKLrWbrYEuNzG/ROiE8wjp0FcC01PybkFITnvhf2kuSiVbh4l1HF+2QQzvVw5L5H6g
	Cja4c/Dgai7fwLJ/nzGuDyMj7X/8/9UlPypQfRdgJ4TPgBO6wXSx/sp2NN2LEYBfHgZtcUOi5hK
	hDmA9gcpFTTXmW4/Tn0PSuDt5rIEuQK1bFVoB0wXDfPWtAfYcn6q2cSIDb4R249zudbYLpqRh+u
	dosHOvg6RFBnYTVa0svzowWD/ciGFnxqt5jzYV+QtZbCr1urcCfW5rFtzJqKddid/9orghMuPA=
	=
X-Received: by 2002:a05:701b:2901:b0:1b2:529c:5b6c with SMTP id a92af1059eb24-1b563e5cbafmr20921407c88.14.1795773116771;
        Fri, 27 Nov 2026 01:51:56 -0800 (PST)
Received: from localhost.localdomain ([103.177.252.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm63459721c88.6.2026.11.27.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:51:56 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	alexandre.belloni@bootlin.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Fri, 27 Nov 2026 09:50:29 +0000
Message-ID: <20261127095029.3280-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_015158_305422_0069A5AE 
X-CRM114-Status: GOOD (  14.46  )
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

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
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


