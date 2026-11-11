Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34700606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=egxceY0D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oJ7Rzvom;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=CmpKbOGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EuUZibU4Qx/Wwp5/9mignjaQTr9n5qcc+mnxg/CvI1M=; b=egxceY0DI8MFp4pOsq1urx9pZH
	/ns1+AJvuvvmKD3DKB6IDs0xsL0skH1V/npt3OZON/n86ErLMyDWFsqFEAMOu1ighRpI77xmppkIc
	w4v65IzazwROLiECXZJ7shdH+df+7JaOpuC4Dahvm5jNpn8KCqjxFwMsyquEUoNDrjQH00Fzo2iie
	lMuCaH6rHl0tuDCdBGKIM0WOXR5VAWEDOIpjaVcMUgcVS2VUBYUVW7MohoI280aErbH0GZ5YxxeZi
	4Kzdtc8rvWosIEspwOoDjwj1oGcj0yBPSzULNGI5svddOVaYEk1zN4hzBn4b88gfHlY8FbqRkk1K1
	EkOcCpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Qn-00000006KXY-1Hm6;
	Wed, 11 Nov 2026 10:19:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Qm-00000006KXL-0cVj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 10:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EuUZibU4Qx/Wwp5/9mignjaQTr9n5qcc+mnxg/CvI1M=; b=oJ7RzvomO0SRwBV8fHFk/+xHnh
	hGeurHK7BKSDGU8x1M2IUHM5grzwiMC0K2WcJ0SDHj/LSf3lH3oY5xSI4GsLGxnoz2dcpr8BLRV8T
	epU2LhnAEN9Ta+LaqS/ou97VMjnuljOE9ccmnFDwbzjaabDGXb5RYvdrYE3Y5PbFxvJeHkHG35NPu
	3tue6Ju+oyP+EYSzx1R7NmBZezbydrbXWvtz0n5aYvQCLKhZr5g3+9B6YOWdf294W1IdM33ghmtNm
	E/rzZ2/yBqWK1etGLJZb2LXXScDAPrdE7cXEHJJDmZFgYuNC0fANeDOzzKq876rMYYLbQoJD31iqX
	JxoOH4EQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5Qj-00000009151-2M9n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=EuUZibU4Qx/Wwp5/9mignjaQTr9n5qcc+mnxg/CvI1M=; b=CmpKbOGKH2DJbjdrQmybWLc9sN
	99KGYDnMN9YDlZJXhGdLqySpk470lrbQ84q7Tuw7y5U9bpqAjG8rx0n7FAJ4DgH+9xRnmMtdavx5J
	RjeTogd0n7jw8BRbbhsYwk0McPM+jC+Jzy0/RrEmjIJYKsRmBvO57oF15Hxjw4J8s4y+OSKCFNlXJ
	MizBCnlcWWQ7lvx63ZWkzWLRQ5EWiLbGjdfS2NH66VQe/1ATqQkQDKLI0O8mTK+N8nD0+P7TL6fqM
	t+BrMqq3JMAxGIg3rLuGO3qErIEz7XibnFagMviPLt+Kn/zS9RN/6Wz8Jxb66aQrcnrYLa0znZD8z
	b2/G35Uw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qb-0006eu-2o;
	Wed, 11 Nov 2026 11:19:41 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qb-000NjR-0I;
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
Subject: [PATCH 1/2] ARM: dts: imx6ul-tqma6ulx-common: add vref-supply for ADC
Date: Wed, 11 Nov 2026 11:19:23 +0100
Message-ID: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28180/Wed Nov 11 07:24:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_101949_571188_AFF87A6A 
X-CRM114-Status: GOOD (  10.95  )
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
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
index 5c90d0a3ee2e7..1cb1791f64a45 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
@@ -10,6 +10,10 @@
  * - TQMa6ULLx
  */
 
+&adc1 {
+	vref-supply = <&reg_sw2>;
+};
+
 &m24c64_50 {
 	vcc-supply = <&reg_sw2>;
 };
-- 
2.55.0


