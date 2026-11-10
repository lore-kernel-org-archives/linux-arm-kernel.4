Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB860A3803
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0t3EtmNp;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MkXAXoG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=; b=0t3EtmNpdRtKkH
	AyYZz2+ZHHL8EwZm7GuL5zaGaBpETXERe1vI71N8w3TmJ2B7g3ekbt971zZkxtrVnhu20SxSkqtQ2
	052Q+czHZ4Qv2X7eYhdVLN67rep6dnVzu+rHC18owvJ7SQ2rzxmP7GzVXpZ1Hm8CgmIZCGCQDLNNF
	eK3LP3H0K/eH65x3DaVu0xKaELkHcSMeH2S/S+1AJQpKFMZay/mTCuPUzJzkdp5GyrYb0GwlMerQp
	+Kb/51/NevbDEgzrZylsC2wlNQBNajqvAa4hmW/D8QfJy4g6f5GJ0AgTw294dzy2d6QpMX9lU7klX
	nZ4CylFPvw5EkGGwRECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtop-000000055sO-1KHQ;
	Tue, 10 Nov 2026 21:55:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtol-000000055pb-19Cp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:55:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so19848875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347750; x=1794952550; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
        b=MkXAXoG28pJvjacpz2PcaKqO/nJg19lJAlYzb6akCQ/kiy6Hhpje5eCigATjoa3ech
         /Hh82vplZgLjpG/D8fhzz5WTnbc96uQ9K2hXXto6HxJwoQheLl4mLylecGbGEZITd7bH
         NA3QGppCHe60pJzdZaJqtRJN+G1nz8zh+YCYObJEdw6OlxFe12mY8UzpK7iqcvRGhYtD
         65cii3C34te9tLBYdR3dWurM9bz3VWJgPTjBzEnwfpQITEaRZhVsuE9X8xS9AxS07fto
         rERe7mpAa8l/ZiDc3U992K8t5+ah9qd1Q8G1gDDDMVPV0ZYnG1YzFcsjb+IV9Ff99GNN
         VPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347750; x=1794952550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
        b=mqvHEuC6PuoZFw8ep3uflOAm4RjDXFSpS02najB08zbleyPn0PnIOq2xtm9QULXDGl
         LhgIYXODI8RnyLn/sDIjWH6tiITK32O93QrGNeuAslS1H09cavtNH/2P4HezAXVrPc3h
         LF9alDBR32wwOkM45/4eTQy9Rtcjv7uLX9hghmXmVFAE8WLXgoUZgxyC4Q5juk05zxC9
         00V7wAJBX0bFGegPxT7vmr4DZvmbYyOlGwe0/KnB46jamQACEEvyK07WJmSsLj7/hBCe
         0IoXcx4GFZn3Nye/9sEFl2wquR1DtjJ0ieEJIuTRlUo1dYpGsIq+RrrltHrRZ/xsl/sw
         3gXg==
X-Forwarded-Encrypted: i=1; AL+hErHai8RJlb75lLFWIY2c+rQer7psix8GACxiA6Xe8GWj58bpMkR65+lwMRNq5tL+m3ZhixZeYIeagD7Rlu9+DjT9@lists.infradead.org
X-Gm-Message-State: APuU4Z9AoaVoBUkF1Ee5e1uFHO32noLVPcgCOhPuaKTtJmcTg63IeZeu
	VdKcvJfJ84HmWBU4Eqda8kkb9fZ6LFWdJvoH7HuSAy6AqckimQPWYrp4t9BWHyxN1WQ=
X-Gm-Gg: AYBFou00gVLJdlP7h0LlbHiKRdeQLVRJhLQOwUXbaGUX+hFHCL5o8Zvhr0SQE+kRWwW
	QVbtn6NJ8/LBYNYfTNjEWcS44/DwYdTfBqC6wAL9+mvRMobvLBuS7qSoYW9NTakuuH3PyvOv2su
	1kUdoopzwLVqplaKx7QASb5kDNJ/AsL8WOnwuEEZywcfiEKpeve0tQq9z5NlQKmNXkCA1Fagk6r
	fmJL6nQsKK6tRLcPfxfkwwcTNsHoatL2HyD10VQ78MfvEW3Xu1oSXX7w8WiCP8fPtEv4NBLy2//
	O/y2doVAgzQOvxHAouqf0vIoHvX4Pk/sINV0M5byZgAlzZ2dxY9Bn1doKGvnw10zp3SjhgRJ8+D
	Bxu9Ehz7y2XPu2g9ammAPdw0aYhvWWwQoag/bOVZFlHfkbdlOt1cVqepSthMKJWWZuNN4GgfpUS
	aP+lLlKzx8f+mjqh8tKMW0NNqo8lgjPNriwRtN/xlvvKprXNiWS1+K38Vix+HyvaX3qSGSrbcq+
	Ki3ZssDGQ7bcG+EdGn3yrC3/m256cCbxclQ1AfeR/1E+L6q/fnlMSeepw/aLQ0FyIALnwrN3wm6
	xRSkzisdb0dJ1lyj1dYwl4d6cDCHTy4PqA==
X-Received: by 2002:a05:600c:3ca2:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ba0935dbf1mr6324345e9.9.1794347749735;
        Tue, 10 Nov 2026 13:55:49 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01d9df5csm109091985e9.0.2026.11.10.13.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 02/20] mfd: bcm2835-pm: Drop unused header
Date: Tue, 10 Nov 2026 22:54:27 +0100
Message-ID: <c3dbfde231fd08ec74b875026bd820987934f620.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=UdHoeNWC/wFvkdmLuQarAQl9dCSespRdlpxDjltm++I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KXl1OBAGE23elaJ3Rm+dDA0IlB3w1RSbdY+ 43FtWNovUqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSlwAKCRCPgPtYfRL+ Tk3gB/4rjRvfTFLDwOwuaM8jz3V2FahhT+hj3EGqSUhPRPVY8DhvhnoGuBfwkEu5Dp2fvKFBjUA PGsBBpPjWf+Y93zL2Gs7GA8yxo9a+Ljp8tjD2QeNaiTht7AgUSwWa5AXDavdKJhDxWEiQ9DZOUv WkaXrjSkHBs97VS35AH0wYV19gbLycmKAYp/Uo7ffHSnqJxn+E+Ef6yz5tzvjIxzsAPyaPWKqC4 2GdVeNIbY72nbJqmrPQfxz6hhF9R1es5kz+IXcGyePWxGD8NSVM8nPFcZuiG1Sr0vMvPzN7SDrb 3sTc4pcDkCPLLetAg1TmAlTJ63wSusk5hpGgKhwQsbiA2ivG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135551_331747_0B5FA7A0 
X-CRM114-Status: GOOD (  11.40  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.56.0.rc1


