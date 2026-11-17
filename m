Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27083606A891
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BuS7kIoo;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ioTceAOi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c3Dueu5TPCNGCDPtRN5VUoDG96X05et2nYta3+bvLTk=; b=BuS7kIooMAXdBGEXUW0oLpoReX
	LqFV45v80qqOlu3Rx8ZY5RjrTJ2gbfAnSWAku06dpQfn2/UauA55Xtx/xNXmdTtS4zgpHGmGx+EGj
	cFRCSo6L3UWpccimdl+O+Kq9NoWd0B5Ft8OcPykmR7Biznbv3+tFdRxss/gUkEhEP0TYD5NO9bMZX
	E+N7Duwx/7hISFP5QTgVhRzYizwt7tMC9csvtA9zTqUyFbMloTnaMi6/h11fQbLkTFPJGBa1QQG7r
	rl8yy4fjfSfzP0e2bX7zbTv63XVzENwg1e4ESZpv+jzWPX6q1rUy4ycTmlM4P4pVqlnfx9c0dY7Ov
	1EFxBgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIus-00000005qIQ-02kD;
	Tue, 17 Nov 2026 13:08:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIuj-00000005q5e-1tOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:08:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2AA5E4E4156A;
	Tue, 17 Nov 2026 13:07:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB3F95FC81;
	Tue, 17 Nov 2026 13:07:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C97611BC0024;
	Tue, 17 Nov 2026 14:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794920869; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=c3Dueu5TPCNGCDPtRN5VUoDG96X05et2nYta3+bvLTk=;
	b=ioTceAOiB8oWPw32RePNfZmU6fs6uuEcDr5FSclTbQp9gfuzxbbIW44tK4mcHftBdGANzF
	BWoJr/7nN5584YgZO/tpnqNkSGezf4ZDyKVnWYoz52lbGZPplvbJca5l9G1shfRASEDjHv
	YYJt6zEc0DlnQuNXSpLsjoFBR0fwK6+YJYTlADmn9RtxUFQyfXI2zpQMs/e6lTyyAyt3iR
	ygd4K8GT/FZLzx2rwAkCafyLu3KPl+Qd6m7OtyNdi03Qq1bygdtSU3luysySbGoiLNySVM
	e5lonO01r1sof2FmkCBPu/LSwu9BWPpCXMj/u3nPjZKY07Hvt5s9hL5ysJEYvg==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v6 0/6] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Tue, 17 Nov 2026 14:07:31 +0100
Message-ID: <20261117130737.141993-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_050757_853799_6D8656F5 
X-CRM114-Status: GOOD (  12.49  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For TI Jacinto SoCs (J7200, J721S2, J784S4, J722S, J742S2) which support
low power modes, a chunk of memory is reserved for LPM metadata, needed
for saving ATF context and the certificate information of ATF and OPTEE
and the DM image. This LPM metadata area is firewalled to be accessed
only by TIFS.

At boot time, U-Boot R5 SPL copies the DM image into this memory region
so that it doesn't have to be reloaded from storage at resume, speeding
up the resume time.

U-Boot R5 SPL/TIFS use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

NB: Unlike for Sitara, this memory region is not part of the DM memory,
which is not retained across suspend, so the Sitara binding can't be
re-used here.

Patch 1 adds a new binding for this layout.
Patch 2 skips the firewalled lpm-metadata memory region
The other patches add the memory region for the TI Jacinto SoCs (J7200,
J721S2, J784S4/J742S2, J722S)

Changes since v5:
- rebase on v7.4-rc3
- gather reviewed-by
Link to v5: https://lore.kernel.org/lkml/20261021080947.3747284-1-richard.genoud@bootlin.com/

Changes since v4:
- rebase on v7.3
- move J784S4/J742S2 carveout before optee and factorize it in
  k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi (suggested by Udit)
Link to v4: https://lore.kernel.org/lkml/20260921145325.300025-1-richard.genoud@bootlin.com/

Changes since v3:
- rebase on v7.3-rc4
- skip mapping the firewalled lpm-metadata memory region
Link to v3: https://lore.kernel.org/lkml/20260703143717.177362-1-richard.genoud@bootlin.com/

Changes since v2:
- Split the DTS changes per ipc-firmware.dtsi
- Reference the LPM carveout through a phandle
- Add a dt-bindings patch documenting the "lpm-metadata" memory-region
  name for the Jacinto layout.
- Use the generic @memory node naming instead of @lpm-memory.
- Clarify how the DM image is handled
Link to v2: https://lore.kernel.org/lkml/20260427160326.370415-1-richard.genoud@bootlin.com/

Changes since v1:
- add specific lpm region for j742s2 and j784s4 instead of the common
  one since the addresses are not the same.
- add j721s2 lpm_memory_region
- change j722s addresse to prevent holes
Link to v1: https://lore.kernel.org/lkml/20260312113446.1857592-1-p-mantena@ti.com/

Richard Genoud (TI) (6):
  dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
  remoteproc: k3: skip mapping firewalled lpm-metadata memory region
  arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Reserve
    memory for LPM metadata
  arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM
    metadata

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 18 ++++++++--
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 +++++--
 .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 12 +++++--
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 12 +++++--
 ...-j784s4-j742s2-ti-ipc-firmware-common.dtsi | 12 +++++--
 drivers/remoteproc/ti_k3_common.c             | 36 +++++++++++++------
 6 files changed, 80 insertions(+), 22 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3

