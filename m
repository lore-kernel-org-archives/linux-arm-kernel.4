Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71565606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKvE56zq;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=CdXKfPYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SXTRDOXzAHUSWSl+Ai9JHB2q0oBka0VriYkwNpTKYKQ=; b=XKvE56zq9CQ0sY9BnIf5Wet6PQ
	65kumO0ns4/FpJMIaYLHQaSOy0uNW/8k9H3RpMVNV92e7g6dvp2+UWs5rIIghrQwZRu9Td1cHZClc
	b/a7vD9F7ut0F1SHFXQ0CP9sbaykIZrq71NbEKOiWt2Wcp8NVFKYxGiOtG5zCxNaAZftC85qMSDsA
	DaMD9bYT4D3Jj/JUX3Ui2hU1h9WQxBkX99l8NqjLxz1GpvhocZzCry+4B8y8Gxqtn5rPaD2lkxtUT
	qF0u6QKgDHfGrp6zJTuOC9fZBIzpDifwpf+JRfYRD2yzuMhliiHLcdLOxZlnlDjoRvqaLJRJSyZIc
	bSMxYuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6W8-00000008gTQ-1KYW;
	Wed, 25 Nov 2026 06:30:08 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6W3-00000008gRh-3mkI;
	Wed, 25 Nov 2026 06:30:07 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 060184C89A;
	Wed, 25 Nov 2026 17:29:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795588189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SXTRDOXzAHUSWSl+Ai9JHB2q0oBka0VriYkwNpTKYKQ=;
	b=CdXKfPYY7vWtoBevximD0MhqDEw04bj+8tHBAbkGUu4t6QVOiQ+gXd/fqzJin9OnfczbAa
	MV9IDkhaDTNLsAsIz9cqrjJZu3KOMwU44vghIwhWucmg8rNH+8lyYUpRs/A0/AIKmKi7Eo
	Icr5+kbPULm2pgPX4/rAowLWwzqiSYB/M/o/1B+bj+t/WmUarxEE2Q7ShHvaZPci/vZu6K
	nO/bRgOHqkLCYiW3aKQBu1BVa/t8Ogw9L1COCQxkS606S2mk63X3k56Tptrn5Kuiikqjw0
	0seIhxUTEXW4GDHjWJ2SJKCFBgEoGqGFmm2s+eSXdKt8jsv5FcNeoz8+mJxhDw==
X-GPT-Reason: This is a legitimate technical communication. The
	email is classified as personal/professional correspondence because
	the sender (alastair@d-silva.org) is a known entity matching the
	recipient's domain context, and the content is a standard Linux
	kernel patch submission regarding Allwinner A733 hardware support.
	The presence of specific technical diffs, links to lore.kernel.org,
	and the absence of any marketing, urgency, or phishing tactics confirms
	its legitimacy as a developer's contribution.
From: Alastair D'Silva <alastair@d-silva.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/5] Add Allwinner A733 (sun60i) PCIe and Combo PHY support
Date: Wed, 25 Nov 2026 17:29:43 +1100
Message-ID: <20261125062948.1234677-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_223004_408159_D818AC68 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

Add Devicetree bindings, drivers, and SoC Devicetree nodes for the
Allwinner A733 (sun60i) Cadence Combo PHY 1 and DesignWare PCIe Root
Complex controller.

Tested on Orange Pi 4 Pro with a Micron NVMe SSD (1344:5410) on both
cold boot (no bootloader PCIe init) and warm boot (after U-Boot pci
enum):
- PCIe Gen3 x1 (8.0 GT/s) link up via mainline dw_pcie_setup_rc()
- 8 MSI queues and Root Port PME/AER on legacy INTx
- Root filesystem mounted and booted from /dev/nvme0n1p1

Patch 5 depends on:
- "[PATCH v4 0/3] arm64: dts: allwinner: add A733/Cubie A7S support"
  https://lore.kernel.org/all/cover.1795034153.git.enzo.adriano.code@gmail.com/
- "[PATCH v7 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU"
  https://lore.kernel.org/all/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech/

Alastair D'Silva (5):
  dt-bindings: phy: allwinner,sun60i-a733-combophy: Add binding
  phy: allwinner: Add Allwinner A733 Cadence Combo PHY driver
  dt-bindings: PCI: allwinner,sun60i-a733-pcie: Add binding
  PCI: sunxi: Add Allwinner A733 DesignWare PCIe host controller driver
  arm64: dts: allwinner: sun60i-a733: Add PCIe and Combo PHY nodes

 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pci/allwinner,sun60i-a733-pcie.yaml       | 187 +++++++
 .../phy/allwinner,sun60i-a733-combophy.yaml   |  84 +++
 MAINTAINERS                                   |  16 +
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  76 +++
 drivers/pci/controller/dwc/Kconfig            |  15 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-sunxi.c       | 505 ++++++++++++++++++
 drivers/phy/allwinner/Kconfig                 |  13 +
 drivers/phy/allwinner/Makefile                |   1 +
 drivers/phy/allwinner/phy-sun60i-combophy.c   | 372 +++++++++++++
 11 files changed, 1271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/allwinner,sun60i-a733-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-sunxi.c
 create mode 100644 drivers/phy/allwinner/phy-sun60i-combophy.c

-- 
2.53.0


