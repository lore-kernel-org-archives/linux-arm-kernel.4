Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DD606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sHfUcuxQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmJ1rKpC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=seIdvgnGU2bxjAFiq8tvcgRrmLuTA/lxMAeaISrG7xs=; b=sHfUcuxQm5rc0rMUmU807rWDhW
	tBfig2dM20/ceAzZwlNoy0TFDBu0JsChCPFnwlmiWIXLgGjIgAdTgzzjWJmL7T5Ep1EBkXmojCf2M
	a0dJ400/1tbWdPwZEX3mikZYRpepxQiC69sfev5sYdr2vV4qr+3SgRPGm44bK29MPD2lCbOuYM6Mg
	2QRqSBa3rnCewZOp1pWRQHmdLwPHzA/NUa1zZXkxEuNuE0jqD9407dqFqkiJzIuO4DmBpOHkcVLQF
	Rc2T+2ADBfWc6mgpLiV3if1+A24honbIdoqW9qm9+jBScA/voTnsk7WGTEAJq1QbtsedMH4C1jw4p
	5xjyYmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt7t-00000001nDe-2Dku;
	Mon, 16 Nov 2026 09:35:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt7r-00000001nCX-2C2g;
	Mon, 16 Nov 2026 09:35:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF58B624DE;
	Mon, 16 Nov 2026 09:35:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794821746;
	b=zwNpr/HT2Zhc/yIA4PACH4y5CBPAYxzUSkfbskmctevT0UGhUPIr7BsBv6OSRhTlIQUY
	 oDBTGycE71uhW9PA0h65If1/EqB+OXhyRijpwvTSHKgcO0WlceBZKelu0QHUa4S8Tolg/
	 PR2nlR7ld1fFy16HkCA2J6lH6axOdJeadI7V4OcOWP8h6fu+N13Vj9elJG0nQjEyT4ymi
	 LjKFuO77lkbinRG8ThoU9xtYKqA0lnlSIVJ00T4HuFw0c2v9IM+l5m3Agn30nmMcEa+rT
	 9nKZ+O+DO/dnEVKBUcRzZpbEKqcoeXa6JFM/jZaJTgGcszNJ5clUGeNTMTaHVpqibeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794821746;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=seIdvgnGU2bxjAFiq8tvcgRrmLuTA/lxMAeaISrG7xs=;
	b=ngxLJktEnWnsWTfz/WjAtrJ+5J9wNe0B7q7fnjMTVkBxf9xZmBYro4pY+m11GBAOg3t7
	 m33m79DMV7CkNDvnIgiWcxvig80bI5+aha/bubWwjG5WXX0/WmyPi4PybQLVO4YpQvGar
	 vVcxHohKKyPkTSeDHBz2hqx0YYBWgHeL/kuX1K7fba2/ZU57Vqz36fMj77uxuGB9RYzlc
	 ABVfjPGPeFppH0laYRWyKJJVPsvCh8O4rh38ep7AKlFV35lKfNAs7mViLzNDXYpnCWO7e
	 bRuftC61pfGYSxdKOFZrTIy9iVDEd9ljiHtcFr7VThgLbVwLdIdZn/WH+Nr7lam7JJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0B7A1F000C4;
	Mon, 16 Nov 2026 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794821746;
	bh=seIdvgnGU2bxjAFiq8tvcgRrmLuTA/lxMAeaISrG7xs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UmJ1rKpCAPb1ozTmCNhsVPf5uy8bdljW2WkRQPbpd7YFbiSUyWvYw2xxfqGnUX4tk
	 jBX0bhV0GT9sG3O204gb0ckoGkxPfZ4ZEx8sylSM5CM3EBP2cnngGfXpTnRpzGbYYC
	 Q+dVEtBD64Zf0zkOct/hwp6fRU2w+EYFhGVzDOh5igzYfbMNF9nW+dhhir2WwTuqW0
	 JHlOh5dkt7hTSG4DCH5ylY8oAak53h1ulPwqcXblh5w4D5OPzHY3BjlX4h10wWnr1H
	 6OZfjm/tpjXn4Nl7vT34GfE4yKXeL9iDHMi+xflWdjv2XTebAYPvkEnRm3rKkrPLp6
	 pMoPREGHmacBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4B03C4A3EA;
	Mon, 16 Nov 2026 09:35:45 +0000 (UTC)
From: Matt Thompson via B4 Relay <devnull+matt.boondocker.io@kernel.org>
Date: Mon, 16 Nov 2026 02:35:43 -0700
Subject: [PATCH RFC v3 1/6] PCI: rockchip-host: Skip downstream config
 access while link is down
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-rfc-b4-v3-1-0bf052b68f2a@boondocker.io>
References: <20261116-rfc-b4-v3-0-0bf052b68f2a@boondocker.io>
In-Reply-To: <20261116-rfc-b4-v3-0-0bf052b68f2a@boondocker.io>
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794821744; l=2164;
 i=matt@boondocker.io; s=rk3399-rfc-20261113; h=from:subject:message-id;
 bh=/1HByg8Lw8nHRyQAHKhvWIxWEc3G8cAR7GEHnb2FsoY=;
 b=ACOsM4wsD+wVnmt6FnYMD7SjXxlEZDz7vxl6bjCI3jGh4Jxpwpjdi509tkN3YsabP6YbQ3w3a
 y4+6ucOqsWlCsCZpHIPbDdDKw4iElWvCVX6AnXMsDtRdVJWCoapwAe9
X-Developer-Key: i=matt@boondocker.io; a=ed25519;
 pk=WMnh3kwFFRkrqamL/FbDcdl1/9rBF2uT03VdvGGP40k=
X-Endpoint-Received: by B4 Relay for matt@boondocker.io/rk3399-rfc-20261113
 with auth_id=1517
X-Original-From: Matt Thompson <matt@boondocker.io>
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
Reply-To: matt@boondocker.io
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Matt Thompson <matt@boondocker.io>

On a RockPro64, a PCI bus rescan with the downstream FPGA unavailable
faulted in rockchip_pcie_rd_conf() during a vendor ID read. The rescan
task exited with interrupts disabled and the watchdog reported a lockup.

Check the controller's link-up and link-training status before issuing
downstream config requests. Return PCIBIOS_DEVICE_NOT_FOUND while the
link is unavailable. Root port config access still uses the local
controller registers.

This check cannot prevent the link from dropping during the transaction.

Fixes: e77f847df54c ("PCI: rockchip: Add Rockchip PCIe controller support")
Signed-off-by: Matt Thompson <matt@boondocker.io>
---
 drivers/pci/controller/pcie-rockchip-host.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5b071bd..35105c1 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -143,12 +143,23 @@ static int rockchip_pcie_wr_own_conf(struct rockchip_pcie *rockchip,
 	return PCIBIOS_SUCCESSFUL;
 }
 
+static bool rockchip_pcie_downstream_ready(struct rockchip_pcie *rockchip)
+{
+	return PCIE_LINK_UP(rockchip_pcie_read(rockchip, PCIE_CLIENT_BASIC_STATUS1)) &&
+	       PCIE_LINK_TRAINING_DONE(rockchip_pcie_read(rockchip, PCIE_CORE_CTRL));
+}
+
 static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 				       struct pci_bus *bus, u32 devfn,
 				       int where, int size, u32 *val)
 {
 	void __iomem *addr;
 
+	if (!rockchip_pcie_downstream_ready(rockchip)) {
+		*val = ~0U;
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	}
+
 	addr = rockchip->reg_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
 
 	if (!IS_ALIGNED((uintptr_t)addr, size)) {
@@ -182,6 +193,9 @@ static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
 {
 	void __iomem *addr;
 
+	if (!rockchip_pcie_downstream_ready(rockchip))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
 	addr = rockchip->reg_base + PCIE_ECAM_OFFSET(bus->number, devfn, where);
 
 	if (!IS_ALIGNED((uintptr_t)addr, size))

-- 
Git-155)



