Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZdwGcqw9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNWE5A0x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6akX7pzAHH0ivf8SsSGJ7CYw3qAkgFrjvzXEYBsaGuI=; b=ZdwGcqw9Q8pMPkVcxgp8gEwYPp
	LObeYfDkp2Ca40/RLUWCZaS2j5DTBAAwV4yYhBLVqdFU019drVY2g5ZuDwH9KEoPQn5n3lSFpOsy7
	0+9nT0SLV7wtmX8lRGvGmIEplP4WPT2I6AZpSIxJceACe97rR0W5FdXPL1UMS56gSBrA+Xm7gISK1
	CEwWhZL4x9LtiDysyaiYL2hTgYFCyGQpV+02vrSI5nFTGjOkMQuWPPs+5USH1/XtP60l0Uopp2cCs
	8SDUjhTRgKSahs2UM/pgW3pz4E98+mB/8qXPN96EUSpBrMKMO2t+LnBz0CB4lbih4iYZdGaYJscrt
	Ci94rQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2qu-00000000rUB-1Yvo;
	Sun, 22 Nov 2026 08:23:12 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2qo-00000000rSr-3YZa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 08:23:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so983315a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335786; x=1795940586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6akX7pzAHH0ivf8SsSGJ7CYw3qAkgFrjvzXEYBsaGuI=;
        b=aNWE5A0x8f4qgSQ+4jw64wHkfdkpsJS+nH9hIMaFjXgMgbctMPd/mSxsEtk8ONIMnc
         EKnxcwimtfOaicdp4HJbi+Ov2lcY2bLkgZVxaS9LQ1mtS9jeXX5H1VHWYkfyo5w8dhCf
         tUS2ZnPszAL5z3eeAbCGJuuYZdWkh4XhQ1loTq3twuKNSLECVMqwTqsWleL0keQkgESW
         7y+bcUi9yD+okqaz5X5cnxCUTU/g5fG5ThGna1pFk1bf7LJkMzbUyjUChIF/SpGWWwev
         6HTWVcqVdiubmv2B3YLpbcPmGdVzjfW4I6gVhNxc2SVE5D8gXHOVwSLN5UJfvDu7fEcK
         Ov2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335786; x=1795940586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6akX7pzAHH0ivf8SsSGJ7CYw3qAkgFrjvzXEYBsaGuI=;
        b=mm7lCHJGM3s+E0e4DOiQJhWTcMm4/oqiQ9E2wM/CMynGOtyykP9TZ8RUH6DzT9cRll
         K/+8ZmGzEujvWTyrM4QimZ4EeCg4/LsO7s+YrA3pe3W77iojWGdp7Y6zGabfKx/qSxQZ
         0zqyN9rzXOyhe/QW23r0c5oGpLDc76oLfiLdGrB2xtXOsRub1SyY5l5ixM2QXtXwB9NM
         pM3Miy6qN6QAfQH8TBit5t5xFnUwIA0Yyc9Ry10+tIENgmpcBTgqp+re1EaqMBjH8GrP
         3WqhGLSjdLkS5Kcjb/z4Tcj1wn+aXMc6lsyG6CH/Y1P2oZ8h8IYp4hU4OKbYNWbUwz3Q
         gUmA==
X-Forwarded-Encrypted: i=1; AL+hErHXcend5vU9Gdf19iQN/3bkUH2bR99BY6lDBrP6bwyMB8021u95aCjzetVh+ZmebA+TIoXLYzyiHp3nmox/6s3U@lists.infradead.org
X-Gm-Message-State: APuU4Z8i2b2LePxYFUqyPPTYqqYNEGMtHV4UXhIG5IaJJDQVf1rOliDX
	hHU7ZQTeFPUyJ0+ijcOqM5nH9vHqNMByWOQCDChvWV1bSDrjJXQGDiWoiPpCUg==
X-Gm-Gg: AZFdTZf8qqE7oCfMRCQosnt1cdDy1WqX50xEbDjUMEYZm7TmgdMviYazAnI+DmyoYHk
	PbHjPd+VEaQjMSiFhYQBwGUlJ2FFohBbiIHNnkPupTC/uaty9DdJleKiqgN5NjQPqVNlMV2R6CM
	fD13QybmHxWBR+8cYJDU1RIfWvMsB0M0lB7sE0wcuqBA4y7Ae+x4CznV0Jzl36hbahtMCshydGU
	5BmqKxWq3bd+KsgPw44AG+CTBsdpckkhjB5zwe4Mb/BcoCGSUbC0ji6erVGtj10NUjaOeMdeSfs
	z+tBJnWmkRXAxK0yl8xBPMMRlsyFZXKrAY/LgG8r3SqgHUontuoQMwkaaHp/a8VlBkhC2iaRt8u
	M8rdq7/m5oEsxSg6d2LgXEPkuep5Q5mDY+pXULgIAH/bfMYufREcB7Zb+FRFD/hRSVGrD1NRUnJ
	6lOqs2eudXNm9H9aWm9D4hAnkYSjSQm7QDRPuPQ+LUyBBxytmTWMNGd1UvM2KgSQKaUwYue76sp
	AJLnPigqb94d/tUSPaUxINTRvVhUUWqhmkEw8Zx9tcml3+ItgODs0im993kvP81982q+NrX1dbK
	BpOAxCEsBgy+3DGcOphmLOKi4kFTRO2t+NlloIfiwekl2h5zmA==
X-Received: by 2002:a17:90b:2f8c:b0:3b4:1997:3495 with SMTP id 98e67ed59e1d1-3b41c9613bbmr7277675a91.57.1795335785650;
        Sun, 22 Nov 2026 00:23:05 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm11723350a91.4.2026.11.22.00.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:23:05 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: broonie@kernel.org
Cc: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] spi: bcm2835: clarify native chip-select fallback
Date: Sun, 22 Nov 2026 02:23:02 -0600
Message-ID: <20261122082302.170387-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_002306_912286_6A5E83FC 
X-CRM114-Status: GOOD (  13.42  )
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

Document why the driver uses GPIO-controlled chip-select instead of
the hardware-controlled native chip-select.

Also explain how the temporary GPIO lookup table is used when the
device tree does not provide a CS GPIO descriptor, and document the
fallback's limitation regarding the alternate GPIOs 36/35.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/spi/spi-bcm2835.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index cc5748973281..d4c938fa3a23 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1310,13 +1310,16 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 		return 0;
 
 	/*
-	 * TODO: The code below is a slightly better alternative to the utter
-	 * abuse of the GPIO API that I found here before. It creates a
-	 * temporary lookup table, assigns it to the SPI device, gets the GPIO
-	 * descriptor and then releases the lookup table.
+	 * The hardware-controlled native chip-select can produce short
+	 * glitches during transfers, so use GPIO-controlled chip-select
+	 * instead.
 	 *
-	 * More on the problem that it addresses:
-	 *   https://www.spinics.net/lists/linux-gpio/msg36218.html
+	 * If the device tree doesn't provide a CS GPIO descriptor, create a
+	 * temporary lookup table to obtain the GPIO through the consumer API.
+	 * This fallback assumes GPIOs 8/7 and doesn't detect whether the
+	 * alternate GPIOs 36/35 are configured.
+	 *
+	 * See https://www.spinics.net/lists/linux-gpio/msg36218.html
 	 */
 	lookup = kzalloc_flex(*lookup, table, 2);
 	if (!lookup) {
-- 
2.56.1


