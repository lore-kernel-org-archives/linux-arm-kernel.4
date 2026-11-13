Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158E60A262D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dshwLvbX;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=nl/c556e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rRQOqc0GZd5tQdW7FSO2PqP+kKXJUKP7tyAXns2ykuo=; b=dshwLvbXlkkPol
	rU1G1ctHKu7p2/hZQSH5OmAVCu5CP5nvet3WwMEJv+xgVe5xTdTPVBXErhHY32VYgLfcanNN60Qau
	x9vHOv4PbZyISTiIydNLV8s9TpqM61+vDwi7KiP3NdnsgLfsoG6svZclvc76M0sK+lsMVGlXiQPdM
	CE3uT7yRHT5CMqBCZ83iULYjTN3k8ZZ+rEvaNZMTCJn8M52j1wSieyZXUkORI02uBmzCjAEpbE/zr
	EtiuzV4OYXpWxEXhKpCqsf+MR6GflksJ4jFRT6ez1EE7aZytTJDJpmbQ44fsy9eJ9KBHJM0qT7N6j
	5l2QQi78E5Fp46iKCuaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt1M-0000000DMrS-3S2j;
	Fri, 13 Nov 2026 15:16:56 +0000
Received: from inva130.nxp.com ([92.121.32.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt1I-0000000DMqL-14cT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:16:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by inva130.nxp.com (Postfix) with ESMTP id 4528660193F7;
	Fri, 13 Nov 2026 16:12:40 +0100 (CET)
X-Virus-Scanned: amavis at nxp.com
Received: from inva130.nxp.com ([127.0.0.1])
 by localhost (inva130.nxp.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk983Pls3qEc; Fri, 13 Nov 2026 16:12:39 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva130.nxp.com (Postfix) with ESMTP id 8DDAA6076D34;
	Fri, 13 Nov 2026 16:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva130.nxp.com 8DDAA6076D34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
	s=nselector2; t=1794582164;
	bh=rRQOqc0GZd5tQdW7FSO2PqP+kKXJUKP7tyAXns2ykuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nl/c556ebd9ke7HOGgEJqno0lmg9sGdds6j7WHarlTOWJy3z582Z4rl/mgvK9BdAq
	 vE10xMi9oHkDDF/qqxNCOeKBfla9QZUgCgRPwTMW53caRAEZ2QMSen5uUCbNr84zAR
	 d8rkke9O5DyhKqihF1rb1G/JQt8FJ1ivfWSlhgF+inXL2OvPSC8SwS0Zqx0ziMHwmg
	 Fb4BCVN8j1FJFoG86gcVEpqom5iJDE14fBzBnGpg+roN1/KYYYMqq9Wfj0QxLH+w/f
	 tyebf2xdsw5c3MLmrVmxn9QBxHHjWHTISIxTfED9aoKGLNtFIoYHzYBfApFrrOfYxx
	 KXVMwGKIJc7Dg==
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 527052034B;
	Fri, 13 Nov 2026 16:02:43 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 5/6] arm64: dts: s32n79-rdb: enable NETC IEP18
Date: Fri, 13 Nov 2026 17:02:36 +0200
Message-Id: <6f1ea6caef6ca01c9a6384cd1024384d31848c53.1794581338.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794581338.git.claudiu.manoil@nxp.com>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071654_468583_1E7D8A34 
X-CRM114-Status: UNSURE (   9.09  )
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

Enable the NETC v4 ECAM bus #18 on the S32N79-RDB board so that the
ENETC v4 Pseudo-MAC port (PPM) PF and VF instances are probed.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v4: none
v3: none
v2: none

 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..897ba24ac03a 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -68,3 +68,7 @@ &usdhc0 {
 	no-sdio;
 	status = "okay";
 };
+
+&netc_iep18 {
+	status = "okay";
+};
-- 
2.34.1


