Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B6C60A260C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gp/iD/I6;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FZ+wzuhM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uzequ7u04c7zvTxs5TC7dHbAyubOrWFz3bgZTquTipU=; b=Gp/iD/I6nJ4L7S
	dganJ79EQxtzAI8rTPgVSzBqSa0Q4BKzxThFjZPl1zY3xeXLh2LbgZWdOaV3Pp569Jsno3rvXl1VE
	zEYNkjvmuOcjQ/TZKnTvb+uZkx5oybT4OpEy1rwIuPIlzdMfSSHuQc+SCkrlurPIVdsWQY8PRkKPS
	Qxd5U0tSXQP6TlUPR9WtOahrsI168/QvL1i5Gi5v8KE+uU45XMo+nci9YAPdKwbAuSzDayAiBp8mw
	6AwNRUOA1WNLel470Od2NOBUxsWgeuibJqxrsdRMGkTLYJwI8zQVHVWyXM9ZBEqZRopCEB2mdFJYd
	NJEoMVBqeX4bCLe/stkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZKA-00000001yZ8-49LB;
	Tue, 10 Nov 2026 00:02:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZK7-00000001yX6-34Rl;
	Tue, 10 Nov 2026 00:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FZ+wzuhMGbTtx8caZk+DhnWMr61exkh0BQV+va1fTady2eKV8o2IUYVKrZRJOy7kn
	 EUIgYUbQqSuOItX/qzhDV/1bNBEzjA8yaNjvgdbTlrApVorPFeqbqUBdKRNljKMEGT
	 YlLPmDqbBjNJvMw8Hg1lYA+yj29teNaSgQDRm72MCkAqhPRNsbDBrs9MhrpqmolZj9
	 KukW0Ipa3nrTJoCXmziCvqwavj7/bgBWmt+ahwbvI1C4maC+NC+ZJnj1q88M6c0Rlx
	 uJ9JGQ2ZYCsNdpk2HSbvqI6don1kulHUBXlAG91rRi7yO17/9jDmYeI2lxKcusDK33
	 9DhMjMDFrvUEw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 658EC17E04B4;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 224BE48002B; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:46 +0100
Subject: [PATCH v4 1/5] phy: rockchip: inno-usb2: simplify and unify PHY op
 debug messages
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-1-51acc071634f@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXydLwAKqjWujyTi08hJyBtJKJsb77rzZV
 fRQV9auXCcFmIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8nAAoJENju1/PI
 O/qaa7QP/RbehpOBiM6icqHkNuTJ0LsxT0CwSPShsV080C/QUigLcxkkL0G8S1NAsXhUC8H6+k5
 T9niz45mo6wT7fGyJBdvJIIsek8HTuwAHPMD9X/dSbPR7ozpVCzOu5Nf8NXPcTYeiHauyXUXjYg
 UPlCGd/htCIQwjtuG6ztTcHmZbzgWobQ4QMK34qzykVBJJVNf17B6W3igeaGNrobd4ECjTbp6kz
 4BEuHXwfxiBOVISj9/RW1Ddy38L2ur+9v63il8g7dDnOastg8uyNn+4n/69c7IL1AhpmuMH8FJx
 JQE/HDQxtJUxXXaaCNu939GBG1d0BUsTkD16ExLEng5TQqOlFCaRhpgZxOYLWe5W5ml5JIr8r5G
 +PmK2sDSYlDNRG24up9B7k3DeubuODKiRVyuEYC03I/Dfc2Gv7QNFosXcJBCPLKpENSt8LGjpZO
 dV5CFiln+ofvbid99t/8WbVjcITp8SesiWpqFHbNCJSC7jO/72qMm1Dg9BoYntuuh9kZlCCj6C/
 xNxssW+JgexS0kg7aJ3lyVhz6cAVrhpwS6smBgqt2VVwUBe8wqN9RDm+yeZpiJrq62FKiJic/Gl
 Vvrp05Kj03IbB39HKO/pvLck3WLn1FIG2r0tDt69Fezy90x6NtlA9qDh7Q5nn7VigPl3kCvTdRa
 zpcCGQCAf+9V65DF3eXoxpA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160251_956589_05E1ED72 
X-CRM114-Status: GOOD (  11.04  )
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


