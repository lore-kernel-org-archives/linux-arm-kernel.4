Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D803606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0wCRoi2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWk5aTe9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n6H+e1UqhVYCLF+C1ilQowG+JXqFtAAI3Ttkbc5yOpE=; b=S0wCRoi2/fD9qt
	QZEs/pLjtY1J9jR/aLzCn9yQHy8cZDYFl52GUwhUFLgakegiQSol1LXbNIdwan+1Zl5rcfIQqHVA8
	fpaTcy/R9f7zY3as5D71OqnxcP2Eo7vgqI+nTQR3AWsMWpT2J6lj1+VatzCHY+qIYLoFKQ4RmvgE5
	rXPHm25SbF39BYyTLgdTelAQMC0T0fLgY8lEnWBRF+y60Ka/UyQEy6KE5pC6728ta+CRe+yDcJA7O
	6SrO37kiDkZoQ2GNBs5QFcREMeGb75qHJJWTmuDVbrBsh9jyiSs5iRd6ikvRol5YiIH9NUN0GXu6b
	E8yDk1t+Qz6Ge76a7IZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXX-00000007m5b-3CTW;
	Wed, 18 Nov 2026 05:49:03 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX7-00000007llK-0pgA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:38 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-382f4710a17so408338eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980917; x=1795585717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6H+e1UqhVYCLF+C1ilQowG+JXqFtAAI3Ttkbc5yOpE=;
        b=QWk5aTe9dHz/uZLAa5KIZ16Fvu11dY/1zg2y3iRaCU6Aq3XRIX2y/NDHGxt+K+I8GB
         SVe1v7kw43PQzch285ZuQ8KEYL9SChHLkfRvusCX3BxwLpZoVcPqKkck+P2BylLc2K4Z
         FjsBC7NM/gJEuKdROs4mAiFojNG8prCaYbGFRzALKD5gGcXVlHh6r7+kRvdawxM5DSwb
         oet4es3htdyG1wQnQyXE5FvBYPsr5UAVcqdRD/ClvDE7rxmFw+p9aGUWYuzYpi5TkmO1
         BWv5t/bG8joq02AAo72uEWNUV/lC5zvRDRff3yK9pmfm48L1e0hyKgVk74z/zURdjSWC
         CQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980917; x=1795585717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6H+e1UqhVYCLF+C1ilQowG+JXqFtAAI3Ttkbc5yOpE=;
        b=fRQpY+hdKST/3I4rG0r3wUApPBLdThZXnX/wsTbjYugkjGv8JPMzH47grBEgp840kw
         nB0oSa9yrwKwJZcmVA9NAo5G81QWPPaCA/8vITfd2kexglJUr+ITfX3SSnPbdbT3Jeur
         vDEsk23K2hmcC3nF4cZ7rWqZJeBfy0k8BPG0uZNTvhitvAbJQAU39AU3aweXIusqcT3C
         ehEJ5DwnHgnYQ4+Y7ocFBNioBFS0CfQj5NCSZyqKF9bMwkIyBWw26tX5FmTZhGF1HKFW
         WmHRN1yPmXyONvt1Rj57Yt1k3zslz/8dLyOBlwX0Slyl1TqbKh2zOz/qFmfCHHZ9wRcO
         LS2w==
X-Forwarded-Encrypted: i=1; AL+hErHnHanq9pEKhzTBCVOuiI/S8jy0dY7qOpxjL0K/esBS7lCK1+XC1FknX3YzoPGnUUK8GbpuQXVLc2ELNLAgOffD@lists.infradead.org
X-Gm-Message-State: APuU4Z8boPm+pJP98xGQpYzjU4uySYC078vyTyervn7pCAnXmzM2ja8l
	qZrFBHF4h2c7Ahtmxq33joLi3h3q8KDKBC8auDEviuUmt7jnppoSvUfK
X-Gm-Gg: AZFdTZfly/DArFHsjPrCO9vi8vCPT1C7Sy4aRSDSk6JhYdV6CR7/+UwDSq0HScsRELQ
	BXIybBX2QZGwqa2+0XieKi+IT5SDxIJjpEBI9Ni4pgPbFlJHyp7lhk/NSXITJUMNt+ymtl72gDG
	7vYahIIEPHT9Vtf0fh3rk6Zju7nGzBUFuYrF2IFUZApgcr+ocG02tzjE/H/IQeMj4FRC14iRaYV
	nTkkhNgbfvX7bxP82dEw4mBt1WUeVPEkEnESmDudxZb17H9wrqVp/rK9uHtk4LoZUjcKj7137OP
	wEufm5sqUJY3ckW71bokpZfBt/ar4ALZgFjKw5liox6Lj7gpdhvgRF/AA4LkaA6n3Ccl+m4rDLc
	+xMNGFpDzgq6xx2GVwhAebTRSAN3mRp2l7ww1hbWtPCK/7mWrfAewmw1U2euzvBffaXe9YFsFnz
	qGbWu9AkbPKDXyYZaIhgceBPdPp8XzE3vr6PWLgpF4GBV531s4GPd/6/2dZdolyeovju8E1B5jE
	BdXaMll+jy55GRF6OyRFBUBhJaLHK7oRUD46/W6Z7Q6fKAamQDsByEj3eZ26YFVKJkYo1XvZtP0
	1O7rhnUItcxTH+d2T7qrh1bn5xdg1elCDO25ifpnUN/1/JQry2swGEEUEclkWpe4+FzuqRE1x5Q
	70fvodFocYfC3oVO1v8cE2oanQ+bYDt+wW0FF3C4H68LXxXE6x5Y5JmaUmteSPn94Eie4eGCj1Q
	WsBg==
X-Received: by 2002:a05:7301:1807:b0:376:77e6:a66 with SMTP id 5a478bee46e88-38280a3d9e6mr1665998eec.16.1794980916525;
        Tue, 17 Nov 2026 21:48:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:35 -0800 (PST)
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
Subject: [PATCH 14/17] ARM: dts: BCM5301X: R6250: use gmac2
Date: Tue, 17 Nov 2026 21:47:55 -0800
Message-ID: <20261118054758.132233-15-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214837_246917_821D8B19 
X-CRM114-Status: GOOD (  11.88  )
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

Use switch port 8 as the CPU port instead of port 5. Port 8 is the
switch's IMP port and connects to gmac2, which is present on all
Northstar SoCs.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..f5c135f2ad71 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -120,7 +120,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -128,7 +128,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1


