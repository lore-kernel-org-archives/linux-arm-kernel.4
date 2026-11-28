Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 02:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HDljAkhh;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SSDJrZne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=; b=HDljAkhhAxtBbg
	sJ1zEeo0Ts8C4D/chEGImlJ9F3AQ+jvfEqORKI8jLxuR/oHTCgjAMSQ7WvKMF4+Z8R+p6Ji6L8wf0
	kpj0YREYHLvNYYCQW/oShKZ1rwr3cHgZugWYIXa+15UBiKxiKcC23jLRBKTYneyBGE8Ar99ImpJeV
	DA+UYohG1iQn1aNuQBa2Y7dZJqnZ/P20YhzRqSymmi0X3WnV6Osg61rtR9SQePoCuBVVKu2EcLaa+
	VLY8WMHcofMred5SB9/hhUk5Jwm0r3D4OkNHgKnO9TzJ4awSGGjkMcr0IePhXyksPuIes4RKQv+4B
	5k3awahNoV+EJs8jWy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8YS-00000000K2Y-0jko;
	Sat, 28 Nov 2026 02:52:48 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8Y4-00000000Jw9-27Xq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 02:52:27 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso3777254a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 18:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834343; x=1796439143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
        b=SSDJrZnebxKh8tW+giqx5M4YI2/Gibz5wKF/xikvbT1tHsopWiDGJyFV8oP15dk9KM
         PYkrUpyiSgvl6tbiWvUprXuk4mClbNJ4GRMqmiUiX0sca3zc2a2cYlqXYI8Omr70aXU3
         oSbaI9+Rp4EErFUxc7Ex0mjNyXDzk4ZBXdwHdlDu8ymhXXrAaNYUr5gFMzC6/RHzooLR
         hMWYmA+bYdm6hZzA9fgTFp1qm352eo1xFk1AtkzaEyA2pUMgTZPDJLOHIOxkRUV3Cfv+
         IREVklTCntNKCtJjKUbNlnr3WRScxi3r33q0hAc6JMtO2pOIsbzWROrxHag5lSpsyYvI
         IiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834343; x=1796439143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
        b=U+tMgEvT5gV2I6NO71WINI81qz0wDcNVVFa3l6ar1QMDzbxq8n1a1+npNRUW8O8z2j
         PVLnUxAtH0UpY3pFnsjrVAPCA6G2+mRL6mw5HAO/M2X/4hxoUgazYI1Jhvf/IBy/E+1t
         hYQb7QTmPSvTKawfIdNwaQaN3XOmCESl9SgsMYfZ4tFCZel/0M2CvRd8y1zZNvCxM8Po
         1CBlZaHLGti3lVUwp4DCwiIp6vPLZSljaYgr/Cz1kXKVTyNMAqcOy0pnLpSrhrcZ2jb3
         hXz7LR+FCPUZw8z/ARBBCL+LWeRpMKFTe1j+w+YezXHCtx8dDOfR+Jzh2Yip/Avy/fJw
         5t1w==
X-Forwarded-Encrypted: i=1; AL+hErHqXVHmop3+E6G0/Zvzrr8eyz+idsarl2bO49KINPbeTkzBGbWqx3ars43+FSNZSi1cbZmHeaX7EqtUmLoike7q@lists.infradead.org
X-Gm-Message-State: APuU4Z/EywhYQG2l4sr56NsU++zPPgdldKpyHhUrA6hQccHTEPrlHvoN
	sh0vUUklA3O1A7nGFMIL9MgHbzlZXdQnrAAXkfuUxsOwE/vnkn1uBAUhoSG3yvHin0o=
X-Gm-Gg: AZFdTZdMjiv/yV/y/1aSq81hmyIAxrMvLdyzTdOH9QsmeGDPzR0Jf2er5DpOtnZalSx
	19ByN9Zg6lo2wg973ICZqejrs+BkeQHXsiPOdzfhRH4qr4KTwBQ3ltiD1gsWtzmEirIqBpdLPzH
	xrhCg2Ys2ONB6Cw0ciwAybXyxg55WLLFXMmtb9fbQJDNhWSRS0zQUBm1Ok8eQxaewopIYs8De0O
	/u4sDq2ClB+k27HxR0gX83RR7PQzFHEMd/XvwE0uuoqejnJCUHuoxUgKCtwkLPHtRl+ZvP7YjMy
	nLvlUY/2txjpwgcOR1LNucMMoY050fwIywAWJcr4gPrboYD1tnAKkyAuPvXzvgZ18D+19qXo2Cr
	OVniikhSZSM4uncfIdKVjsAgXuyOVYbgve0lfelh4mJ0CBetTyDjWAQFcHWCExLvvQa/PVbyR/W
	cvzLWa+AaF9hjypNuMzS1cmxTPZeh0/7dgx/7Rg6DqWpv/+kifH+QAzim/NTzHbVLdaY81xk1oa
	3UHkuFYIVlG90tZ6gRC0rO4YZPRBCAr+eXrnXNslAXZxzTs1QRgVwLzH/xj+tYfaweCoDJCirVV
	1F+XtFwv21WiS8XTlnIwKb98EuQVz9nTVbtjWJaxryFZQdYDliFuvoB2AHe2kHtdcsHZqiOuE+D
	KhF9jwIcxcsRLCQ==
X-Received: by 2002:a17:90b:3ec8:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b41cafdb7dmr22496986a91.47.1795834342573;
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492174a91.17.2026.11.27.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 1/2] ARM: dts: nuvoton: npcm7xx: Fix PECI controller reg offset in APB
Date: Sat, 28 Nov 2026 02:52:18 +0000
Message-ID: <20261128025219.2679805-2-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025219.2679805-1-william@wkennington.com>
References: <20261128025219.2679805-1-william@wkennington.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_185224_686849_198DE00A 
X-CRM114-Status: GOOD (  11.23  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The peci node lives under /ahb/apb, whose ranges property maps
0x0..0x00300000 to 0xf0000000..0xf0300000. Using the absolute address
0xf0100000 fails address translation and causes peci-npcm to fail probe
with -EINVAL (invalid resource).

Use the APB-relative offset 0x100000 like sibling APB nodes and
nuvoton-common-npcm8xx.dtsi. Tested on an NPCM730 BMC where peci-npcm
and all six CPU/DIMM PECI hwmon devices now probe cleanly.

Fixes: 9949f98ca5a8 ("ARM: dts: nuvoton: Add PECI controller node")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 83cd10b47273..3862adf85b68 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -325,9 +325,9 @@ kcs3: kcs3@0 {
 				};
 			};
 
-			peci: peci-controller@f0100000 {
+			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm750-peci";
-				reg = <0xf0100000 0x200>;
+				reg = <0x100000 0x200>;
 				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_APB3>;
 				cmd-timeout-ms = <1000>;

