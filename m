Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED505606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1aLzNSJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ8muau/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=; b=F1aLzNSJ0euTNS
	aQ4On8hs+40/x0gFb+57irR9DQyPskcHhWqGCzrQr/C7y9u8co3ZM0gMVgI/qJc8VclN086CGLNH9
	S87QTUmKgXXYmxZLpV+pZErhgBUx16Pp+gziRYw7ekzs4WFHE4j+20QiZ1WCCUFvzzPxpoG0H2tnN
	g50a4pmKg8KVoC9H4vIH+jmPcZqpmSEpZ28a5M0EWsgamJdChiYqX594HHQY740moIPgGU5vqMx5I
	dQXwXcC2xxY4ZVx1CYd6R0dc0qwKoIbIQQ2WV/JpyXbA00LunBy1k+4wSmKIH/SRADi6royX/ZDTY
	brm8V5zCF9yP/soPPr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Ju-00000008qZs-3Dwq;
	Wed, 25 Nov 2026 07:21:34 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JZ-00000008qQp-2hDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:20 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-385d8a00598so8000527eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591273; x=1796196073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
        b=AJ8muau/Ukd/Q0oRemO5myKNIOxgNOd5HI/gJLtdjvqU/Nac5doorohHUuF6LaumOT
         ksnYF6PKDMywM7sq/QQ8FNFVvzamhDl9S3hGW0mYY2kv/dg609vXCEjeLWgkEfW9ZGQ0
         7Glfny5xGdZrnu5vYvrnELDMVXkY/S6/D34DbUBp8cxYZUJ/8NG+tydufXnICUzukJoX
         IrJa2jY08rmLOC0hryUmwjqL2BXQRWBXlDVr1hW6FU5W8D9a/DOr2fYqBb/GwRa8sHy2
         i7c/s+CKK0Y6xpRlIqLVP9WEyGsaZYJFmB2WokdOEWK/sY2KuJdVry2crtLBxRoWXZTd
         ytcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591273; x=1796196073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io0jgXINzxf8Pk44PIZlHBE77FZbFSzj7shA0YE3rU8=;
        b=vU8b0/YJiCNRzcSaHwFv8jht5b8bDWNgsMlOEmMnRfjpQ/bWInDAIM4h5nntKXip9Z
         ouyF1azVy8b1bfQcBJrYMV7noaOFVZt3Pq72dijaW+hsXQOfVh3fLMkARW8W6wbFCHCk
         IT3ye+txUMz2vbwVxLRToUYJyUsMhz63cUzVy5jfXCZnnzrHqutzHvBDXyyDCg3bPlvg
         3UgfAgGdjeuHJY5C4IyWYcEF7LRn5117eRpTe4SVmW77ubQEkm/2ZYJydnS9A73r/MDF
         15Ll1gw7RfkdIdFrLhBNp+TC3WBKnX533HMjia3FMR//gGtQEdyd+Rtnmopg5inu6ztr
         a/xA==
X-Forwarded-Encrypted: i=1; AL+hErEilEuyjdLd/5V/Pe9TurWmYpbZxuJ556hssf2jqEGpMog+elk0bqmTyUjc7Kxkxs2l07rwAbOJqliPidMmcwxf@lists.infradead.org
X-Gm-Message-State: APuU4Z8Q6D+Cjo5Xpog7qPHa52QuFF7Gr26VzDUfdaOv1NQ8UyD3Mcib
	WQF3wyCQoc4rYsTjFL+Xhm7wAU9xdztBCe0NX2TRaVLXo6NdHUz7ah2u
X-Gm-Gg: AZFdTZet1BGo+U6E/y3w4sb4mJNs9IV68OLR8D11ZJG2I1Ejmt9j9qYdCNKaLKQ6Acx
	RnuqB0Ldf3ap8H0zviki/+1JJaG+CEYp3rYKK18VTRSOxDL1OoCVDOv226umcxWXGneVHNGGNRa
	K1Em07OT4UpV2/iE325VXxNGevggsNibZGPVZDzNLzETTjXZggosouSH2dAZ1HkgzL5Z1hvRfUv
	BXSuVLH/p7RsnIao2JWgAU6Kmo1WT6C0AW67FrLt+ko7zOU3RWyA4ADlXdQYZaXSW0/K8v2MYGM
	tiYfZleESJlQjnRBDwbpR8/tZLhEZ9TLHkLRSsawOEsibtB0R2sYTMavdqK/sYdBG2bXeRu7+wd
	XlJSZeFs4lIqjTX/W+HoxQ0aM0+GhoevkqheAs+clCL2sX4mKVH2yiIdWDOvfSC8qnlftyRjQhF
	3gx/Qvvv8feh/49iVLhQj5CjORPLU94t98XijfTw3Eoa8l8WV8JAgPMjtF6pcf3iU2RG/RzFYPX
	WmT/ustYqc+K5ocWaghF9r7vB3Vsm98xguYyM3c77hBGkBTCN8nqcVrKMdJ/jqMuDNPoqE9V8yu
	weEQ3LrePvsh08VvHxtHKTQ1YYpB5ibZIpxrnY/drYBJQGfMP7bZPGkjRPUgRnaj
X-Received: by 2002:a05:7300:fb97:b0:381:6ac8:ef2e with SMTP id 5a478bee46e88-3856ff5db0bmr24055433eec.25.1795591272607;
        Tue, 24 Nov 2026 23:21:12 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:12 -0800 (PST)
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
Subject: [PATCH 12/12] rtc: rv8803: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:26 +0900
Message-Id: <20261125072026.2997493-13-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232114_353849_BFC33511 
X-CRM114-Status: GOOD (  13.19  )
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
driver prints "failed to set wake IRQ".

Use the device-managed variants so both are released on unbind, also for
the wakeup-source case without an IRQ.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 2f80de657f83 ("rtc: rv8803: Add power management support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-rv8803.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 7445c8151..9dbbaffcd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -700,14 +700,14 @@ static int rv8803_probe(struct i2c_client *client)
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
 			client->irq = 0;
 		} else {
-			device_init_wakeup(&client->dev, true);
-			err = dev_pm_set_wake_irq(&client->dev, client->irq);
+			devm_device_init_wakeup(&client->dev);
+			err = devm_pm_set_wake_irq(&client->dev, client->irq);
 			if (err)
 				dev_err(&client->dev, "failed to set wake IRQ\n");
 		}
 	} else {
 		if (device_property_read_bool(&client->dev, "wakeup-source"))
-			device_init_wakeup(&client->dev, true);
+			devm_device_init_wakeup(&client->dev);
 		else
 			clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 	}
-- 
2.43.0


