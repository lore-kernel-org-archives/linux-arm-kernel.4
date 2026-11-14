Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F823606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G9mXpm7s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3dI+r/p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dh3nDHm657l2W/CzlusdswzzmcH3pGrEuZn9tsiXWpE=; b=G9mXpm7sR65OhhwFuOHQ0ftIjC
	CH4IiPVUPT0rsy1oGx3PSZqiptGl/E0wEFASQXIG3bgrGbSzdRx8upQZdHVi3611mCVKqv75W7e30
	T+6HW7OYco05WjubSYhATtSefTezPfRLCEowkgjuXOQAJD/0jwpcPn5KON6l/ZKUYWMLXBdqgAPK2
	HsH9HNnmj+I5RPSGJ9s74/sdSNHy2Bbd2dcQWIChCxSmGggnkWtdUdQEv0oNCKfOOyas99kjwrwG/
	v+Nzava5EMzoiexGgSVhor4suJujkbG4Y3v0gs2+AD7PRQVQiB1bd867TbU9Nd84mVGPQgcypayPd
	cDwBMdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDQ0-0000000G3FY-04KE;
	Sat, 14 Nov 2026 13:03:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDPz-0000000G3FN-22R1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:03:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87DEF60F01;
	Sat, 14 Nov 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794661422;
	b=lQEsKyeS1IDgYlgakB74ldqptmcZs1z9IobyCSWVu8bh/t5frHBTCf4zgjoUpb8EaHfq
	 rce3nSsY2dUH9IPAp/ZE6t/83SuV/nBRkzEqet5wtZ9jgmA5bMESoqJBy+TIn7Uezhdbk
	 gowB3TwVTSakM5WwQEZKwCd/sMOIO7P1AApdmrZFx7z2F1rL1xl7GmjgmZRHNhESxaiOr
	 CkUEIvG0iijmDw6B9LhDxkeWEiNgowWOJhXaNkPIfo/rMUOdZK869O6iBtM3PntaIAfOF
	 7Zr+nIZzw4WEwNKhDX2T3vtNqrXZMYhJB2eRVLF205UJonSPI65BoMMvBWTGMxc7hcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794661422;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=dh3nDHm657l2W/CzlusdswzzmcH3pGrEuZn9tsiXWpE=;
	b=NYWZM9ml2l3DCrKNmpS0tTf97NXISHvTgx/2Nal3MaZobZ2RlLSRAyRKAVJwkD2pmxYE
	 cbUjgO2a2tbQA3ICnPFCJ+emRVXpCIaJmrEyLWdDBYgrKELz1Uzl8/GuesUUb+eLnTS5q
	 2OvcYn45dg++KC97oiEL8bh8ZEzSEaCkzUOElGJ6I4DE3kqWkkCYGYUJ6gBPwqrBkkPie
	 /FNLawhKCgIqRFTO9NNvQqbx9OgszhrWsT+F7mIDZd2ZKIGSbGxlWT3Ihg6q3jUUElrYr
	 zUgo44KvruA3gffHHmgqkn6B8kF9bZQ7OJB547ELfSgVfBnbdetHAOcz34PoGXNPhQQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9D601F000C4;
	Sat, 14 Nov 2026 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661422;
	bh=dh3nDHm657l2W/CzlusdswzzmcH3pGrEuZn9tsiXWpE=;
	h=From:Date:Subject:To:Cc;
	b=O3dI+r/p0xDA1UGPuVihwPmiAiQ6Vm48qaO5mEwWdTBSXDddDBK8Ql0ddb35anWXB
	 6ntvslVW54OxXPkykUJCaTrRdHDk1W12JCqu9gBZY4JhhlobTCKeP51dquNKynRQCY
	 0+1aqWGkOyf1c+OMnAZO+9gbNslNASgukxD+ijLAbK8o0uNngtLunDqqOkJ7OM8n+O
	 +wuN+C41eVLmOfmWV1lsdsTelaD0ZWgECyGlrhuAkYxgfEVzIU/4GePtnHgUWsh5m7
	 A530nR4a3sKYEwz8UW4xdBsN6eNiYBtBaZbh5MHFPXiM02KXSh/2Oa4e0lU/RK0xLm
	 EQz4IgxfpYHiA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 088A849DA7;
	Sat, 14 Nov 2026 13:03:41 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 14 Nov 2026 14:03:35 +0100
Subject: [PATCH] arm64: dts: apple: Lowercase hwmon node names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-hwmon-nodes-v1-1-7d0a9674e3ae@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB1wgj/YqxQXiU7rCCYlY6sg3
 t1Yl9/ivR2Uo7DCI9sh8k9Ugk+gPIN+tP7NKEMymMLURFSiK3Fc5+DRh4EVbd06Y7ki0zSQok/
 kl2z/4bO7rV83cb9cFziOE8WxGmpyAAAA
X-Change-ID: 20261114-b4-hwmon-nodes-a69b2ae51277
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3915; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=gizQ5l+OSD2VXAgRLhGonhOWVto+Q+V1PVlMy8YyyeE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aPGK2cp18Wd4gIKraF7DoZdXqjU03KfZOlBw9NcVO2F
 3+5fMrkjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBENrswMrywFs4xb9fdcOLL
 gx9pz9b+/vthYdl1n587BPWaK1SmFU5h+KedY96V4nrGJ9I8Y+pkIbaQe0fO1TT5BqtJR/y//MA
 skgsA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Fix the following dt-check-style strict warnings by using lower-case for
hwmon node names:

  arch/arm64/boot/dts/apple/hwmon-common.dtsi:9: [node-name] node name "power-PSTR" is using discouraged style

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/hwmon-common.dtsi   | 12 ++++++------
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi |  4 ++--
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi      |  2 +-
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi   | 12 ++++++------
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi     |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
index a35c7b14fec8..b5153332e819 100644
--- a/arch/arm64/boot/dts/apple/hwmon-common.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -6,32 +6,32 @@
  */
 
 &smc_hwmon {
-	power-PSTR {
+	power-pstr {
 		apple,key-id = "PSTR";
 		label = "Total System Power";
 	};
 
-	power-PDTR {
+	power-pdtr {
 		apple,key-id = "PDTR";
 		label = "AC Input Power";
 	};
 
-	power-PMVR {
+	power-pmvr {
 		apple,key-id = "PMVR";
 		label = "3.8 V Rail Power";
 	};
 
-	temperature-TH0x {
+	temperature-th0x {
 		apple,key-id = "TH0x";
 		label = "NAND Flash Temperature";
 	};
 
-	voltage-VD0R {
+	voltage-vd0r {
 		apple,key-id = "VD0R";
 		label = "AC Input Voltage";
 	};
 
-	current-ID0R {
+	current-id0r {
 		apple,key-id = "ID0R";
 		label = "AC Input Current";
 	};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
index e87997d21e22..771484ed5870 100644
--- a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -8,11 +8,11 @@
 #include "hwmon-fan.dtsi"
 
 &smc_hwmon {
-	fan-F0Ac {
+	fan-f0ac {
 		label = "Fan 1";
 	};
 
-	fan-F1Ac {
+	fan-f1ac {
 		apple,key-id = "F1Ac";
 		label = "Fan 2";
 		apple,fan-minimum = "F1Mn";
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
index 180eb8d7441f..b36d0c9b6af3 100644
--- a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -6,7 +6,7 @@
  */
 
 &smc_hwmon {
-	fan-F0Ac {
+	fan-f0ac {
 		apple,key-id = "F0Ac";
 		label = "Fan";
 		apple,fan-minimum = "F0Mn";
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
index cadffd000c76..674013b1f387 100644
--- a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -6,32 +6,32 @@
  */
 
 &smc_hwmon {
-	power-PHPC {
+	power-phpc {
 		apple,key-id = "PHPC";
 		label = "Heatpipe Power";
 	};
 
-	temperature-TB0T {
+	temperature-tb0t {
 		apple,key-id = "TB0T";
 		label = "Battery Hotspot";
 	};
 
-	temperature-TCHP {
+	temperature-tchp {
 		apple,key-id = "TCHP";
 		label = "Charge Regulator Temp";
 	};
 
-	temperature-TW0P {
+	temperature-tw0p {
 		apple,key-id = "TW0P";
 		label = "WiFi/BT Module Temp";
 	};
 
-	voltage-SBAV {
+	voltage-sbav {
 		apple,key-id = "SBAV";
 		label = "Battery Voltage";
 	};
 
-	voltage-VD0R {
+	voltage-vd0r {
 		apple,key-id = "VD0R";
 		label = "Charger Input Voltage";
 	};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
index 7fd86e911acf..ce61805dc879 100644
--- a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
+++ b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
@@ -9,7 +9,7 @@
 #include "hwmon-fan.dtsi"
 
 &smc_hwmon {
-	temperature-TW0P {
+	temperature-tw0p {
 		apple,key-id = "TW0P";
 		label = "WiFi/BT Module Temp";
 	};

---
base-commit: 7809dfc2040bd6b8808da2cb7b8ce429ce3df946
change-id: 20261114-b4-hwmon-nodes-a69b2ae51277

Best regards,
--  
Sven Peter <sven@kernel.org>



