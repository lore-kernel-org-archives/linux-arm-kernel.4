Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rbm/pzey;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zITUS1ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=; b=Rbm/pzeyZWpaUX
	JdUFbhaiqiLCVpq+v5c/bQrmZV6edHMrBneBrO8bcbOBtxcNpIziePF8Ym0+F4vVAyivVMqOPcD1Y
	oGNtN8RVxTtdpkUElUWVfPzH2j8PsZ0mCsp6fJB+v5iH9y/Y5onUX9gp3RVUSVdWhCGTejrovcBSw
	OcycrlokC6XSYaDaVJaChJXSJ8OfTiwz9VtowJSHNyX0pfWr00pwohckr4oR/x8rPz7s8HIbXiZuk
	9XJG3huaGO5IAAxWx/HIeYTXtzVJxbZRJOsKBsB7xvNOj4wpALrASVw9N68rQ03JyeDOkR950ESAP
	xiC/8vDbPLtTAq4ejg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxx9-0000000BGtl-1i13;
	Thu, 19 Nov 2026 08:57:11 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvt-0000000BFzi-0zN7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:57 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5363316fa0cso27540251cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078552; x=1795683352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=zITUS1ngTp4izYxqbigZCF++MclxgThAUtJZCxzijIJwlu4MfLNzTJ3xKCB/Ck3Sh5
         YbBYAbbXA4lxzCLvNTm9vNMse41euF91WhKY8pszEvfIQbSpvvgTleKDTPnzYSyY4qlU
         DdJvlOxKkDmL7T/suIYY09RQlQ48+ptrN+I8gSsrYxWJXSXIGwpTDH4murgflFM21klm
         5vitCyRss2lovmRaI4bT+UyNBmmHzPXdBHLEOgIcZGDY9KYQ9qFpeXFS7DiBIMSEttkm
         a/YZ5XOHmMOtqWVhW0W5XitB1WUtX0tBlWAlNfcwpAhgXPOCfa5HL/NR98+n4e+4Pjcl
         qMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078552; x=1795683352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=lq5JLBn7IJNV9Y01BdV9xBj29YoL+zuqXovSPLG5ptjZzRwnVEaBQR94GsP492OsU5
         uqgI3zRhTp7zWUvSxPnYavHmVArz1cpOkQD+NUX2dvoUK51K1hoYKCF+EdHcsBPbt3xH
         Fuiy2/b895S1ORrCGyoxzOO2JnOt0T2AIOVtugebMrsRZv9dV8o/ZOcYsSzv/mzHx+VZ
         E677ejTG9scEYeYbgQsCNlkx6U0OvVq3rm8LXt99JCfgKNTeB/A14XQioevg198lqv6i
         dOzKiLccGMsBlsIM6e8XpWU7JRHytxMUK7E/sGie4XwHsi8ySWLauN+2vxCN0tASLml7
         Rvfw==
X-Forwarded-Encrypted: i=1; AL+hErHkI5gNHMMbTQFZlWdXi+RiNLhv1lb1C3WwSxoWMjwIsC/YFVMJjVYSnJiA+Q9VLyACvI+gy3gASi96nerqfATP@lists.infradead.org
X-Gm-Message-State: APuU4Z8C09kTDeL0FohUunco7x0DaEy9N9KVWxtIAculjvgqZmfNq6Pt
	Iahpu9rCwax+PsQGg1D2NpAoitszrgbDxbeUrOSQNfy4oy048xZwd7vG
X-Gm-Gg: AYBFou3tbvtvxkafTLdPNkE13blMKjmqbKxKVfri7kymXV3sxbS3u8KKlyCQxYeU6BC
	AMoRm4bo9SMm9S/c3IMHIe1Yk7K2EVHwyeG49HEf0OhhX1k7pMe3bvNtUaw1AYX7Ifln69dVAyt
	UuuXsUtGN/FOkdpQTk+LDkzp/6JZOk9wm5b/EnHN4ZsvY2+jJTs7Do8mgJFIwmU457FhEeZ8H14
	vb0wabp/y2QO1RHXn62YJPrvk9gWbuh1RiNXBuBoJ57+7dwvHSYJG4LSdNcWOWod5fcydJtIMW7
	6h3k7zZXujIsBiccr82eafLojhnEBPrcKJ///y8fF/ls9OsNvx7FybwLDgBTtoKiwTEtrgzYAmJ
	+N1JoHUnJaDhOJUo9UKlprCOda+1a6i+ZWmGYezVqUxPJAcpswWce0MGiEsNxs9LZcc6T8GhP0c
	Yp4F5HfSWyTy7w8VsJApVYiIzF5cjn+F+v6vPbHhSXKal/9NNxNn1f2+HcLWAQjZqGq8FcTutZn
	gU0xTPne276R+tFVysXGd5z7xRzBDDTNREoLuDsQFiRA7Wcl+f97kWlwjVvmNmOIp24JYvpeOyi
	qQULfw++xb2nt2zOAIX7EoeGp7+KuNOP8DL4XteeXUCSUtl4qIWVkc+7aR8h0NVfioWAtOrahU2
	erYFIAlP+QIUJLLguRw4NUwSURQLMQrGasp7uwVkolRJl56EDm2ipeOZwna9CgE7W1/uA+0GjcH
	PGnw==
X-Received: by 2002:a05:622a:488d:b0:536:5ee8:cca9 with SMTP id d75a77b69052e-55d5a4d14d2mr88338551cf.12.1795078551785;
        Thu, 19 Nov 2026 00:55:51 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:50 -0800 (PST)
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
Subject: [PATCH v2 19/22] ARM: dts: BCM5301X: Archer C9 v1: specify switch
Date: Thu, 19 Nov 2026 00:54:49 -0800
Message-ID: <20261119085452.75708-20-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005553_288676_E1C1FFE7 
X-CRM114-Status: GOOD (  11.17  )
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

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index 5a8b2b1567e6..c38396ac1288 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -120,3 +120,41 @@ partition-file-system {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
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
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


