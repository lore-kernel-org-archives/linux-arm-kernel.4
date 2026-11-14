Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBAF606A89B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p/Rm33k3;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=b8kh5x41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LVLhWiEdWHFBJHnv0Cs5kHL4UQUBxd0+XsO4PKT1bxI=; b=p/Rm33k3ATilKQ
	vXhhbpSMtA9J33Y2Z8qf1ZqpHmJKkVpFFeqHgfB+ytiTr445csXLubFwOTIIgng+I48vcYpEwUIbK
	Fd/qyqT8Bgv2OMjFuBKYO7J0H/RSfNQohGH066/IPBLunRrFY8ZiEPlduF70MGwLSOv9pg2SD9XoC
	JLR7xxEsVznoR7VxR3FFUEuiUOmYQs+hyrsBONRjZEKYvz9LwsjwqNc7ojLsjwY5LtVlaBWNiFoLV
	l2WnEOF7kJijNXSbKCHiYJ4Y5W4fO4DFoljhQm7p3n7AfpI6zaj4B8H7F7c2Jv3tIDD2PYktTBUC+
	LJoJ88aLLX6OYEK7I3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5ss-0000000FQIu-3fcc;
	Sat, 14 Nov 2026 05:01:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5sp-0000000FQGS-0yFd;
	Sat, 14 Nov 2026 05:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=+ipPs8iD7ik+cdrCA73kGnVQQYgDC9VIvxWxUzjPh04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b8kh5x41JLpSguDJy4r8QnLUG0iiSO/rvbmTrAAdPiTUZrYY+cVB/8WveSfb2c3A9
	 luG9bc/SLNBnVh+V5LBruwu9TNOkSiJElSMSYiyhJufWdc5FuLwtwd/PTYrP81Qdjp
	 5+qNoIBxeZprSeVgkMKpffjMn6EHFCByZF9k6qJYsvANrST5zS2ZKAZiByBhzHFyR2
	 uX6Kx5xOLfkZVVCf1Zyve5A0cYZIT+WF8jlixrvP7zeh5hpt3+H511FWmaWEzE+lvj
	 vo9FzmfG0WtGie4hot9d5tw1HgWKvEARpXM7/Q8ryeRAZ6L8wOe6ySg1C4GJhAOSja
	 npro4v7HOnscg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5635517E0FCC;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F562480031; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:36 +0100
Subject: [PATCH v12 03/23] drm/bridge: synopsys: dw-dp: Fix error handling
 for DP link enablement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-3-d42d3dc5bdd4@collabora.com>
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
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+ipPs8iD7ik+cdrCA73kGnVQQYgDC9VIvxWxUzjPh04=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wdd3JvJi7rqgp4TIhL8Rvs6fdfh68P70
 byH4rls6kajaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaNl4P/jX9GCiNXGi1JymflyfKjzQexCMwNr1/NXkljmhRk+Z21RIdksrqb39NQ5fD3S3/d5M
 rAhnt2EKYJhcLqD8D4mzX0xJSK4xzMEBObmM0cOupbxISPehkeLttbgxvvcM9tm64o1LVG6lZjK
 gbPCvvhA6HLbnjkxt123wfd0Lp8OtA7lO9w/Ymw84jZHICzl1cythe8DIZGHxNnqprGqAwhCHmI
 DgXmlnS+DboHrEJla8397ZfayXZ+6XvoERJ9Ry0c70Rt23Fs1AZf6Z77PN5i8MNyt22gSMOPO5s
 KSIyHNm3IdDFBGKa1b5Xfn46RT5znhjg/IpfavXdV7X4IvWYeIO7R8pFwH0FU53Gy0h2lIDNu8p
 e2TI8QycyWekacDwG7ywDNT2F7vy/ONfj0tDkWx/VKmSlqHJj80uabvY7yeUs6g2sL0g69r4qEV
 QVjtILTm3NyqzY1kwlzyjrquit3qleKdjB47SDV24yxXuAJdGWldSrbEF5xQox6GdSsvA3akvtG
 fGxJrewU0cPwtTSl7rdvlkIsU1SAg8gZZXa4CpW37HpWV96d7nQtsJWFLoGrVSTyYXD4Ufh1uKE
 w7PhnN4CRDGwQ2kNll36TVWD37FnuBLKtH1ALv2k9j6G1bxo/CJUzmIWN6Is2Q4Nh141cl/L9yB
 5ZikOVgX9/mo+vFgTyn8ykg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210059_426803_8743E574 
X-CRM114-Status: GOOD (  14.21  )
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

dw_dp_link_disable() may be called in atomic mode disable even when
dw_dp_link_enable() (or an earlier step) failed during atomic mode
enable as there is no error tracking. This would result in broken PHY
power state.

This is fixed by introducing a new enabled state in the link structure
to ensure the link disabling only happens if it has been properly
enabled in the first place.

The patch also adds missing error handling in dw_dp_link_enable()
itself to ensure the link enablement becomes an atomic operation.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Acked-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ac16d290d49b..93d52a76044f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -279,6 +279,7 @@ struct dw_dp_link {
 	unsigned char revision;
 	unsigned int rate;
 	unsigned int lanes;
+	bool enabled;
 	u8 sink_count;
 	u8 vsc_sdp_supported;
 	struct dw_dp_link_caps caps;
@@ -1614,6 +1615,9 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 {
 	struct dw_dp_link *link = &dp->link;
 
+	if (!link->enabled)
+		return;
+
 	if (dw_dp_hpd_detect(dp))
 		drm_dp_link_power_down(&dp->aux, dp->link.revision);
 
@@ -1623,6 +1627,7 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 
 	link->train.clock_recovered = false;
 	link->train.channel_equalized = false;
+	link->enabled = false;
 }
 
 static int dw_dp_link_enable(struct dw_dp *dp)
@@ -1635,10 +1640,23 @@ static int dw_dp_link_enable(struct dw_dp *dp)
 
 	ret = drm_dp_link_power_up(&dp->aux, dp->link.revision);
 	if (ret < 0)
-		return ret;
+		goto err_phy_power_off;
 
 	ret = dw_dp_link_train(dp);
+	if (ret < 0)
+		goto err_link_power_down;
+
+	dp->link.enabled = true;
+
+	return 0;
+
+err_link_power_down:
+	if (dw_dp_hpd_detect(dp))
+		drm_dp_link_power_down(&dp->aux, dp->link.revision);
+	dw_dp_phy_xmit_enable(dp, 0);
 
+err_phy_power_off:
+	phy_power_off(dp->phy);
 	return ret;
 }
 

-- 
2.53.0


