Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E05D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ckYTbljK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCu2wOkK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=; b=ckYTbljKitf60H
	sNZ9TYTaL4+ZCKXl09ncoA3NDD/v8xhLiyxbu7shHMP7YgxpXSZqiubUW3RmRe2GU/XD1aKROFiQJ
	48v7/FiwHy38Zz8g5y54/ibs5zrjCT6NQOCwOBTQke5kK+yamqqDrCoUM8pJvBOO48E9jzzIHuES1
	4kkwwYxX4U479BS6nj6JdBZbovX9HAc+Mp0eKHxPr0AR+KvPwasrtje8R3reH8vWu5WgLNm40HNQQ
	Lo3e68jt6A3ak8eeiJsJn8sXGGjXW9RT2k0aKzGspUJGHP4rY10Pptvt9uzItx5JsnMs8VGrCNcOd
	eO4BFHYrGCvmzEs40Hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvX-0000000BFeR-25aU;
	Thu, 19 Nov 2026 08:55:31 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvK-0000000BFXA-1wuk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:20 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-55d03bfd477so20940071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078517; x=1795683317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=wCu2wOkKM0V6nTUhWpKJ0qJ+APgQ14iGiHpxgnAeEBh/Ux74VgnxQEYmPQuDaDSSSA
         bTn21K1WbijJne1aeBTlFngBm5TqoCTI2yS2vPEpeYXF8eS1bOHDPKTqRYa2+yLMA//9
         0yQ3DUMNG5TFMES7oN6pILmuncRkycpnqX8j/w0XHcG3QcV3uMw009t8R2bNcbsPz+PE
         JUnDhXGDqN7lWnGn4JDcNdA3fDqjza9aiEDMu8CfsbKMKX6fefkd2uH2YOSrrFfGOVNl
         l91irH04pAXU+cTmh1PBm1dwMkKksuVQC66hZlocVLrtgmcfjyZePuexuMBN5tMBV2MI
         DS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078517; x=1795683317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwLM987nQ+pFkVErQYOpzlmepQTE1jrmewNsyk4Hu1g=;
        b=MZkW0KrQoRZhdqMpsuZ0JRzh18GgrYn32F6WPSYu1p8PF65wloSiyxQuDySkY71wgg
         7N25XkYUBJBQoBlwhGfTx+x/ff4FRJlIUEOXmpvgsyV9uFS+OMEPFNQ5qt3elzfjP2rh
         dKQNvu+Hwd25xJEjwOTFVcuCY1HYYVK7a45+RMOm0SwzA4J8M5wWhiKrzhlO85bA6QIX
         vV1pVxYED8kb7deS+7+7jzpz75jpOQo0hHKiNpuedCeUSHr1h9cGmSn+u7B3QxynWcGd
         SNMsHRMZIK6TlnnouMowP1QBZfcbQN8Bsw2c9c2ej3Wj7O3SLbzrsbTOHtqLqmWqaVvl
         IVZQ==
X-Forwarded-Encrypted: i=1; AL+hErG8F1bg4cDfNen6QP6fmI3OWKFNpUS/gn3OF/oCtfPAHJOE+Yhq+cocWUmHEefYiNs6z6csKmoAtgqRc/dUBUvF@lists.infradead.org
X-Gm-Message-State: APuU4Z8XjYYksAIteO6avA/a4Ow0rGYcl1mCTEZ2L6zuq1hbPei8dSHB
	L8bJjCWue6QyThK0rPlxi7HeZ31bUUvTLX8bYqXYlZ7pFRQpKXUE+i99
X-Gm-Gg: AYBFou1sraWcO3GKJYD1Pi0UZiDtQlgvSMoZv20EmjRVhn4RzjXCN2IyJH9l0QkMSlV
	OwTarUTGCnuqJ47qxf99E6l/MgdoHRk3A0tvIpRg36LvOExNl+gsp4LwCSRgOH+4cqvZ+j1Yhhq
	r7Jm0rqFEDo7b6G1cmL4Ph1xz5y2P93pV9/9F4/L+E33Zd0sBGjIrEjGc6onGU7gtGUlG2Sz8AN
	RqT7BcMfESGyANkvA5brqkqgrju/fF2FXR6KVMd2M/3ZF+Rw3aSM4dgr90JHBJViwGEXCG+8Waq
	I510T0GcUsFkNXPsJ+FmIXrBhCP79Iv5XoLnozVoY5gXeZi1PuqN0LLGg5IZmkwm/9g/wXALSQ8
	IGCdLWOUPb4jxPWBTcfRqEE3uvC6JeN6QTkR71FmbnZLOf3rxanT0V8tCPBSDrE75yqKI6mJGGm
	/dNjTr6PdSZD/D0HM1aoEinOKv4jBbtlRyWtLzPuoF4CcpGxankRsktCdAqoTDqAaFXvslhZMa5
	4laIbLj+gOdspi1SJhSwgOkKXrFEmuzfmmaqUSqGF0juNvbbK/IzRMpqBWIV2SpZckQqQQa5kH4
	Q0fcxOTigQDa3KZp5zoXIpVUQwrNjQgKDKC5Vs847J9eGStDc69BMtUWy1BP7qEBpwhf53SSS4F
	AgmHuFId5tSJ8ELPsdoGGHxbaPVaK50UrJrKGiNVqKnExpszoGwzZTfOn+pouwKOp1tT51+cr8a
	52Cg==
X-Received: by 2002:ac8:5f90:0:b0:53e:35dc:9bcb with SMTP id d75a77b69052e-55d5a6a942bmr88333111cf.61.1795078517303;
        Thu, 19 Nov 2026 00:55:17 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:16 -0800 (PST)
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
Subject: [PATCH v2 03/22] ARM: dts: BCM5301X: N18U: specify switch
Date: Thu, 19 Nov 2026 00:54:33 -0800
Message-ID: <20261119085452.75708-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005519_714248_8220E9AC 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 5874e6b606de..4ae4e2d00b7c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
@@ -91,3 +91,40 @@ &gmac2 {
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


