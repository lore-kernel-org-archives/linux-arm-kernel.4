Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2F606A6B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQLcufS2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxG3xL7F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=; b=lQLcufS2Kxi0pb
	l5/6hENFvPTkyW4TUX1A5qQgEFxJvw76GdWXUMrCHagEwY+YCxP1EWMD/P7x0o/9h4AHT+QuLM+fV
	JLgP5hY5zMe+OsCcgocEHd4+wh2N3Y4TD8J5A9P7fTzG5uo8BZ3MKFGhJNy53lommbj3ySKKmkWp2
	tCRTL/+XWR7vn/T1sqTGU22LRhFm3cFHmOjfjIzb1TwPI3fE2+VyHJjt34LdM3Ysb3PuOaNyJArRa
	k+OUxpX+u3Puttvr0Wqa7mN+kNw2o6yZpFT9B50nBYBBjO7y3BSJ3BRiS9XiVaxPnexTPRH6glaUW
	VjWcfp0dbM0dSaJKDyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYx2-0000000GVP9-1ngM;
	Sat, 21 Nov 2026 00:27:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw8-0000000GV24-3FjG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so1303586b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220796; x=1795825596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=yxG3xL7F5g7PRQfh4piBFB8Brj36pndnmgUKSZrAaX50ONuc+wl/+3XkxIb/f2p/xS
         R871pfcIYZm8jsYfgAHl6y+NTiqLaVB9vnBPNgAK4TRLWGn+GcnM8Vt7+NcIbAmH9CVg
         GAp4p2rC6Vb77PgATX0pZ11JlQL2zOHOHvWuZZVxfhRCtVA6Nifz6pSk+jdDg8pDga9t
         pB8v3Qlp8y2ojX1DbP3Wa4TnuogTit7fMfUb/s/iXzMbDR0KUSVMzHZowd8muZq7SRzz
         d7mnzu/HyamswBlnOqqzlrItul21wyzgALue3ZmDfULBJfSdpJlq+i0gz/sPcIgzfTDt
         W0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220796; x=1795825596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=mp2Y5Hm+pS8ePIUHRLdssE5e8aAb4+ILUzZo355qB1iQA5S145eUOmhSxtO5pYFOET
         hJtjhGAozlL+zvQ0OSS6VApZBZHNDDvqCOI7t5RnYU9ojcyfqa3CKPGzlJeJY5fuh/7K
         7/W5v0jEWubm9Cxm3CQtaoP1USBr0eR2N3Fo5WeC/vN8nPL9orrO4PnQFPDTSh88I21z
         rAccK9e8FLoUALeTOFEHRhADe1ALPN9x4nIneTgHuKM9gGihO5cZdCK9QzyJaTuTlhbD
         e/KNdMSbQtI9+tu0MGHJ6FsPbeRDcAPJqZx4Lwybvx5y2rFT7l824SqMwL5ghT1r+MRG
         GzbA==
X-Forwarded-Encrypted: i=1; AL+hErH7htAfbdAPj4iFy3X1PDl5Nkwt3uz1FTSxgA2AkFLdgI++AONkGkme+u9k8AJZg1tPWytdPUuyHEfLQEKGwoas@lists.infradead.org
X-Gm-Message-State: APuU4Z+08jIugA3u6P5+WRv1qHrjikRkP8p7XBi6jQmXJKGVooiq8xpT
	joXhwYyitnVHWe+pKaI+eVLkLUgQRkHt/Rh24IKpoPeeBOR8ad+Sddv+
X-Gm-Gg: AYBFou1rFXOZdvPgGSPZG27Qopg8aqjrl2AavWX3RNMpFUix599QU7atGdL1i445Ipa
	U/t5tH5T0hc9vU4kFSYR+zqyVfqBC+pWyN14vvKaXeZoHNkk94LzWK6UqVGMZ5UfTaEOn9BiE7v
	EgMkdzkD/G9QIiwXL1NOFsphi4+FxJ5OI380OVlglrFHExHv0c1Pr2lIExgRd9OPQfuJ69pSFkT
	L3UpBkFszZvY2m+GLc0ZgWH2LxAcTkZG/AlNfKbWasWq9YVxLnpMLZWETukHZVn8FpJmZ5Kjv9+
	BShsO12Q6irHoZ1bJa2wJtWsa+2lcXEIN+ss3bLGh7WZqKUZcH8BDkrMbBhDjBn+KOLF8xywqST
	JNMISntek71cowEBLvd1OwKRPYuQeZS1gTIosiRUe8p3jaFuoduuQL+DPziT8bYiV9Fk/F3YGWd
	GTw0X/+nHssc7kx3hG70qAmwMTpg/0tjVPan/Pthqv0Ad/NDeRYvMB7NGnm0ydSa6N7AYnuv18c
	12F+FDo8YwgJVO74sHK/zJTbpjJhUDrxjfZ2bTyK3l3zHGI+T8Ih/vO+lOjF30hDcm9MTZKeua+
	vV38NHCz0rmUk8DfL4uj7cJEelSDlmn8mlBYbIKN1ko4hANSiBc4a7NPbaPItW178i7M5veGlH8
	/qRFv0QFkrG4vKfp1OcZS/05py5UVd5QdaC7L2uWkmaEK1wM5EoLo/Ha/mJ8bqmAMV+SNYlMda+
	97zM3brlmj8ttTIDGT+znPPFo=
X-Received: by 2002:a05:6a21:7e83:b0:3e2:b561:2b23 with SMTP id adf61e73a8af0-4014c250045mr2849998637.18.1795220795744;
        Fri, 20 Nov 2026 16:26:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:34 -0800 (PST)
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
Subject: [PATCH v3 06/22] ARM: dts: BCM5301X: EA6300: specify switch
Date: Fri, 20 Nov 2026 16:25:46 -0800
Message-ID: <20261121002603.25254-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162637_391999_63BAD896 
X-CRM114-Status: UNSURE (   9.86  )
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

bcm-ns.dtsi specifies a default layout that is not correct for the
EA6300. Also allows setting the WAN MAC address properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index f8dd08cc7cca..bca4c440a499 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -59,3 +59,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
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
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
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


