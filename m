Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00177606A6BE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cteAixfn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHJJpDCG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=; b=cteAixfnj2tNQH
	W0YGnZ5xEpx2uXMO764W8dR9VF7Iyf0WSgtYb3RG1i7P5arfPx1INLwIEfxzSUi0khzV6KLGuD9mb
	Y7ngB2VlZfGK1uQB6x9Sqhv3w4ysys6r1WH4wE+KxILDKKs4mHRpdOhmnx/JY+Sqd/6C0CCXFBDZq
	57WuXxDuiKonPfXdEdYHDZA6bECA9uzRgrvpcC+fv28wauNK8+YD5Fp6vC9P6r6G5rVGkpoeF/gUr
	08kqoSLm7CTU3ZoJZ8/6v0r6TfwtVc4R8P3/4tDG7eQIgrqERtjFSRabPUBUWE8/G4bPsks5xe9AV
	fT5tsWOVqaJU11bfdQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw9-0000000GV2Z-24fY;
	Sat, 21 Nov 2026 00:26:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYvz-0000000GUzx-135R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so918788a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220786; x=1795825586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=IHJJpDCGr3wxOZB+8P6flngilCztRh2QesGEK9dfwmWMy+fLs0W4C0XPbljVoBoR/R
         i74cg9o5Ow2s+sc79m8ANut6R6GQ7587bpwgX7kLuyg2NISpRVmifgIXFia2S4n5U7xU
         WLKKnVAv58rc0tkxe/18eRZr/ulhsdCBSD/XpKIMmC7JQ9AvwEHu111MKZvls6qJPgG7
         A4PNGVcOYZJB2pEvz3Icd2V6nO8cOnZwFYx3UcdPfwwxbaDO/Ww6e9jrpVgoGm7v4ewy
         OPC+w0rtJ3eIBe+b8AuXl5Mzxy77XwyAhqcV+dvLGnytB7YESgh56Qu3jDRi6/84fix4
         OTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220786; x=1795825586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=qlkb205wRbglcPntFwPOMnHEtPlh97hoPaD2QH3l4qGnnoOA67iEy6ZxanZchPG5m+
         7z6b/Y8bxMoIPMfL6kgU1P5scFOiLyPai+MW5pe28SessiK21L0BdEsD2Nqpex/gbxMD
         5Mx3fp1leLoUbpD6OwfO18kS6Ib/xjJLtGsS5T7bM4c5STWXeYRqxV6y6qTWOxodK5vb
         nJ6gBgijCjyF96ytlyecRxjhVA5nA3MZ1YIiCPzBFYR3qMV5f+YXy8j1/PtX+D6VjEhB
         DYu0bX5V2QZN8lfYGg/NYjIqhEHmeE+FYlTadiGDiyN6lEjc3Ijs0giCXOsfflyTftd5
         BTnA==
X-Forwarded-Encrypted: i=1; AL+hErGe4cqXnFy+bNPpGCGXNq1R6WxxoABJ6UhtOE/hufFy7W2fJLm/PSejDYai6URARC9vI24zWRoePUZkD2lueY5Q@lists.infradead.org
X-Gm-Message-State: APuU4Z9wXcHpNLZFZ+oIULIlpaMfiajZVUn+8FFEJ7Rc2YKfN2L6sV5R
	sORrHwKU+YArElqWlgPDeMx3/hNEMcjaEqFBAf804K07cIP/oSufgqGd
X-Gm-Gg: AZFdTZejgnCW9SEInxNp7SV0rOJNmsxOAbSAPtDgr8G8gBjTbB02kqx/3cYQVV5WMa+
	web6fX1szWxOn29YbKhemVaUs0CuV/NnRLrKQKtFXUoxtVyLsThHvPyWl6uB2VO2dJ7emSOa1Lj
	9wBanRTOWwmQSBYuQZfGrsj9F2bvSONAdMg4IW5JEEbsGDkSLWa5eW1QYqDwls7a8WqGa1LW79G
	zXmAmvz1yAzKb0oHQRglYE0Zo61nrT2Za5VJkyPEFovfxOh7lJphX8QT2b4YMLGUOTcCdJhcrFN
	fiMgu3HsyWSy+8mw1H2vRld2LjNQad6wiW4TVYvJZpOpdLQu3kh5yBH1qP+AIZc7tYcD+jwNC/b
	vpBSZNpZTL5OWh0uFMgnMZg5VHrVNpvRPIwMU2GxNmkJUqHj7W9nrZ0ZpyFY/Mj0/HgTdPuow9F
	a7ey+n4xz1+aPZeYl2yLXE05hFb1yZ7AfvoJj9bZbFTykfjgEJp0nRTjqeXNmn+rxo3W9ZCwKIx
	nN0OEzORfoNNRQfr2RBKwiLy2cgjEz4IkRHlJRDCQ4g29go4m0D2MCM7aRKQ/4qBuiSIlNB7ZXy
	JY5RprrUy5TVfFNXQuOh9N6bPKFpdPxSShJh4s3PJ7qI3gp5yxKyRDANG50Q+2IU0/oxzbPzk9w
	4Ht/LkgopW58iWyKdVYBLMkSul2Nk5cDt7sF5QZcaTc/spqnOjChdZNq6Q6EClBgyguEqa7cPDe
	xFjg==
X-Received: by 2002:a17:90a:ec86:b0:3b3:ab75:c940 with SMTP id 98e67ed59e1d1-3b41c9b2ddamr4473434a91.18.1795220786299;
        Fri, 20 Nov 2026 16:26:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:25 -0800 (PST)
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
Subject: [PATCH v3 02/22] ARM: dts: BCM5301X: AC68U: specify switch
Date: Fri, 20 Nov 2026 16:25:42 -0800
Message-ID: <20261121002603.25254-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162627_317873_E6CBD3C7 
X-CRM114-Status: UNSURE (   8.85  )
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


