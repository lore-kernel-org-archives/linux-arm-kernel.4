Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D11606A69F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AGbWizs1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VS06vSM4qtWUmBvMENtTVI0rKBtvKYghkg4SBYgLU6w=; b=AGbWizs1Grx0ctWg2NbnlLyKKt
	U0fFNJ9cWMnGrV4p/O1TyAz2LnlRqDgqb025ZlVz8qol5fKH60MvmGJTUIFuf9n5h+4GG7yEqBK2p
	aUrahVbSoY+GZP2RNFhYYd+lYt5Yli/xGOYBsgWS54U/R3+Fnb+k7uJ6qNkCcM6EqtsWj2uXLdv1g
	lc/+Nbv/BVY5O3MF/c9sdme8PtsFv+p4JT9H+Xexm7n9gR1sHgxAA+1wtunTDl0ZxiY8p8DHELGET
	Vs0MpF4ILmfRwmlS1gXr/PczQXtfLCQDM77n4e5shUp7AM3CL1RIKJbyauJP9FgbBCgg0wSMMR2j0
	k9M88nxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoPB-0000000HX9n-3bm7;
	Sat, 21 Nov 2026 16:57:37 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoP9-0000000HX8f-0k0W;
	Sat, 21 Nov 2026 16:57:37 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUoP1-000000006J5-3KDm;
	Sat, 21 Nov 2026 16:57:27 +0000
Date: Sat, 21 Nov 2026 16:57:18 +0000
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
	Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dang Huynh <dang.huynh@mainlining.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: rockchip: rk356x: Clock the vdec at 400
 MHz
Message-ID: <11b23bbdd9b1e2e351978ed87ed87bfbb7a00076.1795279680.git.daniel@makrotopia.org>
References: <cover.1795279680.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795279680.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_085735_219259_4FBBB752 
X-CRM114-Status: GOOD (  11.60  )
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

The decoder AXI, core and CABAC clocks are assigned 297 MHz, the rate
the vendor kernel derives as a quarter of its 1188 MHz GPLL. This dtsi
runs the GPLL at 1200 MHz, from which the closest rate below 297 MHz
is 240 MHz.

Assign 400 MHz, a third of the GPLL. The vendor kernel clocks the
decoder at a third of its GPLL for streams above 1920x1088 and lists
400 MHz at 900 mV as the highest decoder operating point. The rkvdec
driver scales neither the clocks nor the supply, so the rate applies
to every stream.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v6: no changes
v5: state that the rate applies to all streams; no changes to the dtsi
v4: new patch

---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 411c9ed62d4ac..6305a57258b4c 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -666,8 +666,8 @@ vdec: video-codec@fdf80100 {
 				  <&cru CLK_RKVDEC_CORE>,
 				  <&cru CLK_RKVDEC_CA>,
 				  <&cru CLK_RKVDEC_HEVC_CA>;
-		assigned-clock-rates = <297000000>, <297000000>,
-				       <297000000>, <600000000>;
+		assigned-clock-rates = <400000000>, <400000000>,
+				       <400000000>, <600000000>;
 		iommus = <&vdec_mmu>;
 		power-domains = <&power RK3568_PD_RKVDEC>;
 		resets = <&cru SRST_A_RKVDEC>, <&cru SRST_H_RKVDEC>,
-- 
2.56.1

