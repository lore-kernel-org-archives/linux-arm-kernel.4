Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64865606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oBRydOah;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=ovdZp0dA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E3uK4ToIL2mUz3Svln8sWa7foOIYRKuRK6T5m3vJSVY=; b=oBRydOahiZubvJ
	i70rKAj1hK7Hahc9JIftZEmmDRuTrh+U1vomdUnmBDwB8rlP0lpP3PB0Z1DjB+sTTr16ttKih4YiA
	zc2B0CbABlX+UC7KVxnFMv3G3hiAaRU5EquXL4mGhVBR9eGb9gkOlZeGXaL4sF5Mb999fY97zzm8t
	/i2wMwbtkf95Ock+Gwe+Iqitc6AAKEmspZQE/ak2VArliISfSyDighSqDkdM/fFD69wksYZ1k7jgy
	k2Zn+pUR5QeIstzjwdwZDoN8EFv6WWZMN+foEyAQSB8IfmbwrnNOCIeBgV2xrWBsDJICHcH6vj+rc
	ONqIod7oyLX9TjdH3y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2p5-0000000GCIK-0FpR;
	Sun, 08 Nov 2026 13:20:39 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ2oy-0000000GCEN-44WM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 13:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794144033; x=1825680033;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=CVPab+eqiu3Puch8ckhPaA7dUxIgv7j+PTZCvvIA2cs=;
  b=ovdZp0dAlmbieelNlQeM2Xh1bOjUUsw4eYXOwjsJ3HoSx0A1OoSQe4IG
   jdlqbjj3lTk31oDjO8mc6iZO1y+PhVsMV6oIpI24w77LtjMWAqq0Y75Oj
   5mpYoI9VbjyBPbbX9nCGQT1nbJTqr6hW218brrO38C4MRdSzHgHEOKzbk
   fPzwCuaqPzAFnRkyNfhAJArTWUpz66x2nuhIrbU9QGfPQD9m/2wAhnLVS
   Ajc5X67ra6dbyJxucHlk9s5b/c56UVNnnaCTXgBEIz17EPleIPWgLHIiK
   yoj5GeodfPOEhxAALh4EU35QBTEPRD2trar8y26uT5pCOUnTD7UV9TycA
   A==;
X-CSE-ConnectionGUID: zybtT9kDR5GGTu2OsmKe5A==
X-CSE-MsgGUID: oftXl63DRbu6olFUNI64Kg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 15:20:31 +0200
X-CSE-ConnectionGUID: kIVhbG17Tb6TDfj/1RjtSQ==
X-CSE-MsgGUID: b8fvuy/nSUu7glftSj8A0A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 08 Nov 2026 15:28:31 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 08 Nov 2026 15:20:30 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Sun, 08 Nov 2026 15:20:14 +0200
Subject: [PATCH 5/5] MIPS: eyeq6_defconfig: enable the CM3 PMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-i6500-cm3-pmu-v1-5-bd119584891a@mobileye.com>
References: <20261108-i6500-cm3-pmu-v1-0-bd119584891a@mobileye.com>
In-Reply-To: <20261108-i6500-cm3-pmu-v1-0-bd119584891a@mobileye.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Fu Chao-Ying <chao-ying.fu@globalfoundries.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_052033_285818_26C335D0 
X-CRM114-Status: GOOD (  11.32  )
X-Spam-Score: -4.0 (----)
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

Enable perf events and build the Coherence Manager 3 PMU driver as a
module.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/mips/configs/eyeq6_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/eyeq6_defconfig b/arch/mips/configs/eyeq6_defconfig
index 0a00a201937b..2d06d9ed6526 100644
--- a/arch/mips/configs/eyeq6_defconfig
+++ b/arch/mips/configs/eyeq6_defconfig
@@ -19,6 +19,7 @@ CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
+CONFIG_PERF_EVENTS=y
 CONFIG_EYEQ=y
 CONFIG_MACH_EYEQ6H=y
 CONFIG_MIPS_CPS=y
@@ -86,6 +87,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RESET_CONTROLLER=y
+CONFIG_MIPS_CM3_PMU=m
 # CONFIG_NVMEM is not set
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y

-- 
2.43.0


