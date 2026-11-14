Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A327606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZ/4if59;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=b0QWyK4f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IuiYOKD4YLpreD/nLJGrziEMcmfonKY4MY8JFDw5E7k=; b=kZ/4if59yk1m4z
	CGF0UdXJyaie8iy2Fjqzx6S4uIDiJxY6PeNqnNXM/OzwBou9FHcClzoqhcbQeqQlQPEQGUZcK48LH
	sbfMNBQ/NT4+D7cWqtc9hHoged/SLlDjyZ5jMupvOiJyYcLpspYm8R4EvgDBXR7eNLZM7w/Mdqem2
	vVQS2xoqmoPt/BgWlIxRQWJnJ18I1q42fsXkk3TrEf7mxTLghgHLaGQ8r01mjCDNA7ofAl4rMEeo0
	jo8zFp1jnzZCRERp7e6uuqMuWhusrisgVfPioGMijNP+3l2rtl02fSM+LTv+aP3EGLwSP0cASWXEJ
	FznoEg9EFtBK0qzJpKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5sw-0000000FQMD-0hcv;
	Sat, 14 Nov 2026 05:01:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5sp-0000000FQGQ-0zw4;
	Sat, 14 Nov 2026 05:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=gVPDlukkMHav3dijaRJZnGw/xEdv0jNsddzU7nlThLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b0QWyK4fZqxYjqzTac6iJikkx3E7WcQRCNd3Tss5HQzOuzUngnFhQLv/G+V37eZw7
	 yZsWwfBMI9WpBuqQgIBgIHBbCJnU+MPLrdBtwmtyZWF5PxUw6SY4HeMxEaDFQrMbSp
	 Ytmwpl8zlMDcO0CJu8svNY8q2mkAJ/1RkNGsLnIjnOU4QVULacTWQvRmf2JsSwFxVN
	 KXhKK29JY2bHObsux1Kj2yLMoZxcOthNrdP6tQCR/NK6H0EuOKl2tgXN3BLWamKQ9d
	 xKPSi3sdKIepyJofzG4LuXBmtnOKKMZq50TFwhUwwW9BavKcay13oJxkwYEhjERehs
	 lERU7WxzV+Huw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5764417E12E0;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 10E70480035; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:37 +0100
Subject: [PATCH v12 04/23] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-4-d42d3dc5bdd4@collabora.com>
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
 Sashiko <sashiko-bot@kernel.org>, Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gVPDlukkMHav3dijaRJZnGw/xEdv0jNsddzU7nlThLs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wfSqzx2QfkGHKW8EK8uQUKg308joTDPL
 4umTdCfrivmXIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaReQP/1XxlW/jNg3nUvjTtgHCnJ+piAlDVuw9Ow1SV/ZaGAbPW1tHnddufVDtARiBNdGyF7I
 xS89bBmwPHuCmUaboYdK+HmrI5ZWr25icGs/HP8mzG4XweCPVgvsZZ92VoPtjmiuuqu7C2249om
 MpEs9oWoXmk57SzkmXJ76RDD0VYR/U8qOpKxRt4dcL+eV0cjxpo5QzxayLe+JJfBiYGjdbl6Qgp
 5ohVIyqyEq5z4C7lRoBJN0eh3FuwD6namvjPnwKx2r9U0BFAn2YikAGLsgR9DRlpMWHCCw5+u3Z
 grjksAunRiTL7pgU5AjGr5FvpTl05hpb+TUvGLg4QD0PKJXaZI1nzBLGwiLwA74wtXPpaPcYJ5H
 O6dblw36qkXJqDRZV6p9vrP6MZeiTa3bPkDInl7BOCoqcBtJYe7zxuc9D8LmpflvVZ764eMEtN3
 97wTNJYVzWlTTAzGuqI3tYGOSVrf/89EJAXdfY4ZRaSyNXwKSYVW9h9r7UYiAfsvvr7FNt4eMK7
 VBOyvUBA2p6mK3It1PH2OwzzNQl+2apdII6ZSOxCli3DupBrPI+V1ORmLyPgRvcM3TBdwG5kqor
 SWm2qR6alwXYmNwdV1HPuowvzpH7wE1aW2NtNRbSCq6/Y7rZ7GjIwHR8tvpnXXpD7u8OURr8nry
 /bYPIk/KvIWRjSVOKbw82Ew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210059_445622_4F307642 
X-CRM114-Status: GOOD (  13.91  )
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

If the driver uses devm_reset_control_get_exclusive_deasserted() instead
of devm_reset_control_get() and thus automatically deasserts during
probe, the SoC will hang when the device is unbound.

This does not happen, when runtime PM is being used (not yet supported
in mainline), which suggests the power-domain involved requires this reset
line to be deasserted.

Even with runtime PM there is no guarantee that the power-domain is
disabled as it is shared. Considering the power-domain does not have
the reset dependency described in DT, document the problem but leave
things in the current state until a better solution is found as the
reset line is deasserted by default on all supported platforms.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 93d52a76044f..9677f789c986 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2091,6 +2091,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 		return ERR_CAST(dp->hdcp_clk);
 	}
 
+	/*
+	 * This reset line is deasserted by default; asserting it hangs the SoC if the
+	 * related power-domain is still active.
+	 */
 	dp->rstc = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(dp->rstc)) {
 		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");

-- 
2.53.0


