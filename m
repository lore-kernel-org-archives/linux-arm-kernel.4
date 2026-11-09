Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RDQ44Mq/;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=o3rrfrAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5eiyLfLU1C/h+uo8NWvQpDmBybxx9guSvIRHTGKQvZY=; b=RDQ44Mq/jtu2z2
	uMyUauyHbetORlLkXERM8Qrvfj/XSHKNJONgbO3R+tIl/p/GmVsyWMz7okfif3/iVrxaU2YC4cGJW
	/0WyC2yMWS4ppU1W6Rw3c9WKA5qmsc2EwyZEs/Ees67RM97aLPa4L1TclbRQtVD94ddlWmfyxaIgw
	sk8eGPhRNKWrezKxmCn0vikUKWC+DBr3D4gPYV9Zv4hVz5hIVIZWcDk7hJ8vbMeqtZz3FIYL2IW0z
	ifNCsQAmhgsjeSkth6SGFkNkxnvLZrM6Txec8Fp93VEgN3fo6As2Mdm+HxeE5kFo/5liFybUIQNd8
	2x2MOeCtdXUbeInbUIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl7-0000000163X-3wTG;
	Mon, 09 Nov 2026 15:58:13 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl0-000000015xn-0Pac
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:58:09 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id DBD3C26666;
	Mon,  9 Nov 2026 16:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239880;
	bh=5eiyLfLU1C/h+uo8NWvQpDmBybxx9guSvIRHTGKQvZY=; h=From:To:Subject;
	b=o3rrfrAVutK4DGQTNT/1JoyZsiFVehOyTq3z9xWExy5RUgP9sllWaTWJq5azGhxP/
	 ibFkcMM7gAVv+eb2Vn4/x1mX+z2AUtTqgmfiHZOIBfx7ncjyI5IzncTz5AhQASA0b6
	 zBULwe3Ga50LpJg0a3KFJks8tNVv5wqt7CHgBf2rdyv98oBRQ73IhPjV13N49Ws7W5
	 TyAu0Mjmx16I0o4Ns5q/uDX0WQAjK4BII0ac54V4jM/UvPAr5dcqiUmIK2ROJo36Ql
	 quXTNNvh+Zyz7xANAaTSdHMhTc2mWvN4q4xNRB1mDdIfl0poWZyRHJRxvF6NN/UFwI
	 oYcK7k8r7M/qQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 2/8] ARM: dts: imx7d-colibri-emmc: Add missing touch display overlays to dtb-y
Date: Mon,  9 Nov 2026 16:57:42 +0100
Message-ID: <20261109155751.475875-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155751.475875-1-francesco@dolcini.it>
References: <20261109155751.475875-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075806_984434_B51885C2 
X-CRM114-Status: GOOD (  10.43  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Capacitive Touch Display 7" Parallel with Touch Adapter and the
Resistive Touch Display 7" Parallel overlays are only built as a
dependency of the combined Eval carrier board DTBs and are not listed in
dtb-y, so the standalone .dtbo files are not installed by dtbs_install.

Add them to dtb-y like the other Colibri iMX7 eMMC overlays.

Fixes: 64e7d6ba2037 ("ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter")
Fixes: 392bbdb0357b ("ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 arch/arm/boot/dts/nxp/imx/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index a0ad7ee583e8..f22abbd01434 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -472,6 +472,8 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3-vga.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
 	imx7d-colibri-emmc-vga.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
-- 
2.47.3


