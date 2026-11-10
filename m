Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DF606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtM9pJt+;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TZ8SQgs6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uzequ7u04c7zvTxs5TC7dHbAyubOrWFz3bgZTquTipU=; b=PtM9pJt+KYoPF6
	nY6FwJ9XL6pY1y1L0jiKsRnIme/IX5y1e0Suy5uXvzYz6H1VTJh7hNqh8wzW1cUYVCJCK/Wvm5uwK
	d+s71qEc7fvkg7A1qzVHyDNnjUeJuPNh2LN2QLN2TzOrHRirr/rBZFOcOuMDRKSxjR7qQmNqD935k
	cwB9SXyuazdQhUA364WJ5ns7MgOrBjB3znL4/rgzL/bxP1WIXDQ/5UCwat38SOp5fGGIGexSoksP5
	/ervu4LNxmS29I+8Z3He8UEUPySNY3GKhUWYIT7FBGcSJHfc1SPeRE81/dB8sdoFF3QrrQ4QgStUs
	bT4z7P0OX5J+Pp7ezLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVY-00000004eDw-3PWq;
	Tue, 10 Nov 2026 17:19:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVW-00000004eBg-0GoE;
	Tue, 10 Nov 2026 17:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TZ8SQgs6tjdKliKufAD2RYTRQajHbrht/NL9Jadw4N8N+/SpFKLJ8pUuUR8aUBnF7
	 3bksch1DHN5teqEiEHOkgLQ/c9+fHQ71SClfy8BjZDbJ6OkRfXsqw+DxodIwZW4N1I
	 tzIKzD8dHFMRLlqRoTKh68VU4uLsBQRPAewCO9n//ltUT2hOZ/80TK1RCyBhSzOu+t
	 wD7h59dM2hm12iOpV0b+aRCtcsGo1YVSbNHekAbRo5VKaGZ99sbVwgfZtNrHQDVkN6
	 T7dY0xYmc+OaJbVG1w+BjS7WK7QVODI+WrImvWSCZBlwqx6DE7A04YCF/dX/1uD/uv
	 HOgkXdy45FXIw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 530DA17E080B;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0B80548002B; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:14 +0100
Subject: [PATCH v5 1/6] phy: rockchip: inno-usb2: simplify and unify PHY op
 debug messages
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-1-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUipMtJGjGA7JsIcLf3X/vQtc34JG3owgb
 gomFsu+/0ew5okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qa9+4P/jXLFAzanFy2iVOWOeQXHODjQAcCzLbIZhbdiO6JmAqeTWyjaik9uvM7xdlmzVT7dzC
 /Zqm+MiuWGWjYv8Vhmk6ZHBQpRfA6X1oNyL0f3DF1pw5trmo6Ub7e3qP7TL+7J3DmjF7J8acInM
 jiZesbm0MkYJjobjB8BtgCfBMY6Egsk1/9dB0Wjf6QnMH8zVO72AipVuVz9EHGXDfa+FktDkcdP
 EMnxL8wVP+9RTzqvfDzvfTPVU72o1JgHldioHOLNXjBdZpUxuLtryv+7tfdjUeEZ78jqldL47fB
 BxGj+/5x/m1nSIAEjlWg8rzNQXWThIAFJq7djD1b8ikmbVLM9NwGqqG/sj7xxlVlrP3lKVMiqmf
 cIn8ntl1nvM++t/TMNjD3mNQVzzdtYpPAM8QKnHNWbhAIedLOaNjLDj+yziUtP1MPZROfeeuAAl
 4IyDsnKHqdWohaJRdvIT8qP8ffcxQTymxmB9dMKUtjZnDZaH+bkSqpvhVh/hyHJHLJ/JTHwtSpD
 zKWR8LmHfLbIdZqDhXC//LJ43AN+Qw4KsqGNkA2Vuiy37PKtI2QELQTVAQIcfdW5BWQ44lNsIPO
 4iI7CoGds8byt+wyg5m8Eqpn12Bwkmot/dKMq9RXQoLBwmUVDQ1gV73IiKGvSnoNv0R1Z0hjpJ5
 r8CtTe+BGYADcJ4f3zqYwfQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_091942_263659_FCC628B4 
X-CRM114-Status: GOOD (  10.84  )
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

Add debug message for init/exit in addition to power_on/power_off and
avoid the useless extra dereference in the existing power_on/power_off
to make the prints consistent.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e47b89015586..0b61f152eb3f 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -508,6 +508,8 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret = 0;
 
+	dev_dbg(&phy->dev, "phy port init\n");
+
 	mutex_lock(&rport->mutex);
 
 	if (rport->port_id == USB2PHY_PORT_OTG) {
@@ -592,7 +594,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power on\n");
+	dev_dbg(&phy->dev, "port power on\n");
 
 	if (!rport->suspended)
 		return 0;
@@ -632,7 +634,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power off\n");
+	dev_dbg(&phy->dev, "port power off\n");
 
 	if (rport->suspended)
 		return 0;
@@ -651,6 +653,8 @@ static int rockchip_usb2phy_exit(struct phy *phy)
 {
 	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
 
+	dev_dbg(&phy->dev, "phy port exit\n");
+
 	if (rport->port_id == USB2PHY_PORT_OTG &&
 	    rport->mode != USB_DR_MODE_HOST &&
 	    rport->mode != USB_DR_MODE_UNKNOWN) {

-- 
2.53.0


