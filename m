Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE92606A6BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y959Ix3L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YP+k7J9k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=; b=y959Ix3L+qyLuC
	voxTmiJIhPp7K3Btoit0qA0+XKSUOk8LHs4eJJ2rB2uT2EqkaXqCcBtNAXD4FGD8JTXYvtvAR3mq9
	ee7xINMRLUod98aRhVzv2ngtl5pABDWROvFgTVksj+pxh5ELciB1B9gCEK+iSB5/h/vP4VTNjeGrc
	H6RcFYQI5exRLF+WgEEbC0ko9gfU2EkKqVOAgSP5gLTdExA2vMf9XT1b+HxXM4liT2V+Jpq9xFAUH
	rH17OEskU7K1oGRprZO50YQxFLWKkvz2n/2DR6KZ38O2B2L6+72aAw1F0222oBk6kn2tfU1ZFiV3k
	BxEP1cXKwT2xXGlgx0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxD-0000000GVZ0-3YoU;
	Sat, 21 Nov 2026 00:27:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwI-0000000GV99-2LYZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:48 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso699822b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220805; x=1795825605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=YP+k7J9kuHq3N0daxK0aM8VuLY+yucTfM7F3yku9dfeuOyZrykOFafdd0WK7j2wVVt
         hs0RBDTMZazbwdw9cyoQLFsRvfhXClPRKKwajVvOjPgUGRXhSprw2YmiQx1hvJXpaORo
         K1U/rYGZQVs2KrTYBrnKSGIONGQgTKh6sT6p0Lu1Jj1Bag0va0MBnWg92jJrbMXe/q7q
         ssz7EF2WyZFl2ErU6yeeILFUkGrOmcx5VHjkp6zffVuqm/b47Z5aNsU/fEkKv1eNR7Vu
         62uX+d4ILPHn8INDL659ojbixeMqgl1GyfTOe46lgR/wdBhhoyR53aWPHyu53Uc/faQO
         +mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220805; x=1795825605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=QAnkcN5L3T40IT8aPBJsdgEeeRD0rn9KHmyF8/HZiFzm4qsL1GG8qoZx0hwmiLqTFi
         /LmlzWTKR7wHmzUt36M8ONbnXmTMyEWwS5wNo5t2X83ppgas1bW6ykw7hYGDPfy42hvt
         FKEPe5Kk2FWCWfllgIQReUKCXwGLMUoYrmpbIeeJ3gdD+qVpTAphPKYj94E5RqKOTedw
         eMnuJefrRyDR7XP2Smk9B+ei/4jo5nAPpag2/FzzyRl1fC77uvoo9ZWh64GCO9ImG16h
         SGgCmEGFflyhn4hh5KcNpsWO08nXnNh0ykAMj0Pqf4jq7zZWvDTL/SXOTtD9lrLX1mbl
         xwzg==
X-Forwarded-Encrypted: i=1; AL+hErGti0jscAtQn8GDpz7+2iTRh67kRT1Ngb16DFn699c4Rt/kKyvTZxAIcxis6WG5Ioof3qJcRM8oYG0DXwN8rAqn@lists.infradead.org
X-Gm-Message-State: APuU4Z+96mQ8/5jAV0eEFuCa8nZILlSXykbyPuqJZq8KA3LcAEIiAy0C
	uuXFsfhS4bnJWGnLTfrFv15rLTrsZ3ijjthBJH0XWk6Iz9DAcOu4iLu2
X-Gm-Gg: AYBFou3DxtNyjP8kkZS0tRHst1YrgnUqyxjTFhvvhLCgNaBfIwfgds4g6iaLGrtjFvv
	wNzawybg+DJaC08thANxOxuNjP9BzfX4gXenL9Qcbfz5V4CxIwIO3u7PHIGfGH8Yme1l3PsYq2+
	ExXYvKqqhiB0AeuxQWCrLlma/7tzL3IIFPHStumzP8mSnNLZMCQjsAjufIBg0Na8GutB3baIaGF
	M6Di2xQdtjj4H/kcxTYCuXAe3plsVTS4a5dcaMrNwRQzqKvxSUofo/07clf411LbRhK3UeETrk2
	Zqo2SMQ7QHcGqb2O2AklfsuqEUmg+baDVTngP4lVtiWX2BZ9usgMhNuNHygbWdP3dltzKzEra3F
	YGp+IdHg3K/zZ1KoW2WR6movnPID+AFjQpBR/w80gkI6UyAvT4jDJvUsOKo8YGgjX0aZevJHUOh
	7ZWWvKyImGVUq77L/m9uNinmtpMXP87DMSsmc6aS/jaut9s37mrqNBrEO5NJRXs2x9TTw3MTNE2
	0EqVDJ3mc7JXZJqYlU/j4w7HZAo5kdzirLPa7OmY5+sLGmrEgR5QAPnHf1C2P/0r0JYnFtO/Z3i
	M0pGfIfp4HwxodmUz+4gxV9m9aylWHJU5Tmc33r/b08XCCaE8IHw2FMA+I5c7vnlT0quFaDde74
	hB1JPENJKR0nrh+0bIhWW8k8+KdaGqgZDZnyiN9BxOj4WhbZYptDbnrmT8fYlL/o24EBtr3XE4h
	SOlA==
X-Received: by 2002:a05:6a21:139a:b0:3fe:81b:5194 with SMTP id adf61e73a8af0-4014e45f92cmr4701665637.62.1795220805565;
        Fri, 20 Nov 2026 16:26:45 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:44 -0800 (PST)
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
Subject: [PATCH v3 13/22] ARM: dts: BCM5301X: R8500: add nvram node
Date: Fri, 20 Nov 2026 16:25:53 -0800
Message-ID: <20261121002603.25254-14-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162647_283679_4737ED36 
X-CRM114-Status: GOOD (  12.17  )
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

Add it and assign its et2macaddr cell to gmac2, so the MAC address
doesn't have to be set from userspace.

The nvram partition follows the 512 KiB boot partition and is 1.5 MiB,
as on the other Netgear Northstar boards.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-netgear-r8500.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index 76d562610654..d312afdb750f 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -22,6 +22,15 @@ memory@0 {
 		      <0x88000000 0x18000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -94,3 +103,8 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et2macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1


