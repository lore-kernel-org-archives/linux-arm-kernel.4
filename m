Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34A606A689
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SuPP81a8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbCKUfIn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=; b=SuPP81a8PNn4LC
	bPhJXJX8m91sc/1csjqjO7hLtUhaEzUebAzMFy8n6VrTqPAwrI5m2SFgkCZ8GUqGTGJZCyx54pgzi
	K+hBA82dBiXYCOt5s4tZnTsQB4wwnTG/du8LBKdAcm69fENF5E7FlO0CdYzedqMvyiOV1Vs8KwyAo
	H7IMA4syw90rzKF0PQoxJMa2DgVKK0AhTI2hCHjuOpA6iqvipx5MhrU+iPZJ1hmYfXXSl/8MQvcS5
	T8TTKgu+OopQEw/XwomTq3pwTaOkhRbw393xUJIFZgimKvaaQlXKPtN7El0kS2AhkcvgV0M+LDDv6
	Gn8PuFGhAFTUgtta9qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw9-0000000GV2x-3Enh;
	Sat, 21 Nov 2026 00:26:37 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw2-0000000GV16-3lL9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:32 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso1359391a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220790; x=1795825590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=XbCKUfIn80uNf+eXeLuRyXEMa7i40T1i2qDInaTgA3rSzOR+rQ3t71ryjWljmdwOzb
         Z5uV3B+YKuAkxJDpPcdu/4nTuDZ0g5V1Iq3A2yxXbOSWTsAf87x9pxb/MlspyKmtPpDM
         7c+2wK3IO2GGaOFLP1+waCUZd5dMQj4zmBb3lOznhAJY1Gn6Ol4jYvHHUJjGfzVJDkF6
         z8UYwDrfPNrT36Jg9P3OVJ41jgzj6zVx2FXQ324e7QCe8LTV9kQcUq+nfK1GSdv5lEGi
         D/4V2FVHGK1roQGIDRJW9rwreBZoEFCOdz8/9hfpYnZiKKao1JJgJBjc1fVQhCexVTZv
         t7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220790; x=1795825590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=q9bqa31iYUFWymOImwBoQByGLVtXK+KG+wnl8t53B4AtpKR1f91PIgoPmzfpi0Atoa
         R9jpTrkBOV8csH16oLyMcEhcnOOzY0dmaa/DTqy8GE06A4BpT8Mt/0RRh5PpSKnUSGSL
         jDvigj8n/O7AE1jCT5cJa6msuBar0g3d6wFbVgVmUSp3O9qLdG7mgQRD9Y2YX/qFudzH
         P5T4dxk7gomGnLqTovg+qIH4nDDG8t5pMejTeLoIKbnMnY1ZxrGS2SzSgYOWWEPMjZwS
         efMBbZwLRIGSHdxBvvo61vf9uMBfh0jwJ3nty/oiE4AXPQwRqvt5YcMMtE7FwG9UQBsW
         GbeQ==
X-Forwarded-Encrypted: i=1; AL+hErEDjFDAXukKPYEQAghbm0oFBo2DRZNmsVmNEKyAfXq48VhEfAuBcqX/SELDXtxMCX0ZQdzXH3l/qM+We5QoBy1p@lists.infradead.org
X-Gm-Message-State: APuU4Z/5cx8F4E7M+aRQFNbozt9msiHDWZ1Jl5S5prGFq/sM0vubjDkD
	l9ynqsfW4po1QE3knc9CiQE9vSJdYTOPZC0y5ecd7zIUNt9fWqO0xkZb
X-Gm-Gg: AZFdTZexoiAEyBG2rgBFyGCmyEJwnG2o8Zq1my28Ca4VXMBBIDnjt5qhPIaN70us2RM
	wEGnvBCQsQBLnFeKLR7+1BeULuHQoEavtXXEU8fAahHEXghUZWcmE2bWGT5sYNRGIKgrcYUPYWH
	m1FJfMt5kUEDD7kdTOIGClcLmNUeR7snWU0V79P8WJmiXXAJy0QfClA1j5WC1rrdWQe0L+MZBIh
	BA7KxAjma5Ik4KxaZuaV/vIo8uxCjWydbgJ4lOjL05wU+PvL0SIlYVVkEePh8aWk5F8pNwcPKB6
	U0NOaxBcOLx6Hv6fePAKvjgIBUVfHeWXDBaU1sEdbjsV3NdpOBXklnz3kxLbNhyK9b0Iag4uVmG
	M9TxA4mfVEJf5lAs0S1XvmomckAQQBgZWVqWwV68tJcGNGYsK3jJFh/TV4MfWQfXaWSoPf/EZI9
	GiLqZd8AuTNYnVZGPT/TG6sxbcVje6HEVYQkuYhk8H+1aYFE858Ez9N6Sk2wk4pyX8F9CTNeRTF
	Wxwivw3Y1gViFB2AMqUbHH7yfnDVO1y8ojloC49w4tqxgPA6a9UBw2V/5rs1gjxnoVOw0PBEosQ
	uhWLb6xrQrnRtPRJbqcyxqTstn/xbuv3KltBwlEl4GVq2vHUyVaGqOswjuJyXCEtGipfX0b8MiK
	kxjPUMG/KE8O5CCz3k3/Mc9pnaTP3gqaa09k1Lya8g450I6vYJjZOlDf5ZFu7Oov222J1OjeneH
	ZTYVA=
X-Received: by 2002:a17:90b:164d:b0:3b3:a575:846a with SMTP id 98e67ed59e1d1-3b40a5de1bcmr4439665a91.22.1795220789943;
        Fri, 20 Nov 2026 16:26:29 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 04/22] ARM: dts: BCM5301X: R7000: specify switch
Date: Fri, 20 Nov 2026 16:25:44 -0800
Message-ID: <20261121002603.25254-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162631_345675_0B3A305E 
X-CRM114-Status: UNSURE (   8.85  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 6ea845f3ac1d..65affe615bb8 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -118,3 +118,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


