Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200E1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FsDZcNOd;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P2eEKtrg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2+V7YIy+ugL63jgP2uxhOpyvZ08G/pDMPRbZ7zomEng=; b=FsDZcNOdez+4xjL/SIQYOuQZfw
	dpRM8QUJ7kbmj75s6YNr5zug5BPvYIHa40K0SV5jK3GjfVjUUp/+WPbAi/Sz7nWdOeMXgv8z+7DD5
	rkAfMjpqreQCe/hWaHcg1nJdJLvwYVBxjK8gI3cVyrFpYYYQhmttOA2WYiTR47grd/3X6BUMkBQzc
	on9OKtsPR2Mrp5/wAJyj/vTBtuEihX3WM4Kf/qi77dQvMhBo+kueBGxUbtEw/pbgO78r2tNgWbbw1
	x60pBqCI3lWr4IEBqCDsY0TDHXFo/Ny4rclHt8HybxKSbeJh5DNQdcrZcZepVS3ClULGOGdmgJ3lQ
	9/vzV/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOGx-00000000duz-3w7C;
	Mon, 09 Nov 2026 12:14:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOGv-00000000dtS-0HF9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:14:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4918c2d727fso370838f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794226487; x=1794831287; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2+V7YIy+ugL63jgP2uxhOpyvZ08G/pDMPRbZ7zomEng=;
        b=P2eEKtrgSMiwKgeZuqQjceG+4r82JQTdM9qAtoisgJIMgp7CswsdIuRPGm19DMTifd
         CZNVGgGRzzw3lrpza6LQQLwfOkp7wqoNXPXjBWwjdfTS35mVJ/lCufstKirNOlSsTEq+
         PhVEPHgJYv70B743u0uJ6E48oWVVeYYTjN96NCWJ3NPFGZJmYiif/MZ+Py+D3h8hDD4b
         cip2I3kB8ieHvR56z0GHBABUpaurTJRYjCifpAoFVCAd0M0lRxpQT9aMCacVonmYdcL3
         KCzvjeMcdiR+uJ/Rk4n5Yno7jKrh+olTN+eVjlN82DKcq0id6+4XrrBGLdQPbxpm1jwV
         m/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226487; x=1794831287;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2+V7YIy+ugL63jgP2uxhOpyvZ08G/pDMPRbZ7zomEng=;
        b=JA6rYAXAEYc09+uecMrFLKZzjfGI2NDxi3uog5plRJV5cXfCRsOnMYg3QFjmOtTp9Q
         dY8ZC6xptiH1vuW9vCCg9K3HDYENt9h8Yzb1wErLHMIG8q1dhSP5b4GtgaZYUUC/Ei8R
         19mC6B5mehxvs5mI6ePtHbANHtlBsOOjL0BVaAi8bDlMbV6k86cWdg392hN3PerWC1CQ
         0N8guVsJOKjS0QCh+6cp+6oeRD6u+AqoynbXpUZ2vmM9Lm7QYE39FcpxQb9BhExeIPuO
         HgIlGxh6Q++dIz5OyBVYRZWbzF0w6OxsS68zQAQ4eS5JmmLL0Ida41iqPE4NodSTg8bZ
         ijKw==
X-Forwarded-Encrypted: i=1; AL+hErHpM1Km1fDCzllyVhnsxhl93Pl6HkhhwYBFfv7+7er4YAHGwxg7NHLmILDF0orssOEGrYq+t05w22B0KwpwJwsB@lists.infradead.org
X-Gm-Message-State: APuU4Z9P0eeSrFtbTU8dQH2khLpbvHlB9207UxBpO6M6s+UIVkrDy4HR
	wq62ezSCw2LU5gVzMxK5o9GpQDQcCed1z1l/yRtlhXrjOXJpivUVi/KSeHCg1f3QIFU=
X-Gm-Gg: AYBFou16L385g3eEnZDvEsABK/ONpSgYEwMNxkU2Y/SZsP5+keH22uqrgbIGMc/ag3C
	x2ocbu28EIH6FDKHI5s3LWx4c5F0QKPuSpavEjtjY16WWKB5wU7Lh1dxxzG6ApZDQI0EV8hlNFG
	OhpWvTyTC3fU7pxikL6cWbUaz0IciLaQ6ZbdlnkWBBsjvYgMV83k+yzS/KRLKiRBTApB7R3oj5h
	X6OMhNS5TGMQpWXq4HYFiiRtW3gGf6YqxytB+uBaO0rJHr8z1hjkqJib/JU8/eCeHPobuqhUdqo
	ocOPIYvPaHlJZ7F22vhVhXnCd2CLw+7EYEIwwD37hVLKYTc/hwBG5y3cEJyqSprPNW35IpIXGSn
	bZ2g+4jOmdJUBmJLloykY4ceUAsejM6KC95gPlWT8JmqHaJr6/PTK0dIBoBxRaCsi4tG29GWBBD
	pO8fyb8P5WjJb50DWyFTukIZyTcLplou2q17zywfEa5cdlRPInsFLGTmC7dvx5IoipQ1rFuUCPP
	mAs/LjhXmIOYmN5ebgR5owAPYnh7Q61eEIowOsM7kYWHrOrXi6408Cj7eIZYpiY9xEWoxWrKL9w
	mhyk4lanlh/RXzGmG89PjrERJzYRyfrmasm5VOjGLUq+/w0b20e6rM2c
X-Received: by 2002:a05:6000:3c5:b0:493:2376:81b7 with SMTP id ffacd0b85a97d-49588ecc152mr7398751f8f.27.1794226486849;
        Mon, 09 Nov 2026 04:14:46 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49596f9ab09sm9313946f8f.28.2026.11.09.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:14:46 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 09 Nov 2026 12:14:32 +0000
Subject: [PATCH] regulator: mt6363: Serialize BUCK_TOP key access
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com>
X-B4-Tracking: v=1; b=H4sIACe58WoC/y2O2Q7CIBREf6XhWRKWAsVfMX1gua1YuwjUaJr+u
 2h9PMnMmdlQghggoXO1oQjPkMI8FaCnCrmrmXrAwRdGjDBJKRE49gvWFI9ZcsnxAG98n92ApbJ
 Ca+ZBmAaV8hKhC6+f+NIenFZ7A5e/tn8iwmMti/mIIWsSYDePY8jnSmlSc9443tRMesWc6JTzu
 ibMWW3KHc6MMp1A7b5/AOf7X2HGAAAA
X-Change-ID: 20261105-rgp-91-mt6363-key-lock-67b5992de5a8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_041449_138027_AAF2FC17 
X-CRM114-Status: GOOD (  17.39  )
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

The bits that select the FAST mode of the bucks only accept writes
while the BUCK_TOP key is unlocked. mt6363_regulator_set_mode() unlocks
the key, updates the bit and locks the key again, but the regulator
core only locks the buck being changed. When two bucks change mode at
the same time, one of them can lock the key between the unlock and
the mode write of the other. The PMIC then ignores that write, and
regulator_set_mode() returns 0 while the buck stays in its previous
mode. mt6363_va15_set_voltage_sel() unlocks and locks the same key,
so it can also lock it during a buck mode change.

Hold a mutex from each unlock of the key to its relock, in the FAST bit
writes and in the VA15 voltage setter.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
The race was reproduced on hardware.

The new mutex is static because probe already stores per-device state
in the static regulator table, so the driver only supports one PMIC.
A follow-up series could make that table constant and move this state,
with the mutex, into per-device data.

This patch applies to the for-7.4 branch of the regulator tree, which
has the earlier fixes to this driver.
---
 drivers/regulator/mt6363-regulator.c | 41 ++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index e6c4bd851fef..8ade92c59864 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -12,6 +12,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
@@ -114,6 +115,8 @@ struct mt6363_regulator_info {
 	int virq;
 };
 
+static DEFINE_MUTEX(mt6363_buck_top_lock);
+
 #define MT6363_BUCK(match, vreg, min, max, step, en_reg, lp_reg,	\
 		    mset_reg, ocp_intn)					\
 [MT6363_ID_##vreg] = {							\
@@ -388,6 +391,23 @@ static int mt6363_buck_unlock(struct regmap *map, bool unlock)
 	return regmap_bulk_write(map, MT6363_BUCK_TOP_KEY_PROT_LO, &buf, sizeof(buf));
 }
 
+static int mt6363_buck_top_update_bits(struct regmap *map, unsigned int reg,
+				       unsigned int mask, unsigned int val)
+{
+	int ret;
+
+	guard(mutex)(&mt6363_buck_top_lock);
+
+	ret = mt6363_buck_unlock(map, true);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(map, reg, mask, val);
+
+	mt6363_buck_unlock(map, false);
+	return ret;
+}
+
 static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
@@ -400,13 +420,9 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		ret = mt6363_buck_unlock(regmap, true);
-		if (ret)
-			break;
-
-		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
-
-		mt6363_buck_unlock(regmap, false);
+		ret = mt6363_buck_top_update_bits(regmap, info->modeset_reg,
+						  info->modeset_mask,
+						  info->modeset_mask);
 		break;
 	case REGULATOR_MODE_NORMAL:
 		cur_mode = mt6363_regulator_get_mode(rdev);
@@ -416,13 +432,8 @@ static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
 		}
 
 		if (cur_mode == REGULATOR_MODE_FAST) {
-			ret = mt6363_buck_unlock(regmap, true);
-			if (ret)
-				break;
-
-			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
-
-			mt6363_buck_unlock(regmap, false);
+			ret = mt6363_buck_top_update_bits(regmap, info->modeset_reg,
+							  info->modeset_mask, 0);
 			break;
 		} else if (cur_mode == REGULATOR_MODE_IDLE) {
 			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
@@ -508,6 +519,8 @@ static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	struct regmap *regmap = rdev->regmap;
 	int ret;
 
+	guard(mutex)(&mt6363_buck_top_lock);
+
 	ret = mt6363_buck_unlock(regmap, true);
 	if (ret)
 		return ret;

---
base-commit: 7904338c38426d72c5f7cd9402cb9a20232a7af5
change-id: 20261105-rgp-91-mt6363-key-lock-67b5992de5a8

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>


