Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B39606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wE2ANPEm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8mybqTc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=; b=wE2ANPEm+0BwmU
	v5eXFuD61lgBn8ri/IkuRRXEpYOX+1IB6BhbJOcy7SY5MohjdCksYEyYwtvEGYSV/qnN+NC5BFlPB
	Au6b2EqYB2UKK2cMsQPAmpASaJ9whU7VeFXQSTG1RwZDW8yelEc4AYAmOk2pL1Z1s/tlktGln00JU
	0SEHZSBnLS85F2FDRZ2FFtmu/dBnvXudxqEDh3Wibhr5NA7/nZOF5k6Xv0wDyStK+gm3X+eto9N2y
	k9zlfBVG1N0AzDV97+kwfDZ91HdN4OBQD6w6QyPKJ1wRh93vGO8wKz9qrMwuto4RmY5AHYtcbueoT
	Z+5czmqXnFlwAgsgR/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQO-0000000Fwq9-1xZB;
	Fri, 20 Nov 2026 18:33:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQ4-0000000Fwkz-0hcF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:33:11 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48dee593f18so1085719f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199586; x=1795804386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=t8mybqTcRsJ+kNXT1onJGeRDmXH9VS90Pkh+rJWwOtQ9vdHRnm8QchGJKRao+sHIQK
         YBBE4HETvCZWoZtZuhC33Z3e3f7PBQVWGiEGPFzOLIXipK/8L0IA56l2cWjC+2p9w/8u
         lFvGleiqCOS+5VGnUDN6+3OryzEo6wuYU/EoUs+FTfl7KMzbA+hKTL5j30h9yu05dtHg
         akykHJNI2ue/Xq/OSDIFUWrcK29DdOHnH2Wlc8d2zvgPi8+R3sWJ2mU1u1eB5mB3JIzd
         M+slh8TRnHXZjAvKwyyK+O+KFYXeps3YrfJijijkw1epyBFvJ6lwoZhpAVC+qXrf6fLk
         U6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199586; x=1795804386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=IjSQvQxCc+IxDmP17QFKcVh1NZBTdWdJSmWwtHCBTgaVxxoorQtN1+eTVY0euxWcBl
         HX71jmJTi1yfqg1/J3gb5NfNkswMfe66oJeqgcjDfA0DgBDDzBhScubeZ/O1R9sqkctz
         sJoSexVlaLgz6M/JRM+EXuzIDpME5G0jCHB6Ln/UfEk7DOc1iYVheDm4S4BNJ5fZqHXm
         WoyFWD4PZHmsfZBZCcbYVqH9OLd1euBNXO3O1hfxcLpLVztsK8m6t04DrgzmEVITSNnG
         KZpDh6GbpM4TLx9xetrnOWld9oxvTa3juXlxLTAb7Ja0j1M9uRTidnTG0I/xvyfV4QaL
         743w==
X-Forwarded-Encrypted: i=1; AL+hErEVo2MEPZzn9YwX6kbpQTgrYScY+bDbkhThRCSAlDVtXi4CfKUM+2r3rnnJXR8dkUrSr+6LMx0v3Y6kRAACRO6P@lists.infradead.org
X-Gm-Message-State: APuU4Z/SJd8tiu1h2u862rS7u/wd1W4Dlf85OFIZMkvalq0Amd9zNQ0W
	bxkHrQONr7ErBsG5S4FttKIJheimbcygNyKmPmTEdspoVZeNVx/3GJwo
X-Gm-Gg: AZFdTZdD03A0uy3LYhDKJD0fYb+ig3MozOTkfFeU1ebR16xf0hxzzSmFVUDaJRSXHaX
	TOHZFMc2ABXMsnwV09ILyj9H2N3RuYS7G5PmlD0kLe8IlqmuZS+l8V+uZT/bf3ag/tWR9sBVw0B
	ciYr0SiXDyFb/hjEM88N5b+UuHYAXIAfGSXdlTLcLxH421T1v+8CZJU4x8dfcjAR863chDlqOMM
	yK1Hvzgw2+SC0D+MrqnJ527xiLHvOvvauErwFrf79m7QGunbMvyPumqNuX9Md37eNQgKjpvwuW7
	E6j2Qj/QdaQTWzRyAHF/3xQdXAUfxI6M8u1+PaIPzfRfgzHDDlRQPJx2xAGzNUq1BkYVms2ml5/
	Flnw1TPBxwLaztCC0tInARs2ke4hfDtYQ/DimUPKwuAa7X5q8SkdSLvsh4LbySOXNFekRpvY0If
	Fs2DIYOMBkMC06Er0ly9VWiUsUkdHXL/DFM1kn2GCkkxj/vDsAwcJnrbWfZ1wY3ZmJNhIgj3Et2
	B/zWrg4IdbrDq911B5318RVH3RvlbefmHRGUUV0peQfdFRjMzglkWdpORzHTrtP5HtpnhY4PyzR
	pJoccbKb0t38WW2kOGnG5u/Xr9VOfVDuyPXA3yKd4CWddnMbK+XYsJbd0obi/PY6J8wYynZtK5q
	YC8Xf2L9Cj117SHQEbHYzsr55viX7HbhJyqhDfYpzmxpzUUxynuAyz95E/uMD8kc/10fW
X-Received: by 2002:a05:6000:4541:b0:48f:88ad:7b54 with SMTP id ffacd0b85a97d-4abb2169969mr6420016f8f.19.1795199586192;
        Fri, 20 Nov 2026 10:33:06 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:05 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 1/3] arm64: dts: freescale: imx93-var-som: Fix resource table address
Date: Fri, 20 Nov 2026 19:32:28 +0100
Message-ID: <48a008ec1a785f96f25c3b6eafa2869ddbdee0ff.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_103309_768595_1B49FD62 
X-CRM114-Status: GOOD (  13.36  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX93 RPMsg firmware copies its resource table to M33 address
0x2001e000, which maps to 0x2021e000 in the Cortex-A55 address space.
The reserved-memory node instead points one page later, at 0x2021f000,
so remoteproc can look for the loaded table at the wrong address.

Use 0x2021e000 with the existing 4 KiB size to match the firmware.
This also matches the resource table address used by DART-MX93.

Fixes: 4ce623d9f1bf ("arm64: dts: imx93-var-som: Add Variscite VAR-SOM-MX93")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- New patch: fix the Symphony resource table address before extracting
  the common configuration.

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..78b19d8918b7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -107,8 +107,8 @@ vdev1vring1: vdev1vring1@87ef8000 {
 			no-map;
 		};
 
-		rsc_table: rsc-table@2021f000 {
-			reg = <0 0x2021f000 0 0x1000>;
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
 			no-map;
 		};
 
-- 
2.47.3


