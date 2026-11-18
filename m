Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bat5yg8T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A49Jm2Hl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=itizEFZHPqDe4O4Tsh3exl0JqFZDxgPeZbu/03W+KX4=; b=bat5yg8TpmU7w8
	BQYZk5shmCh/wcGNyM5H/kif9/OCCeCdTg5F1xKBUrncv3Ry/VqLyoKQlxBkYPB6lnQJTpmmFyQCA
	xn5f5uu5RBz+u32r61ShmnyrMgtsbBVaBEoJvZe2unpeMDyV6qo6AqTuswa1EKgQE+KEM+ABayPwY
	Xu/K/d+kWEFaYz6aRC+yoyFVqAlL7UCfs4Le6EYwxcA/IU37UnjCkvkhpGzc9+xFtMJipCyae/PtP
	6U760TohKk9g6C0l3PXxfhqFzldkKXCOshyd+QX4KO61PGeBfk6tMXvGwM2c1QGZtYL8HttCOmg6G
	vhz8+1eYz2nQQ5qPzwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXZ-00000007m95-07DA;
	Wed, 18 Nov 2026 05:49:05 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXB-00000007los-1JhB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:42 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-380b40319bdso1048270eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980921; x=1795585721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itizEFZHPqDe4O4Tsh3exl0JqFZDxgPeZbu/03W+KX4=;
        b=A49Jm2HlNAqYcOe4lvAKRAleWQdJaJ+zDN1FmCMS1DN4Zn+opsrtxyaMh7Mbx1ofFZ
         ZciIgjvlZEARh/HTwc3r6b/Jlqzza96XhWsQO9Gr/lbLOzq/jQ/7gr3OSlt7hw5y7Lgk
         Bb0MI+IZ07WqfVeBdzFeCxcgbEJolM0HM5DztnrOoVoGayN02xPDJvZxMmgVvq4iWMBr
         WapXCBmlP9TyrhRcg2siDKQooQQBwwGEsUAe3QygeWrnbT8/RZMdHAaBGz8qvHWtul+y
         EnAtTA8KuFDkrcL1w9iQ4c+tugRB62wvxyyph6lNW7/q08P54l2698gBYk6eBgUv3s/y
         Lr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980921; x=1795585721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itizEFZHPqDe4O4Tsh3exl0JqFZDxgPeZbu/03W+KX4=;
        b=Rh8wB0a9jP+Jj4iEskeS+axn0VaKH50TL6wlTY0/v/SfNEuBqRFrPFe7LG8b6sNgua
         2T4pax5YEKmv8M42PQrMIqIoKT/OfFCAjh7EgskvF4lyLi2phU8FwabFMMBOZXSYiAAL
         KOawuoQ1tfrF+CZpt75vafnEUrQid87cIEcJ+6mzgsH63+Hhkd9uLQyLxaskWejnO0I+
         GhhUoA0leaHqEl1SivQCqBFzCU7kMxnfVBN4ouXTobCjeJwkkPmg+rbRwAFOY4/Ndoq8
         SjrKdxjGadsc0ogxKk8HmMTCAh8lShMxmjjn2UUpj3Vs8uzkpoSlPf0kd28MXh9BxB8+
         wpLA==
X-Forwarded-Encrypted: i=1; AL+hErHd4oeFEA/c2DI3rKzaOqkm8EhW5+c94HnSZjBAJ3Cn7BqO1bwHaYfH8ZLHqNDMx5YON+mFx3RYqGel/Vo7GeNi@lists.infradead.org
X-Gm-Message-State: APuU4Z9iD6aHkLcQ7mdpsYf4xfRiN1KZwj1vhpli46lc3Kv/m4eMwxoh
	nBI75zC+CvLzXy8TLTZoi/22OhkaxiXXjZsIvasNvbNbZUqmpJvQHQz0
X-Gm-Gg: AZFdTZfK9h8ZdKqLptUU+TJhv7qoYHzoxAxw0cr6c5+ufcsaxNLQ45lHWE51GXZRYwD
	eBRvd4cguj5t7T2h5Xl4YKlr5N83RWtLLSyyhbPDYPMSXq8AavngTJWMnjFXe6iOS/X+z3k6EpW
	BZ/Vl9d1lTfsizxobPR0PDlBjY71Mzo23GHOJE8Aw3iTzsW6adcSL+QaQE95ck6sufdlLRN3zF7
	gj3Q191JSePtEAERSl09s4Fy70gO3KmgbIXlOJJnslqI/1u3vg1GLLMN6VZN4OPvNa95sO3qzl7
	rgEywfokfPmoS9PEkAUPcqU7iSpg9D8YMIgkjVqyKndzso6OAIrZH1WFDnnpZHuFkDl5w7jXnK2
	qE8kxbfWSbEPYTfoooZK/1KIt7FhoJg2VGw3u+93d8gfhv8w+WytgVxtyNP4g+pE+qDDE7pDh+B
	Bu6MQu/vrm8n5STvnvGAODeSIIPbsaIIb+eqIgANGd60Uwa+n1C1zMYDdogJh+G8rBR8QgJtF/G
	db2p0SsxSxcK0xC9vxZ0cl+YbBQi/Oc6Cnm8YJh+hPwxywSfEGGKe9/RyeDeDQj7SXJqJzaRyP8
	7kjxFnPnMxiR3Wu/mUw+i2ywpX3VXvYM4JIjI/ao7YmZ9geM/p6bpPVA74s+GKd0j9vf7amvZiZ
	lgMwuJjqoeTPHpRv0vzDaQsN4HqhSopa+CvVklXPpv/A1DOg5UHDUxxUJIJt3tuLIQj41w/aiX8
	Sz3Q==
X-Received: by 2002:a05:693c:42d0:b0:381:c15:1b6f with SMTP id 5a478bee46e88-3827f98c04fmr1627449eec.6.1794980920497;
        Tue, 17 Nov 2026 21:48:40 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:39 -0800 (PST)
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
Subject: [PATCH 17/17] ARM: dts: BCM5301X: enable GMACs in boards that use them
Date: Tue, 17 Nov 2026 21:47:58 -0800
Message-ID: <20261118054758.132233-18-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214841_397159_B5B3A11A 
X-CRM114-Status: GOOD (  12.98  )
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

bcm-ns.dtsi enables all four GMACs, so every board probes and registers
network interfaces for GMACs that are not connected to anything.

Disable them by default and enable them per board:

- Boards with a switch node enable the GMACs connected to the switch's
  enabled CPU ports (port 5: gmac0, port 7: gmac1, port 8: gmac2).
- Boards without a switch node enable gmac2, which is present on all
  Northstar SoCs and connects to the switch's IMP port.

gmac3 has no fixed-link and no board describes what it connects to, so
it stays disabled everywhere.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi               |  8 ++++++++
 arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts |  2 ++
 .../dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts     | 12 ++++++++++++
 .../broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi |  4 ++++
 .../dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts     |  4 ++++
 .../boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts  |  2 ++
 .../boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts  |  4 ++++
 .../arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts |  2 ++
 .../arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts |  4 ++++
 .../boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts   |  4 ++++
 .../boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts    |  2 ++
 arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts |  2 ++
 .../dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts    |  4 ++++
 .../dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts     |  4 ++++
 .../boot/dts/broadcom/bcm47081-luxul-xap-1410.dts    |  2 ++
 .../boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts    |  2 ++
 .../dts/broadcom/bcm47081-tplink-archer-c5-v2.dts    |  4 ++++
 .../arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts |  6 ++++++
 arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts |  2 ++
 .../dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts     |  4 ++++
 .../arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts |  2 ++
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts |  4 ++++
 .../dts/broadcom/bcm4709-tplink-archer-c9-v1.dts     |  4 ++++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts    |  6 ++++++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts    |  6 ++++++
 .../arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts |  8 ++++----
 .../boot/dts/broadcom/bcm47094-dlink-dir-885l.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-dlink-dir-890l.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-linksys-panamera.dts  |  4 ++++
 .../boot/dts/broadcom/bcm47094-luxul-abr-4500.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts    |  2 ++
 .../boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts |  2 ++
 .../arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts |  4 ++++
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts   |  2 ++
 arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts  | 10 ----------
 .../boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts  |  4 ++++
 arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts  | 12 ++----------
 arch/arm/boot/dts/broadcom/bcm94708.dts              |  4 ++++
 arch/arm/boot/dts/broadcom/bcm94709.dts              |  4 ++++
 arch/arm/boot/dts/broadcom/bcm953012er.dts           |  4 ++++
 arch/arm/boot/dts/broadcom/bcm953012hr.dts           | 12 ++++++++++++
 arch/arm/boot/dts/broadcom/bcm953012k.dts            |  4 ++++
 48 files changed, 170 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index 707c8693b282..850b74a0fe6a 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -335,6 +335,8 @@ gmac0: ethernet@24000 {
 			reg = <0x24000 0x800>;
 			phy-mode = "internal";
 
+			status = "disabled";
+
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -345,6 +347,8 @@ gmac1: ethernet@25000 {
 			reg = <0x25000 0x800>;
 			phy-mode = "internal";
 
+			status = "disabled";
+
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -355,6 +359,8 @@ gmac2: ethernet@26000 {
 			reg = <0x26000 0x800>;
 			phy-mode = "internal";
 
+			status = "disabled";
+
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -363,6 +369,8 @@ fixed-link {
 
 		gmac3: ethernet@27000 {
 			reg = <0x27000 0x800>;
+
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 574fc4f76e75..433e3719cab6 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -103,6 +103,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 0f369c5d6a5c..9b741a402de5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -94,6 +94,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
index f5c95c9a712e..62b028c0fb1e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -136,3 +136,15 @@ &usb3 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 2f1d49733f09..6347ff72a334 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -191,3 +191,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 95ef6ca7210b..99f1c8ebf3ae 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -149,3 +149,7 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index bca4c440a499..5d5f6bb4fdda 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -56,6 +56,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index ad246f9a734a..eab136192704 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -47,3 +47,7 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 3375b234fc9b..4c3feb950d5e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -62,6 +62,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 26ac2f2ed5a3..9f884f11f8fb 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -69,6 +69,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index f5c135f2ad71..813a97555464 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -132,3 +132,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 55f0d9e90d5f..cd60068790eb 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -90,3 +90,7 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
index 60661dde8ca5..23d39c9e07d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-smartrg-sr400ac.dts
@@ -129,6 +129,8 @@ &spi_nor {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 4ae4e2d00b7c..059c32126427 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -88,6 +88,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
index 47670b9bfb79..c63d1b1ccf5d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
@@ -155,3 +155,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
index 7655e4ff2d1c..4493e2472bf4 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
@@ -107,3 +107,7 @@ button-restart {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 2b152115d03e..7eda4acc11b3 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -62,6 +62,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index b5664216dcef..64f56a320099 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -111,6 +111,8 @@ &usb2 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index b6a5886698b2..03bb7576c0bb 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -111,3 +111,7 @@ partition-file-system {
 &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
index 3da2daee0c84..1b285996e422 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
@@ -76,16 +76,22 @@ led-wps {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 2>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 4114c6eda1ac..101123158e8b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -72,6 +72,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index b7cd2faa30ce..b8e6d3c2b7ca 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -130,3 +130,7 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 37593e7582ba..df926ee77a1c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -163,6 +163,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 65affe615bb8..dcedd0129e2f 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -115,6 +115,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index a4b135d37659..3d48b2a6d160 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -248,3 +248,7 @@ port@8 {
 		};
 	};
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index 5a8b2b1567e6..48a10bb7df07 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -120,3 +120,7 @@ partition-file-system {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts
index 1655ac95769c..e6dfda3e00ab 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts
@@ -19,16 +19,22 @@ et0macaddr: et0macaddr {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 2>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
index 8bf623c67de0..79b089f1dd26 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
@@ -82,16 +82,22 @@ led-wps {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 2>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts
index a197f447fd97..a4c8928646d1 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts
@@ -93,16 +93,16 @@ fixed-link {
 	};
 };
 
-&gmac0 {
-	status = "disabled";
-};
-
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr 1>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index b64ba9afa736..7137bf2452a7 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -122,6 +122,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 944d592dee2c..9029257fe1f2 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -120,6 +120,8 @@ et0macaddr: et0macaddr {
 };
 
 &gmac2 {
+	status = "okay";
+
 	/*
 	 * The NVRAM curiously does not contain a MAC address
 	 * for et2 so since that is the only ethernet interface
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index bdbd0f097925..1fc92eaf74ea 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -307,3 +307,7 @@ partition@5200000 {
 		};
 	};
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index 00aa28a2e70e..393a3994c3f3 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -66,6 +66,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 04420ebf056a..ff05766d5171 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -60,6 +60,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index 765b74919fcd..947424406bf2 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -66,6 +66,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index eb4bdf8c9c7e..59b6b03d9683 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -56,6 +56,8 @@ &uart1 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index d5436d70ecbf..f7f6d045b5f3 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -106,6 +106,8 @@ &usb3 {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 64d3634d130c..c83c063270e6 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -77,6 +77,8 @@ button-restart {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index 76d562610654..d87e9f7d8acf 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -94,3 +94,7 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 018faf90fd4d..72138fced325 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -48,6 +48,8 @@ &usb3_phy {
 };
 
 &gmac2 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 890945a5690b..fba1074b7c9e 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -57,22 +57,12 @@ &uart1 {
 	status = "disabled";
 };
 
-&gmac0 {
-	status = "disabled";
-};
-
-&gmac1 {
-	status = "disabled";
-};
 &gmac2 {
 	status = "okay";
 
 	nvmem-cells = <&macaddr_board_config_66>;
 	nvmem-cell-names = "mac-address";
 };
-&gmac3 {
-	status = "disabled";
-};
 
 &nandcs {
 	partitions {
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts b/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
index c1f54391746f..9f14d78f66f6 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-dlink-dwl-8610ap.dts
@@ -80,11 +80,15 @@ et1macaddr: et1macaddr {
 };
 
 &gmac0 {
+	status = "okay";
+
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
 
 &gmac1 {
+	status = "okay";
+
 	nvmem-cells = <&et1macaddr>;
 	nvmem-cell-names = "mac-address";
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index d6dc448b2849..8c1d94a5b546 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -103,20 +103,12 @@ &uart2 {
 	 */
 };
 
-&gmac0 {
-	status = "disabled";
-};
-
-&gmac1 {
-	status = "disabled";
-};
 &gmac2 {
+	status = "okay";
+
 	nvmem-cell-names = "mac-address";
 	nvmem-cells = <&mac_address>;
 };
-&gmac3 {
-	status = "disabled";
-};
 
 &pwm {
 	status = "okay";
diff --git a/arch/arm/boot/dts/broadcom/bcm94708.dts b/arch/arm/boot/dts/broadcom/bcm94708.dts
index d9eb2040b963..7c8a6c286086 100644
--- a/arch/arm/boot/dts/broadcom/bcm94708.dts
+++ b/arch/arm/boot/dts/broadcom/bcm94708.dts
@@ -47,3 +47,7 @@ memory@0 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm94709.dts b/arch/arm/boot/dts/broadcom/bcm94709.dts
index 618c812eef73..b4fbf178b363 100644
--- a/arch/arm/boot/dts/broadcom/bcm94709.dts
+++ b/arch/arm/boot/dts/broadcom/bcm94709.dts
@@ -47,3 +47,7 @@ memory@0 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm953012er.dts b/arch/arm/boot/dts/broadcom/bcm953012er.dts
index 96b93b65536b..ce2df9efe1ef 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012er.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012er.dts
@@ -65,6 +65,10 @@ &spi_nor {
 	status = "okay";
 };
 
+&gmac2 {
+	status = "okay";
+};
+
 &srab {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/broadcom/bcm953012hr.dts b/arch/arm/boot/dts/broadcom/bcm953012hr.dts
index b728cd54715e..23e54d77ad38 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012hr.dts
@@ -51,6 +51,18 @@ memory@80000000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+};
+
 &nandcs {
 	partition@0 {
 		label = "nboot";
diff --git a/arch/arm/boot/dts/broadcom/bcm953012k.dts b/arch/arm/boot/dts/broadcom/bcm953012k.dts
index 27c0992f1855..400f985569d6 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012k.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012k.dts
@@ -117,3 +117,7 @@ &uart1 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	status = "okay";
+};
-- 
2.56.1


