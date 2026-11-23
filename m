Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19072606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dOAC2yom;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CeBXs2oL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=o7sIBFFFGupPpSXGGScHHW+hehWJv0kYPtO1ufaH37I=; b=dOAC2yomovQjjyOTXBJIO+DgK6
	KZIIYKNGyMPN8bDF7Pv5u47QdM1SwgY9TVHM9aal/Ce5lGg1ebnYzFLy6U/sbo6JmA+Umz5HOH/Fi
	NsQhxeREbWrJoiy1l7zOnz4rCB5OdnKYDmxVGIyQIL3y4ChVkPizI5UKxqodsbqMuPb81ZK3E5HWb
	kdsoGOSMOGopTisE1BRD8idRw1AZboynYLL6yRerDIpAiZOuDm9T20YGrs5O43UzTouP1jxlDQOGk
	YdNt17U2MYoWMYPfs3Ua79dsXWJ0DdK8xtg2en69qWMJoy/LAwaie8YOkI02hjHXtRQOC5oxLORjR
	oQII6OUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSvH-00000003Io5-3EE0;
	Mon, 23 Nov 2026 12:13:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSvG-00000003Inu-2pLN;
	Mon, 23 Nov 2026 12:13:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D37E2614A2;
	Mon, 23 Nov 2026 12:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BF51F000D0;
	Mon, 23 Nov 2026 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436005;
	bh=o7sIBFFFGupPpSXGGScHHW+hehWJv0kYPtO1ufaH37I=;
	h=From:To:Cc:Subject:Date;
	b=CeBXs2oLp6A32oLgZuKi8TFJBh8uOfS5BUwobI8S42NbNsdRfXkrzWL+9Q2zYh4Yx
	 0XcdBqK7RUhEVf7O1nCTJk30bvhV/WUaFlRnfrsrLdIFZj5104+Jy1vCQSb7Yeugtt
	 DJvCd81Rl+pOGrONR7Fnk56GQcHLInJrkCHeHUbSlW7OOJ8lZnML2Rkqqp4Xmlz/pA
	 TgjUcBkhnkbvEu6GmdK2VRsCbUixs+ZCRG4b6KqJTwh6ytFW8DZhZEf7fE1xJFqtzG
	 dSxsVARt/EZDM4D3qxAVkt22KVTPa/WJpp3jaj0PoSwvLvt06S5lmCmrPT+psIH071
	 QFLLM/ouWeczw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	James Le Cuirot <chewi@gentoo.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] PCI: dw-rockchip: Clear stale link down interrupt before unmasking it
Date: Mon, 23 Nov 2026 13:12:17 +0100
Message-ID: <20261123121217.1107902-2-cassel@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718; i=cassel@kernel.org; h=from:subject; bh=Htlfg5iHMsP43OFyuabLrE8FquJUbNL/9t80OIK+2Hs=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLJZdBeminx25P9yxP4HU5alfPZCs80bUju/+tRyeL9hX RUtsnh2RykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACYyTZ6R4cMJB6GL2xblnW1e Ls7WYFK8nyl798PAyo+vfN5clRM8OYPhf4hJ9vLwT+2xzb/uz1l+VO6v+G2H70mfl0c/P+HK0tH HwgUA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

PCIE_LINK_REQ_RST_NOT_INT is set by smlh_req_rst_not, which according to
the RK3568 TRM "is asserted after power-on reset until first link up".
The bit is thus already pending when the driver unmasks the interrupt
after resetting the controller, both in probe and in .reset_root_port(),
so the interrupt fires as soon as it is unmasked, even though the link
is up. Since each recovery resets the controller again, this results in
an endless loop, as seen on a Quartz64 Model B (RK3566):

  pcieport 0000:00:00.0: Recovering Root Port due to Link Down
  pcieport 0000:00:00.0: Root Port has been reset
  pcieport 0000:00:00.0: AER: device recovery successful
  pcieport 0000:00:00.0: Recovering Root Port due to Link Down

Clear the bit before unmasking the interrupt, and in .reset_root_port()
only unmask it once the link is back up, like in probe. Also keep the
interrupt masked while .reset_root_port() resets the controller, so the
link down caused by the reset itself is not reported.

Fixes: b376b3ff9cb0 ("PCI: dw-rockchip: Implement .reset_root_port() and use for link down")
Reported-by: James Le Cuirot <chewi@gentoo.org>
Closes: https://lore.kernel.org/linux-pci/08cc96c5171fc969b074371692e6d95d46eba60b.camel@gentoo.org/
Cc: stable@vger.kernel.org
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index ab2e26699409..2ef7ae97eb10 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -686,6 +686,18 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void rockchip_pcie_rc_unmask_link_down(struct rockchip_pcie *rockchip)
+{
+	u32 val;
+
+	rockchip_pcie_writel_apb(rockchip, PCIE_LINK_REQ_RST_NOT_INT,
+				 PCIE_CLIENT_INTR_STATUS_MISC);
+
+	/* unmask hot reset/link-down reset */
+	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -739,9 +751,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* unmask hot reset/link-down reset */
-	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+	rockchip_pcie_rc_unmask_link_down(rockchip);
 
 	return ret;
 }
@@ -898,6 +908,9 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
 	u32 val;
 	int ret;
 
+	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 1);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+
 	dw_pcie_stop_link(pci);
 	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
 	rockchip_pcie_phy_deinit(rockchip);
@@ -938,16 +951,13 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
 		goto deinit_clk;
 	}
 
-	/* unmask hot reset/link-down reset */
-	val = FIELD_PREP_WM16(PCIE_LINK_REQ_RST_NOT_INT, 0);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
-
 	ret = dw_pcie_start_link(pci);
 	if (ret)
 		goto deinit_clk;
 
 	/* Ignore errors, the link may come up later */
 	dw_pcie_wait_for_link(pci);
+	rockchip_pcie_rc_unmask_link_down(rockchip);
 	dev_dbg(dev, "Root Port reset completed\n");
 	return ret;
 

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1


