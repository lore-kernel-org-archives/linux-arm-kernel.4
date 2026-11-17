Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LVDzjr4h;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fz8w9lRH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=evA50aPqc3DFC7OnsafBK/uchzbfQmhK+e2vPkGMqcw=; b=LVDzjr4hLEgrnh
	7jGei873ZbRwAg2tmYwI0WBqWEC+cjzFpKK0GKACTZ2xd0idVRkkdfJyxulh91fuL08QvVTmK99dm
	VftzL/s6jLwoRYIDujWdpz+/CNAR1EQ82VBQ01UpGzqdlwAgur/BXPNH1qBAw3O8IFRiZ4BfCqQHZ
	NbMVzApGYsRHZJWeDlo1dtMQk485pmOTHSxlgsvAU4k8LMmW4rMEf+4KzBDtbV8OBL9V6B+YlETGx
	ICa2MXQ1XHtjBhUqqmlxO44dwQyaQx0zs0TQakgIUM3sLa3WOPD+1xD2/sv2sov1/8hLMxi0qYN32
	Q6K+y57rFoEX/3v7kNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJoi-0000000635a-03GN;
	Tue, 17 Nov 2026 14:05:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJof-0000000634V-3JW8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:05:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1972099f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924344; x=1795529144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evA50aPqc3DFC7OnsafBK/uchzbfQmhK+e2vPkGMqcw=;
        b=Fz8w9lRHgunr1kU7vxEvTmgKEEaMiPsV+DTd6Yn0gFpjWQqxejBw0B6cRh0+vW3XO3
         tTD7tQEFRsaUml8W5eXz5wWTQyZxX4gzIMcnQWZyj8gTxBda6uveVflv6aBNOCAHD2Hc
         FpKz5YZaGoucHiD4KpQmfO3amhO5RsN9tsFaJ8bOZ9IrJYlMXj3eRfve4Y+Wz2v6ddUD
         V/UqhfwyCdL2L7jDPGo/R/nSlk3B8aJHISptONvFIbZ0pPgADgRP+8Mh0xeqMNFeelOT
         1+0RBKJCTkbRZ8u3xxNN94JIieBUrz+M9dCf8K5ZkvT70ftAjfpHowLxaLOf5tmKi5aD
         q+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924344; x=1795529144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evA50aPqc3DFC7OnsafBK/uchzbfQmhK+e2vPkGMqcw=;
        b=vDPUFUiE5zJ7mf7r31cZw03QBTDZCWRZXvD3050lim2+0S4pSTMHCIjJ1BBLL1vX3F
         pHkTSW1z2c/+sWAxKV5lk7K4a8daR1yb9SgEQrRaUI0A0G+oag6+WFs/YYRa419YFH/m
         WIFoHohQkTEALqn02rBP7zxBNrE0ubZ877XsuptwJXqOeCAdDyXyAKl2T4BomNigv0WV
         TYsozAG7jWxByAEIC9MrcDn0RdiHXZ8h/QmF60j/M4LWRprRZ66yoMt2t2dth7S/ydSa
         CumWy/4cXqrCAw7qMjKDr9PTXuiKgOkIgdMgl06RJX87cI5+vX6azCgshs8iXdNDn9AZ
         Wfhw==
X-Forwarded-Encrypted: i=1; AL+hErFYWZvTGMSEmazTy0BW3JStX+h+gKmGrEb1bxp7lnYYN8dviQ3Z1OwnQ6Q05SsuBKt3Wq6pOVMYkMd+FPvDhIKp@lists.infradead.org
X-Gm-Message-State: APuU4Z92uwOX+YMbD9oWhTpDJvl78zKHYqDyV1t86CExD3CDC0wj6ouC
	QzvNzSmbmEOrG4NaS+AZD3YB6Fv8vZEANvFguJGAeH6c5Db/AyBqUFws
X-Gm-Gg: AZFdTZdKJ+538RXDqfDGSzkJmWgh2aJZq0xxGQb1ORvMJ4Qs3YlM27EBHfWmTwxw/EG
	XM5r+S9lEtZMgqkTWvCo6WOwdaffe6gMwGWKpJAvRA5ri301oYdeN6BAS4ZKKhC2NZu2Jx1OvAI
	4elW0oZ0QKOPktwBzUW/aRDkeSzHMhal2ER+ROlhuDSDpNZUVDur2ViT8i3C+re2o27h6wT5mKw
	zDj64x+dnqyoNvk4tcS1essvaazQLS5jT5/vTSNkRz8hzfrMPvqzysO3cODe6xaBA/aXRWCJDHC
	qgswhy0l9knW558dmo+bSSOEU937fg/WaBpyZyTu7uB+vzvShk7D74stRNpdU8dtgJ1UWExLVcW
	S+A8eykoXOAmG6xZPSFLFTtPgnuPNTIc9p4Jb6pDdAx2iPNPbpAYG33KO7M0/FJ+J1amfsHDVLu
	4WzTx2hdlIzW/6meko401kq6avdrq9e8R7QeYA3vhwlN2xmZ/0ebmdA263hE+Ab1Hu7Wv989vLx
	9MYv/IcuolAAbxLmK/tA9OQnDVM9Z7uBMfsbfsmh3MsL3H/whL8uW6bgtzAJNcTTussTtlZcaYu
	vKZGm27tNR26lF2c+Qn5y+uvDCxDSKXfu0bxXQ==
X-Received: by 2002:a5d:59c9:0:b0:48e:bf0:352 with SMTP id ffacd0b85a97d-49c6e68da9amr31383557f8f.5.1794924343919;
        Tue, 17 Nov 2026 06:05:43 -0800 (PST)
Received: from fedora ([154.183.162.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm2623032f8f.8.2026.11.17.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:05:42 -0800 (PST)
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
Subject: [PATCH v4 1/3] iio: adc: at91_adc: fix NULL pointer dereference on trigger remove
Date: Tue, 17 Nov 2026 16:05:08 +0200
Message-ID: <20261117140510.391907-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060545_842355_EF638122 
X-CRM114-Status: GOOD (  14.09  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the "atmel,adc-use-external-triggers" property is not set in the
Device Tree, at91_adc_trigger_init() skips the external trigger slots
and leaves the corresponding entries in st->trig as NULL.

In the error rollback path of at91_adc_trigger_init() and in
at91_adc_trigger_remove(), iio_trigger_unregister() and
iio_trigger_free() are called on every slot without checking for NULL,
causing a NULL pointer dereference whenever an external trigger slot
was skipped, either because of a partial allocation failure or because
the external triggers are simply not used.

Skip NULL trigger slots in both teardown loops so that only triggers
that were actually allocated are unregistered and freed.

Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..c7fc06214c05 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -660,6 +660,8 @@ static int at91_adc_trigger_init(struct iio_dev *idev)
 
 error_trigger:
 	for (i--; i >= 0; i--) {
+		if (!st->trig[i])
+			continue;
 		iio_trigger_unregister(st->trig[i]);
 		iio_trigger_free(st->trig[i]);
 	}
@@ -673,6 +675,8 @@ static void at91_adc_trigger_remove(struct iio_dev *idev)
 	int i;
 
 	for (i = 0; i < st->caps->trigger_number; i++) {
+		if (!st->trig[i])
+			continue;
 		iio_trigger_unregister(st->trig[i]);
 		iio_trigger_free(st->trig[i]);
 	}
-- 
2.56.0


