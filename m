Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56616606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11e6lF3+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssnlYMFB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=; b=11e6lF3+CtfXle
	FUwc12VAVZGGbNRvcYkOlk7ZqDrpwHZACcE9feXchw1NeRe4p1k98J7FmXraqneNYCO7xRzpdyD7R
	OCRxihq+nLcpLR/2cbWj/3kvSlTq3ZEtga3pGq+8cu29lCSdi8l1ZXMDkeyYngI4ryIItxSgG7xv+
	iYSWKxhtsSLz2B7X5hHQOaEb+J3Tb0mAsl9UavlEjLVe1MhPT1PP7YzlKUbuu2ksyN5KHh0C7xi5K
	iMm9doPuk4EtxjR2VVIz/6Ccz+FB/89Z0sBGX9x4oliii9QWlHKwLBCYpucu2U9scQy8b/+cEf1Wq
	V9NnUs4+7dc1yvVLxDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWy-00000007lcz-42Rx;
	Wed, 18 Nov 2026 05:48:29 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWu-00000007lZd-11Xl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:25 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so924783eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980903; x=1795585703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=ssnlYMFB+0PMVeAVIMURDlpK4xy2r3LhGRNm6EEOrl7UyoB60wBDTDC4NsE+VQfawx
         39W/37mbXT6IsFDg0u4slNCY1Q0ovD64Cr2DUalJ7SGLM+g79O6FbHHNyS++gibJatYg
         B2pTT2JUTjFe3OluJBZNVtxWAzijG7/DuuezIE2//8Tw3ME8Zvk2JeJHRGp2313YvhJb
         f14xpskMmRnUpdZRd2qoNo+ihufspzrZXTBhjaStZVquCc2ku+kgxmNhqXm3ZW8Qa/OF
         6u+7LxQoYlaL40FZ6I/MKW+HDEBAOYt5dLmW4Yiil7n3odCa8rWSIyYNAcsvFapdhn4U
         P0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980903; x=1795585703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=paJ/VyHnYQFPVLMw0migiX4+Pvdx7H37k0LITsTQ2Do8HHKPEEdNHLexAz/VL/n3De
         GpDMR2pa7HcMTErMV6f6oUOD5voBYKAAWx22+kc3CUEFl8N8jPggfo+Fltwmy17sj4zr
         FsxZlf4PERsuiQ8ZFwF8jFgg0yhpPMXqOQMsrZBcqy8jZCXZaLhYsYkJFofPzlQPq6Tg
         j6dLfmC+Q542nAx6fwwUSspIfh49hABQacQIZ65/0zP65d2p0GDgwev9+bfnvH6c19P2
         6VMDKvLE8BzPRuHKd0PEb5XYvX6vw8sxU5IR87KtbO1g1MMQQU/Up95VfE6uxmr99NuB
         VXYg==
X-Forwarded-Encrypted: i=1; AL+hErGNE4mHITE3CW/KvaD3mhI7ay4J7TrZFa0Av7eXy7gifpzHr3Eo18EOT2Ff3NpgoyPcP+oJvd17HqM1l8Lg7MNs@lists.infradead.org
X-Gm-Message-State: APuU4Z9AV9Y//4s0SNYlbOesdHHnJjJW6V+6NDmRmPAcoVX6MC58RK3I
	YRoPBtAjeZcyIgoQNz01xaNGF8raU3qSph4f5VBmfru1XafffxeN8YQu
X-Gm-Gg: AZFdTZfP1QH41wi06w4nBNpwBypXcqJLtZVzYCEJpp5nkPDZQ4GW8lMjSj3HUu5VHMe
	Q7ocT+2G+5IFpV+u7KwuKlHN+vS2nX5wP7PtAqXJHbOA5J1beprmviYVabXnpXl/FXI5SdusulJ
	lm51pHCvG+N4oAHAaLBDBKl3iY7vCAqnpuOaro65L+hjgqxd8JGV0UXlfVjzmluVSIZ7SiYvzaw
	RQiU3CXVGB4l4WSyvfmwesIXtMKek7n6l3zOGIJPbJ7gj32h/T0YXe/vrXuRZx8GIWscf11H0Uj
	KCGw0krZKf1B1IPqqVqacxFKSPZJYqJkmykg5h+m4GHyvgMSrmZ5QhPWY+zi/PfyjC3BoozXEJz
	e8/ZvVQq3EwP8n4u61BfCHhME7hg1xI0Qcqk7e+a9gCI0Wd4tu8VWvqJOzIRd6hiGAPcF/psZFj
	Ovvh+uR5JLQnD6ZFwSFIWFKysD4ByrNek/6OUKRs37PcvjTlHXzWKXPi7ilsMSB3PtsKqq9kkk1
	pfXA8q4Hwq7RSc7HPQ++cSNj4Pi4zXbpqN8cqXuhoGRWQGlXLxZ8ogkqraSHZSt4AXh6XV+3/+Y
	u89QeZn2dfOfU7lOlqMyaguQj9EFkk/BuAyLoW53nqMY/2pSZvmr/Ty9JEoFCsouQl+a05qVcme
	okaWaCG3jvR5hbz23JL4yeBjw1XAUJj7AVnq9LISM6ha6rO17czWywFvmIadYjD74k3ZPQXkYBi
	s1yhw=
X-Received: by 2002:a05:7300:824a:b0:381:6b5:56e6 with SMTP id 5a478bee46e88-38281810085mr1623743eec.16.1794980903407;
        Tue, 17 Nov 2026 21:48:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:22 -0800 (PST)
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
Subject: [PATCH 04/17] ARM: dts: BCM5301X: R7000: specify switch
Date: Tue, 17 Nov 2026 21:47:45 -0800
Message-ID: <20261118054758.132233-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214824_298776_A075CA97 
X-CRM114-Status: UNSURE (   9.30  )
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
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 6ea845f3ac1d..65affe615bb8 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -118,3 +118,40 @@ &gmac2 {
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


