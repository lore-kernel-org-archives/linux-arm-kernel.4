Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202D5606A6BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ycbyi0m6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e0UJuwBe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=; b=Ycbyi0m6sP4MKe
	d9uLU+IVnLduEm1JvOHMyR9kaPAEU/sxF7N9uk266CUMJY55lYjbaubVpAYeKzSLGuxxLB8HY/hYl
	91L+HFlplJXjm3r1PBL9Vf3b94V9kwdU4zDXs0O4phLbVJY+IBNkatTafxU2+MAvljEp6LOnzADGP
	fQIGq3M02xfwLXgShUUEN3LLlbL/hhwf7U0+7st/IsVeN+ksMkXH/D4txeb17VzRwbSj8Sjznjxp1
	rOS6nABdwnUxiUAAQkepgD1NxzhlpN/5q9QlWUmhkgiPlSHH8K2uTcL1FiLFzV0Yhb+BYr/RdLFVo
	eEr1+oxIviw6Qv2wGk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYx5-0000000GVRB-3LHT;
	Sat, 21 Nov 2026 00:27:37 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwB-0000000GV3y-0Kno
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:40 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8b271e573adso704411b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220798; x=1795825598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=e0UJuwBe1BfN6VnSIeo0HYj/Rmu3+SU4hyTOkkv5VdNQ0vlac5qinuqGOQeeHbFJhm
         pl+BkdeDxyZ5ApK4btMMi9lZHbs1nfqkKq9AEjqc9KpvXSVu5Js3Wpxl/Rw45jbPFzhC
         RomwtmKGNtWyVlqjDhKvedhuvGO0Ok62JJlGmlgwCdOsXA+q+QGUz8xfRxM58Mkd3wha
         OuMFRnz7tSeu4ZbCB7ecJWSYFVBZOfckAzLfVOASDRcPUfCHl9/UaHQCC8yxrW9reIgQ
         rJZccr6YSVbKr2BVEOBDn2fN+5lvKPdCVlDh+YBQd7+nZgAtaXLP8zoUFQhlTCexXcHV
         +OOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220798; x=1795825598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=vu+dDQ2xDsuW2lNfWwjjDZ1FtIbAzLutsCBFcWY8FKVsCk2QHfthtrfZ57aiH+0oSB
         kk0EvGrfTRQA5DEoGCsb5UYjv7PtGUbPVrUUtSgl/3e+dPW4H9AHg1YDl+j4BthQJGti
         jjzDZMT1kp5Q4ylOeADzXXtc505vHCYbYLhcANqh2XXEoTR7s9PK3OmPQhZHZJeXHlOh
         ySqT4Jdt8snZI1EUQkiJERAHqv5lhZti+bF42FVy8ZLXbnPROshlogONyTTEPbdioehp
         LqPfy6090Y8xq931ucqoAlstpUhOxzU5L3TmvQWA1NZrgXxSf0BvtgnNzXGYKAO3NQjM
         2aWQ==
X-Forwarded-Encrypted: i=1; AL+hErGvnX/VLA0DSabvIPfMs8NvbKSJO+UReCdYCVSOi3DVj4fN7uY2l271g87CSK98ZRuTZWZc+Pc3dENuaKvWC26c@lists.infradead.org
X-Gm-Message-State: APuU4Z8CPb2Nhw9z5Xmhm9bY+n6bHjYEr7PujFep6CauEPW5RHJdLssK
	KxcIKxYLZUTeZS2a64eaAF7ejMpLrY6DZuf54QWwNCzcQ29vBH1MwKlr
X-Gm-Gg: AYBFou01PnZxxMXbv+isBXlwT2epNeeQuhR2r7LoGrEcDppeWeLYVwjVJXrxmM1QWeC
	GBqg/wleD5s2jAZmcNFz2DNEPAQO3Zg5UY4EWwykr+o+hF4Y459AwiGJ7WNyJA6XvqLmw2FtVid
	Q7PfGSnOT4/D4XCZRRfX/6tB7zRv6SQWnXdJ9YnsJDi5iWCOJS/xHQKnJk0nD7P195ItlgM3B+t
	oX7wGTTaDB4haAMvC6/PEGMq59EjLlURtjuSyKDbuf17eLjZFONRNPznkPVJEeqli3S7XVfS/fu
	SHaiHEAh38cKDOLVW5C9c83afRjE7eTzubihLOZvGWziEwjHCE1MVtKtFph5QT8dTYI5bxnWMov
	phP94+1BmDcuBYaUE8q5FD0AwZahzlIXSetfvxGr1XkZSW5D2YsDdqWS5k8UCMT1oJKTBM1ghZd
	P0GI4RP1HMxW7bjDFj0j/OPCbKhdf6RHqikV0MuhHIxMKf7fmpkZ1wVBLFW93NxUCZ7MhYqOQmR
	e3RQI7PKWreEEQj0f/+I/aEkJe1G1iHfVZvEHvOyevN6I5u7WENrWXNEMwWEwt6/HPfmcuCGnL6
	GzloEYnxOH1euh60WDPdRHqBHw/iN8EycmgwEeeIripSmFXUogFCEsMMXhtPiUBKMI04C3cjZx0
	talCjrEI4qDtE81wImUQBakbhbTuRdMCFTCi9OW8uvc3DddXDBnKsF0TA/SIvmUn7TvQcH+HZSU
	cj4Q==
X-Received: by 2002:a05:6a20:748f:b0:3e2:1218:3ea8 with SMTP id adf61e73a8af0-4014b564283mr5703588637.14.1795220798428;
        Fri, 20 Nov 2026 16:26:38 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:37 -0800 (PST)
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
Subject: [PATCH v3 08/22] ARM: dts: BCM5301X: phicomm-k3: specify switch
Date: Fri, 20 Nov 2026 16:25:48 -0800
Message-ID: <20261121002603.25254-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162639_180833_1D23CB5D 
X-CRM114-Status: GOOD (  10.62  )
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

bcm-ns.dtsi specifies a default layout that is not correct for the
K3, which has three LAN ports and a WAN port on switch ports 0-3. Port 4
is unused, so disable it. Also allows setting the WAN MAC address
properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 5b9250976f13..018faf90fd4d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -52,6 +52,43 @@ &gmac2 {
 	nvmem-cell-names = "mac-address";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@4 {
+			status = "disabled";
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
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1


