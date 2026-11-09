Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC9606EEB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O1ToUxwr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4yDc+/L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WJq/L4Pgym9IuFiwyjztfQfgbK14PqJ5yqxkIfQZJ+E=; b=O1ToUxwr/f78gR/9t8ERHiuBc5
	HPsXw5kHkCBcCPYgDDYWP4dQ6bRQ5nKj/DGQbU2vDV2rLj+kDocoJaM51BTLJRF5se5NnJbMx3Wq9
	+wH745uwN9dlvrTWuf8kuaJLDyXNe3B4k9teNRB8drXmGqpB1diLMELefVQVN1lX2Q/Sj1ItELYQU
	+pWzAUjzjFq+vx16rfcEfqwZX4f7gaW+9fp5ms8B+s8IB7nW+Xodxn/usuAvyFsZW/6Vbz2InZkDT
	ViLyiyvmntGdOXcmEFbpOYtP8Cj3xS4FR9ieIq3C7aWIF97qS52FyqAlf4WBbQmKqPasFYXdY8R+7
	ULriewtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOXu-00000000gmA-45mg;
	Mon, 09 Nov 2026 12:32:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOXt-00000000gl2-3hO8;
	Mon, 09 Nov 2026 12:32:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 723F2458C5;
	Mon,  9 Nov 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227541;
	b=kCS8m0Ch+rdRAohPuX4CegWRpLE8brcG4Orz9kK75Hus2ZJVCg6V/Db8qpFf6EvKHQEb
	 Kpz8fi/c9HAZCS2Sb2qxhtLdd+ppzv3t4Xu8kQknIt/UO2FTUm4tkXzsFNXgpwzGy30Mx
	 BHE+//+s3DbD3k01CJW3qOXEhb4pvXl6DAlIXsomzVQamDrl3z/B73QlWkvXKDCCFEYJM
	 +VABNb8xJPVFBoekHEoduJGZxCpPXzRwXNaUJyumWBXXNXQCj7IG9OCdRjLI+52VHwsq6
	 z3HdTGNLcKXVnJrOXjwhjWbwyddGwM+U0Jz7OH9ihlIMHQXD5E1frzujY9ZcrbgOJTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227541;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WJq/L4Pgym9IuFiwyjztfQfgbK14PqJ5yqxkIfQZJ+E=;
	b=KnEs1Hy2AKHuibhCeKHKAtqWvoJ6I1BHVZ/NfA/gNNtaKYsxHdrOPQnYUJQMCj93iQbv
	 ERRpkQ3tQFItrMOezLCTzOpX7Xk6odoyY7OGjB/lzD8K1mSNgGZtUstBFrx2NUhLDPJPJ
	 ZsOSmfRYsM+YTiYwqXUfhvzhl+tTbzWEP8bsdPxmTnq1D4wmodNT10AuGEYz9gUF1Jj+4
	 n/5NJQH8+SpujWBz0VLyiKasneaNLRO8/A6sKRx0SQWIbTNcAF1dRw2a/I05PV3vrzNTt
	 NP4vTv/sLo+deqKGfVcjXWlapLn/jSvNSzIYVOOjndcz4z6OCcitGf6fEbHxzXddxLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 784A21F008A5;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227541;
	bh=WJq/L4Pgym9IuFiwyjztfQfgbK14PqJ5yqxkIfQZJ+E=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=l4yDc+/L/goKXDPf6E937d1kK8qULIOvJsUQMb/kmpLZ7jUZyyA5AnCOH1FvfFWmo
	 1bVWoEdgN8yfRACq0WgxaLEoNZEt/TwFTxtQ75ar0l7UR8l6N/jGS1T/nszykYavOR
	 leeXmeFJjF2UVTiBkA35fGvpfFteK9+5Pfqf+fgNIloMmtndW7TpwBulMSudUy0gRW
	 ICyoPv0gghWQnK9lIl1Dwd2BB56p1oZuj78NbMkgjDZZiW88egGVTOj96Cgv6E3Sh0
	 G+9ptub9lX5QS4Gn2SRSOnyG4I2lt/CVyYW341AFg/r078IrcDkAD9V5w83SLACKRI
	 +DfkuMubrFRwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 08ED24848A;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH v6 0/6] describe RTL8125 PCIe NICs on Rockchip boards
Date: Mon, 09 Nov 2026 13:32:15 +0100
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+98WoC/43Oy07DMBAF0F+pvGaQ34+u+A/Ewo8JMVRpZZsIV
 OXfcYpQi8oiyzu6OnfOpGLJWMl+dyYF51zzcepBP+xIHP30ipBTz4RTrqniEsq7UNZCahVKOwC
 2ERLWWHLAfgR/yL5CZJiYNcFERUmnTgWH/HmZeX75yfUjvGFsq702xlzbsXxd/pjZ2vudVNsmZ
 wYMvB5i8koLH83TyZeUp/w4YSPr6MxvWbeR5UBBOkMpl5ZJMdyz4sp2eCMrOmu9tcoE4ZL/h5U
 3LDMbWdlZHpKwjvPEuLtn1ZV1jG5kVWcjCw7VwGhM+i+7LMs3qS59DkgCAAA=
X-Change-ID: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5671;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=SE+ulRJfxixyEy/C7Yk/ixDXQAH0gsNdOqLkBsMFHLU=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1QkKbeReCVP3vLmzUDio/TNeYUoxxTEPpc9
 1svIbtRdOaJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UAAKCRA7Xj/jnsft
 6SVPB/4+GXlr+OKZbV8jwEKd11YzgQ8wTiVdVadBbGgtjCmXyMExxEeh1kTtiQYLwmrpJyPmRHw
 U9jcFB3lZlqEekR/DWIl5pAseFwJS8qgdaqWp95TzysxoTF8IzUzqunQm0MP49iPsZC4ieXDBDe
 WtTDaapgYmIOpR186lHOyNlnS/m4RfLvdMn59Dj+hj/rg1wZhi1iUxgkKDHUf0Wo0v+FM18+XT+
 DJDhSHrYNFEGKAw/XeYqG3hf92Z+uJu+MBxcxduQ7mgNcIsmhY6tu99TbRpqp+DBH9sdqbGiyvu
 nMKcKN4BhNevBzp/noteVQqysE20doL14NHIao7LisNgmo4a
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
NICs whose PCI function nodes are not described in the DT. Describing
them allows for stable ethernetN aliases (matching the GMAC alias
convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
inject mac-address properties from its ethaddr/ethNaddr env, so MACs
stay stable across boots and U-Boot and kernel MAC match.

The DT binding for the RTL8125 (patch 1/7 up to v5) is now sent
separately via net-next, carrying Rob's Reviewed-by [1]. There is no
direct dependency: "pci10ec,8125" is already covered by dtschema's
pci-device.yaml, so these DTs apply and validate without it; the
binding only adds validation of ethernet-controller properties on these
nodes.

On these boards the RTL8125s are not pre-programmed with a unique MAC
address, so without a DT node the kernel falls back to a random MAC on
each boot.

Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
/sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
u-boot correctly adds local-mac-address property there which is
correctly picked up kernel-side:

  => setenv eth1addr 8e:b4:90:66:66:66
  => boot
  ...
  # readlink -f /sys/bus/pci/devices/0004:41:00.0/of_node
  /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0
  # xxd /sys/bus/pci/devices/0004:41:00.0/of_node/local-mac-address
  00000000: 8eb4 9066 6666                           ...fff
  # ip link show dev end1 | grep ether
       link/ether 8e:b4:90:66:66:66 brd ff:ff:ff:ff:ff:ff

[1] https://patch.msgid.link/20261109-dt-bindings-net-realtek-rtl8125-v1-1-cff4b8a8be66@pardini.net

Changes in v6:
- binding split out and sent separately via net-next (ref Heiko).
- rebased onto v7.4-rc1 (diff context changes only, eg. new NanoPC-T6
  pinctrl names).
- nanopc-t6: fix nomenclature according to schematics (ref Diederik).
- cm3588-nas, nanopi-r5s, nanopi-r6c, rock-5-itx: fix the root port
  bus-range to start at the secondary bus, as already done for the
  others in v4 (ref Sashiko).
- make commit messages and DT nodes consistent across boards (drop
  the inline comments; move the EEPROM/MAC rationale to the cover).
- cm3588: describe the RTL8125 in the SoM dtsi instead of the NAS
  carrier .dts, as it sits on the SoM.
- nanopi-r5s: note that mainline U-Boot only sets ethaddr/eth1addr
  (ref Diederik).
- Link to v5: https://patch.msgid.link/20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net

Changes in v5:
- binding: reword commit message: pci10ec,8125 is already covered by
  dtschema pci-device.yaml; the binding is added only to validate the
  ethernet-controller properties on these nodes (local-mac-address,
  nvmem-cells, et al) (ref Krzysztof, Heiner).
- boards: add a few more Rockchip boards with RTL8125's.
- Link to v4: https://patch.msgid.link/20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net

Changes in v4:
- binding: simplify the binding YAML ref Sashiko's and Krzysztof's
  reviews
- binding: describe only the RTL8125 + rename to match ref Heiner's
  review.
- dt: fix the bus-range according to Sashiko's review.
- Link to v3: https://patch.msgid.link/20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net

Changes in v3:
- new patch: add a DT binding for Realtek r8169 family PCIe Ethernet
  controllers, per Sebastian Reichel's review (the "pciVVVV,DDDD" OF
  spelling still needs a binding when used in a board DT).
- new patch for Rock5 series, and include a brief rationale in each.
- retitle the series, since it now covers a few boards and a binding
  rather than just DeviceTree changes for the NanoPC-T6.
- drop the v2 "rename vcc3v3_pcie2x1l0 regulator" patch from this
  series; it will be sent separately as it is not relevant to this.
- Link to v2: https://patch.msgid.link/20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net

Changes in v2:
- fix: pcie2x1l0, not pcie2x1l1; indirectly caught by Sashiko's review [1]
- while-at-it: rename regulator vcc3v3_pcie2x1l0 to l1
- Link to v1: https://patch.msgid.link/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7@pardini.net

[1] https://sashiko.dev/#/patchset/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7%40pardini.net

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
Ricardo Pardini (6):
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPC-T6
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 family
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on CM3588
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R5S
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R6C
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 ITX

 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 30 ++++++++++++++++++++++
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   | 15 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 30 ++++++++++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 15 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 18 +++++++++++++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts | 20 +++++++++++++++
 7 files changed, 158 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



