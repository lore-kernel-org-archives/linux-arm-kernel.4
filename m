Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F4606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ceg2wNjy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=R/jeQG2P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=IncZHQik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5dU+D6xlqx5np/vrlxZeszcBuxHck87mXFaV/490fx4=; b=Ceg2wNjyrBXMUc
	xkdwPEQT/lvsnanu1jGXdR33LM2sS/iZD65wbbFs2EV5jAOANANqG2nh/M6/VjVXQgEt+Bk6IPUli
	4GMRd5FjBa9mcAm7FuxivZ/i7Sp/9JFA1QrOQtvv+u2mMpuAo0+wUpwglMxddfXva9P4x8HwQH7vr
	okHvP21lFIdKE5udc/gsp6rIY2Ja6gV2Dutg6h7HhSc1D7RLMxD+syVbQozJLAF1oFLEr+zotpKXK
	hCiAbsyjt09JVCjsCs0+LbwzrtxIlKxgk0EyVm981HfhUw+0Fe3cmkxsWm3lXT3QkcNnHLPikcccd
	oMXY0G4+2CHmORgQFu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Qn-00000006KXc-1lG8;
	Wed, 11 Nov 2026 10:19:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Qm-00000006KXK-0Te6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 10:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5dU+D6xlqx5np/vrlxZeszcBuxHck87mXFaV/490fx4=; b=R/jeQG2PFDJd2FaCdxm08ukdRx
	w5z95rWUoWX3G0cLKl5AGnzmLB5efnTVRsKf9CHUVhGs7CnjGtVqFtNBwZFOix2YIlwgWoIAyiEuJ
	bgX9Mr8ui3kQhzE5IgXTtudP2l2WtevlIJaNC4M1gy8PiOMER4q69Vg7RfeNDvlAhiCe1Uf7iBYvY
	kGAioB8aPqAJuSKB+o/DU1N3CBNpyZTs9cBv4RVqEebCy9zxnahLNiizJacNsuNcfsboubfthf6ES
	0XCF2uNY6HMGz98b6GPeXYDw5+ziGcdEwlq/Nz0VZ40hvUCfOVp+QoWAHCKtJIUrlCAnUVTHFWZps
	Ui2TaaXg==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Qj-00000009152-2JaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5dU+D6xlqx5np/vrlxZeszcBuxHck87mXFaV/490fx4=; b=IncZHQikyfwYYAMIGTmxTbsGhS
	dspfCsA1baFPrJxCe5+m3zZVw5VQZNroMgKmjXezR2GrwQnGl2PDFSY0EXn3Pc56+lJ1hZuj6g6Se
	3GH8rEVuY3awTkgCqNKA+ffUXTp+7iKCLORNLGZ8Mi2Vkmxn15A0nCTCdaOmWFESSNWcXzo5XBD5p
	/jtlnj1MbtcHDntG2kXRGOAzEqIEEtKYTvMM3fSeoEIBKTMr8P1hjSHRUvviSjVfrry729xiSXXb4
	5vGxU79vycY4w8Nj6XH1Yg+B0GvqijZYFCQJ3ksETBlTxl9lFBaryzw9ukEl3ivNtRopRpMlA+Lic
	Q6ZRQXXQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qc-0006fC-0w;
	Wed, 11 Nov 2026 11:19:42 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qb-000NjR-1b;
	Wed, 11 Nov 2026 11:19:41 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] ARM: dts: imx6ul-tqma6ulxl-common: add vref-supply for ADC
Date: Wed, 11 Nov 2026 11:19:24 +0100
Message-ID: <20261111101934.1216887-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
References: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28180/Wed Nov 11 07:24:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_101949_622029_BC57EE66 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -0.2 (/)
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

On MBa6ULx no ADC channel is available as the pads are muxed to different
functions. Provide the correct reference voltage in case ADC is used on
a different mainboard.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
index 133961ee72831..fa117acdfcb27 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
@@ -20,6 +20,10 @@ reg_vin: reg-vin {
 	};
 };
 
+&adc1 {
+	vref-supply = <&reg_vin>;
+};
+
 &m24c64_50 {
 	vcc-supply = <&reg_vin>;
 };
-- 
2.55.0


