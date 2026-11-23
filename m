Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDA1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=csO2CAmA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHFPByGf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FN3Bbbst5D0sGRM0932dqc0PNYvsp0yyVthhcry7hX4=; b=csO2CAmAwywUzJWpv4RRYx7hRK
	CpIgQt/5oclSnnZ7tGCFL7SetyBv3DDixIxfhNstlupB6M7/GmK0gCvzdMyhgWsybS1Xd1n7X94Nn
	FtaAcMYNuDViP4fPmKQOPamofhDvB0dKBZkQRhZoATo8KOkJnGThUkd8nLnKDcdvX6X3v4Ah5wbDv
	MzLleuMg6cwAbM1+d/mW40fWCyJz1OJqWyIX/wLOjSm1CWBTntv2FhQRBjq+eRpewt146nTvwao7N
	tBQRze/kGvVwE9YoTqQSRFR26vJcLJZ+1ExzBJehPJFOPEhp2kVFguRAUPCiG0gFAjKao7RqMvjVN
	CGu8ZFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIDS-00000002198-08yp;
	Mon, 23 Nov 2026 00:47:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVICX-000000020Sr-0yRi;
	Mon, 23 Nov 2026 00:46:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8149D61B16;
	Mon, 23 Nov 2026 00:46:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795394792;
	b=yptY7uAb93MVJJFc5VeLgvj+XxQCbkZIQR6274cjaxk3BQ40GO4uah7qhEZXaWyhDbeE
	 zcDhLtA9WV0wteUF5L1WwcZs2x8GcgD0FIR5aL/vMnI7NTqcrU3VcNmJ7ApD9/ieohe6p
	 COF9kuhee3Hm0mkCG6VGN1zEIBIJxVjgVt+0IR56hmah/GaSuenmKXz4oMuFATtLg2Qxl
	 wvpKCvAEJrIStyd180KIVU92ar3+SIzke+jgL19Ucc55EfKj41H42zleIxuarNrPLXjqQ
	 TfZST9LzLommRhr9vtNgNHzTULzsVVogMB5mtl3Fdlc98vauhLUrSx1/JqLVLE6MXxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795394792;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FN3Bbbst5D0sGRM0932dqc0PNYvsp0yyVthhcry7hX4=;
	b=croIgxelQWqLOdJq1naxm7RqdThBTNaGJYzx0cIkKyVJtCamgTdOkA3ZyXgD5JbASQYW
	 Y2O0754BDLl+JCBLcLB2aEIGdbrCNBPakD6yckXDpZDk90ALRXK6MyRLrkGeIgb6TEgtE
	 FQOx2BT0yC7o51a+jqLkDd26tYV4VRby6mVguLtsZNe/frq0sn3fyLMz9qUu2LleNxmqd
	 RxjaBjh3+DjwD+hje+o7UlMrj1Enwgj4hdp2riLea41OTjhtTkTvyXsKgt4KrxfRpXDdJ
	 9h/+CHICb8A0wZCNr76Y+KVSHgsmWyNKR9SNYwDw9rn+eFMAuyi+jwRnfj6Ks3ZXpbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 135871F000D3;
	Mon, 23 Nov 2026 00:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394792;
	bh=FN3Bbbst5D0sGRM0932dqc0PNYvsp0yyVthhcry7hX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lHFPByGfWvtPMngvhAQTXd5gXRh/T2z6+Zzh3Pk2Bve+97yw/TJIKu0vsI138LGEi
	 5p4uaal1x8ZeMD30FZvrAVoByhP+TPRxVgwD/plu3u1baucMK2COALbq1Z/yo1sTYX
	 ZJSzmx+X5tUjysv29wDACFQ+zn81A8T7zMP/v/ohE3WV2gw0cq7yctzFti9IZsS+qE
	 TpbmPphzAytWSbx9iBiUSPtMM49xN883h64YaSD8Z7L9JTW9VvVa2Nj3oez8rJjUIv
	 X+1XniOOkl0yTVLrfRWGpNc1nsKHujM0RJNOmGgzgd7aDMyvEIjwZnpGVABClVFQ11
	 ODkyChF2iYXgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 977114C286;
	Mon, 23 Nov 2026 00:46:19 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 23 Nov 2026 00:46:15 +0000
Subject: [PATCH net v8 3/5] net: phy: stop postponing PHY interrupts when
 phy_suspend() fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-phylib-mac-pm-irq-v3-v8-3-e9f706e79614@iav.lv>
References: <20261123-b4-phylib-mac-pm-irq-v3-v8-0-e9f706e79614@iav.lv>
In-Reply-To: <20261123-b4-phylib-mac-pm-irq-v3-v8-0-e9f706e79614@iav.lv>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-pm@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Lukas Wunner <lukas@wunner.de>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Wei Fang <wei.fang@nxp.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, 
 Thangaraj Samynathan <Thangaraj.S@microchip.com>, 
 Shenwei Wang <shenwei.wang@nxp.com>, 
 Haoning Cheng <Haoning.CHENG@cn.bosch.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=uRMMA0Q2puJNX3mPj5NSRgKeAYrUSBenrydqXPVYlvM=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNnMPTcunbzVGP1OpeTbgvawfYxi57IlgpU/MQg4/Two6
 XRPVXB7RykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZiI5GyG/8Er+nccNVhetqpN
 yupD+yHR8gMWbvE3ApMnTtGfw/rywU6G3yweXLbbD9j+VhK/FrBpk49ugWSyqsuTJkGlO3ru06x
 iuAA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

When phy_suspend() fails in mdio_bus_phy_suspend(), irq_suspended
stays set and the state machine stays stopped: the PM core does not
resume a device whose suspend callback failed, and the next PHY
interrupt disables the line until the next resume.

Undo the postponing and restart the state machine when phy_suspend()
fails. Set suspended_by_mdio_bus only after phy_suspend() succeeds.
Set before it, the flag outlived a failed suspend, and in a later cycle
where mdio_bus_phy_may_suspend() returns false, mdio_bus_phy_resume()
ran phy_init_hw() and phy_resume() on a PHY that the MDIO bus had not
suspended.

The error returns of mdio_bus_phy_resume(), after phy_init_hw() or
phy_resume() failed, stay as they are: the postponing goes on, and a
line that a postponed interrupt disabled stays disabled. Undoing the
postponing there would run the handler, from the next interrupt on, on
a PHY that did not resume.

Fixes: 1758bde2e4aa ("net: phy: Don't trigger state machine while in suspend")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Haoning Cheng's Tested-by on v5 is not carried: this patch no longer
changes the resume error path.
---
 drivers/net/phy/phy_device.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index f2e2370b4be7..2d2058c29f30 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -368,6 +368,7 @@ static __maybe_unused void mdio_bus_phy_resume_irq(struct phy_device *phydev)
 static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
+	int ret;
 
 	if (phydev->mac_managed_pm)
 		return 0;
@@ -385,9 +386,20 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 	if (!mdio_bus_phy_may_suspend(phydev))
 		return 0;
 
+	ret = phy_suspend(phydev);
+	if (ret) {
+		/* The PM core skips the resume callback of a device whose
+		 * suspend callback failed.
+		 */
+		mdio_bus_phy_resume_irq(phydev);
+		if (phy_uses_state_machine(phydev))
+			phy_start_machine(phydev);
+		return ret;
+	}
+
 	phydev->suspended_by_mdio_bus = 1;
 
-	return phy_suspend(phydev);
+	return 0;
 }
 
 static __maybe_unused int mdio_bus_phy_resume(struct device *dev)

-- 
2.43.0



