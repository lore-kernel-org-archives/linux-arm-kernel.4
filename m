Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B1606A6B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GW+7IgZD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hA1OuCXd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=; b=GW+7IgZDEfTsvL
	pila7yktY4mdnzoMiD7bTiwQt3mC8yFHVgmG/u9iMm7bSjhDy9137kVO0xfZDB3xnKQW3yLSSijGT
	J5Jkv+HUyeSko7MROuaYVwojA0L1L0SLxyyClmLJI6DaleTJiosVn9HHoZfDF/LnV+57zlJS3Cnhp
	sT1IcIBxKe1gMDVXAU+2QAgk8euKBvb+03ySUpVBQGrKZILqgMmSFREcNYtIAZrKbS+w5CkJa38bv
	s9OUAKD/7Vo9KuC0PlnXJy2VXygzQA4m6kWhGEYCCdIlbZt51bJk6cNROu2K67zphECoBT5n99Oyk
	NMzX4HvEtFjDRlWkdfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxP-0000000GVgh-0HRp;
	Sat, 21 Nov 2026 00:27:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwN-0000000GVAn-11dO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:56 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b271e573adso704448b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220811; x=1795825611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=hA1OuCXd8XIU9+rayxlD+dg4WoFbeETO3jsJzZhG02wChwszxrBvu9kgHJ9UQwDUh8
         V/uPN1GdSgYRvorKnTH/DnGAfUXNUhAalKosp1zirZnfr1cQfpV3ZfLKzDQmqqgu28Fq
         AzC7aHf+d1dzn7GbSQahmwXxhaeBVLVEx9QjzjvZiK4L4BW1TObCl/NH6Md8tqWapGp0
         rNaFl3R0uM5QSfTudRK8rf50GLOp2TjkTKQFP//qbr3KqyZMJe0iqGbQnYU1y+I1uZVo
         cFok/yQ5SjW3dU/5LcmJCU8FhNiPI3rmUshhozXcLaxm3sbGmYdXkeaLTQxkz9al9XNQ
         EJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220811; x=1795825611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=zwexDJvnkakT7KClKGXzYMX3IQlI/VwjYa8k3CtuwseUANc+2Nu99sV06Oiz8CLe4O
         3TdOnfgN6TmeojIamngZ3h2lG2MuVxqZculqPYXk+UI/qxyezaqPloZT+4oWE17UZvWV
         5M/b16v5f/MITaGurdjzTRlukA3Dz9JZuQjC1aI00OiXhDEAsiJPkXR6PVvDVkIE4dfB
         KWSLq/KzG9lTUmY/Z2l0KcTCo5sX7Te7cOabnsKF9EfuVM2dNc1XoOc2CQyEzcfQIS20
         oJEc8JuwgbtUoj1dfFVFWiUPtnUKI3tdKBx8m6hIuowF9eKNoeLuDVkBzFAYDPaRZ7J7
         GaVw==
X-Forwarded-Encrypted: i=1; AL+hErGWiDt2TmpYDDvqOJt6MYmaO5qBWBAWa1xMZDs+zsHdHnwpNwdgzKtZcW6NoO7dOqLMlhAmX8iYwGLLc7oq8YKb@lists.infradead.org
X-Gm-Message-State: APuU4Z8/HeI2NZr6+yp93i/ptmcdISKoV0A5E9EGjZFDrIFCmw8OY4Q5
	aaA0zBpXn13o++ZKlidg6yKhAu1kTW+HWeFSMArkAnaiYKcI1HcvJnB3
X-Gm-Gg: AYBFou0uLvUUQH0axljpD6nqQOBDND4z4p18Z3Mq+VgI60KzcyYKZb8E9MKiJMxIbqJ
	HdAKdRjV3ox/ZdIG3eh9qicbQgIRPT9S6z7P7oSAVZ0koKJZ7UPBn6X1O2iIPiE1ncRGtYMfPs4
	8HO62TC6N+MUpE1BpqGD8jjBNige5ogee98zi7nO/qsyoEpsKDhBxUMnvtcH2hPJPtbEpGVEonq
	VXQBXqNgDQOr7SLWf4MmgT43r/ulgQApbvQa8+Ys1xZs+3TqtwOLI7yb+GFmrnE7tSUrs/eiNeV
	pRqki4YEEESzealLM3V11boPjSfmuOKPzoGeGH6dPujWizfHSTirZawdC639U+dSDTul8TW0dtS
	i4glO8N9MxdG9deULNQPeOeOURPhkgDD9M3iz3Hw0lzjFurvoL4/wPMCIusMlSv3+BFq7lO3Nzn
	lA2WK4MJu0rTO7rPCK8Ul3Uo9LJPS159/XsA+xdQw7t49ScNb08Rfb+kk3p1ZJcdboQZQH36HI2
	txFkzJwUM+Y4ymjcuZ0IoWgq3wp5CbkHeXW9/Ss1sVHSNYfR39r1qUE9TdOkE6J4Tt70i6K9T9u
	MswhSNRF3LddHov/hJp73xNlP78N9Gbc5jMPENnB1gz9U3CgwDvIKytAod8dKUVbwaVezwAuD/6
	9p3Y9jBWlWL3p0mlR3OJdb2JVrKZyqd1mi8lzyFjWnphWMC1qhAnDprEyB4wTnzJsUJfHgAR1qB
	fbnM0i36V7ihlm/EZiHMaDazg=
X-Received: by 2002:a05:6a21:a97:b0:3f8:87a0:9267 with SMTP id adf61e73a8af0-4014cf529f1mr4954906637.62.1795220810578;
        Fri, 20 Nov 2026 16:26:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:50 -0800 (PST)
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
Subject: [PATCH v3 16/22] ARM: dts: BCM5301X: WZR-1750DHP: specify switch
Date: Fri, 20 Nov 2026 16:25:56 -0800
Message-ID: <20261121002603.25254-17-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162654_707513_4FAAE2E2 
X-CRM114-Status: GOOD (  10.60  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add labels to clarify which port is what.

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 95ef6ca7210b..459ed246030b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -149,3 +149,41 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
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


