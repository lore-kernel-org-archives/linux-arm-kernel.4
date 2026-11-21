Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E68606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WVLch/XY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HD8wAayL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=; b=WVLch/XY045bjU
	WxMZ3ywMazXD33TVKExX0U+JuFtvNW4IU5ns+9rsYe7dfZ5T6dTMDZ1tAmXLLm1/VIx00dL1My/Ya
	CE00pYNngpM6iKwhVywawjxIYifdwSignWj90mBeYdfUeR5RoBgpAZO4ys2TkNAc1rXQnbJlTQOL0
	rxjLFw3nvEQVFkNk8K316J/abF+N34PSrK1YUNg2BALl8+cJzJZ3vN/ZqYmPWyebCxYe5R70BpHkD
	j5LaTQZylbBJe0TNdA/QaDRg2ZJZQ2Drc4sJ4y7yEbH5O3aUCgd/x/OpepjCv0918kdI2xIYt40rR
	FvEl9ZyjIwvQCBX6zGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYx5-0000000GVQk-0feb;
	Sat, 21 Nov 2026 00:27:35 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw9-0000000GV2W-3rNu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so586156a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220797; x=1795825597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=HD8wAayL37dKspgLQAR6euzZJljCdl0XhpYyYFvBqURbuSOyhCviW4xryi0hK/GmuV
         3Pj3Wis3zhzlbVHWZos0frRFexpGtvDn+CcT3IuwhBh7eYHRgeFMTvnyPyFSE6fuEPtH
         gfF8VwnzLvdpJINAMqu7ANsdIw3pZrdVjeyWwTF0vmBpeVWMsRJlXivBHWeZlsvB2zl9
         Zfdan49ZWOVaAIq/7NtPJvmuan7Vg5unmU39wq3XoCQphmyB13CPE2K1Uw38s8rkWiLA
         CDbnJgHkqzEn0Gjgdz1O6r7zzTV46pIZ5DTMSYg6l+b8c4CSdAYeqMCdi3OQNUmCDNLE
         7qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220797; x=1795825597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=i6X6GnSnxlg7zqhg/g4Y77lch+D5A02rtS04qm7WL1nSCHh5jAoFurY0/jxXPvNPzC
         lD+fN3ujePp0UDnLMjL6TRsIsFvMDmen34Utm3u7k7180pQ7Iw67E10zNN7WrQmF+C5t
         0nKpIEmUSn5VcCdGM160qpOniEzHHk2VcZmku7ydQ+bxMxMpcjveRl4aYTBW70nheVIS
         V+2R8Zoz6E9L58MYvPULSYouUxX06QArlVuJ17PgXEgnbKyiaUZnXBDjzXuuq7IpbyYx
         fVfIHYrYQbTXgKBKjNavJkR9+Ad3TDR0pvq7es7B/nXVMClhehXYs/olrAFJB74rxJJK
         8TGg==
X-Forwarded-Encrypted: i=1; AL+hErGOHsljtQaBycWLFccA+mOUhNOb72FAdrJtfiXgYtsxUR+u7ZdjY1nM2prMh6U4bFnrqwryVKwtJhRfdMeqIv2D@lists.infradead.org
X-Gm-Message-State: APuU4Z/8B0At3lq75+GiEdFSxAvapio76DBxOC4ELPRaPAfsgTsB3r8v
	6ZXR+CjvTTzns3QKdVZrEuULwafouMk6m71Hus6ULv96DWUxjv7IEGvl
X-Gm-Gg: AZFdTZdgiA42WozIEOlqh6WADvBD4ACc2h0Hx6HSO8D8YV5wLkVGbrG5nXnJJzVsaZB
	4XBbq562e5St1oggHJ5VBtcUHHYmnmevU+8WDgymkAB9EMN77O+sXO+16/39iqW8AS0cJOL87zK
	lDAAD+Zzb+SGWslW8kDhAlshfzTsf82Z8lO3v9zyPgfBwH4vPlXRuHwGAH+QygIjn7hl/Vvy08g
	OUqjwgUa64BsOAa5kJuY/TJrWgh79f++8+qO/zXQ+aQSg9biuvO+G7goHD0Li6dHY2EFzQc0t5j
	zq+c2wEot2iTXpjU7EDLLdaBtxhLNn04jsTP+aEtebos+bxIk/WixRJIWE8+q/IBb90G6rASaxH
	aCNFZUHs90ReS17DbOutaVDwfb1pY7xPvHNS6BIn5oL1uBddOHXkvJ8ehrdULQV8qZkSXfXXtGG
	BtMfG7l0ibGtu2Zt1MyPZQYIFiGOXPqEx1G6qlBCpupTPOAW158/6BZNV0Cp3wG4tiqExPRIxkS
	rs9eMXNJXBoCR4jtRhe5hw3jcbP8/A3tmZq8D5h0agNInDBpqQ1PkEdu+V/dFSApZCoUBkiZW9T
	alsHk0p76bT1WCUIF7bxHSN+JtTQr+J7ijxucl3I8f4XsgzPOAGt3smRg1gQ0EfPmmmoa017frO
	zSA0wO5PdF0twVbSzEliknQOZoCPgsSdaj8UCZclor25u4tjtoeLnKEZ2bY4khXhf/maA4d1CSL
	VG9nHWfoReYtZbVULPKEco3uLt
X-Received: by 2002:a17:90b:2f8f:b0:3b3:ba43:54c3 with SMTP id 98e67ed59e1d1-3b41c942998mr3916301a91.33.1795220796940;
        Fri, 20 Nov 2026 16:26:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:36 -0800 (PST)
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
Subject: [PATCH v3 07/22] ARM: dts: BCM5301X: phicomm-k3: add nvram node
Date: Fri, 20 Nov 2026 16:25:47 -0800
Message-ID: <20261121002603.25254-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162638_005848_42BF9329 
X-CRM114-Status: GOOD (  10.82  )
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

Add it and set the MAC address for gmac2, to avoid having to handle it in
userspace.

The nvram size was taken from a boot log posted online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index bb1bc4e61bc2..5b9250976f13 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -28,6 +28,15 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x100000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
 };
 
 &uart1 {
@@ -38,6 +47,11 @@ &usb3_phy {
 	status = "okay";
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1


