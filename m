Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CB606A6A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7JRx5nS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qK4/mgZZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=; b=R7JRx5nSMOD9la
	ofplZjMmrXo+rEICmuSvwQ3AO0iaW+K6b2CpHZIMvv5S21PMjuzobP0wissNSL3yX05mSKaJreOqU
	37pi2W23u3X5aK5f5KMpXHfuJZkUusDurS8UZGJpl7RB2gKHdWyoxb3J997pFzQe33zIHO2+kP6+z
	89KrrAgrEKTkKuELdzK2K70hiob+hNcTrlyihBoA7hFmEOZ6/P5hNk19RrUBYvHr5Gwo7pCrZniqt
	LUjk1HO1yDu/Hd4Z9gYP11Lzb4xhAQWBE2JR3nlz/wdT88nxIjhQmmd2+up/12meRVdr+9YOiJAG3
	PboaSst+anxt8ehWMWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYx1-0000000GVNl-0Upj;
	Sat, 21 Nov 2026 00:27:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw6-0000000GV1T-0qhM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:36 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso605748a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220793; x=1795825593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=qK4/mgZZy8BfTjyEcS4Y+dqwI2O1nDbtBLx2CYkxlSPtoGIg0K9V1M2M0ABF/LtETC
         fyctZmZISRi7LsJGYXVogygEQmTD4z/aG+sAZNuKBSewOvR06ITqtZZbZNXbIX2DrjAS
         lLjIpRoAhw74s95G6OpIUdxaTuf1hZzmjLS4qu8WIXvibCgB/SeH3Hr6KwOutesm7Zu6
         WdLE8ti5XKcFDRW8VdjhmpCuNBO78c3KjXEAVXEd6ZeRiP8qZFypMRvR3DurMHYRRu2d
         QFKdZYUYq6vt2Tfn7NMlHDNXuQ7O6+/U5ozHzSqCzDWPlDU2mwWPzRGF3Mvs/GXowio3
         TLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220793; x=1795825593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=G/59oX/c16s3Yn0CWTRPXEEW74VZy/Yyk9IGZQzFub+77kDI+VrAanVSbVAcXtWa3v
         GHOMHF3lxJtc9wJwy2Utia3kEiyIL8Ur8xXkQBke+VYIx/ZM8YqCl8ORlnd4u30nAdsu
         mckIQWnnPaICQlM+z94D4oDLjsb26BfFuLoyfEb7F/0V/YsD8UO9Gq7+KAYQ1srn7it9
         S6lwAOx9QIpu2pDOgxG5GvAmLJOq6MCEoS/46vKm+pvY33Hj6il8hMjkufG9CaFu284E
         JTsnWy4jbr8yyLf3dElR46x8sDl6/P3f/W76bJ/nWmM8WyqRmPPktiQzhUkTcDJMUHYA
         wW2w==
X-Forwarded-Encrypted: i=1; AL+hErG85vxBvAFoEUn617FTYSTe1+d4li5/UulnN1+UltK5ux+qamidlJ4vucnZkD21wt8KL4cfPfavupGQKR8oa9VJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/Cdp0wsmVKsIyVifid3aVHXKjr7i3ObrW4i5w3mF8kdXNKFqfh
	XwTDTIjcvyXsRcYQ1Fi3wI2zT18eWg2BVreV0ZhctbcpGeXyvKWTqGPH
X-Gm-Gg: AZFdTZfCFL4WJ4OIoa8hD755CFxG7/ZPsxftoutts8HfwL88LMZ5zePpw23NEmjoWB2
	4ZcOhT3QSkUb8F9Fmg6wKL2P+kfRDwpgK2VHQSmMmZF8xuDqRx5VkrwRlcUqAHHfYZlvewfL+JC
	wtTlllacEYWIo6MsnCTjlUymDaoRqo4qTsEDUD0fkJ/7AyER2BNE6ht3X0DZyvQvPaTFtY5royP
	PW0BUZF0RvkA856seqVKoXU06CPVs4jIzxc4Rmj6nbez7Kt0+imrZ60T9Jn+F1yFBeN8KvFy0pD
	KdJq2ta+//n3aLXfaNa6AfRGz0VRB9D/tmyMpf6ePSbj9Lp9yMQjEurPpRcGN2/LyJ4PUCv5QYp
	z6wj1BLY35v/hpDlLxgww1Rb5B5hym4FNpDCWP3EwpGg2lCX1E6nd/gzyuQLm4EXCT8H2SIu5pT
	aTU6z0N+5xLwK/J4/WnTJ6G8p6ohwnGl7eb/DN4FkTnCFQ00BIigIvvaSrdacg5EhL5BcH0HQ86
	+WlDiiT15t4mapswX39/MmwSeRkO5URimnho7B2NdD9HUr7nKNwEQRYfSUn0ZYgtY/g5TXoM+Ff
	LRFA7bgNTBjYwXZXW3HcO+qePXvyidWY9IaAzESWn0I/5HS+fHC5FRRVFgKVGEWA5UqtI/7ptWf
	Tl0lmB2G2CvDpbQmwrwFfSlFzGDVXHpNNBGskOnimBJPvvpkNp8JuCqi7h+kWgWhuW4gVP9ceUm
	Gu2w==
X-Received: by 2002:a17:90b:5543:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b41c8d49a0mr4222346a91.11.1795220793267;
        Fri, 20 Nov 2026 16:26:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:31 -0800 (PST)
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
Subject: [PATCH v3 05/22] ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
Date: Fri, 20 Nov 2026 16:25:45 -0800
Message-ID: <20261121002603.25254-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162634_501174_570C89B0 
X-CRM114-Status: GOOD (  11.07  )
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

Describe the et0macaddr nvram cell and assign it to gmac2, so the MAC
address doesn't have to be set from userspace.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..f8dd08cc7cca 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -24,6 +24,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -50,3 +54,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1


