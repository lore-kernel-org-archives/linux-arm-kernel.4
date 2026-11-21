Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3FA606A6AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XMPBdIIr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h42R/4zo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=; b=XMPBdIIrrT8/py
	mKLVVjV59kwRIiH0+9UoU+bB9tJ0ei0n0EnC7PJRPm5Ikrn1KUis3O0PZ9mdCbx2EInJhDAE9B1VN
	/7D1Boz/1plIpKyxf1tjhRmO/CUMy3KtUNGGq/4a55/QE/ojD4IO/csSDHXSDdHh+PkzkhYRoPvYL
	PlQqJpuBqjSkX5+PNE5dCseBv1SmtWqqFL7aDuGrXp/2FDhW8ZmwUwlV5UBrhFC4HV/Re+nortbAq
	u5bFnJnPXqcn1a1kModB0V+OnEkD+mSRu2X5FfSeHIuEoGcRHmzmQ5sbo8Xv9Cz3wCwsvuQYHu0ND
	lfnz9ZolY9MPUvnB4CAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxA-0000000GVUl-2TQ4;
	Sat, 21 Nov 2026 00:27:40 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwE-0000000GV6s-1Acp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso699811b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220801; x=1795825601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=h42R/4zopcLk3OV1ar58TOoXB09ZAgt+A0wYpwQegOwgtirROLLAShmV/Qj49/j7UV
         loa5x0QgL6PdsgQO2iUs8cvb2YXhWt3Jd0ABHOC3pWzXLOpqC86tWJyBSXGDJTpsIJyn
         ah6QO0+hMbdRnhye8RuZ6UToq7VRwRc6s81x+1Lv+wZp/xzczgCu4Qb1VIwlcA12DPsa
         Gtto2Bo2BfAUPHxVo3B3xGP+0qILNKi+hD5ZikWU/c5Cdce1lA9D0srBtbA6PqinZ089
         GUvSa8HdLrAjt3Kt+QowAc60iSmUuxDw/HvmssMEIIbD+NwWKzU5kzRlOW9dX+aTazLa
         uL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220801; x=1795825601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+AyTakRG8bmsy9NAJdRhJjihQCthEshrK8gdAhvNUM=;
        b=g/+pVC/JlBLXZadDWqs+HcB1U/oRHgj7aNo5QAEdyW6EgKJvok/HXiLJ1RcBDMpkLy
         WG6i5+cLeLSEgkiZG/G7oBJdACD22cYKpSUHg/QVbsUyaoy1842UpSp9OFhVuVECfRIi
         t+HB3bZqtovD0zC1hkFEELrtKdO3wxYMpdFsqN2Ng1sHR508ANNTKfYKQgGGJy2pdFjy
         TXsqnO3dL+92A/DIRawtlev+SJkSL2SA0ZcjFzRaRxvVSBibC9+VWnZEGHsSLDB/TyDW
         Y7pUXBWdIwWgkutRJUVC40Smm7ROZK0/v0QMwfveSuglOzFc04oSWU+lC7lRSrcYTS+M
         4ngg==
X-Forwarded-Encrypted: i=1; AL+hErGeJfaOR2e3TeK1Zxop4MsBKcbUZIfGqvH9tkJ6hekzNIjBC0Ymya+1kCS60h10hQiwM2rvOXx9Ywx9ZYi3sdb1@lists.infradead.org
X-Gm-Message-State: APuU4Z/WiHGihxEgw5AH9FvP46knPvaHTsBUfnriLvRAzByxravHIICD
	h+8wcC2v0ufdn38Op3LOTCcXumXVKppOyrEKucO2YT8KhU7fOskfXrY6
X-Gm-Gg: AYBFou2U/GFNTVpxM7TGmim5WCtp5hEighdXf7aQXwWqRu+WQhvWtJfnYub9H59YqJg
	8D3HXZCbN1Ke4SpFnJU/kVj6Wn3U3SopIHOLVlnaHIeQLybo3Bc7EIBbRAY7JvFJl3t1+meHhwz
	WhYwdE7QKVWgwGBll6jFDN+V24nV8Qq6UCbU1IeF8Jk6Wu1Rtu5HKUbMAOZpN8e8cs7nFCuQSLb
	vm4up7S2xRPrYJOiuV0w8zwzlvAONCl/UjsK+eyUTdmxLhTkNbAzOczs9EQnEKKdEfdGAT1Sj9I
	SLtBOJ2JcpDUpl3Q72e9HvJh1I5FAAk+zJnVgMUkFrKj7607C++0+/dr3Eenkh5gUke8pY+9Q56
	9oV6TrmvqK+133ZHFdKq7l7cnuwH9aqFbIFieGIUGa7i3vd9AmDxbVXGb4RorYuZ8BK+JhE7lqg
	c6VR7S7x90K1/inAY7pWs3yB7Y9oElq1t9ZICCVOt+9UG3uvXTdrTSRvAPxwnpzQjVpLxzpkFs8
	48CDhVda8Sj8ZAW1Y/ArAifNKRKtjR1yd/vXViiLlsANS2MQy5VqS4shc62p0mDlKm8jJpRUiQ3
	Is309XvsaO/gUBI4BoBchRMEhUyh1bpon3dLdsUk//0ZrFX22lmIi2YbU8oJlmx509QfDvQvK9R
	OSk4VJEmX4rHv7z+DUEUkruk9kATfji4wT2o0l1lNGgWAwv1Olnj9BbWFIjsqsMMZT3X21pOn5I
	O7mw==
X-Received: by 2002:a05:6a20:9183:b0:3fa:db87:fc48 with SMTP id adf61e73a8af0-40146119185mr5378408637.0.1795220801265;
        Fri, 20 Nov 2026 16:26:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:40 -0800 (PST)
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
Subject: [PATCH v3 10/22] ARM: dts: BCM5301X: R6300 v2: specify switch
Date: Fri, 20 Nov 2026 16:25:50 -0800
Message-ID: <20261121002603.25254-11-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162642_358192_89E5040E 
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
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 1b99fe442dda..2d7bbc4ded60 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -104,3 +104,40 @@ &gmac2 {
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


