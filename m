Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C1606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x/SZ8eWQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btohXJpO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=; b=x/SZ8eWQeUDYIB
	aiC/l1xOXHUvykWQYwrApHT56mkZfl7UnCPsoP+DvyUKqja1B8y1OaRBCvNFtOY5t8uQIWammuKHx
	vQUeiY02vqg/x+BTemuTq5G76czgL7ooDwrloe2blfWkEoGy8AMQLLmzpA3QPqZcONuVhiuKlMTkh
	h+DSnNeDCOMMPtaT/sTkA8mkdrJNDHfsZfwNbOElFjcPoW7QRM27TPXrQDqiqWkahrgovepACIJQU
	jAywaRL0LkjlmYJQrVnqkszi9FNm6dsYLjaTY1LnVxZvrecLpXjIdT3PvAMcvAjM2Ryh3bGhnxfCd
	9kyVFfVznjYiS+GUf4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxA-0000000GVV9-3Jsl;
	Sat, 21 Nov 2026 00:27:40 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwF-0000000GV7a-1x5u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:45 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso1552347b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220803; x=1795825603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=btohXJpOLdYzTBSMTA1biinzdcT4ufiAZYo/6LBqo/rie7jJMynYGzRS9nS1kwNf6R
         3mI/8d4EUDfpJzb3IhcQzsL/ikxNBhG0kRrQjq+WjhOQrCXsFzCDNobntotUhWTAWLBy
         Jmk5+jkDaR2xYYoktBFx9ovOqhv4+KsgQXXmAlY1MXRA329YfFUE7HYDjZ17Ckr3qRAQ
         lcsxAvnrww8GYIPAKHCb7TJgtw+u03TJrYp3hDkZRYOUzN1GUD0IjQ4EIyaxbJ9ZLXSR
         HQEpWnbYlGFn0CDABsA47Wgs6hq4YXoWfe8Hc3O7T+HbWtkOx4+4gY+w12DBpzoaAEJ6
         s2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220803; x=1795825603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/DLXSE08P9OEQzjsjQB6jV4KZGi8nzSYK1vqQ9fOcs=;
        b=NRKDUt6hZOnZZm66dcIJDyH94SogXkam0w6lIeDHdwuXf5yMf9j12+Q7HQd7vSfBda
         azPYZiC2hLztOXj+Q87IxNBeOe8ndu26epRexVMYdWfXvdhTAtbqa6mfN/kJcb3wZqoJ
         Vmnd1a3EEp35twIL3ylt88XycAh6UehGlNRyX/cUeYZUmo+5EuLXTuz5y9gf0o8ACWAd
         2BCWOMgMgkMfzLLxcbYxYhDZqweSIJtcW4OM2H+XmrBIak7IoWL/FGzVBoYzi9zRc8FT
         9B0I9kJWnPHLsk0/3U04FGxSQ35cexqpEnhVsa5AMlO3r1FpEd6jPJvX8M6NIWSPMwJt
         j8OA==
X-Forwarded-Encrypted: i=1; AL+hErE4ZzjsazoIlgVzTsQaRtW4nFTAiiiahytL27R9dcfkqrLRnR5udO7zGWZ59S/jxpHUPsiYXjJtpuznhq86Y4pv@lists.infradead.org
X-Gm-Message-State: APuU4Z/GjY/N9cvNUv1NuWhqf7Hhw3fYnuy+KeX4mTBmeNlitPll3ciU
	IHJ9wN2FN9QecGydl99iJKcpRn2/ppAR+7fFRNrCnZ2R9GvRS53MRt3Fgj9V5g==
X-Gm-Gg: AYBFou1JTOg5kg0WOQPZQiK5sSVM9BwixrMZ0MSzPsLtF6jSQvdkG+/5KtJJnhXevOP
	v3iiN0AkzL6IOR8G2CAGL1dMFQOFWDI4UBLocN2/WtCr4fMDlRF/HDVaAOwZ1uuCKcz/xS1nnvt
	1tkpqRMFQEXaThBXJ85lWIFAXVjLL8+/4AGvCCV2xNWr0PppL2JxX2yc30f/hn0bV/DWBvvLMW8
	aEtAqpKNUHkfJ+GOkWj+aVYeWJoW0So+0+AO7AsUbeadRusFf4A2oGBuxDkqhPBbq/oVWpD39+r
	460G3tD2wLiC8EIUtezVxsuby7EASNYyxYF/xm8EjpYqLXhP0gXyXyQdnAP+o9U2V2CHvCPEIgO
	AaZPQTwOUzzSS8lFjnRLHP4xX2TnVsjBzMK/1h2snDA49k9kDovPpaN8cKwJS8uhbrvJjfg43ty
	e0oXdUc0g/jJvmlp9mUYPzDeSPQcMYEZxoq0a88bDO41LyR0ja6L08UHTWKNzhmgI2ZRd9gsVYP
	lrJITORoFhL7787CXQkS7E+2BD33y5gEKn8zy0mINrCEV98Q4kclEDRDIH2kCzeqGi6ktj1qoLj
	B4Ge7lBXBzomleEm+RQT/CSojbi/D95UDjoPYUFEL69/m72bllcudNs9eVWQIH8o3OK0dS5B2um
	5zHQZtFTGlJv5OaefJBxrxxbKBXvCr4ZIX05KA8Q1sxKGPO/Kbx5I869D2aL8OeExe8fPTZDBDv
	Iu5w==
X-Received: by 2002:a05:6a20:258d:b0:3e2:26a2:794 with SMTP id adf61e73a8af0-400ae7231c7mr4940330637.38.1795220802790;
        Fri, 20 Nov 2026 16:26:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:42 -0800 (PST)
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
Subject: [PATCH v3 11/22] ARM: dts: BCM5301X: EA6500 v2: add nvram node
Date: Fri, 20 Nov 2026 16:25:51 -0800
Message-ID: <20261121002603.25254-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162643_625317_66D2DBBD 
X-CRM114-Status: GOOD (  12.09  )
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


