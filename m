Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742EF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FMnVo+tO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ha2/Ufq9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p+q3LFIMHbm/nMce+FLXOK/M2t+rToT1SbCyE/uCano=; b=FMnVo+tO+JMyWKfGnCz9tnPnxw
	3PSWy28QDhbiz9pY8/72TzbYZSGxXg+wtZJswq33x1GLOwA96r8uxiwUwK/gBbxqX385sr7Yc1ySW
	BKeRUnbdduAhM23OGIlzjYq+74KjgjLRmaBhVLgdkhoQsGGd8Zmy9AsK9oy1Cnz50tKW39JqFL7pS
	YSzYdttNGLxb1ZHXdE7HL603o26I2z6pzfNhfN1LtuTSKMCkGyCoo2uE3Xfq3NERc4/qxptK9KKjv
	3jZQVvvoa2zBIyF9DkIZqe1ZcAe+CrJj4EaiIwqw5GivhrJPI1sGX5XL4ZWbq29tjzWRTwQG6DWZs
	3YxGF70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROqr-00000008s6d-3DVF;
	Thu, 12 Nov 2026 07:04:05 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROqn-00000008s5r-3Vdn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:04:04 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-93f269e335eso474840085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467040; x=1795071840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+q3LFIMHbm/nMce+FLXOK/M2t+rToT1SbCyE/uCano=;
        b=Ha2/Ufq9cWr4tGRgKslEeof8ccQhcqCdeZG6Nr6EDW1C7HLRLFOBwMYEQBRe3ThhZp
         0+a6KPTLZMHsWxvNzSDlUqKe6trnfkZvkIsOIvoTc0sP8eIvCkRnqcwlBTIdgntrwwFo
         /ULGp+0P8Gkl537df+WAbh+ViOQc7RyeuScoWTK4Wbu8RfS58GSLTbjyNJdwHIkYF6my
         DRBUkUsC+PqVz3IRg1ir6BNXDxA9GUAebPcYKNM+/0cVJ+Pvq//D9UULmyQGLfa7Ou9B
         SdHC9n5tCpsNKKBmfpeqSk1lCJ/vddh3mMtARognvZMi+VOc1h+3j2rips76xKugP7Jt
         r2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467040; x=1795071840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+q3LFIMHbm/nMce+FLXOK/M2t+rToT1SbCyE/uCano=;
        b=w1TTcygM3Bmb6bS6Pp6ASGGkR0lGsZybOoZDTG4+tZ+yGrEOUyTlAY17xQcNL4M7xs
         W0of8b/dyaHwtYE00nXv0aCObiTio9nW6u4+dpGNzXe2ews9+yJSBIyerWThQz1DPwgH
         +9fK3QGb1D30ixRd35Pht5ax1Ff6oXisJihfdqGpqoeLT9GHAI9Jq8sAzV8myNxsQHUx
         3kWfNbgivufpjurOMZiLzEsJdfhmW3fu+zcsu6E7ajDBlH7S6jrpQB1896MTZ1kL0T+7
         Tp0AG2Duh/QBUjrZqk1FArBXoC8wt5faHLHZZX9zveNbnGoMKmqWHUktCZjNUAgAiDfE
         W47w==
X-Forwarded-Encrypted: i=1; AL+hErGnVLGwphqh04T1Ung57g3RjIUILVs2QBMnRMyrYwRwmR9VPzbsXBZVMulvpJffM0Rz7fjzHtW7/jo5Jg9CJS/X@lists.infradead.org
X-Gm-Message-State: APuU4Z/71LuzOrQYijGeTBDa3w32/6yEePVFht96WEzFSsb3+eroWhya
	5XVGYHbXacnfTIbbephZazOxWyPZPVGWhDxWvwqGhh5l4hVPoCOcM24=
X-Gm-Gg: AYBFou0uCZNEyeFzKHCz52KS/f0EJbjL3V6RTmyGXyFl+gu4Fucl59gb5Cc1oO/8miJ
	bryCj+dN1iEodAhkj3bJi5kRRjbI0Qbl3d6h3PJpiSlLmL0tj9tudJTMVBiXBtaYET9S39u7hYK
	KpUYC98V27BWdp/sGoPYGpVJxelmGO9YQdCOVBB18yh/K4ELE3ubNhKkUTzi9v/f4on+WhW5v5S
	APjMbj1xO9uA4z5lAbigo1zGCBX7WJ+I/Xiz00mdGoPstd2odYwZFuwDm9NqvsdRRFanD5PGSh2
	hbxncsYoUDTnhltNH1C00rMePnemKcUh8PD91/nRlPSmW6BqIbgDlun2/8c6cXS28gW1Fs20uXe
	ugpSEvQ3XHo1yGZuWmT5RkWtvjNNBnEzNeHSVtm3jV71A/flDKPQqdzHkyrcijS9NJlNs/gaott
	uwQ8gHJAlPIdx1C3dMnZ828Muu4jbB/VjSRgBn3v00vsxcnY6irWRZXRkZ4kqoWMo4tQMwz5Pbj
	uYp3yGQlQnaMJHqFgFOFMUrDHn4nVGXYTRca2D4V88F7zDZM0VUhvYn3n4auYQrkv9SZrznBNki
	ef7fq+QQCmEJyfjxWZ7RO+6doiIz6nddUzz77bK6ZGAuc6waEidZhevkI78RhJ4z3DZRfA77pSm
	Zj+9Q2/L2z6batlAZgaWquT/JSUVEE/mbJbJ1h3Mzi/X+LA0+OM2/IFQckgiMZORwUFgnFSEHtC
	1qqlVg4BuinQMcXNcYesOdecbVf3q17ieUwDNWe7Sqb+Ffkva//yBecw==
X-Received: by 2002:a05:620a:460e:b0:93b:ef24:bc8c with SMTP id af79cd13be357-947afff0a6amr852657585a.47.1794467040229;
        Wed, 11 Nov 2026 23:04:00 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7f2edesm663463585a.40.2026.11.11.23.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 23:03:59 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] serial: 8250_aspeed_vuart: shut down the unthrottle timer on removal
Date: Thu, 12 Nov 2026 02:03:57 -0500
Message-ID: <20261112070357.38870-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_230401_916645_A52AA2C7 
X-CRM114-Status: GOOD (  13.77  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aspeed_vuart_remove() deletes unthrottle_timer while the port IRQ is
still active. An interrupt can re-arm the timer before port shutdown,
allowing its callback to access freed driver data.

Use timer_shutdown_sync() to prevent rearming. Keep it before
serial8250_unregister_port(), which releases the register mapping
used by the callback.

Found by a static analysis tool under development.

Compile-tested with W=1 for arm64 and x86_64.
Not tested on hardware.

Fixes: 5909c0bf9c7a ("serial/aspeed-vuart: Implement quick throttle mechanism")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 452bef82bec2..0776675b8382 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -552,7 +552,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 {
 	struct aspeed_vuart *vuart = platform_get_drvdata(pdev);
 
-	timer_delete_sync(&vuart->unthrottle_timer);
+	timer_shutdown_sync(&vuart->unthrottle_timer);
 	aspeed_vuart_set_enabled(vuart, false);
 	serial8250_unregister_port(vuart->port);
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0


