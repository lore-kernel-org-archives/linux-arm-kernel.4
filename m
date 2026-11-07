Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E10606D807
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1H1sKX/2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8yVdBWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=; b=1H1sKX/2pPWwDT
	vFHSw8oEtDB6Y7T7Kc6LpzGK0a2gmZUimD43CeusInBe4s74hfw0G+ipomCsQfANpf+pAs5dwWoqm
	E61y4D0Y2mxFMO5qqoEVvzKHvAXOK5LvgNZ0/kDX0sb3SioKHofHeknAqjeVGMh4ady+kud5JOiWO
	qW2DJmspmShdqdVzQIuhz7IufaYVHDH+68b6K6l2VyOFi58zFXn5dvJaPAH2ZEJKlZ95HlCAtqSBI
	N+yMLeF5TW4viMbZCa67f4z1ISlurS+nD7oUs9PT1p8DtLbYSs9Rx9+xEZ4T0t2iAw29ZW1Tq9Go4
	bGA9jxl2gMhiesORR0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3Y-0000000F9tx-2U9P;
	Sat, 07 Nov 2026 18:22:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3R-0000000F9o5-0EFb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:22:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4b467581b98so13104955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075735; x=1794680535; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=x8yVdBWh6eBV3zN1vhztNk6QePKMesT85mHzWdKUzkQqNiGw6S+nlfWCQ/70Qdvd99
         3EoQWuEt9J7gE1G+aK35Pywd8nvca5HnYOWdcN2Xni9WggW2OIshgFmKGBfYVikozObq
         BgILtWojfIJhiBITp4LqjNC+lLoX7SVD1N8oRRl/wWsF4JkVyo3Ck+yQqMy9cn1lYgDp
         AEr6XaOlCFWALKA3mTg+w2AQvgha6qFDNRyybAULpIAsM7NcXliXf9zEmfHXN5XHXwTe
         i5Tdnqaf0CXKPbatkEh7PBHUtvEwM/QGmm5lWL2mJ1Ujz4R9CPtfblYM1QkLAbiEasBc
         hA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075735; x=1794680535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW6QFkGd7neo8fg6RUV9wkGb9LD/OTXb46vxR11jHYs=;
        b=TaVKGgek9Sr4nupheYfFklcQzsEQ+cWCOd9GHDGMo6WS5vdi794ceDYEiEhxMhqB+P
         q75d05P/RcgvECEuV2SowlNd09SLxM2ov+cKMJCNyifIN5nwbQSSjY8M8Ys+BErUtasd
         GxQq7ZSJdueHjhtpQYR1G32XHu4/hFhb94QkLH8vrWBybXuCxnuNi35uJXzthmFbBIWM
         q/YkWNPGyp5Hxsm7yEuVFANwtNogWOcvN8PpVzCYABgtmzzQPvs1SwRy1cvVnmS+nfTy
         fLWGn87EU85aEN3ORuXcK0ZIOqmxB9kFuJTMUXVLRUtzav5CaS8M/F2WQJmkoQBLaOyF
         09Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwYno6qXB2/HFSMxGgZ+484ZwPfZxj8zX949SCPC274LkxdaUNEvRkd0+Pv21xaMMBM2+MULX/4ixbHGBYjGZQ2@lists.infradead.org
X-Gm-Message-State: APuU4Z+PGvf5RmbRaxNaB2iiMPoKlFL1rcV6W81wS+6o+KTlv6cRmlqm
	FHZfGCDiyB7eBc3neuy0BySPA3E10uGSV+dw3xLAEGNviMjRBI41KXbg
X-Gm-Gg: AYBFou3s1LNVCjYy5xO94uM+Xlr6xS3CXGaCl+Glz+RY2ne9G99kKlPklvokW0MWpNJ
	kdG0UICJfx8D6qmwilty45Kd7N+WOT0mP/q55+UCbae8bJ3V3GJisAgBYou/fBixTMQgyvP2ju7
	5l+ksrrHKyH0laNxTjN2nn64wPian78pVBHjlVt0A76k5+wcxDNaanosrrdyLPkBkflI5ycV8ic
	XJZI035KNVtzdcS4IGqmcqacGwv9uzjzM+c5Z7upZiANu3tTQgLvl8nt5s94Kp/k3bJWM3MknCa
	IikcldA4za2ousU4UJ1QDt7tjFQoaHnGDVqGHztKNl0epWV7eR9zk9eR8wAlhMFk2fezIZr2wOQ
	6t+0vbgUtf6pMif7uH9UcvalcC6fQPso+vab2iBRa20EgG2E1NnJw4YusXBU7bCJKzi6FJYKywa
	lIuMCJmKd89TKcJxPeQv6YlsYn/Jpwur63JxvtmTmeS2pRf01y739boBllEds+CMkuJfXr+v+GJ
	8WJLHzAe5ROxIi7N4Ro/ob5isjor3tAgMjx/QZ6gBHJ/l2NblAbxzogcH9ccKv+rPWvDa+Y6xUA
	rBakOApCkbdQnYHWpV7AEZ1eR89uGb4bq56sQq9zyLnMJoZvcKVOYgV9FxUE971UGSJV4UWoThN
	YR+cfmJBtvSdctp0=
X-Received: by 2002:a05:600d:82e2:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4b6df6deffbmr110679175e9.25.1794075734861;
        Sat, 07 Nov 2026 10:22:14 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:14 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:31 +0100
Subject: [PATCH v2 1/6] firmware: raspberrypi: Add blank line after
 declaration in response_callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-1-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=641;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=oT/JQjeja8ZJ/ptNbh5as5O7phAoJf3oIOYYqQOmlq0=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVMnfEP2TO+oiRDwrTAxKzhsHQjuXtWzrj9
 5gP9eekUcOJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z4ifD/wKSyOFDfXtz3emcdtFHTQzLEeOphtdfj8ZonH60pWC/jo7wuJSwuCddoVKD/9BvKRXB+U
 IIyRnOY4FNKKMZkEW0SqIFH14r0j9ZANA/CBqjJ5MFqrGpxiMgL8SsdPeqG4jyaTySgH+IOfO+a
 jCbHKv+ebLFeRNFafNTbEwbx2Q1DNLwFaekcZlLcUg4t+1diQtJ987s7S90aXRILodT4IcNHcsV
 Kmff29vG0BvtUvaEDvys10FOPPOT+7YTYdIBrq8hj8bYqxk2zU3TSPGXsEhMjtnwZQtpHiOZrA4
 xthOJ8uf9w6r1plx507zqeK8JJja9stJgDhRNBqkslu781LcJGt1hq9mJAtwBCtdva9k5jFvTLQ
 jXU/2/tYgAm00KSS5DwEDRbCG+Vq5sFAQmgU1IUUBI7pPIMGQtxRp7JCKQVt/KmbnuNc0aUDmhn
 VHZKDvixjrbep0Gy8Ok31uGPDD6W9PNfQTqKbxOI4vnThwS7I/Kj67lJR98H754mo17XdJvg07S
 IGcgu2zAEto9uRMxxmusz8ylPK6QPjzg5N1ZhD1MhYS0aGDzAJJbQGqR0bOXgMbLGtATTUabPHo
 tw2RZnwZwOwbJXKUU07GBqicUQaQmoiswFlJmwwl7hjPkO8OklYSoPbAgegkI9HwfpxmBCke9Xu
 eMKqF/G5AubmQvA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_102217_109706_F751CA00 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Add a blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90f..8f3653c4a669 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -40,6 +40,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 

-- 
2.56.0


