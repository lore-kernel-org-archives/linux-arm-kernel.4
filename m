Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEF606EEA4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=35/Tmdo3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bJzc4Til;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XxUTqrdA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZCrkWQWMiaMa6JQ/PNwOBJBl6GAAixAIuZLzVajf/gk=; b=35/Tmdo3fhZzD/
	GfuEky1G0lR0Y3vZMrUP7FTg/44YOGa2QKaQ7uKy/K2YuJ5IJZTuKYIDbuHXkcjr35mKoMobCAuEv
	tINTHfVSHE1IF6cu/e7ZH1NMxTwBfTk7zDg/sjA4TfUv2TjSG1FLP/qXkXiCp8FWpPYzcpvAwOtia
	ZbYRgbnlVwRBlkn9kMTSy5lYt9FyT/nrA7ke7Uw112EhC2CmfWFIwKyH4c35bMa68GKP3TM1IHeYM
	REn+eQtTpNvHyh2Ea+7jCcH238Jetm5hYeuypZM2ouYShzXbjrmZCjQehzhif9G+mQ/4+swWTltyA
	6364zzLi6k1HMPJ7hrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRW-0000000F0cY-2bRQ;
	Sat, 07 Nov 2026 16:39:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRL-0000000F0Tb-1V0s
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 16:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZCrkWQWMiaMa6JQ/PNwOBJBl6GAAixAIuZLzVajf/gk=; b=bJzc4TilgIv1sZZb+HrDj4hbXK
	5aa5QwXgD/90ne8cw5d+gR+SYWrznPQgff6d1ani2wSE+K/R6ZC+1E0HHNVkCZTy7mjAd6bBkMOSP
	U/4QLPq75OluGYzouCx2BmS/Wzvhg9oiwUE0UUbmZOFtfQZ2mf1Qy9ZBY75Ee3raOeYB9wUxyx+N7
	Pq1wURkF8ZS8hzgDl9oi5lEdp9813rOPbrIyIR2yQT1lx274/OA+D/+ypajS4k6GQDJIai3b2+Bte
	/SDMOZ4n9TgkHb1sI6KFoGO/yhsrGqx7UJA9l94Gem3502DKufKmmszDMvWX5VfDtt72R1PtzSknA
	gEydCDsQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRI-00000005KGF-36tN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:38:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so14982905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069527; x=1794674327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCrkWQWMiaMa6JQ/PNwOBJBl6GAAixAIuZLzVajf/gk=;
        b=XxUTqrdA6BBX0s4rAJ65tVlRf9VXdI7lQ1PgG9nheZbd9IPrnNJzgTq9Q6wElkR1RH
         eDiktJQ1Gs4ekG7+9s7rV6iW6ep1P9+TpJeS8nMPi0KrA1dtsVb6aQXeG+mytlFqyVQV
         uuH4Pfu7KzyP/ZC4+CL6OX5Lye4KvidYWLav4IKGvoYaaujttZM1hbpZBMXByB6vjJAp
         sVEq4OPbUiU1iicNPzlAJ9A5BpOiwsZbUzQhbBGUR5ZKxyPALbD3rPZoSRCcDScULChA
         YAR5xLzn9exGe5PLISR8zhs2SOk7p24UImiiT8hy17gPVS/PTvaqBsRr3I0gDCTkc26J
         GmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069527; x=1794674327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCrkWQWMiaMa6JQ/PNwOBJBl6GAAixAIuZLzVajf/gk=;
        b=PMEwsfFObQj9CfekfU79hzibWPwL7raFGC+ck4cqVbydWOMMHKOXNxyAOevItUxDyL
         5F8NecZkp3pVE0V0oHUjGgd80BB/gdXJHntrlH06v79b/JEFus8E2qLK8tcQiTSp4xNB
         dVoO8t9fZSwjh+jmOPxt/DHwYRo16OYCy6YSyC3gXPVTn0fBhZuJhwgidlDwqKmmV8zL
         DgKvPnm2XTfWOfbS7UxsodFsdCoUoD65SZ6k5OlNFZL5qM1+JebkobRK5M6DbuDfFL10
         VJrHKvCzPGHLtguHgafx/zcl/YDbXoCw2iybc11ah4NVfrXm7FkrAOU0owTU8Qi9BMPw
         E61A==
X-Forwarded-Encrypted: i=1; AKwUvBwNhAK5wXYwBDzZ0kxigarXaP1fEudiP6EMkK01wmBkXnk9Sv/7QMLU5La1Oqm5X8+BMEAoJlI5YvBPld1T4kyf@lists.infradead.org
X-Gm-Message-State: APuU4Z+SyfE7Vq9wT9fR5sojTNlsN7fIS9sP1vLekr9AObPRuo/LuW5+
	QPzD3RpFVqZKVHib48abOINtIUfzUQNqpmrWVQrguIt6CbK9DH2Pkq5p
X-Gm-Gg: AYBFou093oc6kzLYbvoeOl8OyRiJ5BbjORPTa10+nYUrH5ctT+q+YLhcUlAXQHOLOb/
	rrH3jXzps2kEf+41QPYDuL84KZOeEGKQYrvu4SMRHe7+3ikoxCsjBJfXy0GTpKWD09aihVIDT7C
	EZ/78FB8cTzT3Apw4HsqUm568ZYtJsqUeMahUlUXSMKdJTQqMl+0HntXPXVqBTPGU+WMOOJ92WC
	kMehtAN5xtDyW7KteHgzmWDSh6lUfkNefFATYfdqpkTDZASQEuH1TH2TiFUooKG5ubkQ9IGYrCQ
	2xWm683XT/SBL0kIlcCeWEHlUsCkRn3nTYZCbBmztk/JJ8rVutQk+3ISp5Sa5zkntu9ejnPRAA8
	i5ZgP9myUM8xsD7ZS8vGtJyQm1Nu21Wc+C65TNY6SlJ5HNBjE29LHvYrud3SZKSEkLEN+qGGJ7D
	Fw5+pUZvSskpPjmtowkJ7MbPbGxR58nXF3q1vs/78mAddU7b7uIBdhmvLmUYg9oiIvwHAEOmpq6
	P8HMtSl5dColTbjPVKRNjzywpyj5Zc8PX/dVPhKa09fpQDfnMcqq6VLiqbPoQ8+xA0out9UkCW+
	eSsqGrk7uoyBjQFqdbu9xp1zGHfXb/f1PvbrJyO1P/mKbB8biCtluDaZqJ/5m68BTV7SaBm6guo
	oR8vpCCPP1V6BXOg=
X-Received: by 2002:a05:600c:818e:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4b6dff86e38mr97387655e9.28.1794069527274;
        Sat, 07 Nov 2026 08:38:47 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:10 +0100
Subject: [PATCH 6/6] firmware: raspberrypi: Handle device registration
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-6-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=AdC4vOzAbMdAuEcT4NFt9HUipWywj3HHnkSbR3/KwS8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRsEMYUoHGkbQFg7nXgZBTB7cS2hllxBjE8
 6P000bTNP6JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z7VOD/4/4tRYkecqnd0BdWVXBUD6/94azYng6hS2Qk9Kr65ChmM5nferUVW7+/OAN1IYZmgCxu1
 qFb6of/vYw9+suJnMkmsnxY2oACvIdRCTopmjDof1Y/hkW1n+vUbkfkSaDIaP85WE5h+S2ux2yZ
 3W69YR6rjaCLmtfVgPeDG3A+KPQX4MwZhWdJUQOLa74/b75hT1IvZiQS0ISkn709jo2XRg5GhtR
 l/dAzmc1SGdjifmFYya3elpnYppiyIC+h3mA6/9hHYUAw8drlVzBNkmmIriiTpR0vVShGElv0ya
 PxgBCEcVa2Khpmp6nQb22/9EVuaJ3M8JeB5RtHY+ivePPQfLa2GCoM4cThGHp2qtm+14VW60CbF
 W+QhoooX8X0Q8KXmXiIspD/jo6F8E7lpEtsfpw97yZ3Vbzj1UmA5hnh4Se7IqTgTz3U5DoFMvA5
 drTY8DbC/MYRnClwqw80KY0YDFtM+hWSDC/14PVBFoNE3K/KXsk2mkc4wCNZTBoce0x53BIrQge
 9u889A0DR92BhmHg/Sd+hO6ZfJWfE2xunfW7BHL19A0jJwvN2eFb/o2E5mTw771hnY7dOTDo034
 UyGplW5Pgqd+XSsB188ICHcTbs7vQUdUV0WskglfQRvufnHDyyjFc1Ch8i0Ami+BHyE/jHJi+YP
 ybiE7Eoct5mr/Wg==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_163848_817333_3412C8A5 
X-CRM114-Status: GOOD (  15.60  )
X-Spam-Score: -0.2 (/)
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

Check the return value of platform_device_register_data() before assigning
it to the global rpi_hwmon / rpi_clk pointers.  Previously an ERR_PTR was
stored on failure, which could be used later without proper checking.

Do not propagate the error to the caller.  The hwmon and clock platform
devices are optional helpers; making the whole rpi_firmware_probe() fail
just because a child platform device could not be created would be worse,
as it would lose the firmware interface that many other drivers need.

Fixes: 70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
Fixes: 91f2cf4a6b21 ("firmware: raspberrypi: register clk device")
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 57f21e4e65d6..48cb8063ddb9 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -203,6 +203,7 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 static void
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
 	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
 					&packet, sizeof(packet));
@@ -210,13 +211,19 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 	if (ret)
 		return;
 
-	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
-						  -1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	rpi_hwmon = pdev;
 }
 
 static void rpi_register_clk_driver(struct device *dev)
 {
 	struct device_node *firmware;
+	struct platform_device *pdev;
 
 	/*
 	 * Earlier DTs don't have a node for the firmware clocks but
@@ -230,8 +237,13 @@ static void rpi_register_clk_driver(struct device *dev)
 		return;
 	}
 
-	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
-						-1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-clk",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	rpi_clk = pdev;
 }
 
 static void rpi_register_rtc_driver(struct device *dev)

-- 
2.56.0


