Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52528606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ia9OwZ9j;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsVp3EyA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=; b=Ia9OwZ9jfdoxL4
	yNg3nkzrREJBotUjuK4mgvHgzyYgV2jJ/Tfk+/9fxiM7taszdWioUQsXyRmFV+fuaTRx6OJte0VjJ
	+khIYPbAp29gHzifcv6/TeHVEeU/9vYds273A26u/QFZ3S+IxEiZAM9rfZ85Jdsr7wLMjW2Cv0WVZ
	NLSmYWjB2VuMxr3VjSn6J9nej6txoRhkUScIPcqsxqeimiQ29LLx2yiuOT2qGfL6fb/PBADD5H6it
	e3sM+CTZNxjuJFLX8zqQes/Z13CZcyBpAo6OMu6sQm/Is9AKPEdmeB5yApd0+K7cbmcrxM2KcKAil
	bw70Fqhi5Fjjw8LoCNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxxv-0000000BHsN-1iIH;
	Thu, 19 Nov 2026 08:57:59 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvj-0000000BFrb-27Md
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:47 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5366ae57896so18872751cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078542; x=1795683342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=rsVp3EyAknoXZeXuN1dqF3ibOW4zqv69CDIWYaRySweUmYctfPYdgvOWFM/1zVd+N4
         59KJgR8P3RG5R8WcVn9HIXVp4h7U3edMqQvWrp1KN9ACtQgXiBfmdx1KP3Cz+4K8ilCz
         LrKOXzFwdLDSWGUcixAoc7xMNGxfpu+RpMgj9RkgWh2jz+Xrk5gkF1y0p66YnRlbRZLr
         kyoSzF83QzoNo/ShnT1DfeT0sNpNeuKMm3K52OqaDruo9uNxCs2+SDoBpeTZWYb+c12K
         Ibl0p6eQQlsBEEn80oh4eKEvThSrtqD9Gx6IMdrm9zSGTlbK8rgTzzzlRA8ZD6q8Vg+/
         bllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078542; x=1795683342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne2ANG2AcfQBisFLtvaPDWEXZjvBiN9ucVQ2DRwlTus=;
        b=oL8EIgfAyMa8cjtibiYdHWSHYtcwuHErW6WD+0uhvIVpkL5m0uWlv2BDFM0ybXYUU4
         CzaKWnwoLGKAsqgNz7K31Trut2CWVvBbZ6ctQ646IBuDkcuh86TJZg2VPl6+YX5oJ1L3
         BeFkLV7uV+QLXxXyB9cQVpjFE99fuBtjNSZgXL1iXPoHbifo8WTYy2/eZM+nygEr2NNe
         elrqPdx0oPTVBgjTfsfmm5uI9gIxpj8Vw1vPifgomeEVh7PJeJprZ+23TA8fLP1DsoJw
         oGEc8vprK+4PAutwlYFV0mKG5hHODf49T0xnQOVhp1FFjn4oHWdIV3tSuoarI4QZ6909
         I9lg==
X-Forwarded-Encrypted: i=1; AL+hErEcIvTiqvGfExgTmAUG11vAz8OYuI884zHHBhQsUMc+IRexRB/Lp/MR5zGV8JRk8KDYgbjGqUwzOtK2ZoEaheuS@lists.infradead.org
X-Gm-Message-State: APuU4Z83YOVHt53lZCrQkh9HwWum3jfA1sgSW4CSyeJKCokC+hA3knFb
	iiyCaHEw76uCEIZsdmyVeUG5VLi7EuST3/u0AEyvxU2xd3YOlcdZDYL9
X-Gm-Gg: AYBFou2OfagzDcRdESzFcYBQeu2H1rWbG8CCUH2mAPBlD4u5aSQ1E1OrApW35EBz0Jt
	LlTXMWs3inNhODk5Tsa3r14OJWq5uhe1yPt2/87a7Y5np6W2dMOq7GzF5AVyEmzu4iYAs0zW8mu
	YtzyThVadHSwTUbiWuGHneIsumBjnRQeW2f/WiJf0JlF+C3oxrQo/XRzF7bP0SN4MOgEsOD7Ve0
	jFfr8ZL63z8wkDp1hG2Yufp2WyymGfMW0lPHmrJo5qPx9+4wYNVvuN8xbeOQaAf9xkdmwG3UrkJ
	JaFVxkgIHzgKCU2Rv5GT7jdYskLhM4W7P6gmRwTvJ4r0JsKLDRtxIO2eFSPncDhpuSqB43bJv9Y
	/760OY4TJC6lUZ4ybASLviaqPhwnpPjtiJrc7Q7Gto3EHu3NLKBJGps4ye6oGAryBDYZUfSddqH
	kH5ZiKUAZa9njCH78oCGbVDbAuystyGA/0liFWJwWy1G1EUQ8WKz7hCT8w2ecyq5f/ZUyhZWt21
	UpZ/NIMEPL9poMm1NLmQqyd/01ZXkzeGaJ5NtMbFRouuUHAv6FVRfa9YX+jjWu2vJ46hJeWkzAy
	HO7NYPuWnsQUeO2Lr8+pchWH++GoLGxwbyMD57IzoDIUwMa9rR4nqhC6iUaiItNJCN1zOSXe7Gu
	xgyxj/HO1iRU0oQLYbMbugqSRquJa0MmsphQwpNaLJncnDhtEG0i0fRlewBpVV/tvhMgFhO8or8
	8LKA==
X-Received: by 2002:ac8:5a91:0:b0:55c:7769:9a0a with SMTP id d75a77b69052e-55d5a3224bfmr89023591cf.5.1795078542397;
        Thu, 19 Nov 2026 00:55:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:41 -0800 (PST)
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
Subject: [PATCH v2 15/22] ARM: dts: BCM5301X: WZR-900DHP: specify switch
Date: Thu, 19 Nov 2026 00:54:45 -0800
Message-ID: <20261119085452.75708-16-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005543_558678_65EEE68E 
X-CRM114-Status: GOOD (  11.17  )
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

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm47081-buffalo-wzr-900dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
index 7655e4ff2d1c..6cb27ea2dd94 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-900dhp.dts
@@ -107,3 +107,41 @@ button-restart {
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


