Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BE4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 02:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FmVadmJi;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bUoPtdHy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=; b=FmVadmJiWT0603
	q4m/Fh0DTnLo0h0ZzB2YS4EWHqxzk6AFF4ct90LUDzcN8gKAc5r7AdgTXApf42nB1KR5y1rBJ7tU6
	mdbSH14kix//Y26kIRfQRE6+F7eqG3cdudGXbV4PiYf50Mmb1umTONkULvoi9Y2DxcSOe8ukbfpPY
	DD6F4dfM9ceS3erGqirWYQoxo44Tb5b5OWvyHdnepz+UHn6aTsFEiT41RnggJlvMmFteWVD1vxoPJ
	O+Y6Ir7hpk0mzvKlKRs1Z9x9zXJLC0Z9Rwt1hG7YhmDQlaBNSl7AlLFElFlKdLNmidD0HBzOywwfq
	j3xIBQ0nWomBvXjcmDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8Y8-00000000JxC-14Ua;
	Sat, 28 Nov 2026 02:52:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8Y4-00000000JwA-21b6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 02:52:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f04f61282dso39892805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 18:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834343; x=1796439143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
        b=bUoPtdHy+T7dIEFYBW173kUJpaTKN7Eup+Uqg65xA9iAis9N4ljupEBisW485JkviW
         vuUKd6pgkHZeTxog66SXywwAxc+qsjcjlpMiDpMeg9cpdQqwDcoEBY4YT7TAiVdULJ+E
         zZzaR1S4CsOSoSEMstRAy7HMgCDUDLmslsBe2aaUDrsoZ4FXbMPYCnALwT2YvVv1J6+J
         0n6OxYmAUsfgLMSJIZpU+eA2qZ70vg/p8xfzUf/HG5gdwQmJmDSaTsLX6TujPUviPj8P
         lkITjkqHWZ9lCLLExoVjxnNdgx5N62BwMEO62Xy1KNJEOVzxMqKFGGHiLtUGoRtvP92J
         DXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834343; x=1796439143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
        b=eiv33cAYnB7TM33C7311IJK+9UObkETUJ8d9de2EqfNEEIT1MeKKAx1hUOW/j1TpG7
         kiJzLz71cgNWArpwpDULvQ6fr3ChsBZ+4UrOP5QA0J/f7fnv5s1i2pnNKDLYSYMI74VR
         i06Wzx632xBjfhWbEtFS94pXCRUl9I3yzrzCKMh9rCGR3vO2Zt0MuGUvDiUGCQrCCnPW
         9HRGqyqRsgmsIGC35Owyx/jWnednFRZq46fB1t26oeVEnNH0dAdKnuqIh0JtAsVEriUV
         9885esgN8PXHZMqr2/kcSapZnZBL3haauafj/O1UrjWiqu48+CMdSaT8yEOOObFWpFw4
         AZpw==
X-Forwarded-Encrypted: i=1; AL+hErFCgY3y04XjQiC87aOE50Tnkv3RpSmq/yXi5s3ci9SdDy4oRxPSIMBv5qdPpHbunuxUl9gP26Afueebjbp2Ry42@lists.infradead.org
X-Gm-Message-State: APuU4Z+fhDbQfGxzrExGpTMAkBD8vd1oDr7lXv0bigPrJWAw+SH5j7V4
	qErBl9Ni0urMoioco+VE/h37ii4JPONIXy8RBdCKdDr7hLwDwZkJq5EzksTTy2ZmJvk=
X-Gm-Gg: AZFdTZcKwYIQ+BP0WAJq5rO/i4CI3auqHQPnP6C139pphQAKOJgt1Qd8dtpUzlCX3XN
	sE7B4cTmAxpg36OpUkperfH46Y6yN2Fsc+zpJXyVXT9pH774PtnKTnrE1MZ3MmYlI+3WbwNlYzW
	fYseGYXLYYE0Egkxnccb4d+eBPTxgoFu3Xla/enARFYTeo9Vqgpfj7WG1UfQGiNEpimPExQUezu
	34Yf/Y8YVSlttPW/BhBBZLVGsxvWH2owDXD8Rtx5QoFYf0ZptWdl8pi378lLnNdw/Xc6ACot+Uz
	CeiZbL0dtUtoAnvzEiqmMg22FWgXLv+zdU4nyV1PKLoUgaUigZSkhSVp6ZXFFzLkeLdyJosOfJm
	g0XQ18bAAiqpNYc5Uat9K8eydEHo0Kz5HD3X7EwuRktnuyd0jB0D1NbJ+2HGVHgtvRrZUgu9cRP
	KBDIfzBLII9qDMVRZkcdgztcj3Hy8Dc7qUrspuHZzt2LDG0WoKvPLG4Xdv0rdkEBy6wuCw5x7KQ
	C7io/H1lMNzGC6WaV+DccfruhpE/+Qzose6eus/0ENQW5JFVzIsHpRCyBlEXM/RjA+RC2uSx/kt
	aJq2v4TTbAfHW9+nl2z4P1S9l6ZSopLy+QOD3TMb7mVWS+9OpcfMwTir0ZRG4a5J5Ob4AMBG5qL
	8Am/mcUA7Dc6ZiU2NFX0n2vCsJZkbJC3Q6xU=
X-Received: by 2002:a17:90b:2f8c:b0:3b3:af8e:ea8d with SMTP id 98e67ed59e1d1-3b41c92a403mr26168454a91.39.1795834343106;
        Fri, 27 Nov 2026 18:52:23 -0800 (PST)
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
Subject: [PATCH 2/2] ARM: dts: nuvoton: npcm7xx: Add nuvoton,sysgcr to watchdog nodes
Date: Sat, 28 Nov 2026 02:52:19 +0000
Message-ID: <20261128025219.2679805-3-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025219.2679805-1-william@wkennington.com>
References: <20261128025219.2679805-1-william@wkennington.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_185224_683751_5DD97328 
X-CRM114-Status: GOOD (  10.13  )
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

Since commit 7762911c0d8c ("watchdog: npcm: add bootstatus support"),
npcm_wdt looks up the GCR syscon via the optional nuvoton,sysgcr
phandle (defined in nuvoton,npcm750-wdt.yaml) to read reset status and
logs a warning when it is absent:

  Failed to find nuvoton,sysgcr, WD reset status not supported

Wire <&gcr> to watchdog0..2 in nuvoton-common-npcm7xx.dtsi. Tested on
an NPCM730 BMC, clearing the warning and enabling bootstatus.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 3862adf85b68..e9765fd6ef8e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -375,6 +375,7 @@ watchdog0: watchdog@801C {
 				reg = <0x801C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			watchdog1: watchdog@901C {
@@ -383,6 +384,7 @@ watchdog1: watchdog@901C {
 				reg = <0x901C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			watchdog2: watchdog@a01C {
@@ -391,6 +393,7 @@ watchdog2: watchdog@a01C {
 				reg = <0xa01C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			serial0: serial@1000 {

