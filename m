Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B502606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BUOhF52r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N21WHvpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=; b=BUOhF52rQiLOM+
	kcGeUfbgj2TCn4+fPDxU9AnMvHBJlQAuor2RaEIEWiINkB03srz1lGWg01aejdI4G8Y5Gkj8jLSGJ
	lId6EiCwdnMoL5LHwK8aOxlxLy3fHbceCbHFMaDvYdgl+EofpDSL/2qRHoHZ+/P9Mp03bwKmGYlVv
	3mTmdres/QHDmiLTNzpJR4mHe/6+apYAp0sqv2KfwazufYCnFOwLUya4akDQEymwOpMU4GHbqpNTF
	xi5ldF1YFGNUQIRQ4NXlCFKOI2M+zY8H/69XSTp9TI9fU7IiO9ulhvio0gM7TcIhwV5n8NLe6Dovm
	THaeg2qMds+KjyFjm9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWy-00000007lcB-39vo;
	Wed, 18 Nov 2026 05:48:28 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWr-00000007lYN-2IPr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:22 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-15ea896ddc8so1123894c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980901; x=1795585701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=N21WHvpvum9qanoapylACOLPUuRViFKLZNrF8ArupgVMr9Y+FGuY7D3CIjuXISXpld
         BvDMckdQwK1YIZ5iFXOkDYXsPYnQu0cjyyfXfUAXnaQmNZqP5NO6SrGbeBOwG3EyyM9V
         adgEU6LvQ/hcjuFPmzdLgNn8uEifu0ulQAYLvh5/wBk9pHQHCayCRc9jgTC17Jm/iHbp
         IJjQIpvX/TXgq0pGK4K1+wdBJRUp2s54NOzJul5foKmF7OTRe8zOk8MDF0wQu6W8tkUU
         88eZ+O9nRqPqSjilq7Zx6AgJKkt3h4gS3/2H29nQ/h/YzMMA2+2i6GcjjpAuATbfUf+W
         NqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980901; x=1795585701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=YJOBNhO/z7Y9a/agS4UPpsmf15E6ZN5lt8WAMMbV3t5U16ZtaeTaaxf/PINfuuVeuK
         e+qqrA4vQsbiABea0Sar7IVdzoSJSSLSplhbgOPlALMt23Idb+svalYpHb6IKSWMLtN9
         DiZzTijDjVciCgEABx0y6dFqJtqdBSDkDOfipaNiyKORXYtAEPOl9BxPDM9hdUUhWUvS
         QsJKIuCU4JxqjIlmA9vM/A+MJst49iVGX9VKGCszbJXFWSzAl/5AfO1Hf4ju42FDiXyC
         uQpQew+9M3Ph2mcWGEB+7vYtn41mA+pZVZtIiP49zhMR+E7plaXVL7I8dKXxm0qu4Aaw
         C4Uw==
X-Forwarded-Encrypted: i=1; AL+hErHGVr1lpmy1RxM+2ko26MdnTBAaBCQGAoX7YyQnhpv9g6D0wNlYAwgsgxRV5QR95L1FkYWrYObOnUZ0Y3DoB0Xb@lists.infradead.org
X-Gm-Message-State: APuU4Z8FSGfrNqGJgPqMx2T5av4fcNZRhD/NkTlAYvXk4YEIa4QBkNn5
	JwPMoyA9CBmKOAZmTjflH04LO7YOBA7k87Bapw0wAlUYWhTjkzfCVwLsLf5jow==
X-Gm-Gg: AZFdTZcGURqIjw4OrKDEiWlA+ySwDMUE4yO7/vG3T9HoA9t8KRkfqLyEJD0Rtif54Fj
	oTCjdqLIF/Kzmq9YucnMbe79GtwI4tXSMdP8ha3/unBl5TaYtRkTSfidzQocYhlkg4LIqGtGMEF
	g74BV4m35IjyzIUqV5hGq5wmEgZrpbeVqTHT/SW+rViGPk2Jo4JEllvQWzlLZ6SfzW+R2SckZdz
	hbbZEmqmKd57qEdtcWCQoP2WA8bCkgMy8oJq1hpjniM4sFG15ruGr38u3B0yzE+L4d3lXj/9tPh
	FFMzbgWZOOLp3Yz4sdKBvo77Gb8fL1HbklTlZU5FkrlRZAdCgj8crUuT0yRhrrljlEtIzfNe9U5
	KqiEZsZHHDatKoHuBRH2VhMam8cJYXXKaNdgeAcmpv2b2eDgOfUj+TpbUC/Lr3ltLwnyH+tSdJK
	xDGh1mNIrQ2nljFbywB3BfEspCC6szoRMtcD5i5mmoRTcef6YpDW3+vPSkmd+z90Er6RxZle7I1
	w/MbILvDMeWoRZ3H8T+llY9D+mahSwRZEmfMlyw3S5lZXf+FkbloNoA/OHBfIqbOnMIuUT1sQs+
	yDrX9x0QZrvce9UYh1ddXGRxe+gRaLtPsVSD4tF9l+ZPaRi9SY963NE/0yfpfTJsB/rc2xo26b3
	c3s3kvYdQ+XM94T036x5ifMmwGQroQH//JTi573hPdXrOpEGf/YrIr+vgQbs+diBdiYEtxNO70S
	z5/N7j/md00i4fhcXcvTPjxDU=
X-Received: by 2002:a05:7300:d08c:b0:381:edba:caba with SMTP id 5a478bee46e88-38280a385e5mr1633979eec.17.1794980900726;
        Tue, 17 Nov 2026 21:48:20 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:20 -0800 (PST)
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
Subject: [PATCH 02/17] ARM: dts: BCM5301X: AC68U: specify switch
Date: Tue, 17 Nov 2026 21:47:43 -0800
Message-ID: <20261118054758.132233-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214821_590405_CB1326C3 
X-CRM114-Status: UNSURE (   9.22  )
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
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 6e82d2af9f1c..0f369c5d6a5c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -97,3 +97,40 @@ &gmac2 {
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


