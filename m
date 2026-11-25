Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D27E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CA+V4oEx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=Bkn28aVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F7VxJmFqGTp33yoG+o0b1Kx0jJI+VDEoKLSuuc+8FwA=; b=CA+V4oExUd2VXO
	QYR+0jTxtylvQQv9+Wfqm5lsQneiX4RTLnbdE2qT88pKPAFU2qTodmW6DbJWvCKgpO2+VaNaTDRDV
	RN2e4nR9RUQmKSEfS6HZ3rnlxfBtz4rKB/zH9XeMNuymSvwF+BFjT8wnE4DMD/O9+BuIfCczmbqcr
	bzCJVlI/Q2qKknLTQaw5nVyn08B59daxU6JIGbuecMw93op/FDpsLAg4T+LL0iCtjhrbSfDWhjiFj
	galPVVaFbVv9xdEKmidVgEWxbwATS+7y2r6KFLoHhd/NtAWGzxufALZQP9CMaTFcfKy6KoJm5HSXF
	1drHinGN4oKiTUu7Ip1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RP-00000008sy5-3aMO;
	Wed, 25 Nov 2026 07:29:19 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RB-00000008sn8-2yYT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=F7VxJmFqGTp33yoG+o0b1Kx0jJI+VDEoKLSuuc+8FwA=; b=Bkn28aVOBUzqECTN9eQxwbWbv6
	vt78iChlgSJJi6s+wbvObGJ9q8zMhqBrVknwaJoNTI9ObjLA7H3K55eWw8mbUhpIoOzAjq+Ypjfi2
	M5LT9nXrW0vV+/ZAMOxdenFxyBh+TAw/1dxq9O7uBOvBi+w1B/fTN4r8HwynpUX5oQDZDUFugoRWg
	yUy5rJa8v7SzRzhewoMOEG8DCefaDohjOgH29/ZcanzeEaIJCoAlo0FbaU/jHVBROQIRBXKK1GXOj
	xXavUbLgqepYM0owzsnH5fcUJEXMW5nJ5lrqJnUhSWBp0nL9dRVaNT43VGYBiNyqQVAprRe/n4x7s
	Yxqhe7Bg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R5-000FiU-1x;
	Wed, 25 Nov 2026 08:28:59 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R5-0007YA-2D;
	Wed, 25 Nov 2026 08:28:59 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v3 7/7] arm64: dts: fsl-lx2160a: Add vcc-supply for SPI-NOR flashes
Date: Wed, 25 Nov 2026 08:28:50 +0100
Message-ID: <20261125072851.3379079-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232905_779753_06DDBC2C 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Both NOR flashes are powered by 1V8 power rail.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index c0c5b8e22d61f..e5951160222ec 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -29,6 +29,14 @@ aliases {
 		ethernet17 = &dpmac18;
 	};
 
+	reg_vcc1v8: regulator-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
@@ -65,6 +73,7 @@ flash0: flash@0 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -79,6 +88,7 @@ flash1: flash@1 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
 
-- 
2.55.0


