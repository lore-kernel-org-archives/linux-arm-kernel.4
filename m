Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E30606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CdVXy8B2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwOFa4DL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZJl9XladIemhT3/Fp4VwYIfIL4e685MSOlrpJso3I1I=; b=CdVXy8B2h4os8U
	mJr8SiUzBLF7cgKwgSVk+9GP7p+h+Un/R14ry7ESd+dCbDp1Zp3hlwxlrpbGOpCe2tpfgQ3Of3vZt
	3Zhx2k7v87RNrxff8YjcS0CXs3UlOBY5dxkt/OUM1gQdKsmCy7t/DzDOvCHUWoiQQdR8CLKXRkmzs
	UZuAinRO8uElbS32xZQ3D8N88UivYPgJiQxFCa23evcmEVcusSpmACuV7VKAAlPluZAVob4011/bR
	z6rHObOobZHdR5OSViru7P6OCq2eKZlOQ+CSu6vXmDB0uRPG+09rkOXTaTjFMJgDkepDW296EVHk9
	/pD5azjzRb78sHdeaoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO48-00000002Pwk-3Z89;
	Mon, 23 Nov 2026 07:02:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO3g-00000002PrZ-195n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:02:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-491971ac844so2668085f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417306; x=1796022106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJl9XladIemhT3/Fp4VwYIfIL4e685MSOlrpJso3I1I=;
        b=lwOFa4DL3y/VCDx6aRobTXi2yfVJmmZyz6Hn3T0t1YDpU9CZgSWJmP7jxOFcpjYqvr
         MfZ230myuRonVyndZ2UVbmAPXCaOkOVTmBZsW1MX8wZhfMTHs4NLiGZl9kUsOzP3jnut
         lf4xlalJNjrmRpAJTmc84/ygGPmB8PP+2s3igzsb0nGVJh41IoKqBdxjO+jfJHTHSX8j
         s9foEpr4OJLy9wTwwpFp4idXat60V1Hr7eabU+clD2IsR7bCOSY0Mx6IO/h6/IHqWrEO
         9Au+aMR9M6oh6APdwfI9VQ6JDJRCUSfwfbt0lGdxLOHyAzS0X2Hbgjr7NZubegAanWRo
         ZVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417306; x=1796022106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJl9XladIemhT3/Fp4VwYIfIL4e685MSOlrpJso3I1I=;
        b=AYAJKKOYdZIsyNt6opk+OV+kpjHesu70R4gb6SixO3WCgJZEHp7I+x2zGLADve/rca
         kICLv33GNLakuRbiWvhRYUadqy78QAAoH8xCJ22LxWIKo4Y9wqgIwpzcSQ8l7omLnbOQ
         kHk2fzXXRkpAL/dB922vI1F+bZXOmOxnLQl188RFTf6XAfhOsImB9RU82zgZwLLFfGww
         E+WYXY9sDfj1YRqCgUQFN8B6MeL73bWTkOPPvrWjKQbxwQ5y73yd7OJKG5i61PPmCmML
         q0IBqkRKZrUSIpvprq7SBfBn4MzJFTM9Mk59lchDtwzbQ6+PSuL2I5wo91VlH1oNiCRr
         WkjA==
X-Forwarded-Encrypted: i=1; AL+hErF6HihT9cvk4FBo6rJlkwGYGhtOwPEJJRyLDBbEr3eOwP9J2IrO391qOI9jXHOkwNyJTFeywof7Gq9hl4KA+9M7@lists.infradead.org
X-Gm-Message-State: APuU4Z/Kx0BYxB2iCWGgATFASBrcMkF0h8NM50iNTwZ9QMQ8ThBHMr1L
	dwhSYWin4FVfPvTv8GXKCRMYpbPYZpWHR/N5w36xsAzIJZjdIHBmb/lN
X-Gm-Gg: AZFdTZfVa1adjC54cMJ6ZkmoOv2fz3h2bE835gzQhMWiRjPX/5CXYt7YlkrfzZbBP1M
	Nyh5KkukdxgAu7thKPVRHd23Fs51cfRVqd9Enmz6BVjD4EzlOc//hJCQr2N5JsAb/0r9u5jQJbv
	di21R8WoH0lTAQFdhu/G4/NEgq7gejQUF3vHt1RehSlRzj8efqJpdzm0QdpLt4494Bn7YnmJC8b
	KQPxfMPFPvb25i+ahZ5MMi57oqthGXz8VtbmC/yQf6oQ5ZLKTK+eKlHSc2gP/xnSHGzrN25sdUJ
	HJr1U+UNPf+AtdDKEbiVQOQFDtI33i8bOjYW8wx/+/DS7nfeMqYRLvEHJZkPCJvyxlMPfxu+gGa
	PsURS9xi55A3oiEuA0AHoLEDQh4erLMKMKcK0slcwFYN20m8/khPehjywuPd5NrteLtq0dkyub9
	ZGyL1ap1dntqX175Lu15z4Bri0dE5FfWH3+TIWomqMAVBwLwfSX8nRx5pvBGajo+ww72i5vZVWb
	Tgpjndo9tx2JR+0sy9sDSa0LJUL9zKf64/WsZPyQ/aw3/HEiFy9RiAzC/YTpofsO7WfWoIag36P
	mI5gLa0lfZYk+X9mBjP/Q8jde4A6+e34kTsr
X-Received: by 2002:a5d:64c5:0:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-4abb2ecf85amr19716411f8f.38.1795417306314;
        Sun, 22 Nov 2026 23:01:46 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:45 -0800 (PST)
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
Subject: [PATCH v5 3/8] iio: adc: at91_adc: switch to device_get_match_data()
Date: Mon, 23 Nov 2026 09:00:56 +0200
Message-ID: <20261123070101.53868-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230201_451821_309BC5D4 
X-CRM114-Status: GOOD (  13.83  )
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

Use the firmware-agnostic device_get_match_data() instead of the
OF-specific of_device_get_match_data() to retrieve the device
capabilities.

Check the returned pointer so that probing a device without matching
capabilities fails cleanly instead of dereferencing NULL later on.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 76000486b17a..2a378540837d 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
@@ -1002,7 +1003,9 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	st = iio_priv(idev);
 
-	st->caps = of_device_get_match_data(&pdev->dev);
+	st->caps = device_get_match_data(&pdev->dev);
+	if (!st->caps)
+		return -ENODEV;
 
 	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
 
-- 
2.56.0


