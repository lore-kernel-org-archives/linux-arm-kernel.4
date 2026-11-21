Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD62606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dCGcqkk3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2PPtEPr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=; b=dCGcqkk3y591Ye
	fTTaTGy/z928J4h2xrpdlpFrq2SYwVrx+52bA4/WccZcDfX5CgX3aDvOpygCbqyVxEuIWzzXUevNL
	M+Lj6dCusy2R3+gLR6qTPZnKHDn96uuTOk7yoSO+dby7NX64EV++2C/r3hi3emvoCmFjQyFall+33
	uFMVfglmW3YxbnaViknml6oDHEIxPFn0qUUg22ktqlBPk4hQYaB86JzVs/8bkbsFE2PjKmuS/0c6e
	MV40GAdtDbA66jru1CTgxHuBNdoLAQn1jJpqJcUO0IG+iLqGZ+iAQWfKw/OOStkU1tAA1yI4y9VLh
	x4rM3OSqB4v0rut2p9cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxB-0000000GVVW-0K3o;
	Sat, 21 Nov 2026 00:27:41 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwG-0000000GV8F-3LzD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso1203010a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220804; x=1795825604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=C2PPtEPre3gJ+WvNUJmlYRyRmSDnpIPpD7R5eH2lWtxuBIIAPjWSJurW34+/3ua3S/
         aOp6LbTZgLykGOv2a0KTzdtEaGqgQfvxJ6eTDtQz1mXnIVb/83BWYsXslEt6LLyVNOq9
         ObyDwKIxTQkZobq9IJrpbRPJHmwKWf5+0+Po7XtnQTOuCRKlLaS1KYLEbkQOscCJBrSz
         DIFp87DHkBtqz5sVC+fkufHboUMMIu84L9sOOPgU0immyLJ9w1ITylrgtZCcpXEoHf9W
         dVvgbbdOodMQLlIFOAMtbHX3+kjEG9hi3zRfxCD86ZWh30LXDQORs2ZA5CpqVBzlyvKM
         J28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220804; x=1795825604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=iUxWmTJdkCVWQluAplFuBXcNWE8KWDHoJ8OXPF6b0VaD47m9ouX1diPrr+7ig3h94w
         Tl4yHIilIeTG/R6fIgsfdYk25j11KX/QkkSAbgOyd38Z6Di84oubp9R/be7ddD5xBor1
         sN8exA459mS0o8mrO4j4jikC+HGUztpLzeCdLB2GmWcPtnsqJzlkjLTUajFIGIUgKP54
         szUfpcqvD6tXxEIOiPpACuV5p7UcNG5xvxERqvZ7hy4GbuD3qLrFYL4UAh6mIiiccXEo
         GIYELplltkDHvTGckPK0IzR/Q500bAvQRMIlz1Oazl0gmjxdTT2Ckm+G0BMFSaMyZjtc
         JHVg==
X-Forwarded-Encrypted: i=1; AL+hErHjLRakS6q7EE62vZ3KWuwRA1rxJxpvMrvi0O1p85PA6esmmN/wWgL7B4Vf6JTaoj1+2OxJZxVZVCoGi9cv0Y7V@lists.infradead.org
X-Gm-Message-State: APuU4Z+SiZKcGu8XetSWNO4JvawWpqjD7rRlnzl7RqeRLHjoILr9eQAZ
	mwGGJR5c9yi7EveicCxbsyXnhts9E0mmIRuQE19SVGx0nGWntPTvfs0W
X-Gm-Gg: AZFdTZeRh+VqXkm3h+ATT7zfaT9+W3b3tHhovzzILdFFrzIL6ilKjzZ/9dKV0ILc+lT
	tnCErnv1UCXAihUdSmH0NEQzWplVuRAP4AfnAzykpyxkVygWU6TPhTgP9yRmngZVOw87WCChmuz
	W/V6u8QA6gB3ml2AC1i7r5J4JcUEfPmB3FjNx1tLBR9bKjG0f9tjWtu7wWAxrYx/TIbTquNilrI
	/ShlM8Mvc5R739fkuRMgmxvoJtjCFGw8ZZ2e4py/lW84JmNy57fIYrJjYZfxrgZGt9t8UFi4ZLD
	R9BTIDECMV5HF887Qsjk8hdU+79KuIYDQR/cCisBTLVTUwg7gVrd/Pn/0V8wzaBtXtktaUV1sqC
	vPkruXvgI79uxXy1UAqip9IC3UHGgsOLnW9ONR8utqqHIVRbuK9KZmGW8Wzw/v2fD1ANfF7BNdZ
	A/qs83V3o4IQqBMSe8ATlpEZiAbZRteZsABx7DSuDcDEENksJexoewp54HNtuX6HTPNegO2mMzI
	J2YaY3xCNgeylwFWZBXwd8K1AMkDmcmaSoEjKmlJi2aasqvE/YOlUfDZbE8vUvBG1qVZbh9UPCZ
	UfAzaYjOe/dxWSjQIa3Oc7j9vkacE5I+7kRboSan737eNmGYNCw9EkKfHmYgPH8dx5TL02n5TAQ
	OzKFE6pgc+LxsN9MFcpFrGPVJQa0CDLOzm4R607j7f6G8igNH688WQ8WSFUhweh2vGHD46tvLdf
	jnfw==
X-Received: by 2002:a17:90b:442c:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3b41c7d17d9mr4688820a91.3.1795220804144;
        Fri, 20 Nov 2026 16:26:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:43 -0800 (PST)
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
Subject: [PATCH v3 12/22] ARM: dts: BCM5301X: EA6500 v2: specify switch
Date: Fri, 20 Nov 2026 16:25:52 -0800
Message-ID: <20261121002603.25254-13-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162645_261797_53225218 
X-CRM114-Status: UNSURE (   8.97  )
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

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index d9e4f84058e3..8b3074684e78 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -61,3 +61,40 @@ &gmac2 {
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


