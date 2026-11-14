Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298B606A885
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjsvtWtc;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=E8/dLNR0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tD1LfS8v3U8vciF3kw+7w2dzpXjbhOMsyertPA+CAGg=; b=wjsvtWtcAl5bR+
	q1OeqcVk4PEoQ/20jqmz2/L3+pMt1sblE61onJoKSFu0mGTNgGfMjIpEDYTU0FffrPMJ7Hj92RLqh
	ZWrsaFtXTYNm7a1SINjekrkMslb/TMGyWzo0BnNPToMi/9KF0RsWFbnfFkisY10DRD6IOccsTHkdN
	vQTOKjLLccyjjuPwMAUnDqsBLkhtVMCMGWPjPVnZhIgl57wfcsN/g0hzLMl6H9XXgtj1FRIXpggax
	dFH+hhFcfVek5Oob9C3SwVamoUE1nLb+olFJZCq5+Jp3IzJRSuFw3evqV5j6dae5wCFr8EJCmn2XW
	P1ODRMZ5mZehW77G3Lrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5tH-0000000FQdS-1grY;
	Sat, 14 Nov 2026 05:01:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5ss-0000000FQIN-38rT;
	Sat, 14 Nov 2026 05:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=M0Q7DqrjXt8ICcxwp1gthEb6oCgbrcLyuXxfBJ7UAhc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E8/dLNR0AKGMazfJCueqCE8uwRw3hKFBkWbi543yOkTiKHpWJwyt8UPrYVMjGigsh
	 43OJpuyHK1Qah31gOEuIa+Z/BXKCazJyUuGTLN3dnfSc4ZLpQfIs1P0iuocn9SYecS
	 7tE/1uPGjMF3/Fqkrl5B9DfMLnE1wuZCxW2BcPB1HOw8tu4AallQWHuRAJFnbxiEHI
	 GJpDgfQFiVYWbbAeyR/BRuRZdDRH1HhJYOMuIECi0Z3Ug30lyOH/Qq99MAM2mNQ/wb
	 /a+W+ZABEBudH3EzoMbhKOHfzb5/ZiZVCz/ptuwZaVajT91sgiFW2E837VT/3cTGxO
	 gZzLLVOdNj2NQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A91AE17E36A3;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 13F2248003A; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:39 +0100
Subject: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=M0Q7DqrjXt8ICcxwp1gthEb6oCgbrcLyuXxfBJ7UAhc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wexfJmXP3rQk8lZhyfgLEMJObk8/yuGO
 xJWp+EPmHe64YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qa1PkP/jNahyW/I1yhqEaivKB81Juihoshti2rA6PPK3/2DeZYxMlmweErLc6R6cLrDyOATmG
 Xa1iZVgwmeqxL4CjOfT/bGxEsXge6BQe/YDsG7uQ0mSl5nrCZpZql9AFzsbSm7SFLc2jOgL78CD
 +skAMPuW6/y2/pi1T7crr7HgGzgw8jDRPvS3h4XKKfQ/ynjM2fUgb7BqxAf6qvcBqYiOAIqgaqU
 jHcm+ZsjWP8JyymnwbL+HXqaaA5XnLY/qi2W6vehWWY+OyCq4B9nn/e6isK/eIL014AG4NDQ2Ni
 D0hrgICZ5BCPa3Lm6vGKaHD6hxIDyCjSb6CeI5vtr2mlJjkuZWJt2PcV2zyQA2CK/d3puIzMfJt
 8q9zjfElKG3p8g2gwfuny0wZ/mvmJ2OGrefKj7s2yZEDMgZpmGkQ1kXbsEIDQOgT9IespViqxp6
 CwBfJ2cjtGd+bFkGxlRUnL1rgG9qdb+A94U+KjA5Wmd93wLwNprlH+TKdNc1PKstV298qpJuAjR
 iz9tct+bC1+qbJ3Za176a/F6B79d2xJtogd7iPjzcHfctGOC3f0GH3iev7s1IvVc/SBkin+VkWw
 xlRUH55HOluovg/XLjtjioo/3yl5yeMDTvj/KKFKgqJtiaRjz5f+qxZ0QyawdRBElFxFg5PztbV
 5QAbOYhFLqQgUbWClvoA4Cg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210105_502605_C931843C 
X-CRM114-Status: GOOD (  13.38  )
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

The DP AUX transfer method uses a completion triggered by an interrupt,
which can timeout. If the function runs into the timeout and the
interrupt fires afterwards, the following DP aux transfer completion
would trigger immediately without waiting for the interrupt. This in
turn means the next one would also be broken and so on.

Fix this potential issue by re-initializing the completion directly
before sending the AUX command.

As this is racy (the interrupt might arrive between the completion
re-init and the new command being programmed), also reset the AUX
controller on timeouts and synchronize pending interrupts to guarantee
that there are no pending AUX transfers when the dw_dp_aux_transfer()
returns.

Due to lack of a sink, which generates AUX timeouts, this change is
effectively untested.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 7351b70bdac9..df0b98cbbaab 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	reinit_completion(&dp->complete);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:
@@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	status = wait_for_completion_timeout(&dp->complete, timeout);
 	if (!status) {
 		dev_err(dp->dev, "timeout waiting for AUX reply\n");
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));
+		usleep_range(10, 20);
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
+		synchronize_irq(dp->irq);
 		return -ETIMEDOUT;
 	}
 

-- 
2.53.0


