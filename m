Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5309606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EShf4ZbZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=EIMUFJMz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9jyaKZ/VFJwAh6HZS6RG4g1jhkDFJz3AhtVW7deBSqw=; b=EShf4ZbZIgUZJ7
	qeEm+4fGqFCtWAuzcP3ShE+t1Ogkq9tsaPRzXgH4nHf9YiAKufzr5zgEpyUhOnpYn2ASfvGg8WlNh
	AITQ2k90zN8SHu4WnX7O6WW0IRpa+iZob31e9k9cKfVKlGoR/ELKQjjcfQ1cQqTdQEe/JHPPCLo8A
	ZdJciyKz7aTj9e+TiUhTOInILSc+iCN44nimwIzmMy6hyKSM5GjvIdwrH8WsPb4Vf/nRq1UWUJW30
	sQvsX1kFVtukwCQgh8M+iPokdEix1SgkebwPyHSsG1I+PjkvNZ0Hg0bTZu1c2oUsASQqsiLjnf5T6
	0MQF0vlxcfaVtCl5nBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RP-00000008swl-0l4R;
	Wed, 25 Nov 2026 07:29:19 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7RB-00000008smb-0gjl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9jyaKZ/VFJwAh6HZS6RG4g1jhkDFJz3AhtVW7deBSqw=; b=EIMUFJMzu67KcrPValoiIaRwIg
	0qx/LSevFk84LShXpJ9b9Gv0+P+a2UO7wSLNFyrzuvjs4kMPiI1JigxKx/99AIferkTs6mbrxddT+
	Io6uaMFM1VGPe5K3R200h/7Yc5IDdvdT/AV8prBcromu5rXbIPs4uq6txY4CrWhHwPGQ9VwEK+Aqw
	07cJ/LfErvKXe1Mrzvd/dMGb5gXakmw1zdaNzdzlbiMX9hB55gneRnODNZFMplm4a3DwF4GdSg6+0
	dGK1VTz8AHbu93H2prgLLZ5mnFt7gsyIVL3SgctkUqJDZv3xEBDy4RUI/Rb7NGzfUPUw7q0segrmB
	xJwcD1hw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R3-000Fhk-2O;
	Wed, 25 Nov 2026 08:28:57 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xW7R3-0007YA-2a;
	Wed, 25 Nov 2026 08:28:57 +0100
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
Subject: [PATCH v3 3/7] arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC instances
Date: Wed, 25 Nov 2026 08:28:46 +0100
Message-ID: <20261125072851.3379079-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
References: <20261125072851.3379079-1-alexander.stein@ew.tq-group.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232905_405393_375A562B 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Each TQMX2160A comes with a block of 18 MAC addresses. Define aliases
to allow firmware to statically assign these addresses to the Ethernet
interfaces.

In addition, udev can use these aliases for predicable interface names.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index aac0ae0ad40c7..c0c5b8e22d61f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -8,6 +8,27 @@
 #include "fsl-lx2160a-rev1.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &dpmac1;
+		ethernet1 = &dpmac2;
+		ethernet2 = &dpmac3;
+		ethernet3 = &dpmac4;
+		ethernet4 = &dpmac5;
+		ethernet5 = &dpmac6;
+		ethernet6 = &dpmac7;
+		ethernet7 = &dpmac8;
+		ethernet8 = &dpmac9;
+		ethernet9 = &dpmac10;
+		ethernet10 = &dpmac11;
+		ethernet11 = &dpmac12;
+		ethernet12 = &dpmac13;
+		ethernet13 = &dpmac14;
+		ethernet14 = &dpmac15;
+		ethernet15 = &dpmac16;
+		ethernet16 = &dpmac17;
+		ethernet17 = &dpmac18;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
-- 
2.55.0


