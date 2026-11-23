Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371AF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2XlcpfF;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUPwJYqa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=; b=J2XlcpfFO6cJW7
	ZXdGjftEu+ye3i1GAPs1POJL5+DcikeddAL+2gfGfo9DMIRx4E1XTminCdMPI8u4I3TyIZI+azBDS
	fl1mMwzSvxCna0Fd9KxlIANLeYLtjnf+nlxMc5lnU/IMMagApg7vos5n0kfGEZ40DycQq8Ir/6r0w
	QcIxEWxpBHwXVmhozzy0DYvuEtV8JN6FaQSSAsjtgIbuzGzb0kS/8mthgfSU5vWTasewwLntzLOhx
	UyN0bH4vxyIcAIDcM9WpFc5uumNblcZbBkO8zEHFjuC7iPjru+MgP7B+BcUJVFu/6kjvyKZvyGENl
	C9MwMf/CFH1WFm2fu9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS6Z-000000038CE-37zs;
	Mon, 23 Nov 2026 11:21:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4w-000000036zP-1mSR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so28710285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432761; x=1796037561; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
        b=cUPwJYqado4mLjRn1Zv+US46kRInrA6Ncx3K7UHM3ZGsyLi8SUCCXDRJBIOv/cNEMI
         6Dw0TW9ttQW77Wn/C8fABufUc++7VfnN5Vdjc/1vE7CaZniiRvT+bp/PEASuaspUK3Vm
         HfjlSh3Stllt8OATj5lKt8ixOul52QELoB3BXw0PtTFLMNQ9TPZgZsxU+YEHoVopEEyc
         j7jaf73/kEA53E9Kh7kfXUkgpeCj1Mz9YTF7Dg+LURWKyvvNtHkcYBQKkjwAQZgA4vTY
         AIK4T2q7SzvqMbCt0+hR1tQCp3Jxuwpgw/GVulMM9OYYh+bH10u9C/MVru41fIPiOJZB
         cj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432761; x=1796037561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
        b=rI+px4AIrweb9zYPVw3/cgYokjEzDy3JMTD7Zq03OC1jR3Tv6IQ7nhvIQwgR4+RKuU
         wcsIe7TXV9oY9c8nIOP6joaBqM46AO5PS8eQMY42flyNTCjqLzmin+bfglChpZ2oXven
         dMPXdwlAYPaEDIyOgMA3uRhKXvm/co6EiEhrhh4k0MWqU78bN6fOYlugsGKnm4zLSNez
         sUsfjeHRTHVeCrJXixE4FN1QVWIgHeJwPc+XApPMK48qo+klFSzeU5ZlE3sr6j7GCKoh
         uQWbQHU8Lcm3clZKKB7hQcV+T43k5WK/PSHuoe9LmhXhjXsn5dBBzEKB7WIJyi6PUIe/
         BkUA==
X-Forwarded-Encrypted: i=1; AL+hErE6stzfdHEr6EsAvZefHWgSVqgxnpZEnfqBSTcy9FriflFnyzsS9KgfKsyV4zX4M47Cfhb29lrEePT1hnKAmulK@lists.infradead.org
X-Gm-Message-State: APuU4Z9epwuPH8SmKmLqb05i0Rjp83LHpP1QeVxl2Qn4L8fAngPXp2Qq
	pI+uGXVwpE7NOuPRthzEn2asO3Ux5HTMfCEzmIj3CqEtRKUF2UTG88QEW9UiH8fOfm0=
X-Gm-Gg: AZFdTZdYeircXAXFJRbKYUZaI0NrGiQh7lvKps5KH24ZTMy73Zdph7Gl6UsEdMwbp7r
	7Zp7bXAKsD4z8N/VT7U3hzK5nnsVe/aGh3xsbWGhsHVKrhXldjdr8aATGoT5exvNBeUv2vSUjhF
	8hBIMYvmXNW5iUb0wsCgFfuRof4iFsnAzxGZPpPHuZ1MASOHDKhnWlNOtPSeoxJ5t01lkcwdQVw
	WPqdKkfsYryvVUK2nBAmZcsCp0lyyilfzSmFp4xV9Iy0Jl11suwVBOXJEsTgqEt712BP8rQrNof
	X/hRU2kz3E2WYqbvwH0XUCgYJSLeoJJIbyssrTLRt2zPwW6FE3NQIb3tmLNMApEKWYL8QqvT/J5
	fa1Ahc4O8QYuMgt6E0lxT1HmtY3t43gPAyclnuKI+v+4HTQikV5aKZjGZXQ7+KgXsd7IKJAi46e
	09tCGy/DFSjBQjIC8rjGkRzN+OxxsnYS4Ug10bv019KM1TkoqR8VvZjdWThHNNYPYq3nwD4ZSxL
	BUEaJOaQZsks5QkA4nGHcNZd2FYCy7M9Q5PeD+642n5d9V/5GKdgnSgZfQkdWhXGUTjG6JD6idt
	w9+DzAt9fMC0WyrDQB41xuA4tDw9HheGSQc+KHDWEp7j9J9D1cmMzWSaq3qV5V23mV39a80y+6W
	f8AAEwLRkQSAIrRej
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr226781205e9.10.1795432760806;
        Mon, 23 Nov 2026 03:19:20 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm640103425e9.4.2026.11.23.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 13/17] mfd: Use named initializers for platform_device_id array
Date: Mon, 23 Nov 2026 12:18:11 +0100
Message-ID: <77a7d8f6dc1defcd4bc444a17fbe12b12c896dc8.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yuApXE+uP7wBaUCWW0JJGBg4bYRq2vqUwBWOU3wES8s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEIp7lbUSpH1IgOlUjliCpKsH7j3vn9CjcJD 3WO2mFrQS2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhCAAKCRCPgPtYfRL+ Tu2jB/9cHZJmTztjkBAPewkCzIe0sLvYsApxAjpJFyVTQxIZsS57YALEG/TS583ylkpslKALZ0b jEelLoBq7MmKSd5oIaTxPtgrZNLWtEuF9+KwBSHpC1+Fa4anJcG7zsSeihzQCFik+1jLMASuEB0 YcvN99U16bLsKnKAjAAyX9xfCC2HDOIMTHWETww/LGG3b1utzYM/Vq4BPiX7AtUXEXPbk/QVrCD WzsP0BLCsc7IwXpqmtb5jw94qODzHtIip1y5u8dCk8ZwqM94NGMMM7r09N7+32zl0/mzbAztEe1 oYys30KFdupnY5eisDJATL1u7A2NGA/LDUfDEYwRj05RBfE2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031924_596310_9F9B4923 
X-CRM114-Status: GOOD (  18.04  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 766b0eb73e43..ed7e6a99b444 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1249,10 +1249,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 96aac158fd8b..3c7e7f1efd0f 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 816ddfe1584a..9bc146bcbe0c 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -327,8 +327,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.47.3


