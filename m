Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D5606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 22:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNlH+62u;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YBZKwPBE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D3i3JtW8zZwhx3O8fVAAShGYEZv1RrlrSS1d37HB+mg=; b=HNlH+62uAtQPGAaacx0AHKGhi4
	MTMgeI9qIn0DunXxeakSr/5MOoJZDfBkdc05hgk7QWMF2SFUG3ymab5sz1+gccjVuBntX6EpmyM3g
	KhNPZEFKmSqp0M4F5o3cIPtCGWNkn/8Tndm1gBcpF6G957CylWJlQ2oT093AUdty8qSkIbWeg89Sw
	Ol1KgQRKIsd10/JE8eHcwEKHkpp9CzRCKiuHvpv0roDcxoDtmjB+NKPVYjy2UonNSXfFyhfTUr4N4
	x7Lwui7wBv7HI9kqh1Gy5VBQHWiHEYty1BwljYknPJsxFcdiOGQsO3NBppgYOwXjj3VJJmQHfXKym
	S4igN4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLzi-0000000Gor9-1uIL;
	Sat, 14 Nov 2026 22:13:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLzd-0000000GopH-1kT6;
	Sat, 14 Nov 2026 22:13:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 893D16020F;
	Sat, 14 Nov 2026 22:13:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794694384;
	b=c3hOBt+ljH3cz/zZwWhaYmG70opnZpX87bRFXCycxaWErCyhv70DYn4R8jGE5yfHnqTT
	 BGwX9iSfZvwoCqttZqYBWuoPJK/NO/DZ8+YEArOReEPAJx2n5uXADOrZk1N7hwHGuLAk+
	 eRYo5dJAg8P/Yy2qI/CCNe9cHLpCDlRSmKrHoIZG69hika/iyCYrB23DoD3gD8nPl0M36
	 JoUrDiYqDtyOqJHj44NnjfDmnJfMfqRDnm3xY/XnUakfDWs8TFy9PdXSw5Y3uaf7NFzze
	 aBzcVBw2rnt/LBhoHrGKwXLF7Fo2EFOBPK6zMoIeAaM68MzbavlYVl8kdtX32t/Mclw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794694384;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D3i3JtW8zZwhx3O8fVAAShGYEZv1RrlrSS1d37HB+mg=;
	b=WYrNAE+YbaOUKJQUdAVknx0c2JcgccA75llITLp+VGXT2p96CYPjfD8dRqLkVnjbZAcf
	 ehODC0MlqJ/0FhZvjWLGijJWAy543s97l2VpgB5OcXkDJJSlO97LiBmEQaOeFPKm9gGU5
	 Flo26bAj5/3E5rjywW6oa6FI4Uqv9nSEBsRxdeoNcwkk2ZwsOpEqa9X2XQio9cBZthOUq
	 cGS2PGZdUDOOSPWlltMKTeor6kov2AJyTBIVRPmTrwo2Nti33nHJl7U4jnC3ROegTURjp
	 i3sDjrUnxdbcu+Uya62EfXQ8FhVZtpU63lgvH6ryx+tzFObOx2eIVkONWtr+9v+OBpQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EDAB1F000C6;
	Sat, 14 Nov 2026 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794694384;
	bh=D3i3JtW8zZwhx3O8fVAAShGYEZv1RrlrSS1d37HB+mg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YBZKwPBEwyI/DlElZSR0LeWMdp8fjZqKnrnkTGFyKB5BXKPoBTS9g34l99UgItIIC
	 ey/2VoRLKubPTeWX2EESvc498Ub/YSjGAagJJQHJvf1rF/gnzjNaSAP/Ey0/2WF4gH
	 07hpxiXUYcpndf9Bn8Nbb0TVRuPguo0KGDkOVd7DrrbP+NuV9oami4s3pjX753xVcm
	 dYWkC8nxti8BgnVywmGRA5zY+j7gUeSy+kG/aKJzPRDpoOvnoZhIKxxVmgFvBnhoP+
	 wTcJq6hwmQm6rlftSHwcZ+XDmrFpUaeM5Ql/tVYwplNMpPcowbcQ5E3hAH6D2/urW8
	 4DUr5vkg+2OwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D039F49E7A;
	Sat, 14 Nov 2026 22:13:02 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 14 Nov 2026 22:12:58 +0000
Subject: [PATCH 1/2] PCI: meson: Power the PHY on and reset the controller
 in host .init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-pci-meson-suspend-v1-1-be3d04a13304@iav.lv>
References: <20261114-b4-pci-meson-suspend-v1-0-be3d04a13304@iav.lv>
In-Reply-To: <20261114-b4-pci-meson-suspend-v1-0-be3d04a13304@iav.lv>
To: Yue Wang <yue.wang@Amlogic.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3928; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=sVRTJrvFuucyhaCx7JzxASlark4tRG0RVp/ihG4vEWE=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFk/7rx1crwUHcWQ9/LE2mO5cybv+yaw9b7a4n25FpN22
 BzqP7Ogr6OUhUGMi0FWTJFlwiGNWxlLrv719zB/ADOHlQlkCAMXpwBMRNaF4X/KFAHrSadWJzod
 ecf1sNm6h+uI4MXTs8/wbr0w5X7ElAUSDP+LK0P5kp+66V05aZh1dmL7PZvaifxNDU39tbofTsc
 snMwOAA==
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

Move the PHY power on and the PHY and controller reset from probe into
the host .init callback, and add a .deinit that asserts PERST# and
powers the PHY off, and a .stop_link that disables the LTSSM.
dw_pcie_host_init() calls .deinit on a later probe error and
dw_pcie_host_deinit() calls it at remove, so probe and remove do not
power the PHY off themselves.

This prepares for system suspend, where dw_pcie_suspend_noirq() and
dw_pcie_resume_noirq() run the same callbacks.

It also changes the order in probe: the clocks are enabled before the
PHY is powered on and the controller is reset.  Resume runs .init with
the clocks still on, so both take the same order.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/pci/controller/dwc/pci-meson.c | 55 ++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 03dd1282f3f3..627470c83bb5 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -315,6 +315,16 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
 	return 0;
 }
 
+static void meson_pcie_stop_link(struct dw_pcie *pci)
+{
+	struct meson_pcie *mp = to_meson_pcie(pci);
+	u32 val;
+
+	val = meson_cfg_readl(mp, PCIE_CFG0);
+	val &= ~APP_LTSSM_ENABLE;
+	meson_cfg_writel(mp, val, PCIE_CFG0);
+}
+
 static int meson_pcie_rd_own_conf(struct pci_bus *bus, u32 devfn,
 				  int where, int size, u32 *val)
 {
@@ -360,6 +370,20 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct meson_pcie *mp = to_meson_pcie(pci);
+	int ret;
+
+	ret = meson_pcie_power_on(mp);
+	if (ret) {
+		dev_err(pci->dev, "phy power on failed, %d\n", ret);
+		return ret;
+	}
+
+	ret = meson_pcie_reset(mp);
+	if (ret) {
+		dev_err(pci->dev, "reset failed, %d\n", ret);
+		meson_pcie_power_off(mp);
+		return ret;
+	}
 
 	pp->bridge->ops = &meson_pci_ops;
 
@@ -369,13 +393,23 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void meson_pcie_host_deinit(struct dw_pcie_rp *pp)
+{
+	struct meson_pcie *mp = to_meson_pcie(to_dw_pcie_from_pp(pp));
+
+	gpiod_set_value_cansleep(mp->reset_gpio, 1);
+	meson_pcie_power_off(mp);
+}
+
 static const struct dw_pcie_host_ops meson_pcie_host_ops = {
 	.init = meson_pcie_host_init,
+	.deinit = meson_pcie_host_deinit,
 };
 
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = meson_pcie_link_up,
 	.start_link = meson_pcie_start_link,
+	.stop_link = meson_pcie_stop_link,
 };
 
 static int meson_pcie_probe(struct platform_device *pdev)
@@ -419,22 +453,10 @@ static int meson_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = meson_pcie_power_on(mp);
-	if (ret) {
-		dev_err(dev, "phy power on failed, %d\n", ret);
-		return ret;
-	}
-
-	ret = meson_pcie_reset(mp);
-	if (ret) {
-		dev_err(dev, "reset failed, %d\n", ret);
-		goto err_phy;
-	}
-
 	ret = meson_pcie_probe_clocks(mp);
 	if (ret) {
 		dev_err(dev, "init clock resources failed, %d\n", ret);
-		goto err_phy;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, mp);
@@ -442,14 +464,10 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	ret = dw_pcie_host_init(&pci->pp);
 	if (ret < 0) {
 		dev_err(dev, "Add PCIe port failed, %d\n", ret);
-		goto err_phy;
+		return ret;
 	}
 
 	return 0;
-
-err_phy:
-	meson_pcie_power_off(mp);
-	return ret;
 }
 
 static void meson_pcie_remove(struct platform_device *pdev)
@@ -457,7 +475,6 @@ static void meson_pcie_remove(struct platform_device *pdev)
 	struct meson_pcie *mp = platform_get_drvdata(pdev);
 
 	dw_pcie_host_deinit(&mp->pci.pp);
-	meson_pcie_power_off(mp);
 }
 
 static const struct of_device_id meson_pcie_of_match[] = {

-- 
2.43.0



