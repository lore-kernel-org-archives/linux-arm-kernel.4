Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B6606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/jkPpcp;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=C9ylrcxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VprmHzKoevFYyO2zpBf3Oq2WFfWlTuyEXWwmu0tCtkw=; b=m/jkPpcpfau5zi
	NZkSI1E/GG2txtTCu82GFWFEHpla/MEsK/q/zSLm2VKrMrLp3m7CkNqIbgbarWXeX8VSFEzuQYrPC
	61FI3cToPxwbZchnFD26tX35O/wlunw7++iRZBShy5M9X1bwyL2r0paoQ4LEnC4E60xPqJV16Xe0W
	A1yDLhV6scoHqkJMvAZHL6L1HTHiM/l8krB2t2MC9VA3+wOvT78d+K4rs0QsYO2PTFBhaGVL/zsXf
	B271McaRkqekEjWzmgT24YeZaGUCpI9oZkEfH+gOg+fQP3U+pYmAU15JTXx+P6V9Iq9G6f2P3RRJI
	83T+dxMmshts2V4TnIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5tx-0000000FRVb-1X9p;
	Sat, 14 Nov 2026 05:02:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5st-0000000FQIi-24SA;
	Sat, 14 Nov 2026 05:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=QxdMOism8SgOCS21Pd4nTNnv0OG6gglB5ydp900h808=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C9ylrcxnOe6qFQsW7w5p6iB73+p+F9WFdttzRktJm0Gz3QPt1me2gbKOZX2LJoyJ5
	 WrbwhtQ/bm38NBS9909QE0u/DJoodlHz9ZxJakVvJCEOG/KHwa7/fIWAyqr8S8WeTg
	 Y1BAVcCLcGgyjT22zTq2eFkfhxIGqr2tuqTywzy4KjiXhe2l8OYl+0djHNMiRO4R/j
	 wWxakRLH9xL7hZ2LCBpHnB86QPbODRdhyHJACxYieVhDoiUuYQ4dPPLSgUulOi3XA0
	 KdKJKOzuR+/DeO0/TxmJNC+I+oW7kRxMfki05T40Oa3jDeWfLcLFEmDdZKfqckX64B
	 iCUeM80vdhjkQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B645617E3BD1;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 18F89480047; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:42 +0100
Subject: [PATCH v12 09/23] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-9-d42d3dc5bdd4@collabora.com>
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
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3869;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=QxdMOism8SgOCS21Pd4nTNnv0OG6gglB5ydp900h808=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wfglAOEVNJTvKhHq999+Q8N9n2wXR9et
 JNR4P8DgheS/IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaKm4P/0lrFXviKzssjcyuHIGiSo66qrpi7GBtUwUZy5lI0ZXbrZD88OPNhhk/VzqOGj82kJX
 uZSNYFwYOTEIfZpfGWSWH9OnG/lY968p5LppZmPAIYiv1/8yuO5NbYdz5OYZKhAoDXmiyF+FaSD
 KNNDy++MpoC+6QVD+6wx33vaMddEbL2tP5YsaNcP+uZSyBb2UPknjYIA+y1PNdUnFAPHFQ2Fx5O
 IXnZA7U79zz2tn1NuqMuJmkd4WHkPlpoDx7bOvFBF5yVRO497O+nOx+P4cmoDTUBAxZHC6E9Exo
 H53f75r2gJYbKyD9epp2/fTFEIgqSiAJawqH8Ai8y+o8/3EYGSWYHANN7zsa/Cssh6KaRdPzQqm
 eMI+MoJtN7wm/vm7YMhqIi/wJs1F9qX2IB26BS5S3uK7dSzHeHIjg3kIyD8NJhqeHUutpZsw4XI
 yjuiahRWxhoOsun/VYUhm3Jluy+bfbXmWNBTuS9aWTySWD8dRRyMo30nxUw/zq3YjgzmrxwSDPS
 0apuKVFnHTnIUpBR0QCmPpFJF7iY6/UFei5FjjqU07Esvzid9zUr6Uv4lLZJsQGr3aO8MxF2zAh
 jp+cAbhBxt7Os64GaD2eaqMvta+R1oiEp9ts4IpZUpf59o26V5Z97kzu1LVFl0Rflz6JbHeNXuo
 1VF5U6MGkYNdAL5C/AFs5sQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210105_497122_97B35EBA 
X-CRM114-Status: GOOD (  15.56  )
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

Add support for MEDIA_BUS_FMT_FIXED, which is e.g. requested for USB-C
DP chains as the last bridge in the chain (aux-hpd-bridge) does not
implement atomic_get_output_bus_fmts(), which results in the generic
drm_atomic_bridge_chain_select_bus_fmts() code using MEDIA_BUS_FMT_FIXED
instead. For decent support of this, two areas are changed:

1. In atomic_check, resolving MEDIA_BUS_FMT_FIXED output format by
   using the negotiated input format.

2. Implementing a custom .atomic_get_input_bus_fmts hook that, on
   MEDIA_BUS_FMT_FIXED, advertises all bandwidth-validated formats
   from dw_dp_bridge_atomic_get_output_bus_fmts(). This lets the
   upstream encoder negotiate the best mutually supported format.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 34 +++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 158c727ab58b..5db9063ee97e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1536,6 +1536,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 				     struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	unsigned int out_bus_format = bridge_state->output_bus_cfg.format;
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_bridge_state *state;
 	const struct dw_dp_output_format *fmt;
@@ -1546,7 +1547,10 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state = to_dw_dp_bridge_state(bridge_state);
 	mode = &state->mode;
 
-	fmt = dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
+		out_bus_format = bridge_state->input_bus_cfg.format;
+
+	fmt = dw_dp_get_output_format(out_bus_format);
 	if (!fmt)
 		return -EINVAL;
 
@@ -1831,6 +1835,32 @@ static u32 *dw_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	return output_fmts;
 }
 
+static u32 *
+dw_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	/*
+	 * MEDIA_BUS_FMT_FIXED means the downstream bridge does not constrain
+	 * the bus format. In that case, advertise all formats supported by the
+	 * DP link so the upstream encoder can negotiate the best match.
+	 */
+	if (output_fmt == MEDIA_BUS_FMT_FIXED)
+		return dw_dp_bridge_atomic_get_output_bus_fmts(bridge,
+							       bridge_state,
+							       crtc_state,
+							       conn_state,
+							       num_input_fmts);
+
+	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
+							 crtc_state, conn_state,
+							 output_fmt,
+							 num_input_fmts);
+}
+
 static struct drm_bridge_state *dw_dp_bridge_atomic_duplicate_state(struct drm_bridge *bridge)
 {
 	struct dw_dp_bridge_state *state;
@@ -1883,7 +1913,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_duplicate_state = dw_dp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
-	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
+	.atomic_get_input_bus_fmts = dw_dp_bridge_atomic_get_input_bus_fmts,
 	.atomic_get_output_bus_fmts = dw_dp_bridge_atomic_get_output_bus_fmts,
 	.atomic_check = dw_dp_bridge_atomic_check,
 	.mode_valid = dw_dp_bridge_mode_valid,

-- 
2.53.0


