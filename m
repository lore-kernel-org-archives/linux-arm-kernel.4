Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE005606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UFzuQY8O;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kwd5Exqc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kf5Lt7yzOAUQ5ueELRwWwf4JNFuNEzgr8IOrFVpUyq8=; b=UFzuQY8OjRqyCMW6SCEnMy4Q9E
	7dTdBX3o9RuwuQx3PmakbgB7/E1DE+I3F4WJZyAiP2JPqowxQ5LUjLSYMdJ6CSxs4zkGfWVm1p5sw
	4OevVc4gmDa8JV02MvaprroFmfB8Rv1z3JouNCjfnu9Dq2RXE9C4RJI25fhX+rL01blmToS8MrLk1
	UTRb8xpb/WHMBE38L6IC0vaMCXzf8dpXTZ37UeUe3EUAicMXR2RCSgHETj6aWoGLNMuvo4eskJA/W
	JEKiWknEibHcV2O5udR7HBgWxUjnfURUrK+lTC+yOhW4iiSoCzkcg+of9kM6aC09M7zUtixzMl5t3
	q1YkW3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS20M-0000000ExSy-0Njm;
	Sat, 14 Nov 2026 00:52:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS20F-0000000ExPN-2VlW;
	Sat, 14 Nov 2026 00:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A74C06145C;
	Sat, 14 Nov 2026 00:52:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794617542;
	b=FNX5M15F5U5VS3C8zZDSE9YVfipPmI+kTzQy4A1uTXNTPdC6l+Q4uAKQpi6gRjseQTYu
	 wVpQj9RBuF95C9JQpPlPm4aTIL0pEzh/+YQoAJPW9TXxb5c9iHCps/Qqq6DCBSDo4W8b1
	 1YOh5Le2CdTXyubqD4ddRBF58AByfKONnBvul900iWxJk9G2l6T/c2VEwglNQEqvxLXXP
	 rzInpQ/rIhuWK2os1/UGbwEzyJb8V/KE0JKtLsK4hpWsrYf5u6MrxsnVo5azFq83dm/Sq
	 f1kZu4RsomTQDCiE0qX4LlcV7VnSiR6wyjkrMd9NMyr//P0HezJ80NcVgMKS1ZedcxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794617542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Kf5Lt7yzOAUQ5ueELRwWwf4JNFuNEzgr8IOrFVpUyq8=;
	b=KWXXkWScFAi0HiE7r0IfMaHiR2B55p1KmMJjAUxKLXb1fwXf8TDm6os7aJWYq29UopiO
	 9a0YJUsZcrn1As0Rm6JFrKb2sY0H9tMpBDMF/f90AbQjyCV0i2eB49zg8y6LUj/+0UToQ
	 Rd9g9GBr8t+XAJnKCZhMq88/5GNhPuKrcoC9ITRBldKcXQ9/TUe5HuQ94Ja4NSw9mpD/Y
	 f8fVENPlqGRAJWvm+eKnYKsP9gNmfsqgw+fapzZ2hB3eFlRPDQMMnLXzmSn4v5uzHRCIX
	 iBXerOyfg6axLd+Cm5LCKtsS8JgXaJP1X/lnlnNfUQAmQTDBfp8gNrg7tpTazj4MIFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3CC71F000C8;
	Sat, 14 Nov 2026 00:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617542;
	bh=Kf5Lt7yzOAUQ5ueELRwWwf4JNFuNEzgr8IOrFVpUyq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Kwd5ExqcLXQ9Pg2oGDBqJ1goYBv79NFE2f3Ajw+WLCSQop6EWRz9Niy4Uc+RINgiX
	 WdeJeHev62ZJiotAuNoXdhdJ6N0i1O3ARb5kiADV2AE3uPXLkySYsBLgOPkRwUAQdc
	 QewPVfDtd90Ime/cfbAPr6Gz6LbkQrn3iccC/vLJ9DigKrzmYp9gfv3ZfXaF586Kk2
	 t2fobkQBp6nJ3xnSwEqGzWCPyCvJ9uHgJdoz6BsGm/WqkQqVTqvimgqV+RXkpEYR8J
	 Gw6nLb+PPV4A00kPxeUdj/qZMppCSMejzUlDUbbrkjf36c2BbamleXnZx9up2CVRp3
	 ni4EjG8UKV/lg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E01F449BF0;
	Sat, 14 Nov 2026 00:52:20 +0000 (UTC)
From: Matt Thompson via B4 Relay <devnull+matt.boondocker.io@kernel.org>
Date: Fri, 13 Nov 2026 17:52:19 -0700
Subject: [PATCH RFC v2 1/3] PCI: rockchip-host: Skip downstream config
 access while link is down
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-rfc-b4-v2-1-d6b14f95c1d6@boondocker.io>
References: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
In-Reply-To: <20261113-rfc-b4-v2-0-d6b14f95c1d6@boondocker.io>
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794617540; l=2087;
 i=matt@boondocker.io; s=rk3399-rfc-20261113; h=from:subject:message-id;
 bh=dQmkjngK0wLJ2jAFS1PjdlLb7zJkoCy2sJ8WeTsPps4=;
 b=9/6wJ4fyi0li8ktfa0g1y80t+yToemwpZHRpl1FuuUR8wL8NcQvQf5YZ4ISCzVYGGfIX4Nbbp
 60UfS2buuMTDRX0VvcUOUgovZRSmUUdjXveUqPlOyYx8G0qNHPWZfLK
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



