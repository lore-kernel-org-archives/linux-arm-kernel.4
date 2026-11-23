Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rjc4OR1t;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MFfLKg5L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=; b=Rjc4OR1t72QNh2
	a0YN+5z7jXV98aQzeMHz4+XA71HYXRkY0A8mwehWomXzJqxvltgAre/XAyRe06ZTOUM0JTOPcnRBJ
	i7kzJxXYqAktSFBOmOhKvoB5qeerKtsuWxy4HQeGbUbmPV9vozWXqCJZI6UWoBon57QHXzt0N/9za
	hrJGZXfArHQy/WMRFhQMMq0D3fH1kIt3FgZo2KXP34JslB1px5j6KigbtNpgxLlRkfI1l5PFk8WI1
	dE+lfTrov5M+zLyf4oGoX3d2gfjq4KndX1AcJykuzg4A1NXOUuZ0mDPiAUu6mRmoCEQI4EvPucAg8
	u0b/srq+LSN+2lNC7+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS5D-000000037B8-1FlH;
	Mon, 23 Nov 2026 11:19:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4h-000000036hJ-2vEF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so23760975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432746; x=1796037546; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
        b=MFfLKg5LjjP/JhPgsjgziA4qX+RPDsnAMKODNivI/AvjlfudMwfIBVKgRXc23jtDnR
         sWHU0wxaMC6Vo65xKOoCGAMltrZzq5XyKm51qJ7qXuyZzPdroJlUbdwYrnuh3GnuNAeQ
         7l6wR+4Iy6a8L/U/jJgcZUVGwyHJoW7sr48bZcd+fQnyFi9xK+eYTJWggx/LRVQW5+bB
         Kca50/YOsk4/v37FPrDCm5BN5RsnYQ0LCUM2N/VCfWhadfT4p0rSCIjMorUyvwZLcXUE
         R/sEyF862BQDZobBAE0Wa5no+XupFHM+4m3UanIRcwxnvEER+Gb5/c3qfVXz2FTz87t+
         Z+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432746; x=1796037546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
        b=Sx/r7KlJqhpqzIasaICg5R/2hxppk1kxSSaucnFZPAnRVcabLMGYdxJtvjwnGg1pT8
         aftlCx0Nq08qeZVGp0PUx5HUeMbRw3o8vXHWQIZa4c2Uu+bUJuh9wHvOLKNqxzzZNeiJ
         McNmGl4jgXwr4kfnynyz0fRHTze50kCc3+ZMLZ2RNSvTZZSeDqJEZVnEVRZvdwnK5cxM
         q9l0bvf95+Y86WFWxlUmWR7orC5w7R9b++3V8j6M8VnsQDORRX5AwhTFCBWXAkSMdfWw
         2pKT90lNd/rDbU7W72itopbz2w8F0paDSNwRktmZuZMDA6L/0VBBe5khbc9MHfHVBZMA
         8fbg==
X-Forwarded-Encrypted: i=1; AL+hErFvQrsxS9G3WqQ4J6DlVFpQ4FtbZrGWJYzuYe/TIT7QTZmS9BjinsRz85VULxFT/S193P5kvYInervoFC/wQAjH@lists.infradead.org
X-Gm-Message-State: APuU4Z/pH3ai/+RFWda75F8KzBCwhZTXWebv5hNAkSSBC6JQ3MizB+Xl
	ezaWhJZpHGjHvvChLQCoT2dY0qKGxPZs3HW7Z0umW3WPI+liSUXwVKtQQldvncugQdE=
X-Gm-Gg: AZFdTZf7cW5vRhQbLtf+zRfWRwups3eNUzTofvK6izVFZKxvzeQEP/KN0XHqaCf+RLd
	VmJ0V3qzTX3ehbPDLvWFA+yPL5JGAHUOZQYl4ghlpFpQd+epcLSleSgM1NweBLiCyjIEMZQ/8AO
	miB28CDC44zuB6dKblbGhK2dKzFx6P/Sbs0WsWZRvVHKAiMtukKT/tkfcuIyv7q14AE/H9sEvfs
	vQ18SgsiQFGsoQiNOckuretie3BWgY5R2Al9vRzPLsr1oWGOXoLyNTgotzskMgEzdspXc7AbXaJ
	TkxL7KLl0AdQhFgnGCMnekkI4vtY59C9RXTU8BMLHFWkq8v4FZb/U51iFDxdiRYOCWhfNBfCbP3
	Aa3MuI/RU6aXiCEjs2UlFBdJUzdByVSaWcNaZjLAKlcgOwA4w4JdfdUQxqgpHjX4a9bExGX03fO
	JEe8zVYZiXLcGBE92gGuiXZTGatf3w09J2oTVcXQf2g3CcwEl+cjDuPtZrhaKQreUDG4VCHh529
	JIdCjCABwlz6GXiuf5ptZmj3EDtOyZsXJUnKxdaLIW0kFt4PxPbWrRyQHRXCmwkGxgZpG8qjGz1
	BWbayDEcWTJ0SSOHCVSZGmnv8+D8i7HslOQF5iVr/YXUkuGfv2DV7NlVxmWqvx94VDfyHBRumKL
	RyOomdS59ZgyF0RqHnNawXB88mPVYSMUB+jGXpw==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr249116025e9.5.1795432745778;
        Mon, 23 Nov 2026 03:19:05 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm307418455e9.2.2026.11.23.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:05 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 05/17] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Mon, 23 Nov 2026 12:18:03 +0100
Message-ID: <244a3c6366c388ef24b2388b730a3eb15c263ec4.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5sHptaYzwLrjcdh1NqJqGmbEvltctvs6O0xb2yZ2KRU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmwWhc+tGraG+jKhKnseiB1WaG/I2LdD32jvXxGLEleuL W63F/Z1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRqUHs/10b+AUibCKWdQVX rf97KKfx9bwdF5we2E7M2fN7z/2UaxHV/KFrVjfGuc+dlatVWeVgtG/GiyUCvu5cZkcZ/CSmMH7 9yCaSLHN6ldnqIuco9v1lbhEGL0wL12zxVLPmnL6zY3ZZ+RKeDEa/FX9nay4QXCYndLfH7tpb/Y 358jEKX8IEVHMflK/8Wc76v9KuJIxvyYFof0t5/vWdW3K/LK+5OHfzbLHf4jw/74VY81c+0Vq+k zlw5+218aIrykw+Hyk7uiN63oF5etHBLBIMcV2FYsx71i2Km+su28DyJfht33z3yp+Hk6Z/2WUZ +uEKw0zPdxfVRJYKaS9jKS7+9UfJJ+1vcKbKeV7RIPGVAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031907_868400_B6D4B66A 
X-CRM114-Status: GOOD (  13.62  )
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

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 8c46e74be6fb..40a035a89c8a 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int mt6360_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.47.3


