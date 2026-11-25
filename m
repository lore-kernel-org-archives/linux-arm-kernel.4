Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7FD606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bY8nJkye;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=EyakkHDt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wewVApk8kLH/N2Oq6lHNMYCeahDe14E98GxLMwFlc9g=; b=bY8nJkyehX/LnE
	A2uOdEftWvhB559uccx3pKarBfXXVqexK0BWl1K7yM/nvsBnIAJUG3DaVEpLdPrMwX2CWT8HvIae8
	N50weNb5eTYdht1bY0Cy8NgppwUDP70Hx4nKyXVjlWNLsPJ3bCk7uFDUUll+4WuVL2HE9qx2NvKdt
	lR04tp0exDDPN1apOuxQ5QyWtqt/7KgxtPvQbP7tRVvUMjjo4SWBpA/mMzwcB06i/3zyMPcgPfbke
	6vXR9BwSKubCyv4kv0M5ILvbpSsHo97M6LWMptgyzJcsw+ORuVu4waTDaaQ58vuW/K4pnBPoYC4jV
	Xxwk7cQQMVUfI6il64TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RM-00000008sud-2iIy;
	Wed, 25 Nov 2026 07:29:16 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RB-00000008smk-0hNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wewVApk8kLH/N2Oq6lHNMYCeahDe14E98GxLMwFlc9g=; b=EyakkHDt9B4Bunpj9ctU/ImjO9
	lZNlUbrXKXBmQlktslU32fViJf8tyMAnD/sUIce/1OOEx6484qgwjxDFPzxW4L2vYWyH2mWSFVVI5
	jc/00il/AaAlQE6R+hIOwg++7/t/I12PFmi4Hgs9CS0xxLcq9DOmVIOmgCN+vrboPdHh25NBxUvMo
	tRKDUC2Qc0HVj4bkbZ6L3sCn1eP0mTSec3uykokLXJRX0/F3AlBzAG3IQRIlzgzru+EZu3NANp8ER
	VgMgRYAtbWAiwE8hJ7RrB5dNNfgk7QK0tjv0n1djdMPFXRtuKl7RGP4U+rsyMqkIRMoW2PKGbb4D3
	Jdt9wuCA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R4-000Fi7-2O;
	Wed, 25 Nov 2026 08:28:58 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R4-0007YA-2Z;
	Wed, 25 Nov 2026 08:28:58 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and pcs_mdio18 in appropriate overlays
Date: Wed, 25 Nov 2026 08:28:48 +0100
Message-ID: <20261125072851.3379079-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232905_372747_729B36A9 
X-CRM114-Status: GOOD (  10.70  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

The pcs_mdio* instances are only needed with phy-connection-type =
"sgmii" and managed = "in-band-status". Move setting status = "okay" for
pcs_mdio17 and pcs_mdio18 to the appropriate overlays, for consistency
with the other pcs_mdio* instances.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts    | 8 --------
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso          | 8 ++++++++
 .../freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso | 8 ++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index 431e4ed2a8b86..46a9fdc92bb56 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -545,14 +545,6 @@ i2c@3 {
 	};
 };
 
-&pcs_mdio17 {
-	status = "okay";
-};
-
-&pcs_mdio18 {
-	status = "okay";
-};
-
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
index 0847c786dc1ca..497ea4ddef3e6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
@@ -59,3 +59,11 @@ &pcs_mdio14 {
 &pcs_mdio16 {
 	status = "okay";
 };
+
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
index 7520f105d5d8c..a51edef83317f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
@@ -58,6 +58,14 @@ &pcs_mdio16 {
 	status = "okay";
 };
 
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
+
 &sfp_xfi1 {
 	status = "okay";
 };
-- 
2.55.0


