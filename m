Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F34606A899
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BxwRbLID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y7VwAXIR3LZ+LfLuKx6LSuovTYdHUSxNKCSscFFqjLw=; b=BxwRbLIDVBv+MPTlzMDs7hj+PW
	GlO6Vf5zrafMkEagtoXReICTlC2KT2gh+XD81agzOuxuMnIPRPj/coUpsz5SRwiYhm3bWT+IQ47VH
	wCwQs+6aG8bpb4Uu3i34Ju3N35Zin6dLH8gGzA4gJ3hNqCcie+MLJV5mjjgYE22ZAvn3uMtv1XQFz
	hTgXRdeNXgFPNuExxTDlNtw1hlqmOTcxMrrg04JuK/BhGh0nKWemb+WmEFPlEv/TkHuRPpTaPkZnD
	9zItc6atb4+L/kC9tsOZi3pCPsSgO4DWdgWVj8EiIuT58H097ecN/4t454a0ceZpaSroIQ/MZd0C3
	rOTdxQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBeP-0000000Fs1V-2HfM;
	Sat, 14 Nov 2026 11:10:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBeN-0000000Fryz-0Sb9;
	Sat, 14 Nov 2026 11:10:28 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBeE-000000003za-3d22;
	Sat, 14 Nov 2026 11:10:18 +0000
Date: Sat, 14 Nov 2026 11:10:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: rockchip: rk356x: Order vdec regs by address
Message-ID: <9f72ce4790da9658a62171ca5ca91b44ce922b62.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_031027_158394_35D5720F 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: -1.9 (-)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The rockchip,vdec binding lists the register blocks as link, function,
cache since commit 35c8178ed2bd ("media: dt-bindings: rockchip,vdec:
Add alternative reg-names order for RK35{76,88}") and marks the
function, link, cache order deprecated. The RK356x node uses the
deprecated order, which also leaves its unit address 0xfdf80100 on the
second reg entry.

List the blocks as link, function, cache. The driver looks them up by
name.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index fac41e34005f2..eefcaa2c26ffe 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -653,10 +653,10 @@ vepu_mmu: iommu@fdee0800 {
 
 	vdec: video-codec@fdf80100 {
 		compatible = "rockchip,rk3568-vdec";
-		reg = <0x0 0xfdf80200 0x0 0x500>,
-		      <0x0 0xfdf80100 0x0 0x100>,
+		reg = <0x0 0xfdf80100 0x0 0x100>,
+		      <0x0 0xfdf80200 0x0 0x500>,
 		      <0x0 0xfdf80700 0x0 0x100>;
-		reg-names = "function", "link", "cache";
+		reg-names = "link", "function", "cache";
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>,
 			 <&cru CLK_RKVDEC_CA>, <&cru CLK_RKVDEC_CORE>,
-- 
2.56.0

