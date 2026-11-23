Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26C6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXj4W2P0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QTV+OLqE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lSA+wX9NNEY3sTm7hObzBOSDNhatk2iNQOlIwAan+js=; b=LXj4W2P0+55+s5aHBml7VSkIOv
	bHdDWP0fyWIMzMlxePgGeJOvSX2/qSb7KPGQZ3zdTMx5FwGoBzRrkK05NPfH7lrdGodgWw2JKnr2f
	sd/riLPShcFE9TiMD9nvo6zD80ZTh87k3rTw6HgEDklAIyJwxQ+cKzg1CLiZItHkhl4Jwl2eWlSew
	IIe8QDC9DgED5kuileF8tOVCSQ/mn+Gt/hMAkKf48McTCgzCfiXFnG8UgM7Y9G+8P99b5jLyF6LDN
	tT70F8TDI0Wlt50Xe2I38bYgX3dlB1jiEr9FD1Q31pIcfngKwOe/qq/uajzIWr3x9rqSyd6Teg9Up
	0MVZYUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaiX-00000004qbC-3mrd;
	Mon, 23 Nov 2026 20:32:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaiO-00000004qWN-12Uh;
	Mon, 23 Nov 2026 20:32:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9E824130D;
	Mon, 23 Nov 2026 20:32:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465959;
	b=x1XuYOcOsPPdpVxE8YCrOHBJamovsqznqOmaKR0PkGyyoefdXu5kkg5SPjpPlkQl85t1
	 w7Ri7Cpd2VOHduwTS9F2YNXANn71XGQOSaw3OjeWLgy5jRnLXXh+s2zSZ91+RbyltRYBY
	 65kpCkl92Y0iPTNLZLlt+F5VaOiJzh5P9Ny5tNx0dq6abcfOmFxv4/716Mq8E/YYA8Bby
	 yXtOLxvd/n88k1t/LOR3C/0Gp/fEP2zDorcnY7IysMQsN0p6HlFy3p6363r1RGF/83stz
	 eYoG2WSV1k2DPEaPABMbAfsnDzv6JP9pwP7qdydtYX0ZXekG/bPL3x7mIh/YXAW1Z5Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465959;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lSA+wX9NNEY3sTm7hObzBOSDNhatk2iNQOlIwAan+js=;
	b=17Y4UXSHWV7frmYT/v/Pe/UXZcol0dRbA8yfqCPRLy1lAvGJ1H41G+DPalFYZcVXn18r
	 BD09XXP/YbY6GimG+jMRczrYloYSLSbTfy9OlwqauaGk88aIGl378d+4D3L1p7CWuJlLJ
	 iXQ65adVPXV0LgYg354dtazVp94iwPDWhP1We0nenQcg35qhSA4VNkRQ7FasGixa9TsKk
	 p2UwZx0MAJtzC2Hfepa6GhcH5mdViwBs7tF6vY93tev1SDQVLvkCwBDhoL0I4IgRKrpYp
	 kAl9URld72AVAVfS9kDgNrG08Iq7j8XsTKj4B966KqcWhuu5fu0YtRVs8s0kvhgjh+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32B771F000D1;
	Mon, 23 Nov 2026 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465959;
	bh=lSA+wX9NNEY3sTm7hObzBOSDNhatk2iNQOlIwAan+js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QTV+OLqEpMuSgJeTfvIE27E7FRr2wDGmlAhczjlfNK48DJ/Aissrs+qXqzcWCq2SM
	 UqWoDnvLPM7L+HfF6jxeRcN+HwtoQFWDsP5URjP5DRxsyHVwgKvCwPays99umwTnpJ
	 XvdCPMUEG/gCJFF5yh3qoun30rn9SX0axuA41HqLlu2yyF52sMAGPB8mVkL/gVNROa
	 wffGEGrmMn2i6/G1hsUSSHAZiL+HuKyPsYK//Lj9ycLW5YnyPMfOS+c/oHXlOJc+ic
	 K5OoJnJohhrneaNng9x9+phb3ibDCOqUWYeoVdbCi/2XSe2gIkK3463O5KnNdomZGz
	 hd1DlMuA/74RA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B09C64C70A;
	Mon, 23 Nov 2026 20:32:17 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:32:18 +0300
Subject: [PATCH v2 4/8] dt-bindings: phy: Describe CS7542 PCIe SerDes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-pcie-v2-4-f589a9cd0bef@gmail.com>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
In-Reply-To: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Krzysztof Wilczynski <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465935; l=2484;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=MyL1iV5O/zQ+yKb0w2UWGAKIr38mntIf4hXKW1lxhNg=;
 b=UXKv6FgpeRwIkYXwJFceJBFMvFDJqHn2ytGbIl4h2Wd1rCSHkXQDOUS12Q5Lx1HC8egNLGh1g
 c89qdqk9MSACOCZ+I3uYzMj8RQtRoYJuSPK3TCzQWILStTqZXKbmnjk
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe three Snow Bush lanes, their shared status bank, global reset
controls and 24 MHz reference. PCIe is the only supported operating mode.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/phy/cortina,cs7542-pcie-phy.yaml      | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/cortina,cs7542-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/cortina,cs7542-pcie-phy.yaml
new file mode 100644
index 000000000..9ccde6e05
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cortina,cs7542-pcie-phy.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cortina,cs7542-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 PCIe SerDes
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description: |
+  Three Snow Bush SerDes lanes shared by PCIe and SATA. Only PCIe mode
+  with a 24 MHz reference is described. The PHY specifier is the lane
+  number, 0 through 2. The status resource contains the shared PHY
+  status registers, with a stride of 0x80 bytes per lane.
+
+properties:
+  compatible:
+    const: cortina,cs7542-pcie-phy
+
+  reg:
+    items:
+      - description: Lane 0 programming registers
+      - description: Lane 1 programming registers
+      - description: Lane 2 programming registers
+      - description: Shared PHY status registers
+
+  reg-names:
+    items:
+      - const: phy0
+      - const: phy1
+      - const: phy2
+      - const: status
+
+  clocks:
+    maxItems: 1
+    description: 24 MHz SerDes reference clock
+
+  cortina,global-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Global control syscon providing lane reset and mode selection
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - cortina,global-syscon
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@f00a1000 {
+        compatible = "cortina,cs7542-pcie-phy";
+        reg = <0xf00a1000 0x400>, <0xf00a5000 0x400>,
+              <0xf00a9000 0x400>, <0xf00a0e00 0x180>;
+        reg-names = "phy0", "phy1", "phy2", "status";
+        clocks = <&ref24>;
+        cortina,global-syscon = <&global>;
+        #phy-cells = <1>;
+    };

-- 
2.53.0



