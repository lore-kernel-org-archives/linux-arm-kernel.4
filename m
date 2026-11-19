Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kEcJ1d0z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxhqQwx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=; b=kEcJ1d0zvxndps
	zZHetXvG6KT0tv9YfhyTM/zUUUbjqjfMAd1Bl/2X5JPmhGUHUtW/kym5Z9zIkb9gfwTPcRtUoFQAB
	YUlBW5I0SjbF7A9pkltYaq/E8K5E4r53rQriEkxtCMkmEH8puVTOPwf/DLLAUQCtI1MqQDZ/XvZeQ
	1aifOS11dmJNuyFhObZeV8mIo9/lWilxZXyafFaZ/nFuI4MNYn4S81+X/0uBRMldanfomgQ+h7LtG
	HLfEzxrdFuO3/mNEaek2H1+PE4pub2LCZEOJgDpdLmeYC+lfW+EoY1B3LY8dXNuTxjY/aLp4xDpOD
	ptTGbSZNb72ic1LmBvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxwE-0000000BGEI-0ZAC;
	Thu, 19 Nov 2026 08:56:14 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxva-0000000BFiw-2W3x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:36 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5366ae57896so18871201cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078533; x=1795683333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=gxhqQwx86jpXlQVzuYVaad88UbfbEsLAgwKhU7FG+jq2CVC5EB2RC09CP3iZWD3qLZ
         YfqgUCZm2fOwd0o7oAEoZRuqFJIatp9ejlLjxPIIl65Jy+UGuodYtjaPG6b9bgMfjyqg
         uc79Z18eCsypl8LlTGvoNTqfbLfxWjtxmMGCx0VYUqgNtwuNUCgB8jlIpNbPbG+ihrO3
         JgKoBvJtV6Eq4P0qWp779+/KuZhU3komogjuCMUqKXDvSaRNu2iF0BfqsZ4aDiHZ0OYq
         relarI7JPEknSyxpXxXWJVK9k8oyv69cE1c2+IGTSrueTwyb68JWKDj+tnLe3H/RgCWd
         ExgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078533; x=1795683333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=te2zejjXlF5WAYEWad9QGMzj+4sJSbaNR01cACOI3lXLb5H/JIuHqzW5Nu7pejQYJ9
         klQ9tkDDHB81BLD10x80KO0wLkWkc5zAQJDrwoqp8RgvKuSm1HNoC4MuMIyTBUs/Ct0C
         4Hx9zgZ7SeHNnwtrq/S4GiAy5KSrcwFS1TFcj6ehcAtF6xJFtUXVbJKarTrVUmSWM8j2
         4hJRTkRBdA6prbCS0uLBiWIxxhl7wHeXLWap2J8814bVeDtVRIFaxBDYb4+SEeFAoh4E
         d0vXFotzAwMa+FlEzppN2eBQeYoQdv0RHD7nRFFgMZKE194J4r9uRZyoy6D18s4xavCd
         sc4Q==
X-Forwarded-Encrypted: i=1; AL+hErH6S3LujUtZkl0wGANE487YvY3v94qtXrzsJ/PDNGT7HnZgUIZh2ycE/Ys2rKOBRnyepk1erew32owhpQmIqO33@lists.infradead.org
X-Gm-Message-State: APuU4Z/KAlwAJsH8ryEBPN3sLUHbXz/KCgh76b25g4HVONfXW8Hnj6tQ
	B9x8jmk+s7lSGjz502nnlLRXkba89n4xf15EiFFYSWUJqlsHVi6qsAPu
X-Gm-Gg: AYBFou09U9Lp0VLyxAvhk7MysKdLcRrtyWUvrBMxJFpoSF/IhCuMrV7Kvt1prAtb1dL
	mJtrrifrbsZ7CWH8x1T4Lnvd9yZ8dmZ8R0+fPYHJ5ruYDUyOeqNqs4fx+0L2Mxz8S6/MMnhKSRt
	qpY4CFpg+vPUcOmt3CVdp3k8AT78UKq2L6tQYCiinCAB4UWlLKqMYjAVpkFCQvKmHEOVPIohYv5
	CvS15iJKn5lea3CsGVzRLl+qmg9MZPdeOeLbRMs/96z/cjsPTZMrfO2d/BikPYn4ghSFIU7kxoa
	GKBd3ZnpjPOF937zfvoyBLI6xF8HTUPAoqogsgwxOmvhzqKrbAfepeUUI1lixLZy/RrMoKXZKDQ
	HjDqIngyaxqvCidmb77Z6OQG3ZvnrFxs5ckDy2tKlUoGfwgh1gtQ9/LxDGuUqJSL2A79JZbmpJm
	/4WKFfLWWzPMTDijFAtQg0fUZn4ziFABySPCmTQU5jkZlsptpiyTx2eC6xGBoqiwhG2iker2P02
	+T4Nedw/SMbXx0qi0OlRsQm6a8wc5JWvCipc2ronuOc888Vz/pmadcoBQxRvxawp1x24vIqSIWG
	HNo5NBOH7eBGtMvsEfI7DrQc0/NdnPtnJVWLwiM1zzQTNl/iUaI1iFjgMj9b/XrYVpdRSVD0y9V
	g+TE5Gk8CfccaaWQzEa8VSAgi2doCLe+Bzel3utALTr/y5pdxVzbwXK6+qxbDrXYEOmyC8GcpYa
	r/eKE=
X-Received: by 2002:ac8:5cc3:0:b0:536:98da:f790 with SMTP id d75a77b69052e-55d5a322240mr76503571cf.6.1795078533317;
        Thu, 19 Nov 2026 00:55:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:32 -0800 (PST)
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
Subject: [PATCH v2 11/22] ARM: dts: BCM5301X: EA6500 v2: add nvram node
Date: Thu, 19 Nov 2026 00:54:41 -0800
Message-ID: <20261119085452.75708-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005534_742813_FD8CED47 
X-CRM114-Status: GOOD (  12.66  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add it and assign its et0macaddr cell to gmac2, so the MAC address
doesn't have to be set from userspace.

The nvram partition layout is the same as on the EA6300 v1.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-linksys-ea6500-v2.dts     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index ad246f9a734a..d9e4f84058e3 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -23,6 +23,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -47,3 +56,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1


