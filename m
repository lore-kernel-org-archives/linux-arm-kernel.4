Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E1F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k061NMpf;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=bMyX7dQ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A8nrZNesO9VLezCFBss71uBRpn9fM/JhgyAtVyrelME=; b=k061NMpfrHUP873FoO2WPxYyji
	nPjAi5rNxVPTuM/GV2fAlqlYUL7GthhPMli58+UDov2W3yn+K3Esi0sS9/BPlK4pu4JIIsDO+FsYj
	xY6P0wE0pChR9u5FAZ10AOUaHX6NwNKqiWAHsljKcC3t8chwKTj/CFxLnuMALgXc/QzS+jjEgZg0W
	RFSr5wlAj+i1XUfmcDWYsJrvbXghn7I9vaeH11tl64kyOWofTaIvxX8DV3owhZWVHbBHLXNqCAss7
	kEIsjZ35vqAKb2lHby05bsc9C24jG0X16qRS7iKoGj50nD4QC5t7wSa8zy9rJeOb1cqMjeHRQ5/nt
	ocLA/D1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLMz-00000006LMX-2dl6;
	Tue, 17 Nov 2026 15:45:17 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLMw-00000006LKS-0VIg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:45:16 +0000
Received: from francesco-nb.. (93-41-19-23.ip79.fastwebnet.it [93.41.19.23])
	by mail11.truemail.it (Postfix) with ESMTPA id EA3E21FAD2;
	Tue, 17 Nov 2026 16:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794930299;
	bh=A8nrZNesO9VLezCFBss71uBRpn9fM/JhgyAtVyrelME=; h=From:To:Subject;
	b=bMyX7dQ3wYrLehzQAWo5jATDdKgQu3k7LcAXyKDdCovr4y/ziIiu5t1HODtiMytG9
	 KxZxUh+ZMITBTynT228gU9DLHoLp0BO6cRnU3aVF3gdPVOYyEPxbYoKWfPvjvlVSYY
	 v2iFNOrdGCGX5m8+wvtqoBqHciVk6PQ4G8gZOMAJ3eYsfoCFIDvSCVcLwiYIOHUJ9t
	 uzJ4OMuZThyv+ZPB/WC7/3GfZl7h6c95pKXdSXJOel33wa0i2iJ4n3WZzK/VHxflSy
	 qZQyK3vkTJtGVRbp0dQVOWpOP/Jznor1bqxXG3RjNMBvUFgpbBYAzl7FZ3Hw1zwPMh
	 JpT1Iv6FOMMuQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx6ull-colibri: Add RTC aliases
Date: Tue, 17 Nov 2026 16:44:48 +0100
Message-ID: <20261117154450.461570-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_074515_202790_88B17E70 
X-CRM114-Status: UNSURE (   9.75  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Colibri Evaluation Board and the Iris carrier board have an M41T0
RTC backed by the carrier coin cell, besides the SNVS RTC of the SoC.
Without aliases their numbering depends on probe order, alias the
carrier RTC as rtc0 and the SNVS RTC as rtc1 as on the other Colibri
modules.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi | 5 +++++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi    | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
index 692ef26fbab3..a296454641e9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
@@ -4,6 +4,11 @@
  */
 
 / {
+	aliases {
+		rtc0 = &m41t0m6;
+		rtc1 = &snvs_rtc;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
index 5e408e54b335..e0eacd0b6928 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
@@ -4,6 +4,11 @@
  */
 
 / {
+	aliases {
+		rtc0 = &m41t0m6;
+		rtc1 = &snvs_rtc;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.47.3


