Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2951A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wf9KFrs/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OsPOU3gP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/izIbDRAeUawScEMYwccdPIVGb9e13gPN2dhH/CsbGg=; b=Wf9KFrs/EMkJPMhBlcQ57pdzaA
	qbfGJ1bBbgTPGkRnuqwXXJ8SFlAchOc0Op20oOQp/wCvr4BTsZE6uE6yJRqqfgFpR83xreOg9bJ0R
	6j+90Wy37lTtAwdTze6PZe/ExTIVvLDfwKL1+5pQyHGsE/feA/10Y77hxs3p+gHzaZ/v5YhSmCUEi
	8AYbns5+UHiEEL1lJ3FoMPM0MithDQWUbvBmQDfwqC+liaUbX9/eP93iOHm+keRF/3vZ7/ZAXlAHc
	o1eGnhNgoXpwk7wDqctXYdPX5P+51UDUecdCDqeFWCB6HiyoBYhVoDgr2IXG1OuTnOLgL+JJzNMXh
	whjQjSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQEo-0000000DZbB-3DwO;
	Fri, 06 Nov 2026 20:08:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQEl-0000000DZan-1oIl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 20:08:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so9716455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995713; x=1794600513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/izIbDRAeUawScEMYwccdPIVGb9e13gPN2dhH/CsbGg=;
        b=OsPOU3gPoA7XjzRKY2e6BYtYdDNLr/7ApwCMRzUv1H0HUMf59H2Imsb8ht/zqqomzq
         6i3MvINhUkEPV78MBpszBhLXQ/Lt/NPkYOd05Xk+Yhq4uFx1VJ5beVN/pq1es6MYmi1z
         Tc03VPP0xCnOdEElYg6l3E5GFtQxpxGEGaF2wvmEMdOkHMGGrzVD/xEmSsghhM0g3kPS
         ADkX7NCHnTDjuFpyDHXH1gItrSq57uS6+uTpY2kuhVxgYB0FA2JlYn2123pOZI7COOJn
         yUI+7Lmd7uWHUwRh+yXKUy0dcyKfm5Rzcbl/7geRxkH/X/cMilHqV0RYsmk33QwnTzHD
         6m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995713; x=1794600513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/izIbDRAeUawScEMYwccdPIVGb9e13gPN2dhH/CsbGg=;
        b=l60x/9DLprOVbjR+s6vejWzB9hqgmjZQv13RXcKEcPoB2X+Pumnvs2lkVjpX6dKDUi
         cmMl6541SbLMw05xGgn/FYY7yxB3i9c32AXOwR+P7kaBc7yi/k4F5QElxoHXuyeo/moe
         7XxVcqYqRg5obYZB4DKouZ5mdU+uVjGKhcPDNXMu8Av4CcwRSsqUjV+kFKLjeTFjprG7
         jBDf3G9db0UdPM8bZpjJOQVAkwA59rJ2NGUBlkNxBNknniJ6q2AWPt59E4TZo8HkvyU/
         8A89IDh3TqyAjBE5eDyVEbKi9dSeBlqPYUyU4yr+U7038PpwDrbA3cxwf2dSBKWIP5yl
         1EMg==
X-Forwarded-Encrypted: i=1; AKwUvByty7YvZlBzlstH/JYIc25HpBwF06ch0AsqLuaermagG9hfnZ9D0Sa0XzltaLbNfF2eNONyrVK5DS35hRKkM/fG@lists.infradead.org
X-Gm-Message-State: APuU4Z/B0WxAgRGLtVOTFQ+NyH3Ap/sFD7t3eY/fPp9u2uZiUUKx+xjJ
	aXBlY54ZXDterEHzblDFVgmXHROjGBRsTE5fVVtQoJ6yd7a09mt6OecF
X-Gm-Gg: AYBFou1r4AIxfgoslp8ZbaHj7IOT77RzPqDxEom8Soqc2tXye0nhTDwuReQAZVoobGr
	2vRuQNzEP9FIljXxa68fSjYUp03Yj928EM2OOEbaDMnyJ0oE81icbo50XxvgTUSNLgflKV95QXr
	82CB+3e3iNg24w+8FEh/KKic2EkI7xG8G1EVvI7eEpz/AblG7y+gHpwt4ZHJk1IaZ2I3C3n/v56
	kmjBDCMYdLOBaCOEsjy1Cd1mcTTlyUyJ4Aif+0VYLfwIUhLruqMnMv0OuF5BA5tfULR7IiuuFci
	rpcF/vyC8QT/8X8vPBc/VZ7/UAvGOidRgPj/xCpOQKd9lp4QZFWvWNhLQpqPhUfHunF7v+R7yLy
	illm3fQ2apvAhq0OhoC/QP7n44FXG8TwMaJTI54RUfQWQEtINeWDJi5FL1LGnS6h5Yg6zHQ5gXT
	W1jBhv8O/VI06Ja8G/kAjEYEvJylmsbAsy/vLzNjp2GDo8yfqgjvW5MYh8IlV8UiX6/q25PXHl5
	AqO57W4HBObfgfxOjQ68PAYsYln1Pxl1E+kjvsWQBCocLdV0MPHgLo0kLv7yLEoI4Y6qQ2FX5k+
	sShN/D3brLXcm+CYcIYarEnEdFWDF6aUk9ZCyg==
X-Received: by 2002:a05:600c:1c23:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4b6df3fd28amr69391975e9.24.1793995713061;
        Fri, 06 Nov 2026 12:08:33 -0800 (PST)
Received: from fedora ([154.182.80.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbdb9cdsm17132835e9.1.2026.11.06.12.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:08:32 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] iio: adc: at91_adc: fix NULL pointer deref in trigger removal
Date: Fri,  6 Nov 2026 22:08:09 +0200
Message-ID: <20261106200809.53799-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_120835_474669_5DCD99A4 
X-CRM114-Status: GOOD (  12.70  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If 'atmel,adc-use-external-triggers' is not set in the device tree,
at91_adc_trigger_init() leaves the external trigger slots in st->trig
as NULL. at91_adc_trigger_remove(), also used by the probe error path,
then calls iio_trigger_unregister() and iio_trigger_free() on them
unconditionally, causing a NULL pointer dereference.

Skip NULL triggers when unregistering and freeing.

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


