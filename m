Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08904606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 01:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4irGCcFq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxfHdcIT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=; b=4irGCcFq2JEzuO
	Nz1Tkz92DrHBxzvWhteStfwDPBb5PM1uegBRe05ICiILJAhMb3ftz3dZuZaeZ1ySFQtcQffUDseiF
	KzLBlg3akJc7Dt6YjTYaflvvOjkmQzpXskJhvWRCTPLsr/ztqHj4JvrXUPD00kB5AN7FupdPtnF0z
	EjZxur8UgGfA7MrvVtnW3QH58fwZs+OSdz4Cgbc0tOCdWyJozQXOSxB4Ua9ZkcwReovqNAZIKa/2O
	EI32XXL3TWIbwqSCxkKN8+f79yg9X81C3eDMyMVAbvV+VT8ldSQ+4B5UkvUOBD1tY/NzkDpwuRAgg
	6voO5HKvOyyWJ6HvfYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKv-00000005Jhk-1php;
	Tue, 24 Nov 2026 01:28:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKs-00000005JgT-0FoC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 01:28:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1981287b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483721; x=1796088521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=TxfHdcITYVDni+8Kpz7eKqTgzGiC3Eof1Cl2pS3tsjRPeOqcezp3SAUKou50O0SkdX
         klcqSkKrD0EVRJceS+n/j1HO40IzT6Wxvh1wosuJ8iF8N4JBD//13Ga8Vqvf2KyF2GvU
         hWCMiLoiOuI/fQUOPRSUt0W9FvRHdNX95VndpUfaVVXkOZeg90FH27FKC15FSJqyEwVd
         x+Qgf2asevlMKBwbhErKBj0bM9my3v6vs9WWhc4hOeelpuUYw0BoL6lI3CzQl87CGAPE
         Chm7fhBm/4pjQJm7DxNBEmtHv1ZE9pNW6b1FMu2+uN4tujxtoQwRv3nGAu0BH5CKa7B4
         nAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483721; x=1796088521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=A6bOwMJ8UY9eenN4rb3G4o41LiJ3I4j4ENmpa4sxUON0sqVIUnzu8oPse4gPqtPe50
         gug5+CbmXXU8g/mu+Gtzvl1xaGwy1wluzNfndo5730re08UuE5tfW70s5mmexyEPZIEi
         arQ1lUzQOaGrrqvssO5f8UEMcIqtcK4IgzgH0mN9iEsbNacEAB9aS3Gu8yFbR3DxEzj/
         JpJHrMmk1PVJDEx0eabfkaBpmNejQ3AufBe2GkWT/wm9XuNrEbbLrVW2zaCIGHH3Nzzy
         AMY5uhzw0zjPyD2rkeAhMijIptiJpdNcgicocLgyFXOGGqMkR64YurL/82eK37MnTL3Z
         yaDw==
X-Forwarded-Encrypted: i=1; AL+hErHgH2te+VD+lldwN1qQJtgIxs6gzZNUQ9zhvyUMmoq3ICdZTfQwv0bjWRSw93E52q554razpuv9A1yOPzb6eJhf@lists.infradead.org
X-Gm-Message-State: APuU4Z8LsAE4UmXXyMF1ePkjfrUkXDyPRpY0Gwy1UdACXXNuwQOFD1ap
	xBGj0IU1jfHDOrBNExKwrUJHM+SGhtWQmU0rM+hTFiFIveHZifnu4cPL
X-Gm-Gg: AZFdTZce2oJkZTRL2N6cbqz1NBL58X9M2Ey2k26vLaifZivfQyXttBEIcuvAzPD44GA
	YzWzU/5Hk5kQrtjsueIjF1vovRri425/k7VyJ03boahQO32w2jZEJXkH6ZGMEwrXUPhirtnWKPR
	1OJGJONTIzG9ITXiYVnDxf3Z0gNoBOG9cWO9x0+wYietcNH4o51S6wuxqo40S0JB5oIDu1ZhNIq
	0wi5CGyLjZypgVvS8YS3//OsYrQVc3U642TiRzaK2LjEuZqd66hyPEEi5NlwZgbUz37EZv0tWbL
	cr+OzTQ1We3/TpMZlpNO9XJtNq1kRW8WL4dhObqU89+dy6r6ySi5WevKKy5Is/ZyEzQYw22CoCl
	xcQsPBq1Git6o1AA81Lok0Ee2lGCmPpN+o3RBq8l8ozJVKudFVp4hmpFz+BTz68ks97Jf/X8Zx3
	9HcaHM4fo+mkIdfgod5aQidv0ArPERUz2MFfUYFGZWnQXUfVKh9lwrCPuj9yUcamclAI7Ade5h8
	xqrzA/BefkB1IuddbnxOKoOpfD9VenxzMUzRnZdbeK5TI1z2R2aeKaTd41r613xXJwQEjAHQC3x
	yHKTkgIgqE9YUELTMJ0qPBiEopux/qWFFNE6yNCwsXGIOPnWbnjfUjc=
X-Received: by 2002:a05:6a20:3d1a:b0:3eb:37a7:12a2 with SMTP id adf61e73a8af0-4014cf57a08mr12321296637.33.1795483720826;
        Mon, 23 Nov 2026 17:28:40 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:40 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: hisilicon: hi3798cv200: Add watchdog node
Date: Tue, 24 Nov 2026 09:27:37 +0800
Message-ID: <20261124012755.328774-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_172842_137767_21715B1F 
X-CRM114-Status: GOOD (  10.80  )
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

Add the on-chip watchdog controller node to hi3798cv200.dtsi,
backed by the new hisilicon,histb-wdt platform driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index e5010c9d4c39..169a919bb282 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -254,6 +254,14 @@ range: gpio-range {
 			};
 		};
 
+		watchdog0: watchdog@8a2c000 {
+			compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+			reg = <0x8a2c000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HISTB_OSC_CLK>;
+			status = "disabled";
+		};
+
 		uart0: serial@8b00000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x8b00000 0x1000>;
-- 
2.53.0


