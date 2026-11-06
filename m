Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702B606D825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bgP6IzVY;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=Sjh29a4h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mD6/Zsa6MXsbkU1fOaDxMLRIoAvXnGdC1NZLhMLVQto=; b=bgP6IzVYac4H5nJhA1XcYZpw/X
	n8LXhrhdQeQE+ulRebbiuxCNA0eIfSS45dYwdY8kR6TInxmN0af1q4TiJV5UfWfVeYKB3/cUnSEjR
	Bbu+clLkcfqYJxL1wQF2cCnuwq3bzgLXSX8GiiHj4QtNtL1859H2c7IO8LZlyY6h2PElkWJXobDT6
	IpO2qMwqtZmaRTE0pG82Suc//tnTs/Jo0J1vur3KF6bL5Ii6tTJNE3CzJn7JbTS3vec9eCy7qte2l
	RM0YHTo1K0LpmIMROxBWLlnGqx8oxAqj0KbWLQN4S4gvtcbV5bNNCpFDlkXwit8FKGcdhx6f8iwUa
	r9qzqi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR6p-0000000DdEc-0bac;
	Fri, 06 Nov 2026 21:04:27 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR6m-0000000DdDE-0F0D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:04:25 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mD6/Zsa6MXsbkU1fOaDxMLRIoAvXnGdC1NZLhMLVQto=;
	b=Sjh29a4hgpnIanwe/63+LNd9h5t5LYsMoBS7Ex8FlqfA2VhjelCuJd7xi1CBYLT+1fuTkW
	UYwkCJCSCByYYtXYnZt03RtfCLVabmgTcRJYgT3TxvtDWA/vIKAUClx+uuk3EZ/YsugLi5
	0sde1Dg/4wYPJIpyMADe+8HMrGVTo68=
Subject: [PATCH 00/15] NVMe support for Apple M4, M4 Pro/Max and M5 devices
Date: Fri, 06 Nov 2026 22:04:09 +0100
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJS2wRr2JYFBhwjK1NpxISw
 t0punyL/zcQSkwC92qDRAsLf0KBvlQwPF2YCXkshlrVVmtl0MX4JhyzoL+iNxgWT9jY9tYYa5x
 uFZQ0Jpp4/W0f3d/y7V805PMF+34Apg0U2ngAAAA=
X-Change-ID: 20261105-apple-dts-m4-m5-nvme-76987565a190
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_130424_313597_63A887F3 
X-CRM114-Status: GOOD (  11.32  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

this series adds the dt-bindings and device tree nodes for NVMe on the
M4, M4 Pro/Max and M5 SoCs. A previous patch series[1] already included
M4 (t8132) driver support and ANS dt-bindings and is part of 7.4-rc1,
but omitted the device tree nodes.

Add the SoC-specific ANS NVMe controller compatibles for M4 Pro/Max and
M5 SoCs to go with the t8132 base compatible.
Also add the SoC-specific SART and mailbox compatibles for all three
SoCs, which have remained functionally unchanged from previous Apple
Silicon generations.
Finally, add the device tree nodes required for the internal NVMe on 
these devices.

As the t8132-nvme-ans2 compatible has already landed in 7.4-rc1, this
cleanly passes `make dtbs_check` without any additional prerequisites.

Merge strategy:
There are no changes to the driver in this patch series. Thus, I would
prefer to merge the dt-bindings through apple-soc, provided the Acked-by
from the respective maintainers.

Happy hacking,

Link[1]: https://lore.kernel.org/asahi/20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev/

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (15):
      dt-bindings: nvme: apple: Add apple,t8140-nvme-ans2 compatible
      dt-bindings: nvme: apple: Add apple,t6041-nvme-ans2 compatible
      dt-bindings: nvme: apple: Add apple,t8142-nvme-ans2 compatible
      dt-bindings: mailbox: apple,mailbox: Add t8132 compatible
      dt-bindings: mailbox: apple,mailbox: Add t8140 compatible
      dt-bindings: mailbox: apple,mailbox: Add t6041 compatible
      dt-bindings: mailbox: apple,mailbox: Add t8142 compatible
      dt-bindings: iommu: apple,sart: Add t8132 compatibles
      dt-bindings: iommu: apple,sart: Add t8140 compatibles
      dt-bindings: iommu: apple,sart: Add t6041 compatibles
      dt-bindings: iommu: apple,sart: Add t8142 compatibles
      arm64: dts: apple: t8132: Add NVMe nodes
      arm64: dts: apple: t8140: Add NVMe nodes
      arm64: dts: apple: t604x: Add NVMe nodes
      arm64: dts: apple: t8142: Add NVMe nodes

 .../devicetree/bindings/iommu/apple,sart.yaml      |  4 ++
 .../devicetree/bindings/mailbox/apple,mailbox.yaml |  4 ++
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   |  7 ++++
 arch/arm64/boot/dts/apple/t6041-pmgr.dtsi          |  1 +
 arch/arm64/boot/dts/apple/t6041.dtsi               | 44 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8132-pmgr.dtsi          |  1 +
 arch/arm64/boot/dts/apple/t8132.dtsi               | 41 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8140-pmgr.dtsi          |  1 +
 arch/arm64/boot/dts/apple/t8140.dtsi               | 42 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8142-pmgr.dtsi          |  5 ++-
 arch/arm64/boot/dts/apple/t8142.dtsi               | 42 +++++++++++++++++++++
 11 files changed, 190 insertions(+), 2 deletions(-)
---
base-commit: 1492e5e32d3bc21b80fa1ca9835e1876431113b7
change-id: 20261105-apple-dts-m4-m5-nvme-76987565a190

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


