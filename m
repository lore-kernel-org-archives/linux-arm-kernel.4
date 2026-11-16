Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B4C606A882
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S1AdAg8g;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=aUi9Zpcx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LAYAjOiB6YavUWNwzjYK42ueMROpBm7ZZ9Z9jg4H5mw=; b=S1AdAg8gInbqcV
	Dh4HtQ+PP7Ffqk8oiEbR9KWlK5SaEujR5eaDxNMSmzSYWfNixAL75Ipu+R6ymI1sKknod+I/GGu7c
	Mh/pefvHg15l86Ef9gh6+Q0YR+CuOh9yBuDiVJfiSU34FSmCfOyKWI60zjQ0TEFYKbMtzvv1/JhRQ
	VjUEvBPkQjx8vGKYW1z7qRxMsx3O96BJDG3f0Ch6eGoXHWXlwaPnGRhcw3t18+GSBaEh4iEk7Mpa/
	Y2E464W0qndzH+QFUxN25q3rdtFNh5H/S6fjis73VTrFPm3T0EXBZqLPC+pvUmrmMt1vBXzqnyjJO
	P3l+lX7YHa3XLN1P2IaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsrF-00000001kOT-1NfL;
	Mon, 16 Nov 2026 09:18:37 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsrC-00000001kNQ-1SPs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794820713;
	bh=NEmzrlhSleob7noedVQsqsHHHILDcHnTIaSn87BO3pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=aUi9Zpcx2XUpYCcJxzV3GVVGeTrThLpiVC8+mTEOwS7yV8L0aMU+aLh7ho+y7IwCv
	 y+50bVgMG7qLszikqaQWtk67+dScsb/qjNX0AUR/6LPbMuj/wpPGDdshGgoChNrvAb
	 Nj6fgmxoY2v++CglgZHi3WxfSixohWs6hkkhU9Qk3eQNrekrZtg7b2Gfab1e5vU/du
	 uQaloGpBoFIEh2CVY+8PlPPoQgxxPe09yiMTnufwYlK1e4HVb8pNBcWSRceqcRYqEk
	 OQbhbsB1PnrAj/AR4FxGJYmUIeFB8sTzL1hjvdjG2oQDPJb0zphckZJew06On6IEbZ
	 sxryOFvoqFTKQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id D5EC78D755; Mon, 16 Nov 2026 09:18:33 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
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
Subject: [PATCH net-next 1/2] net: stmmac: dwmac-motorcomm: quiesce the device at shutdown
Date: Mon, 16 Nov 2026 06:17:56 -0300
Message-ID: <20261116091757.1656602-2-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011834_424458_ABDE530E 
X-CRM114-Status: GOOD (  13.85  )
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

The driver has no .shutdown hook. At reboot, kexec and power-off the
MAC and the DMA engine are left running.

Add a shutdown hook that calls stmmac_suspend(). With Wake-on-LAN off
it detaches the netdev and stops the DMA, the MAC and the PHY. With
Wake-on-LAN set it stops the DMA, arms the PMT register and keeps the
receiver and the PHY up, as it does for suspend. That is not enough to
wake this chip from S5, so the system still does not wake.

stmmac_suspend() ends in stmmac_pci_plat_suspend(), which enables PME
if wakeup is enabled for the device. Disable it again, since nothing
arms the chip.

A failed resume leaves the netdev detached with NAPI disabled. Skip the
hook in that state: stmmac_suspend() must not run a second time.

Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 42f0b11a7b60..1e142ad39e33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -204,6 +204,27 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
 	return 0;
 }
 
+static void motorcomm_shutdown(struct pci_dev *pdev)
+{
+	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
+
+	/*
+	 * A failed resume leaves the netdev detached with NAPI disabled, and
+	 * stmmac_suspend() must not run on it a second time.
+	 */
+	if (!netif_device_present(ndev))
+		return;
+
+	/* Stop the device before reboot, kexec or power-off */
+	stmmac_suspend(&pdev->dev);
+
+	/*
+	 * stmmac_pci_plat_suspend() enables PME if wakeup is enabled for the
+	 * device. Nothing arms the chip to wake the system, so undo that.
+	 */
+	pci_wake_from_d3(pdev, false);
+}
+
 static struct plat_stmmacenet_data *
 motorcomm_default_plat_data(struct pci_dev *pdev)
 {
@@ -374,6 +395,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
 	.id_table = dwmac_motorcomm_pci_id_table,
 	.probe = motorcomm_probe,
 	.remove = motorcomm_remove,
+	.shutdown = motorcomm_shutdown,
 	.driver = {
 		.pm = &stmmac_simple_pm_ops,
 	},
-- 
2.56.1


