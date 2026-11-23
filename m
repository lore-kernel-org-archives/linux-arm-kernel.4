Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B77F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYsASQUK;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnibgPtV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=; b=FYsASQUKuKys0a
	PgCjiAOfiDXwI4C2TmWco7BE28vKG67kQcjZ9bNZRfMNd4euWtvsptvqp59E38XKsYKH0YBPh405z
	YtU8Ih20vS2U5I5XpRyRkPgy5l1XFyuFh6PVuN1jrhnsjJpEDHl1lukMuWMIh4J9oJFWTklkhHt5R
	/ABDO6my5cwkmuBTi53SX6LvoaOdcHS8mGcEyvVYAuoMnH5UrDqULX/cw87up3KD2lzomZaeLJO64
	wdTEjg78skTH7m2Y+5+rBScZm9ApHBwDTWwQLqpZVNeUeHrZs8O/mmOBQH635pBDIlHQBbzdb7IPR
	aiF8I+QMKnKlB7vRiJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS6Z-000000038C3-2WBn;
	Mon, 23 Nov 2026 11:21:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4n-000000036p4-2xmO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a210470b49so29911095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432752; x=1796037552; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=EnibgPtV2erd+6ZJE3Xy0WJLNBgsuPY8ypUJKZ3S+IFoovWHCnn014sQ7fVytQC2p4
         dJ2WY2ZhcfR0iZs699jx5PJQFDCGi0R4d9AuqX64mlDC3bpHsROtzfP54D9b4DsSpZmh
         o78AXt2llsINXcqOoOWTwoYn+aB0Uvz5XZyUQequ1UR2smAJ76qO8NoI3DrFbYL36Jnp
         +EwTSyUVdWoAn8+HdrOa75FhWpfLu7QD/gcatGKDzj1U1NJb33w/refUFAnUt+5a/knx
         aA9xLSYGg+AEwnYtOASE/6iSM0feH0R8FEFu2m9vYHIdzA/vEIIKTOBWVHjXlHStWDXM
         haWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432752; x=1796037552;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=04GvPo3aB8U0lybacTSrVIuMzjlCvNuRbc9Ttu6F3PnmSdrpnORzOFOH4EusZKOvUK
         MQ85nSWc22kNR8CJy/DNCUkY2WHEm7Vx4ItUDrzzTPmKsgYxvWi26Nol9cSrgmy42V2u
         q9961+E89la6UF+t+MwhPpRyKGNEsP8XtAlw4eTpjKw7sQGXvNr/bXUhrVg5Mo8ozeJE
         dOCIKjTVojOPYOzYjJj1TqRGxewfiHasMluas4Vv/IM6DzHk2/fLIkAJSxfOzB7o9XU8
         ZmyJ2o0VjSZGQgt9DknSUQPJH7hzBh+NFEscD4/lTgmC/T6YVSUWVi57avpFnUXLIkfU
         6F6Q==
X-Forwarded-Encrypted: i=1; AL+hErFUYxaZtZKQtG50pLIKYYEe8IbJ26LdzNUzwrA4b/tG0HjVrpmOlNmsHNLUfM0+Cz/6gLYvR+R4VB7GuftjI1Mu@lists.infradead.org
X-Gm-Message-State: APuU4Z+GLMuxOCER4kbs1IDF26ozHKjqTjFn8B/f3vg1AW/rCcdRtot/
	jcgf5XCgNuPIkwbhxWiFrli6QXjMfq7oMiwW7XYS++Sqb2527MbuMTCsNgtuokJ7auc=
X-Gm-Gg: AZFdTZdVp//e5jlg8I/KrVqCe3+LYt20Jpz6/OH+nw8dR+NTnmil4Pyjee5n61NgBKs
	xBPayq/h+YAzcHl7dPxUXbXTTW2c/L9UTWMEM3BiNMGgoj8Ztmx98jAmtCfXzPDrZ0vT9pXDvmW
	Km4Mp2p8Ph6m703fCX+kFnF7IA++B6IuapB62TrNmKhba+IjpfRwyHpxWICQDzz17fTwjbSX7Y3
	zrDHX4B++rhi3fGIBijfSF5XM8Aitpu+hMEhbmq/C1sRvslF/zmenzF+ik8VMrkSmT2Hj56eVqy
	U1YAJ1z3IJ99Lev1BzWm5ituH3PLR1P8XYAi3njwUTKcW3il4oxMFX1Yp97MUbHompv9KboGkWv
	lPJXRX+s4/k+ln7GlY+y28BCyuDDYpYCmqKbEGN4hpuEcf5ulm6z5h71NLAXKw9wBYwQXS9Cz3t
	i0laGVJlnEOJmsumFsaywucrvHwTxtrAZZhmeSoz7aNLROkfvpslSG4UulJQQu2/sHXnhyNJaFO
	UXYfbJYQK2pa9KzCcxEOPrK6VzOYPwen5yI++ljvx9C6jkpUAdqcjU3iesaGTXS3KtwRhG3z3NF
	BbCF6vTuJ+ZK6UPhNOospFHOVcJr43IoscnPqpaffktaFEGXUuCVE33iiAZ7BsFxOQk43HmWpsl
	f7lgkRpo49A4lprcW
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr230811345e9.23.1795432751939;
        Mon, 23 Nov 2026 03:19:11 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906cdcc1sm160681095e9.2.2026.11.23.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 08/17] mfd: Drop unused assignment of platform_device_id driver data
Date: Mon, 23 Nov 2026 12:18:06 +0100
Message-ID: <6d088972de962cd3b8a22926800e36defd268d97.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OvFq0jqcix+nwy/hTUrsl7qFm0ROsXuuz2q1RVingjQ=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGsEIPvISAODgKyfpgbjFnyiCAHcQ7IbFHzgEvRZzaz3yy47u YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJrBCD7AAoJEI+A+1h9Ev5OguoH/1w9 aQiu905LCob4dh8+UJ0quimfHVX9xW7+i57G0S8G2aVJctqf2euVKBSoxeeSo8zEke4pt4akQS6 fJ51B0cHc8thdTMyKEvvqix6mrX+xyKcVQqmq9lHk/m6n71IDFR+XBKvle9oQJaeZnQGiry1mC5 9hKGlxP9dWv4btXVIModwmGhL+nQLu27g8zlS4yCW3JbqOHO2j9R3gWD6EBfus+x4M1eQaAv6Zo x5vYa6z7z7lbQ5+suCKrVLirWylLU7XYuzMFyPb5zxB6Sf+qTBKk9cJNzgsawDWKCbigX8sw4iU BQpqVjVQ84v/zNG4tyEpOu3AkqJKnJGD/7SiVm4=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031914_066157_42513C91 
X-CRM114-Status: GOOD (  14.90  )
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

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e2f6315f7da8..816ddfe1584a 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -327,7 +327,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.47.3


