Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2EE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pwtx03wM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1acC1Aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=chC3+vL+R9U5D0bgGCB/DJtcOwNxIIPIBuMDSuGIh5Y=; b=pwtx03wMZEX0hfI8CjXbPrCUpI
	cP9VJ1Lk8NfvbqR3EP7+YVle/+G44oaGjiFW9OZ8yHim6B1eev10Nzj0TuOIiTX2lxGhgiYAO5Brn
	SoOlCK8kb0Rdm2B9OX2boXjVFXjDD1QgTkDqWMG1JLFpDsY+fo6ivDlnw5lIaB7PxpYSdKV48vFLR
	Dz2h4lDWbkoWGpMvqxLvLTU6H/mjoIv5UfeeqsaLNwHS6MpUFrzJb8PBB8wvYDcrUfTxbxa8Z/cDC
	5qUYwFftWiNZj8ruvMmz+mW1WRkDUSN+RYunEnW5qT+976v+wKuUJihq0/fbbX163Blql0ttD1kSd
	pv0yWcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIxH-0000000EDkl-3bvw;
	Fri, 20 Nov 2026 07:22:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIwq-0000000EDf3-2G5P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:22:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CF95468CA;
	Fri, 20 Nov 2026 07:22:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795159336;
	b=lj5UuDK1F5YWqLVsyI9oG2dsW26Hhu31Lu5wmnGiUyVFo6G4YX1X5jN/rkXzLZifV2za
	 9kZ08Tcgp9DrJKGgjPqioxBrZctdFzAqKDpUmBhd0zE0D9tkQfBR37ZhfRcaKENoLDu93
	 fjBZs3l0YgWn+vh0aPFtwpdPsF03J+0BRX/9JVWktO4pqP0qiOcJRD0pQtAO29P8r+0hJ
	 WWjLUzbu8ITfw24dequ+uc2/LYre+QxE1+gq59qApxv5jvslaszpAn4WMZw9R+VWb09uO
	 m6M88lju02pNK6TFOP/1cw5usXazPekwE6BpDQEkBTiwOShE0QpZx9GDGpXX2efdYEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795159336;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=chC3+vL+R9U5D0bgGCB/DJtcOwNxIIPIBuMDSuGIh5Y=;
	b=O/A1rjQwObJxsUQIttKNyzEXoce32jji5pmQn+vxgUk4BLM5vnBix6J8QsPTm23wc7yH
	 HhFikks3HuMOgM8IwV80teF7BIIOHSNxq8PPZ1NgobHHAN9R0o+cc3dDcqWXMynqxCo5U
	 Id1WtnJ1gzyMdbC3Ja1XZW/qQeyiT7PWcZc30dttONyrABYbOS/sySjED9kCDo3ZGRVjo
	 dsQb/sIp42B78MbDZqqAW2gHfbWlilXD00OGRW5mnPaQEoyhFb3GB2rJMSdnVekntwpNy
	 2YR8GHm7r9ctDXGY8wU1kuZCa+ciKVT4FrL90XRp2dsOMuXAgN7wfE9PMwDdhh7IHwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BB061F000D0;
	Fri, 20 Nov 2026 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159336;
	bh=chC3+vL+R9U5D0bgGCB/DJtcOwNxIIPIBuMDSuGIh5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=m1acC1Aat/ygQW4rx2+/4c5+H7p16UHfiYJVbEONJViTvMRgJOl9BxdFWst46NxKn
	 bm/bRRbGRx92mTQYwKPUhn6ArxwAcTrviuQ1f+vVavOyBxqOLEwvdZonVw0CvvNskJ
	 Ez51frqlx+ryuQMayH/P+iaJqlDQoTmFCaTsB7VcGUJ0Amklz41ZZcktw5bEe0Dcey
	 tVGTu3knMtnBrLm/NsfJDkqci5kPOhqHuY1Cmx4hRCVZI3rBnmJ1vNuvSadF0grQCP
	 EH0pU+TufJUvbwyexyKZ/OBMRuP3t4Xyj2MRjEjfOt5jFJ5v16ascLc3wGNDdGhtVC
	 NyxAZXLZerCcg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ECEBD49760;
	Fri, 20 Nov 2026 07:22:13 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 01:22:15 -0600
Subject: [PATCH 3/4] arm64: dts: allwinner: a100: Add I2C3 pins on
 PH12/PH13
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-k5c-dt-v1-v1-3-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
In-Reply-To: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795159332; l=1081;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=UFMjszeV5jY5MlhRImFhFWSmTuLXTuOi5e8vjBXAcxE=;
 b=iko6jvcOP72UNQVCm5to4OaQaKNmcol5fjgeB0J1qSj7zNC5hDY3ktgiefoFh2038NbAEejZ6
 5yNI5UQqjoZDb8NkcI4+v2GW16brogpaCFH5f2YbCd+21HeMhZWsHwr
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
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
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The I2C3 controller can use PH12 (SCK) and PH13 (SDA). The KickPi K5C
connects its HYM8563 RTC there.

Add a pin group for them, marked /omit-if-no-ref/ like mmc1_pins, so
it is only kept in the boards that use it.

Claude Code (Anthropic) drafted this change and its message; I
reviewed it and tested it on a KickPi K5C.

Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index fce91dc2c28..3b53d64f25e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -215,6 +215,12 @@ pio: pinctrl@300b000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c3_ph_pins: i2c3-ph-pins {
+				pins = "PH12", "PH13";
+				function = "i2c3";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";

-- 
2.34.1



