Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5243606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FsUj/6sD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNshzxdF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=; b=FsUj/6sDdlwXzq
	D5tziRrJ+9yMlcYQ/PAoarf5aWvptuZyxIa8j3fLQCFciLCCZuAN9WJJxKYUYlRiVxAhzOcXTVXqa
	wD8ZcdKXuhnqeUa3sLJuVPBu9dKw9y8nf+1zMdd6igMSFgasA7TxUlfsHlrk5+DWLTUbMepGyTft3
	hVTS93xpUtnCXQq57x9wtu59IqXu5c7OxQm4WcZPxi2Ldk5Tsf8dboRDNttFnxt9uaO6GlU9Aps3b
	w23mj/+ton9to2TwWMNx0iTxscfPxQphEKdawXygqWFhvP4l9c5uosVH9AWSTIjbYtJO/YaazhMr8
	4+q5FIO4frr1spckIQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxx5-0000000BGro-0M4v;
	Thu, 19 Nov 2026 08:57:07 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvn-0000000BFvP-3gnS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:56 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-55c38cdd5b7so24990621cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078547; x=1795683347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=vNshzxdFzchGtIUTv14cbTjuuGwX5mY3b3WSPReVqIzfavidgX8VgxhhGt+0ZrY6k3
         V2ZlBWGJI7quu95HGan2FrA+7IzpX8ZG5Vvptlv9FNWCoEFdm6EnKqYn+iBrGARTCVCW
         e9o2a8DVZSrI4+XUTf2RYH9rO8wR2m06PXqbgJzv1H1didkx6Z+aY954na8yaIe93FkJ
         jDEl6QcpfSkM8+zsNRRSmwssbd+DiEabt2mfPoSsfAvR5RiMVHcfdI8K9gJ1GvvUvbCT
         c2lcaXNlbgYBzc7y9DE9RFxWVxB4wqxvmROh8N5DAG6hEw7Eth8YxFfdwMOCQM25MFak
         bMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078547; x=1795683347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=MUdcvHRF9O1AvsPKn3H8KqCHv6709ebAsD+hDX6XTutLTbSlOhMyBxAEl7yTGhge39
         3gKNb1FFp9sBI0Hcf+Ddn+UnT4Gb9x2WKyQTBJ6mcfrImjde1a9Fb4eXrdjoE8d4R658
         4L6Pd0rI31eTMWuyWmBSzYSi5nkWoYJkQiuP8zYORsN21S13G8tVhNsES51AqsRWNXIY
         RHYBA+YbmmfBCwymolRfhs4RymJ85tcU+8Sulcn5TwR0KUZHrFaRqS2skmHKewDaM9J+
         TAO3fickl4cx1qPF7+jbRhOOk9shusj0U3d0r70aXWn0+/6y5wbbfEB4LbLY9M0np3W2
         2aeQ==
X-Forwarded-Encrypted: i=1; AL+hErEMFQDPFk+VZq7Pnf1Si9hx1HnHoXxXUo46uAl8wiWBBObFHSFsPhw9nh2kXiFA8D7a8Q2axZFA5K7LnDFi7MAv@lists.infradead.org
X-Gm-Message-State: APuU4Z+Dev4swzdrGdCaFkHP9hqg2lShBZUx8PUDUaBVvBtHJw7+/Kch
	ckjlJCsi7BBlFSzDbSSVcQUDLGKWoMSdSw7xfJ7RyGBuUWwXg8irbuKt
X-Gm-Gg: AYBFou0Q7a/n0dQVhf4PPUIMOP5Om2FOkOYQCc8BPPQORE/AvXXutP9rrKIDY2tB+rk
	4EioJPYv4AkHmvQpi3DJZySMm5sEKXpTiTY3J0O/LNf2yNXFs82kAQ8ibJJ+9jRwEThTdfD3myk
	WNGjfb8HrFfpaUUncvDXkipBBEIK07qgtOnd5Ys0/zFWyzg6OhOqnUUIFlabQDENMepvzzu+6hR
	BlRDOUaod3Wb60PpH1eF+l+wkDrYc8BpvIpi1N3rrfy6CDY+u7Ty9Q+iBJqLkgYVfyqRPQuzMiM
	QYo/7lK+HhJ+uk+cT/sS7sNGu8J0YnDpHaqIwziHzNKPfh5rJXgUfAhsPTmKgA61uCKT5UcGQ0E
	PSkizgTic4Y1s5KKnEMBU9/8trHZZsuFRDTrba34ABTG0uqAK/9AhMo7+ofc4Sl0V/W2uySf0ec
	vfbBA3M0qyJ8NbjwJyWnjP2pcIU+CZJjgobBrCO08/MbGSEjdJKC4oFf5MRqdqNmrSM6YoKGYUe
	tZjqM5zvpdgM351XR/HW3AGZDrJXstxhtBvCI7UTbD9gKYXkgKlBzumU5nkDdJiX8UF8jpO5tYp
	mNadF22vz57Sbzp6PA5jdPipfEbbWdYFakfYgFQFmIE/C6XKzyCNvHqk/jQNxhb7N9lu9SBKpGo
	cPl2kMnPTFAeV0mlHD6pgp1rFX00Dwc6ghp9BoAc4WPYR+VURPPVzVBrPsjligMNDtxQzAWqcCU
	Izrg==
X-Received: by 2002:a05:622a:650:b0:54f:8d78:4dae with SMTP id d75a77b69052e-55d5a6b9901mr82855101cf.61.1795078546742;
        Thu, 19 Nov 2026 00:55:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:46 -0800 (PST)
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
Subject: [PATCH v2 17/22] ARM: dts: BCM5301X: WXR-1900DHP: specify switch
Date: Thu, 19 Nov 2026 00:54:47 -0800
Message-ID: <20261119085452.75708-18-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005547_992361_5CF794B2 
X-CRM114-Status: GOOD (  11.17  )
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
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index b7cd2faa30ce..6543eb8aa9f5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -130,3 +130,41 @@ &spi_nor {
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


