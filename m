Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B34606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WLqdFKH7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=o7X+t0LE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKUZZ05e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1MJvqtEQ7KzkrkQd7jNXZvcPx36rVpHnL5D10mePtG8=; b=WLqdFKH7svQxkP
	JBTcNuSW4zi/+xm/Vtsa2tO8zVhUlSZ2jlJgn4548wR3ISXzJM4gYuIZ2mG6TjMqWa+84G4nlYJpE
	BOhFTsakv6yUzr8OfXpSqBTMEj6oDUM/FXkATXLj8HFQcd2MrSnj3T/UlfC4pSfgCe4k0zo+Qeolp
	bDHx8cF2FDhw2WwYaXl09qSyn5z8ZCGjcMkVVzfw/E7b/TjhPkk1tsC8KDoLZP5bbKIMX2JILQ9bd
	F1wLiebPrZsW7XoBZmrRPZxBcnD9Hhvq2uq5R0Lf4De6+ARGO7gYtgk7m+FTlRr8xi7Ne13RcGFrv
	SyR6C47xqwAHw7LweHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO49-00000002PxC-0lWz;
	Mon, 23 Nov 2026 07:02:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO42-00000002Puh-2ScT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 07:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1MJvqtEQ7KzkrkQd7jNXZvcPx36rVpHnL5D10mePtG8=; b=o7X+t0LEJh7Y6ac0vw4Cd9JBBh
	660RBHgPZF6n+OKUcB4IaaPsNHwYinkgnn/9158AJOdVJg2389mNX+oC4Qa0LrUyPRkVn155m0OIT
	/IVZECaIC2D8S2KwOfzCffKmcxQW2x30ZNDJfXT1i7Dep2ozDUywHcKbUaMVvwNmh6ihNkSQuyL4O
	a8MDBjbOrp3NWYxb0AXHaOP28PsYD/51QY0wfPAoThSXgwYMV3jqCWDqy9pgcpOfJ/sKBB3U7wUag
	st7rRwXFWxtB2jalhV6+GQB7TL2ufrIAcY392x+Zsz5nyXi0nNbthqgD3l5tFGsbis7fjamEw3MAW
	6cr13dzg==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO40-00000002nwD-0kLG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-491846221ffso2422323f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417326; x=1796022126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MJvqtEQ7KzkrkQd7jNXZvcPx36rVpHnL5D10mePtG8=;
        b=SKUZZ05eQQNob5AxI9l5hzRvfKjgtcUxtBIS+tucPYr79zj0YLAT4rbLRs1e1E26AV
         hSwyCRknbtHG6PNYimv7ZSY0SSIK8MwnGUWuce1q0sHzzJ/B990JcdmcsM7wn4O+WLhr
         woRw39lzQmVITfNFu9TCespAEAtRFQ73lE15f1NHeK6afRl/QcqNhR9iXMO7MdqT+hOv
         +11CSNhJudtZnKYLpPjlDqwcqW0gIzi5LUveGq+T8PZpzW0YVtEy8yvn/k3WSlrwRlCc
         o3iVZv8wf/nCeYwUDLowxcAtq+sj++MbKW+XE/tU2e0M88fLIxoiHsJ6zww1r+b1b0jC
         ko9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417326; x=1796022126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MJvqtEQ7KzkrkQd7jNXZvcPx36rVpHnL5D10mePtG8=;
        b=ZSURWz7HwBFUSzckc2OUoaRICI4pNT2GPPBL22SuhvpJOzeNIgCs2j84cbKwP1t6oY
         HiVBeNtughcsAr+bZYlx4p5dJihWOs5YXQjblPabuByj/LNrF9M9AjidbaK8XGlgsPQv
         FaXmc8LWOh5QiwbpxXXi0jh9goaMC13WOLrSXrk0ugwK8GTVn7Kelak5Dzp21/Vd9Rf5
         /yYyX7FsPkq6ERww4iFE5SzweiLkrr8Qm4VWn6OZY1RU3Uy7nE8yRCH4Ka3wzE53PpSG
         hJiKOgcxeVvyad7TNchpJqbRTGxmy2bEmlyzNucGiCd4D0ij2Emghig6ibSWkXBHm4Ij
         EpMg==
X-Forwarded-Encrypted: i=1; AL+hErGMHNVxwwdIhHX5lOKJFHpbtwLHFXlTivbXZ9lysP2fZgoyEpHVw3DBNZ9KqrMk4jx7LUNP8rAK5uDVe+Rm9/4V@lists.infradead.org
X-Gm-Message-State: APuU4Z+EDGc/tSYuEBXTOJrxUNJKcaHqikZUXN3HXIfilNOJ3wZ69Kf9
	8zm3gdPjkCXBrvR5DCJx4CXNKa3unl1mlWXCzWIuN79UrCukRL6uEA4J
X-Gm-Gg: AZFdTZfi15sdMyLyo2m4v/Y2uVkJIgS9fJxQH10zkWMkMltg14j3iM/hYGtX/LsDe5B
	ZcKWUby+CELdfKbyZ3VHrlxVOkDMN+sCmjktdtvr6uDbkTKz8lTXZ9tHbwovX+iR2L6zJzs2QdA
	pX8bqYuvhBJSDd/Yholw5bU39eIdpPM52oI2b2jCkMQ//J62Cquxse72zy5EDABkmLOjJRuXD34
	5AeT5h/cwuLRdK99lhwO9JgyZh8d1ZLgMNbsPIKDXLIrQaKNMaRslz3a1CN22VLHtZdLiMKGlow
	FZFK2jwTNK2zmNyo8P5GSYVR1yymtdCdPIt5ou7ndiPDYlzIS9P+mqvjD4EJodQmUj0N3xLc2Iw
	zM4Tfqv5UU8etgpiIhdj/8GXim9gETkOu+RgJphnt5ykBZu0c6XVBPa9cPLqnsFJl51Pnf7DSfX
	xC6lKsCI0E/A0YtTQz45kNokHydxzXy3FlXBujE+O7f4xNbdvVzBadwf/CuCgHw9hlfcMg7KqmD
	vf//6Yk++Xpsq8vjOa2vg2ieMIZEDU51yYkSqCV1Buu8xgrMfDFgugaYG78Q4penX7A24HRIu5s
	Uw/fhA7ZQbp5L12OyS8U0pXXBdivPcLgMulN
X-Received: by 2002:a5d:64c9:0:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4abb1baaaa5mr21008231f8f.15.1795417326388;
        Sun, 22 Nov 2026 23:02:06 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:06 -0800 (PST)
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
Subject: [PATCH v5 7/8] iio: adc: at91_adc: use HZ_PER_KHZ instead of raw 1000
Date: Mon, 23 Nov 2026 09:01:00 +0200
Message-ID: <20261123070101.53868-8-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070208_107080_A0495844 
X-CRM114-Status: GOOD (  13.28  )
X-Spam-Score: 1.1 (+)
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

Use the HZ_PER_KHZ constant from <linux/units.h> when converting the ADC
clock rate to kilohertz instead of open-coding the divisor.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 05e8b3deb043..62f8db630640 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -21,6 +21,7 @@
 #include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 #include <linux/wait.h>
 
 #include <linux/iio/iio.h>
@@ -1094,7 +1095,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	 */
 	mstrclk = clk_get_rate(st->clk);
 	adc_clk = clk_get_rate(st->adc_clk);
-	adc_clk_khz = adc_clk / 1000;
+	adc_clk_khz = adc_clk / HZ_PER_KHZ;
 
 	dev_dbg(dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
 		mstrclk, adc_clk);
-- 
2.56.0


