Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED26606A8B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1Yx2kYl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OG42TKth
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kf5Lt7yzOAUQ5ueELRwWwf4JNFuNEzgr8IOrFVpUyq8=; b=h1Yx2kYlUZDgkt/xYC2LKsETTX
	MTpzaJm/sQOJlG30ToRQCgbLuoGXvdj1O4WiNovldlpqFH2Ldg4Jgxabuxjw+jHANMNApq1xukqDs
	d30044DYx3GjBhkHkWTXiL2HvRyWG+MYh9MtF4ub0Jg+KgGLXfKT466C9gCCbzrMUsj3wO0RlbvVl
	r2mE50Jgvzd5zpIfCZJyyg8ZnsFvHu9T6eZr9K6EnRh2Axz61X3abnyRaJzmsKtOKfQKvcI3Azhvs
	A3s/nEv2HPv9grV7wNfMYamI7Zfv6Grt5yRjcJ5UbOIcwz4RLogU39I9pegv7bwccJqRld/7vpw2H
	YHQG8rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1dU-0000000EuWw-2Hew;
	Sat, 14 Nov 2026 00:28:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1dT-0000000EuW6-31b6;
	Sat, 14 Nov 2026 00:28:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7059644FF4;
	Sat, 14 Nov 2026 00:28:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794616131;
	b=YQiOuav8So4UNAsPiliX3fAJmXQO8yqVUam7edSPaD+gGcmxwo9ZFPLfR0vKcwVaNTSJ
	 EhYL7KBg3f4dxH9krhYHeb4LIxqxQ8PPujoflwJQ7uyhS6IZ5I9JZtZqKH6U5NpHrY28J
	 clebEBhekqqFtSJdRYOyEKiIhZd5eN5B3RqMTNj5Giv/LdJNE9R9c7/Nq+9OxB0+oaSfw
	 A5CQ3SFuzKY/hlNR5FaNjD7rDqLEFfkKRAS+vTV+djlYyKxbPmpGLeVR3ZKWsBrlWaMkL
	 wX8lII2kGPHALEMmBfLCGHJ48GUidV3+qX6kUktFUKFYbi6+mNdkEGufM5zhCeDGLFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794616131;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Kf5Lt7yzOAUQ5ueELRwWwf4JNFuNEzgr8IOrFVpUyq8=;
	b=qd5g7kpc+OMqU1G1eiwuWsY/u7fp6qShzx0mmJS6CuTdvrPBJToQmA5s20fgdeCAKJDR
	 ON4cdPujY+c9LR62Xg1/zG7QmwKWK7y84/jw3ncdM1pMAyYG2uzetjvMB41W8Imo3Idl9
	 GG5Qi6+VTIoJBQvw8fhRHhpDdZC2KYhIAOeDKX9CF5ekq6cMsISrpCTTOZcljwsilzSir
	 pNQCo/JIATjyVoXRiibt+7nkbmjm2nobSTDjcADQHBsldzv3N7D/B5K9IhjN1GPG32Mzm
	 JzfFD6LIIaBZcJpz9u9ejaD4CIglNWgvEq6P6SaEzrQ0BJq/9QSdwOkCABKQqfjI+8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA3B41F000C5;
	Sat, 14 Nov 2026 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794616131;
	bh=Kf5Lt7yzOAUQ5ueELRwWwf4JNFuNEzgr8IOrFVpUyq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OG42TKthNV3+D24nHG8puXdYOgOTtlQldzxnYKIdWABgYCmqKpVvtwjSP2z8oqFkN
	 oQiEI96p7xhPAfMSM20x9zNCpNxLTli4uvBtUOCpiaYFJtBcdPhbmABUvTcaEK1e3e
	 tOafL5nSVpxFxbYEjr1w8R9MYzcMDn0A9SJM8YkweTqbGFdiDPpzZtK/ti8iauhFXp
	 cRXFOI84z6f7truieORG+pAFeIlolCzq2FRFLpalTiGufI6de6SIfK/MmsLOsJcUPS
	 tUdkVpB2aXkOILbFq5YgRodXFEM0KPunX7Mdbkxa86n7gFXQHbkur1Rtustoz/MWt6
	 Y5CNz14BCY8FA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4440949BDE;
	Sat, 14 Nov 2026 00:28:50 +0000 (UTC)
From: Matt Thompson via B4 Relay <devnull+matt.boondocker.io@kernel.org>
Date: Fri, 13 Nov 2026 17:28:49 -0700
Subject: [PATCH RFC 1/3] PCI: rockchip-host: Skip downstream config access
 while link is down
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-rfc-b4-v1-1-b91dcb502250@boondocker.io>
References: <20261113-rfc-b4-v1-0-b91dcb502250@boondocker.io>
In-Reply-To: <20261113-rfc-b4-v1-0-b91dcb502250@boondocker.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794616129; l=2087;
 i=matt@boondocker.io; s=rk3399-rfc-20261113; h=from:subject:message-id;
 bh=dQmkjngK0wLJ2jAFS1PjdlLb7zJkoCy2sJ8WeTsPps4=;
 b=JR1YncO5hnReTvvhdAwSDCsA13bb6Uh5v/R/4psAbauJ2HbOSxQ7HxJxRJcKSmMovrv74WMdl
 mW6ULFx5WvtAmnsrDSHcGia9vEWR2Zu6zpVW62Hb7KUok9Or2TYt6YW
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



