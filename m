Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBCD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mc33Vxd1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Judkf9+c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=; b=Mc33Vxd1ZS48ZZ
	lDWZNAk20QHv0NmXcOh2nVIW8KNotZjGYZUgh8KVDBKPLKKE6gDEOBI1pfAAQG0tvIe3YgaeQfOP3
	eX0MlyIkKGGw0lT4c4GLFDRDfB8EdfuQZZ50G4+z8U/1u5aZ4QrzA9qAkRkdo+a4hTl9r1H95Bn9e
	XEzj9fChcV/bQB/jKlDyYJeJmytmKq9Lm1aXt0LO05Fgp9FGxM6r5x8ZVODby34lpAMzjAdiNePVL
	FleljjQCXEd57/hd43C0DOMNEfknsSsa55xib6VoTZCwmcXyVamFnIQzHbNyBJ0L8/Eo4NijXHmk+
	Jg8P6RO3rag8J34MhPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xu-00000005iFk-1oaw;
	Wed, 11 Nov 2026 06:10:58 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xr-00000005iD5-1N8R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:10:56 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1338756a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377454; x=1794982254; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
        b=Judkf9+c5mb80iZym/mBqorUZ/E6ephWd5uzwJM0kkhQp4+9fW09rdlizRrq9OuOtI
         O/cECTm0wRPFUvZncQqyPfbF7m8Kn7wJHjHwGFk2bo9x3BR92XYv+EeIMX9Gwd3iJdb2
         nZwMOyeVP/rsRp7kD0OR1CRUveusPI9G+7owApSnZ2O6oCkYRRJ4aB583Etm+OsAR+aJ
         ctoorFm5SaZfNkpUsr2Fh7rIYhid87FLnpmaPVBFTYLqJaf25N5JbLq3vzioZKdjj4cQ
         6M9eQ2XHFgItyKm6xoJIH2HSf6how2xrIFakNT5AdSQ3mOH4lo9YcdZv4UT0J52BeDPd
         ZNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377454; x=1794982254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adTF7M2gMHj7eJOUoZHUfGntqMgezvSTHYPTjsdEjag=;
        b=UsseLYU99ce/jJwWPDBNIkU7V1Fr55Qq/sr/kQ5rtpqX+5YdxqQA6p93vhK2hj0+qV
         YZMbJq1x+mzR+P6MnBECO4vIMRKXnnrdLP1A7ow6FN0KrfMoLy63t1hgHCXSGwW4Y0Br
         9dIpqLEy+nGe6BBjDBzjlbhc+WLS83m5Dn1vyAUJpFUo7eNTVEsXJjP3RXmXuDxIBfqL
         uS1UseXRvQduk47ziGsIF/jqj83P3ca0Qnc/di6Ed4BNp4iSfACi6FHZDhwX+xAoUW2Z
         uSYX+jmLb6ebJDqaZfDv/8sQ0L7oCtIAsRZkB0w6GE2+0tBM8JXcO8ozXIiWB+MtuXkc
         D3xw==
X-Forwarded-Encrypted: i=1; AL+hErFUbc0hkxSe25csJr9wybi/3ChKaMntnpRRHsJNV1yAbqTL5cLohRlHtQMkDZi8k8HirQNXlr1trKXis0gLoT3q@lists.infradead.org
X-Gm-Message-State: APuU4Z/qkos0vjMMX3l0BKJlXemPpiGDWYAzmO0vSBhQ4e/5cX4piyjY
	KfAnG/lHPDkjBW+bZs6If2e8AmFXo7vC8TMvRP4I0C75YqJXsrXyz59U
X-Gm-Gg: AYBFou20wDBI46i1a3H/km+ZrYaPYc1TF0UxE1epLfyPM4S3bmjnXiiRESaF28NNRva
	Fc4s5m7lKeS6ORqTqhlgp+AmRKhOpgXe471pp5qbSIOKk6nPFPAsHgvubkRvnnCOvaz2xFyT6G4
	zEyg5TBPdgXUR2vOJV1mlqKQUXR8MB8IE41ntDVtwxlVmbG8Qo4uDxa5VQBoT78qKMYosoifJhX
	wBCCGN75GvLAjKPqtSQB7SIjL40TxbIJqjDiUhpm6ZkGPGLAJRK0DcxTohzhuRvW3gjP2IzesNO
	sPBEvjv4PyY8qStkyJWjLWgo1uvWQqEnKA1EEKG5aEsNFCscjA8Qane1FhYXdlM1HNPj7NccM5e
	u+nLT9ZWO22Hly584oqhf3SRf8YafbFqrasHidPXfSjV1zq/Gmj72g/Uqi49L4I9fGVJK6W/Qhf
	MJdanML/6JCERVHAv48rRpwksuULDfiF3qFFNbu/ptR8gic0P/7n499vHnbkvfNb55TAIyohQR0
	CDZ/zQsyiHCkrt7tXhnq+hT2X/ON64JCyd1HvNzbr0NnrVyLt/SnXqD871hd1EuP2Jq0kxTXF+W
	Ut8O83ziX6Cz6HsaKF+LSUHutqjW/p6wOGTIPQyCC5uBOyXD7SNrLu/Io0Y1eBQGC0kY
X-Received: by 2002:a17:90b:5910:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3b182e12787mr1641552a91.3.1794377454347;
        Tue, 10 Nov 2026 22:10:54 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:53 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:45 +0800
Subject: [PATCH v2 4/5] ARM: dts: aspeed: ventura2: Name the USB-UART
 bridge reset GPIOs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ventura2-dts-update-v2-4-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=uxlzFpBewTlOUpIvaHC+sQHRHy1iC/2nchos0sKDaSA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1Y75M000yKvj+EmMiYb+D2UqM+Gjo5QTY+
 aYZCRbqbnKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gVrfCACO+o3U98bHLfj9ft+SUDV7IbCt3mftqCSoznSCfIaMiRMu1dIttWlQN2p/TX6BzUrsEcK
 ax4g91upkLZ/tHwX0pDAHawfcgNbviAQsmglRgvCNxhlk5ZvzQgAYqrDAzZkj/oxX4hx8yrPimE
 UJTsTTFHDLqBAVOGQ5pcPvnnW/j7NM+lOctLzK6kdFPWb7fedDRM10xaj9es9NJLMrx5LNONiD8
 TRq/DBbh4x2C5EOhPo9nfdKuvOsl1JqZo4i7J84arpRwXTVzAMGjlyQgpr6vr5mqd0RPCSd8CaL
 8xUw8eJFejqLyk0H2J2K0Hd4AtvI/XZknibcG3HHZD9vUdNz
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_221055_373557_F607BA35 
X-CRM114-Status: GOOD (  11.66  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lines 2-4 of the PCA9555 at address 0x20 on I2C bus 6 drive the reset
of the three USB-to-UART bridges. Name them RST_FT4232_{1,2,3}_BMC_N_R
after the schematic nets so userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index c683ac19aba3..a5e6cc94b280 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -1937,8 +1937,8 @@ gpio@20 {
 
 		gpio-line-names =
 			"", "",
-			"", "",
-			"", "PRSNT_FANBP_0_PWR_N",
+			"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
+			"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
 			"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
 			"PRSNT_POE_SIG_N", "",
 			"PWRGD_P3V3_ISO_POE_BMC_R", "",

-- 
2.34.1


