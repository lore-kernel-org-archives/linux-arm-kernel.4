Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB729606AB7D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1Qh+uEw;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YWB52lWn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FShdlslzM911JtukmWMX2/ZVY+TqW//QbC3HYu/eN2M=; b=Z1Qh+uEw07EQCq
	RMe+ThhT3Bd6MdMAg0dAGXxBCcWwzdbLCproh2x/ONx3ft33/0PHnFyjIgL5ezLrPGWLCIuZbE3wq
	O9hAzqqkwyp40GZpqWWmTsUSYem64W2s13ULKitNLICpd0vHZhxLSVxQMitJK0QT0V8fY3VDSZ8XH
	/BZIHgLPvJUudFVb2uZK4tFdOIiyUZSKA5QxWPCwVt700ey0t0zBphK9o0ixKotfKRRY0rkcsslSZ
	0nlEgZZCefBMVUmxejMMMrQ89nbne9utw9iGmrtEMgPZtQ/UvdTsHXSTUzCV3RGsjQGuye1rxa065
	gCh9gQqPoS6zsG0891og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5uM-0000000FRvv-2lTn;
	Sat, 14 Nov 2026 05:02:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5st-0000000FQIj-3XJB;
	Sat, 14 Nov 2026 05:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=A66z4fzdw8+ZbWsKu+Y9Zbehkc3QRLS+yNEvhHjuAYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YWB52lWncr5W13EDdDNOdLdyMjFxvJV25UfjaZ89ELhFqCdWSaX/oeENFnons80oD
	 9oXyidy4wHZBo/iJPFvh2wgZeo+jGkY0xryOMyPptohXTchwSqT3eqgszw2f/VsDJi
	 rRoslH/5O+iMA337w9WXRTfGacn8xbgfMnPKceTsrCEIWbvPISu69GdAlxjDSMJQeb
	 NFbTNze7yXnZsW0XbkONnmhlXl6eECYKO/3XVbGotYR+xDo0jQjp1j6pQ9myA2oghK
	 bKW+yNxLUuDyooZ0YD8WnLDVtQaW2cnu2YzPX4W0K8PqnGXI7EMKfN0JSSPIsL2syf
	 9763wZ0HBYSlg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD4C317E3BDB;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1A6DF480048; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:43 +0100
Subject: [PATCH v12 10/23] drm/bridge: synopsys: dw-dp: Add follow-up
 bridge support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-10-d42d3dc5bdd4@collabora.com>
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
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=A66z4fzdw8+ZbWsKu+Y9Zbehkc3QRLS+yNEvhHjuAYI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36weQXp2TpQc0ktSq3phqETqABg9yRFQTm
 TMrd0NLtcVYtIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaa4oP/REA0d18YRdrXn8W1+NBUMnYf1bPCPwXntiD/fPHV1B6LtMe2oGAEL4dMoytij/ggcD
 cGqFYLo9+gOha9r32AX9D5ILQpHR19oOLv9MXg7q5G4MhToN/ZrOlipVfc5dHhvzHgxLlEPOVmo
 AHtyepbe9Tsa7zAIs4sEiauNBLfCrsUfwtR5vxmV9A8ytDQFJf6m/UCN4ruNk/7l1Dt11eFdiYt
 /YmmmZ2bcVZmFcOZINdkO8z8lYy3M07j9Mmf3rViHXtkYB80h8jMaSkaUeZo12LZPgf88FLvFf+
 6LJIdUqGHKXSIW3jdrrMMonrd8IzIgeY1nnrV0onq23WAH9FG1QB4Z1NPPS49oYCe5WwdTEtyXY
 ghS8Sh4FVUyc7xiDK79liQF4A7dJsUvoIZTpTaej+8gzse+ESHiAJBCRojjodGBgTu+i6fFd99V
 YRnnZMreVavbvVhP/rsRnPNnTqNNUxqPK/u1Vhg9rE1umR6v4ur5FX+xQr0jptvos8yR+YWFl8O
 GFmuEKTDU2S0PN3EO6ZHL0QNBWXpTRq5SufQCjt92g6Fv08g6IwkiPcecK5o6cRNEuYAZIIBkkq
 wzpq3+k3Jd42Gc/mg30dsVpHoitT3ctAvHI//iMIt4NXUzVMc79qDB8voTNUmcxeSoSQSytFQaH
 /EMB9U2ZGvN7hcyqFLcIqcw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210105_675657_5EBCA1C9 
X-CRM114-Status: GOOD (  14.58  )
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

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

It's fine to fatally error out when there is no follow-up bridge
as the Rockchip Designware Displayport controller is the only
user of the bridge helper and has the port marked as required
in its binding.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 5db9063ee97e..74ba1306caee 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -327,6 +327,7 @@ struct dw_dp {
 
 	struct dw_dp_link link;
 	struct dw_dp_plat_data plat_data;
+	struct drm_bridge *next_bridge;
 	u8 pixel_mode;
 
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
@@ -1895,7 +1896,22 @@ static int dw_dp_bridge_attach(struct drm_bridge *bridge,
 
 	enable_irq(dp->irq);
 
+	ret = drm_bridge_attach(encoder, dp->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(dev, "Failed to attach next bridge: %d\n", ret);
+		goto err_disable_irq;
+	}
+
 	return 0;
+
+err_disable_irq:
+	disable_irq(dp->irq);
+	cancel_work_sync(&dp->hpd_work);
+
+	drm_dp_aux_unregister(&dp->aux);
+
+	return ret;
 }
 
 static void dw_dp_bridge_detach(struct drm_bridge *bridge)
@@ -2061,6 +2077,13 @@ void dw_dp_unbind(struct dw_dp *dp)
 }
 EXPORT_SYMBOL_GPL(dw_dp_unbind);
 
+static void dw_dp_put_next_bridge(void *data)
+{
+	struct dw_dp *dp = data;
+
+	drm_bridge_put(dp->next_bridge);
+}
+
 static void dw_dp_phy_exit(void *data)
 {
 	struct dw_dp *dp = data;
@@ -2156,6 +2179,16 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	if (ret)
 		return ERR_PTR(ret);
 
+	dp->next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		dev_err_probe(dev, PTR_ERR(dp->next_bridge), "failed to get follow-up bridge\n");
+		return ERR_CAST(dp->next_bridge);
+	}
+
+	ret = devm_add_action_or_reset(dev, dw_dp_put_next_bridge, dp);
+	if (ret)
+		return ERR_PTR(ret);
+
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);

-- 
2.53.0


