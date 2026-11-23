Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E06606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lHcSU/hL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RXQ+rBDJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/XfWuCI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=; b=lHcSU/hL4Tjp6q
	sP+vcNsR5QUNjO+sqrRkaN3gcRck/vCRBkuenSJrPMkz9ztUpasSpTJf80Izo6jcYy57Fj/6Jo0/u
	l3bwq4q3N+rMjOzXcrg6nV/TKL0MTafpOBM+iNI32GCdcxMXKp5ZTV+Gny47msOn34ClyXgC26OT+
	dXuf0AaPzxuIE2dK+ti1G/Sh54GUPRJU+0VY0NkM/R/1oZ+3pxDfvx70IwO3qym//MkL1a3RZ5X9C
	HX+LKg/Cee14jZPGrEhlIlyc8OSZ11nuz1in4X6N34PbnoctFqVc765McStC2tLTn+2t87DkktnZr
	0KwqUgRg92ZmjxY55KKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQJU-00000002hwR-1sAx;
	Mon, 23 Nov 2026 09:26:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQHD-00000002haG-3mU0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=; b=RXQ+rBDJ77Dxypy3jhgbU4ITo0
	QwfaTW0d7L8GEB/Qarqa+LS3Rw4jSKqfYkzbUUQTORBe5ggzM0nerMrtGD2ulk3qS3uLPzV72wSy8
	Bk4QVpKDKCqbaRsgUgPeeD0WFQ8HABgeeaTurqGVgwqaE5zYY4iOYZGW8+9tU3dHvhCipjKSRAFg0
	s3RE6j2M05fHdKuKy116qKfDfrH4eTJ4H+5b2UICZRMfXluo5TEpIqoC2rG2mphPWR5Q5fs0soog/
	VWA+offZNvDcZxa70lAgroBmHv+DoEBs89LfnIj3RnBYCmBm4gTVBah07RDAudg1hlGxBybcvGgNW
	XTwOi96w==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQHB-00000002ux7-0eOQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:23:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25598175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425831; x=1796030631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=C/XfWuCIREDzFZyisqhhjiSoXee8b+OE5L1g1a0P7J66TSo7j4ZcBZu0btm2kTSxNB
         xGUwpruONd/Rnim/AWG/K5NSJsoZGgAW1KkYg6FKEsaTJIMPMVpGQXLgAvXS+zNuWCW2
         4jJF6c68c1zVpWXsZ25qB6E8MoZgLbMAPazWjSDLefJhzrxraT9hwDDjI3J3kxW4Qh8K
         vwOoutT+CFFAdWYARaULipSM7k9RSDKQ1DASJ7YNbihlXsiAlKAuT2QuZRTw1dgZPigO
         CebQiAkIkqPsSGvEtSg7i1oj6Dd9UuFWHgqGnczq8nd9gwK5oZAoVOFRD7l4cgUjJvik
         hi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425831; x=1796030631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=bDmdfFayQkWYwdFDIKfvfOxHofCOYrX90gEOrktNIyYspNxTWrawAVwpYKIeuoIsFF
         0eVJW/0M3NBdKi15yIYGsYWuh+X2qUQngnVJ9Kx0OgpSbZ12MZOxz+UUaJ1NUo9CX7nY
         X0m4h+dXwTEP3Kr2Lv7SIzFJVb9wy4np7woUbL5KuxGMuyo3TqradZ5Vj1ICiF2L6QlI
         L3FzdCxzRdJqRR59Jdbq7WnkYAZzoafgrps7bbeOIUlq72qSYZ+g7HAb5Cdjxy13wPCc
         M0/WH9IK7UXYtpoh+p3EDK2MRlj7rJCX8iP7VmvesaS5zEpUeKrEamRaK1FtFbUWWoui
         7Q9g==
X-Forwarded-Encrypted: i=1; AL+hErFDLkmMFRthSyAZZpEV19AfmOVJfMxz5F3cDGgVIcJi2WDIA/BYaecLm663JRKVsgZdwtsod1F2Rp1mY2FUHWsA@lists.infradead.org
X-Gm-Message-State: APuU4Z+vQESOF+sip7/HCh7rGgXeIBkS3u1hIG3qS7Uwm9TcSg7kxITD
	WptgF1/Vq1tPCQvUVHavOMndjQj0Ut14IGp/FnHVkocjjNeqCXteu3TC
X-Gm-Gg: AZFdTZdM1fm+wQotNoCjzojbPnc/HMawW+rvG2ONrvY8kSaGvMkGVXX1fTeLuhXRK2M
	H1KZ+ZIpH6EDwhjIdWYntlEqY0ewjtOnPKxHN4aCeDXjR3bdWZ8qDIBzvbU4ieA+CFKM1JEOl/z
	NrrHW8sxcZvUM0lHSC20roBTnr3/yYlM4edOlcExxCELgXUuNwVYexLfLSPLHoWZL/gjrIaSP8O
	1asuWgC1OmV6U1/zwbX67vfX96cW05YBUD5mA1CnnFyFPe4O+wWE77W2XOqjMCta1/ORqhCiwmY
	fgrXb+bnlN0e/F7dovrJDwi9EhdevOydM1Pe66noUxY68eeNO8uGsjDXqDO+tPVWMIm297g7LGE
	rPnnoLSPDsfvKFtHTCLsEXJFTW4xu7H6B9OS6xRys9os3UXwI1SEU6Eo3kOBjEsnryeoCrqXJ3P
	ucnyW4gi4NCPvPk+v63EVocnuPhFNhUC1HHtSUbiZ4+EKsKC0fE08sHt0UwCu9D002euoC5VMHg
	yYem307krj9GN0Vv2C1yh+NePSqX1GBERwbuHL+P8xrJ+aZsgn09t1liemaX2woI1hdzoSgAw/4
	wSonufVxv37Jnr5KMFGogbjVGZ+uIm/7JsYpWL6PzrtNiB8TqzrTgy1RX10azSApcMTLMy3R7Cq
	UUOQqv0WPbrzL7b3+hhrMRcc0RVbKSqlsug==
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr217705195e9.27.1795425831349;
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Mon, 23 Nov 2026 10:22:42 +0100
Message-ID: <20261123092244.1792040-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092353_396735_A3D5CD0E 
X-CRM114-Status: GOOD (  15.10  )
X-Spam-Score: 0.1 (/)
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

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..5550b21e4113 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -112,3 +118,17 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "peripheral"; /* Force to peripheral until we have Type-C working */
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1


