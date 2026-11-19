Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB57606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vVFsdDB1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drBPxqVA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=; b=vVFsdDB1BfluQ3
	VB6AXvNUtbx45PZLr0dxZTg3BJ9fLwBDZHxkrboNByYswscQyaIDpSy5PWe73WjQBhgyvo9/GPfEl
	j2mkrIBC9VcPidIj+gCMgErNWR6zBI51/1nAw3F1ZGucGfKjphhQds/wAPLJXN5D/oe6aBqHqQtDI
	BvZxRPJqJg8R38ChV3WySxWia9wgFPYxZTAIhGPFEN6a2JPqkG4GeiZacfNnpgGZJBUQgEfwAV8s8
	rj8HhuVAS/0zLFQG2NQBwESsbYx1wdNZkdlpGW0p7j8M2IpLk/dXt78Xd0Qh6orexeNqahttzmpof
	DaIXDJul6Fvg+/887gOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxxv-0000000BHtZ-3ERB;
	Thu, 19 Nov 2026 08:57:59 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvq-0000000BFxs-1siq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:55 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5365d26ccbdso23327941cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078549; x=1795683349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=drBPxqVAovhSz1jWYigxnbQ1dp7Cwon8gDuDYedFafzvXAYvKnkRuLaads154A0EVm
         jPdzCv3tYDgCucipKbsLhsiCQGsnfFYs6ZhvxoWoZQBTA5LxOpZnVVz/kpYC8LtCOOqR
         jHAHVNpHA8yZ8ngtHfNjYHf2h4EHDR8nMDMl9VlmCDF84+PGAoAbGB08Wf18ODQmN7ot
         R/Y4CwkXH1cbCWY8aXGfnrCgbAhRrNCRmRNKB1qpZ9lwntJBwa3dCwVdYC3A/Ylv3OHN
         VTzKuwDwNixlN8I+0/B2hI8tPN8jpOvp+028zqBdcJPP8U0JALnHODd9WKTcHsDHG7Yw
         hjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078549; x=1795683349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=X49/SBBf64eYoeRvsacAuPN2Ap4DozwWablRrUjSeyOyIBdiL/OGPtyWMFieu2HvcY
         ceyQddGHgFhjeO8m+1XHmriwBZ4U2iA1YDJw4YLk75gAvlYO15haOEWUf/urDGlHbh4J
         4WoHY9VgDvU1TMc5GCz8gTsi+HPG3Je0bP6lnCqVpiEulbFWLvmYFy6pF0TBBYLqN3JU
         RW2DK207TLcHOu0QCJlkVXlldup0ymn9ABg7C4KUpGu+k7CRuO4RE6CYFDyAgbYQZbcN
         +edfXHeCVJQmjQYnvs/M8lJkk8OFlQ2BasOQMBlAMvWo79kTkKNGPodY8DhREp9bAxDV
         Fs5g==
X-Forwarded-Encrypted: i=1; AL+hErFFX4A5aB7IHlvdGrcRRnopNIsLJuVswy6s/EZHdrBBBirAPZmqHLWjATauGZmSKSIUg2ke3LBZka+b5v27JTu/@lists.infradead.org
X-Gm-Message-State: APuU4Z+iveHwhcdGGrqcwMPuLoiJf3YbJ2C9uNAu8LuiVWq0sK43YVeq
	MnYJhtxihjuWPfIz00LI20H29RRvKDyG/w3oKoShlzyu659/z8VrBxTF
X-Gm-Gg: AYBFou15qWZjE1fpaZvpHGYzzlIJAdegPh7/v6sxhbjdifaUDBxdnpusTLJvm0Lcep3
	lR0+lJm/VNUp7yv8qs+ymFlscEByNPXQuXV9VzZDxsCx7VxtVjdrwNd+M/wtlWCNvw7P5KZnZ8g
	1K+CTEVxZ8UfdCygiEs6Rr3CQbPpn3hwjv45fMpjWzF3dssnyybMMdRvEJxX2khMoYs3BeZZgdv
	Jo9gnDglZZ3c+JXURnio6zGhtISvEm4msmaL9HVl8EzUUtJm51gaIApZNRVlrVUJ92/4/acOU+Z
	npdVUpYkvDvQkrryqnU6Ri+J7utByGGqAjVk2mQ73GQvPZVjMsiT3HgNiyJsgKsEhQox3/yYAxI
	2llFiJuX8nrN06JB/pxfMeLC+RawMoF2gL8G19TOCZFvnie4am+Mgt1S2Qwassj8eOZrqv8atWu
	tZvTr8xz4rx7NfZxG4vVaMcyrpIfuhUp2947ZPOlJybY9r3SmXtEw9QrbbSnZVa4r2muHB4LzrG
	2/IY7mBhxJKRueP4gDq9U5JpS8RtCnt3msTqtBfMMuM5iXv9xmxCYhKp1HuJJxyS9HVjyQDInEQ
	/nvsXBjj4i+xXLz/7j0DEJgDrYTBrVCq+l2hO2ozMoZJq/kenZe1CShYJ853EjlMDgRcWOiUpNc
	bfGi+Q1/hLL+ZWDGQN3ZG7ymyAt2X5nZxP/vS4gFaNI0OTo/aXSHS/NtN1WTCxDYtZVfwHn3Rd1
	qJFbw=
X-Received: by 2002:a05:622a:418a:b0:536:72b4:b84a with SMTP id d75a77b69052e-55d5a5d835bmr88430311cf.42.1795078549291;
        Thu, 19 Nov 2026 00:55:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:48 -0800 (PST)
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
Subject: [PATCH v2 18/22] ARM: dts: BCM5301X: Archer C5 v2: specify switch
Date: Thu, 19 Nov 2026 00:54:48 -0800
Message-ID: <20261119085452.75708-19-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005550_517900_DC5642F9 
X-CRM114-Status: GOOD (  10.90  )
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

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index b6a5886698b2..54898849b87f 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -111,3 +111,41 @@ partition-file-system {
 &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
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


