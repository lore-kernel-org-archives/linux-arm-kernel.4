Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 01:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rrzuZ1aT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3bgj8+l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V+SieL2nVGZvLEQKccUXIqqYkXNqZxAUIg9/rkL36Zk=; b=rrzuZ1aTsXUl/rj74Tvdvjwclc
	+Cuy0w5sNW1N2JoBTHPPupuk3jo9Y8hckAKENeB6SCkqCia3Nc1wuukZEdb789HmqGjSSTXIwyTza
	a1CiZkfJMZDQ1e/Rr3FqIucrQbImYy+bOLvX/ekGFC8xKsci1AVGviBBM1tRHh2iE06fv9AGVTozt
	x3wqhKu61Ypv0CiJAPjlvtvMv7uEVfaQkiIs0l+IvICvxdtFwRCDSq97KGnSnUYKj1CVC9iqDndn8
	2AYMe7BDjeBjCdC/tHFBW1zAf1VP9BWgCOqge4+xQo3y9gSzqQ2R5zeP0OYp3zRWQ0AOyt0Wnru6H
	E7+6rBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEa3-0000000H5Pe-0IJ9;
	Mon, 09 Nov 2026 01:53:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEa1-0000000H5PT-28QW;
	Mon, 09 Nov 2026 01:53:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDFE24010E;
	Mon,  9 Nov 2026 01:53:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794189232;
	b=qQRSq+jSircbGwSPlFDPl1fHt0fjxF9Uh6hzBniUhJ+/Y7adzlnT2VIpLG0e4WofnySo
	 wGqeV2A5M+8PUDiULT6EqHMWBVTeoNDsO7fZSqpgGX4nqGDMMm7Xz7RESfjvQQpziQMqK
	 1S3qWpGTwyc7qhFTzIVHSQK07brJ5I08OZmailMpkSVaZM77fUh5VxbfngBrh4+sKZP6I
	 DhV4Cs2t9XvP+OVvdSsBxaHhZKRKcUarQet8LOu0nne9BRioqBhhlzhl+ljbGKIjQT5Zk
	 YFqcJoi/Wg5AO7DgFizH6q1Bkok9Lxb/COMFyTpE0NXPbcliZCrJT1h6b+H86f470eg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794189232;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V+SieL2nVGZvLEQKccUXIqqYkXNqZxAUIg9/rkL36Zk=;
	b=fZ30g7G6H8NrkrIT14FECJGENuC7sJ+0W5LNvRFgimT1A/6h7NFwq8ynJjoxnJeTyHYX
	 YrN6rhnomJWaFveLl4jl10atX5j7904QbR20AkGvLBXS454/nDCb1Ik2Zy33hkqlLZvZv
	 emyP58ktUDt9kGypJsMgnsd6Qph5+3ntjbGB7a+/Okk0K9RdLQEeuVjAb3i5ylgXckgUB
	 6EY5xgwvs94BzoH3f8Q/OrXIINyCWLIbCazncHo80FozTghL1cR1RjnysXNbrWLJinC3O
	 wnthEljd6GvJWFbqbs4VP40f5oMIPc31gG8H2yAnaqwLSNW5gEwlu6pBo6q14UlYLVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D5731F0089F;
	Mon,  9 Nov 2026 01:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794189232;
	bh=V+SieL2nVGZvLEQKccUXIqqYkXNqZxAUIg9/rkL36Zk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=h3bgj8+lBanCwdpmKvjlJr6ly2Xjzx0Q4MAe/BlDnTE8tnfTB9P9eDSZoaZOB8GS/
	 S4ujNAsPMymzzmjrc7aFb3s8uo8ePhZ4ekP94h42X4PpdMfWDrHifgzm48rISU7HeI
	 fO7GnmTKrLs21+QoPCf8jJmoTKnEdkmntsq+poM4q47BtgzhNsOUp0W7qJuZWt9gZ1
	 Jh2AJvXFTXIdHEYio8ZgHfTuaU03Ldj6JTXaBmE/PP3O/QrH+e7kIfUQLjU+PB+8+1
	 yCmuxJPcczbFIX82rf+mOB8Uq+5Ri6KeKOldJQEV0qXPZSHs/P590qJ6U8YKVEd8LK
	 b061T1cRAIr3g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5F2A2481F8;
	Mon,  9 Nov 2026 01:53:51 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 02:53:47 +0100
Subject: [PATCH net-next] dt-bindings: net: add Realtek RTL8125 PCIe
 Ethernet
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-dt-bindings-net-realtek-rtl8125-v1-1-cff4b8a8be66@pardini.net>
X-B4-Tracking: v=1; b=H4sIAKon8WoC/yWNQQ6CQAxFr0K6tgkdIoJXMS5gpmCVVDNTDQnh7
 gy4fPn57y2QOAonuBYLRP5JkrdmoFMB/tHpyCghM7jS1URlg8GwFw2iY0Jlw8jdZPzCaFND7ox
 tS87Vni5VNUC2fCIPMh+FG+wH5dng/l/St3+ytz0A67oBqUu5Do0AAAA=
X-Change-ID: 20261108-dt-bindings-net-realtek-rtl8125-991226c1733f
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4350;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=7nlD6uY1u4F0mRBPPEUBKpIYrlmDUFHO6at2lmifh/s=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8SeuO6zb9eCJ6q8FtHOjt+bOOtHzf7xobZ4Yv
 OGicDy6heCJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavEnrgAKCRA7Xj/jnsft
 6XLNB/9Bw77ejpGM8LhzEykrl+tF+nUiOG35uGPYS4dZ8xPFx7G7xNQ2S0r2IIG3rj5RMbgcw5V
 vQvGZ9yBx/Ua1WVRrmQR4kEHWEr9xR6JdnUMZ6h6NLqof5GwES+wDjiodYS0M49rYgeiLDfjX9J
 tC5HcEYbyzBvBvVsv4bFdmHLACkeSC3mKh2DcLrcuH+/N1+ny7mvxjbn/YbZ9AlqWUdqj3v9Xlu
 40lySG5btGdRNqZJyA8H4AP+m6R4U8eE/1mTUNSWt75dtCMtHgcY1lyr2Mrnu1Hen6dHaY0lSpL
 +6G+94wjy2dCIb1FeEcGETp6gTlsRo8FLwo3LXxOcb1fVe9S
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Pardini <ricardo@pardini.net>

Add a binding for fixed/soldered Realtek RTL8125 PCIe Ethernet
controller. As a PCIe device, its "pci10ec,8125" compatible is the
Open Firmware spelling auto-derived from its PCI-SIG vendor/device IDs
and is already covered by the generic dtschema pci-device.yaml. The
compatible itself therefore needs no binding to be valid.

A dedicated binding is needed because board DTs describe these
soldered function nodes in order to attach ethernet-controller
properties to them: a placeholder local-mac-address that the bootloader
fills in today, and potentially nvmem-cells, phy-handle, etc. in the
future. This binding references ethernet-controller.yaml so those
properties are validated on the RTL8125 PCI function nodes.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Add a DT binding for the Realtek RTL8125 2.5GbE PCIe Ethernet
controller, so that board DTs describing soldered RTL8125 PCI function
nodes get their ethernet-controller properties (local-mac-address,
nvmem-cells, ...) validated.

This was previously patch 1/7 of the series "describe RTL8125 PCIe
NICs on Rockchip boards (and add DT binding)", up to v5 [1]. Per
Heiko's review [2] it is now sent on its own via net-next; the board
DT patches continue separately in that series (v6+). There is no
build-time dependency between the two: "pci10ec,8125" is already
covered by dtschema's pci-device.yaml, so the board DTs validate
without this binding.

The need for the binding (and for the compatible at all, since the
kernel binds these nodes by their reg) was discussed with Heiner in
v3 [3] and v4 [4]; the outcome, per Krzysztof, is reflected in the
commit message.

The patch is unchanged since v5 1/7, apart from the rebase onto
net-next; Rob's Reviewed-by from v5 [5] is carried over.

[1] https://patch.msgid.link/20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net
[2] https://lore.kernel.org/all/1971659.CQOukoFCf9@phil/
[3] https://lore.kernel.org/all/b7cc8eba-ff6e-417d-8e74-b3bb24e08a26@gmail.com/T/#u
[4] https://lore.kernel.org/all/876a38f8-75ea-4b32-bb65-216cb3adb436@gmail.com/T/#u
[5] https://lore.kernel.org/all/178976078089.1640411.4176382061491076376.robh@kernel.org/
---
 .../devicetree/bindings/net/realtek,rtl8125.yaml   | 43 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
new file mode 100644
index 000000000000..eee13fbc1e6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/realtek,rtl8125.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL8125 2.5 Gigabit PCIe Ethernet Controller
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+description:
+  The Realtek RTL8125 is a 2.5GBASE-T Ethernet controller with a PCIe host
+  interface.
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    const: pci10ec,8125
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        ethernet@0,0 {
+            compatible = "pci10ec,8125";
+            reg = <0x10000 0 0 0 0>;
+            local-mac-address = [00 00 00 00 00 00];
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe23913b1e43..afe9bff92936 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -134,6 +134,7 @@ M:	Heiner Kallweit <hkallweit1@gmail.com>
 M:	nic_swsd@realtek.com
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
 F:	drivers/net/ethernet/realtek/r8169*
 
 8250/16?50 (AND CLONE UARTS) SERIAL DRIVER

---
base-commit: fa5196392691051963726787944db872420dfa75
change-id: 20261108-dt-bindings-net-realtek-rtl8125-991226c1733f

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



