Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zlDy/Np2;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=gF+a1XOk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7Znv3S/0Risx4b0ZeRoP9GV1/qanj0FzXDAXhm0/Ink=; b=zlDy/Np2GCWLh4
	w6fW8qeW6niA7b7xbVX/6SNpxantorGUzVQRX0vAjY7hf1GdKV5agTV83w9a8opdtc9jZzMUkc3Nh
	nLwlhoeWHFnjnMkMFJbgzGH71B2ABtC/CldMvC8KAz93JYYIvhjWpB1u9oOFOKP65LnVSPEe2gJz1
	zXxmU86hCUnUzxdGPbOY8erEylYqlMQksauXzqp8RCXBQy7O1ZC+tGu1N1WwCmAVCGPBgG/fAlCWP
	pEZrNihL6So6Zs2IWCS67ppGQc2fC7ZtmbWg+P+Sh0nhUAYl6Kl50WFpyE331V7qHWcjJPR1EFS5C
	I4V6YFpYMcoc2Ej8Zk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULr8-0000000EbAF-3X0i;
	Fri, 20 Nov 2026 10:28:34 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULqz-0000000Eb7T-46Qw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795170505;
	bh=F37o9lPF5fbkfJltDpqXKh37zda6M0/QtC4EdaHujzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=gF+a1XOkePhDL3DAVJAIDmYVUlHP/FgaKmR4N7xyWaGLU7TI1JSBSmO0tt6lf8JsP
	 MDCtpH+SlqVxtj9xgNB46eptXDypNoUWifPSA7AhnymU//comVUbXk7kkNGeYjP1Ma
	 MgVvTU1aCMmQCG2eXT1nvPxFQNO3L4VlBPgPiIyXGI+JxKev9yqoP06KK0RgFy30CP
	 S54sQczd1d+/B3W8MdJJbx11vTRuGqlK3W8pWNgqg55Wf4wycUWzoSdAgqLXsw8eb+
	 BIh8/0USwQR4tqFiCnmIUzkxXVtqXsryHO3/DxUourvLI6G8LHuarVnslng1dY5lNP
	 TLN6ZbujgAwEw==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 7D9D78D804; Fri, 20 Nov 2026 10:28:25 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Fri, 20 Nov 2026 07:27:54 -0300
Message-ID: <20261120102754.778283-3-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_022826_056505_0DB739CC 
X-CRM114-Status: GOOD (  18.81  )
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

"wol g" is accepted, but the chip sleeps right through magic packets
in S5: motorcomm_init() turns OOB WoL off and nothing turns it back on
at power-off.

Turns out the chip can just arm itself. Hit it with a reset, OOB WoL
comes right back on, and about 2-3 s later it has the PHY up, receiver
running, the eFuse address loaded into the first MAC filter, and PMT
ready for magic packets. Timed that from userspace without a driver
bound.

So on a power-off with "wol g": remove, reset, set WOL_CTRL_PKT_EN
again because the reset clears it, enable PME, D3hot.

Notes:

 - It wakes on the eFuse address, not the software one. Same as r8169.
 - Magic packets only. "wol u", reboot, kexec and interface down stop
   at the remove.
 - Hibernation that powers off through .shutdown arms too, and resume
   copes without a reset. Tried twice: woke on the packet, link back.
 - After a power loss (cable out and back in, BIOS set to stay off) it
   won't wake until the next clean shutdown. The vendor driver does
   the same, so that's the hardware.

With this the box wakes on a magic packet to the eFuse address, 5 of
5. Without it, 0 of 3.

Suggested-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 63ce2301a0f6..34abbdb645ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -12,6 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/rtnetlink.h>
 #include <linux/slab.h>
 #include <linux/stmmac.h>
 
@@ -27,6 +28,9 @@
 #define EPHY_CTRL				0x1004
 /* Clearing this bit asserts resets for internal MDIO bus and PHY */
 #define  EPHY_MDIO_PHY_RESET			BIT(0)
+#define WOL_CTRL				0x100c
+/* Magic and remote wake-up packet enable */
+#define  WOL_CTRL_PKT_EN			BIT(1)
 #define OOB_WOL_CTRL				0x1010
 #define  OOB_WOL_CTRL_DIS			BIT(0)
 #define MGMT_INT_CTRL0				0x1100
@@ -363,6 +367,38 @@ static void motorcomm_remove(struct pci_dev *pdev)
 	stmmac_dvr_remove(&pdev->dev);
 }
 
+static void motorcomm_shutdown(struct pci_dev *pdev)
+{
+	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
+	struct stmmac_priv *spriv = netdev_priv(ndev);
+	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
+	bool wake;
+	u32 reg;
+
+	/* Userspace is still running and may close the interface */
+	rtnl_lock();
+	wake = system_state == SYSTEM_POWER_OFF && netif_running(ndev) &&
+	       (spriv->wolopts & WAKE_MAGIC) && device_may_wakeup(&pdev->dev);
+	rtnl_unlock();
+
+	/* The netdev is unregistered after this. priv and its mapping stay. */
+	stmmac_dvr_remove(&pdev->dev);
+
+	if (!wake)
+		return;
+
+	/* Reset re-enables OOB WoL; left alone, chip arms itself (eFuse MAC) */
+	motorcomm_reset(priv);
+
+	/* The reset has cleared it. Without it the chip does not wake. */
+	reg = readl(priv->base + WOL_CTRL);
+	reg |= WOL_CTRL_PKT_EN;
+	writel(reg, priv->base + WOL_CTRL);
+
+	pci_wake_from_d3(pdev, true);
+	pci_set_power_state(pdev, PCI_D3hot);
+}
+
 static const struct pci_device_id dwmac_motorcomm_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MOTORCOMM, 0x6801) },
 	{ },
@@ -374,7 +410,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
 	.id_table = dwmac_motorcomm_pci_id_table,
 	.probe = motorcomm_probe,
 	.remove = motorcomm_remove,
-	.shutdown = motorcomm_remove,
+	.shutdown = motorcomm_shutdown,
 	.driver = {
 		.pm = &stmmac_simple_pm_ops,
 	},
-- 
2.56.1


