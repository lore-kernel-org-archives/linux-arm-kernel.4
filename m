Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC52606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DxAuK2u5;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TbudbJfN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hW4PnFCT49QnJHLHRZYt9yWGbDa7JaYp1uG9G1RshfE=; b=DxAuK2u5+frI5g
	I+YvC2zQUnG9mv8R4ZmczurWz51I37uUgopiboQ9qq7+UiDJ/4Xe1q1h/mYAp5XlrCYF86HV1h7/w
	yOQ6uXWF5LrvdZHBYIGgLLUGIdNWSlwcK58VepqHxtQjyfzrP0XRojV7CoQKN6K0AMeM1uQGzpifa
	CTB8aK4WoWma+UVdGxeovm8JUw+A+1n41fpR+PnpEBxQdQxOnH8Yv0TZssbJdhKk1u5Tbcs3lgxmk
	D+EUGGK+TUPhcRThVaA8dMY/rl3y54nwa4+we3aSZeQz6WglLMR/SYbUcFBDqBJ1ry+Izl+At2HH7
	cI9GTWbWpsxx9fXQDZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyfc-0000000H23k-0ihi;
	Fri, 27 Nov 2026 16:19:32 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyfI-0000000H1v2-23hr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:19:23 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261127161908euoutp016f18047437bcda904663770fba08fe41~r80OyV3nl2496224962euoutp01o
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 16:19:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261127161908euoutp016f18047437bcda904663770fba08fe41~r80OyV3nl2496224962euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795796348;
	bh=hW4PnFCT49QnJHLHRZYt9yWGbDa7JaYp1uG9G1RshfE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=TbudbJfN2KEAcseLCdqwwdr/3N0wOH56zgL2BIimSzpkBxuP/owSfOiCEhof6SP2C
	 MiUaDOnX9CG+igbpmtHKVvakO0UfRcR5O2R1KPGRA2LdUyj1tOB3B0CQ7X9vCoZtbo
	 Am8wlPKUb0JuspNHw5s4QNGgclbyXZMM+UasxgR8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13~r80OX2Anv1885618856eucas1p2L;
	Fri, 27 Nov 2026 16:19:08 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127161907eusmtip2fc9fbad8311ea1a87aa12e400dd147cb~r80Ngzdhl2969229692eusmtip26;
	Fri, 27 Nov 2026 16:19:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 27 Nov 2026 17:19:01 +0100
Subject: [PATCH 3/3] drm/bridge: inno-hdmi: Don't give the DDC adapter an OF
 node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-inno-hdmi-ddc-of-node-v1-3-465622e1b7ad@samsung.com>
In-Reply-To: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
To: Andy Yan <andyshrk@163.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jernej Skrabec
	<jernej.skrabec@gmail.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Byron Stanoszek <gandalf@winds.org>, Dominique
	Belhachemi <db@domibel.de>,  Owen O'Hehir <oo.hehir@gmail.com>,  Michal
	Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=PekPu8YIeS97KeLHxN3IfvfgL2ZCxwDu1aOL1IF9Aio=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWRzri1fLcSmmGKvGXY7KeviEk6XVxoSnKo+1w1/t+Xzc
	f0qeZXbUcrCIMbBICumyHJ2Y7SR5D+Gp+XHH/+CmcPKBDKEgYtTACbyV4Xhn0r+v+W/WJwebM9Z
	wfc/LG3P25ePnF56euxSVnvMUbu9O4/hf0j183bZlVf2cX1c8uZm9cPKp/Uv4vX3TWZMYDWLVIn
	JZgEA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13
X-EPHeader: CA
X-CMS-RootMailID: 20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13
References: <20261127-inno-hdmi-ddc-of-node-v1-0-465622e1b7ad@samsung.com>
	<CGME20261127161908eucas1p2fae4a07f1d72df6f675b1e4015727f13@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_081913_868110_EB2E69B3 
X-CRM114-Status: GOOD (  12.82  )
X-Spam-Score: -4.4 (----)
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

inno_hdmi_i2c_adapter() sets the DDC adapter's of_node to the HDMI
controller's node. When the adapter is registered, the I2C core then
tries to create an I2C client for every child of that node. On RK3036,
RK3128 and the JH7110 the only child is the OF graph 'ports' node, which
is not an I2C device, so each boot logs, here on the JH7110:

  i2c i2c-7: of_i2c: modalias failure on .../controller/ports
  i2c i2c-7: Failed to create I2C device for .../controller/ports

Nothing on the DDC bus is described in DT, and nothing looks the
adapter up by its node, so don't assign one, as dw-hdmi doesn't either.

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Reported-by: Owen O'Hehir <oo.hehir@gmail.com>
Closes: https://lore.kernel.org/all/20261012175941.258219-1-electronicconsult1@gmail.com/
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index bbc90ae9eaae04166d502c05fde52e126462b8be..bf39483d483e00ccef0daefb80f6579d5c86815a 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -1044,7 +1044,6 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
-	adap->dev.of_node = hdmi->dev->of_node;
 	adap->algo = &inno_hdmi_algorithm;
 	strscpy(adap->name, "Inno HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);

-- 
2.34.1


