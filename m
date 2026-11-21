Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0489606A6AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z1frvbL8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOUi184s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=; b=z1frvbL8U8pXD3
	LZnMm5OdtTY6HEvHzzuI//0nuL1qdUyLj3hObeXs09JeEeqER7psST8X6fXhV4syualJl1wq7RCtc
	9NoJRpVn2MD9401qiE1IKbpevfjfVjXJDQBwMbhOdSuteBvVNOsBdh8F1IJz1CKjaLhWl4QpYNBne
	KhJrVgR1eJRnjx1NCN+U0RZEnq14QwWZRA/1NDYHBoNvAElW7vGGNxP6MaAmFG94PWneBB6Xrxg2i
	rj5eJuW64H9G0V6+dxIywvTKNN7INFftxRneiTOKAZjMelpM//SR/hvy0F26FIoxXdmVK6cb7WyhP
	B0bvMzHpg3m2QRJ7CMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxU-0000000GVmB-18TF;
	Sat, 21 Nov 2026 00:28:02 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwR-0000000GVAq-0SwJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:58 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cddc597d062so879913a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220814; x=1795825614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=fOUi184spAu6Fp+ZdbcedhtnlyCJlFXMDSfmLE3eM3j3p6iRGKWrIOPvKm4MA8pB+w
         sXWWpe/2SorAINojh6rVypJY4PigizGUdvjbmjzoolSib43oxc9CDf0qSzD/WcKhaFFO
         NLFLkfGG5U2WPu1piXN8yrFh8Tzw5jqnLbCtO85AykfzBRHm5BmwYkfnVe13hvOtHEBB
         MwiMvmelIvKN1y9rDmDC8DeDmS1SW6EsMUngeIkhlUfpqd/uPOVosAUuDZyAi+YPRS6K
         X2OgGJJBwf4ZLsDOy+JgTvvu6vMr0bDZr2MCEzvpuuImX/OjGMrbiE8ESnQV9HVD8d/y
         MdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220814; x=1795825614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzuxyyEyd8XipbEeyh7V3cleeTOQNEaifusfdc/CbaU=;
        b=x8ZZFef2paDEJd+EUf5srjsqloqMFCZtCjqmtULX4mUOHl/B59AP/NOtoCjQdSUXxh
         XRNcP0hqfv0nyQg+h1YhIiyyqZBF2mK4LPj2Zw0W/Wp1Q5yb5mt/+je7DS2KVW7xCzbn
         hnJyiiwWD2Zt+FtoyKzkWs9gXEBwUUfSkP/6Pbp2xitBuqzkoS/j+ADEOzGyjralh3LG
         3lRUHBxo3b5KA17xEXxDzcYjO7beGeDVfcgnoZGp0QfN9QY6nIK3VnKBtTEMu9m5ZKzV
         NB4stVGxgq/nFgu1JYYNfGd+/akHUDKNlkYbdEwtT8TlJtKWcGsokGDgHiAj14+v0qYU
         Pf4g==
X-Forwarded-Encrypted: i=1; AL+hErFQPnKC/JsTnzH8R1hG6O178u0atNwIStsoO+6tdqXvuc6ol6RhZepUUT1G9TGpanNKZqtxA3rREwOkOOhRqqwu@lists.infradead.org
X-Gm-Message-State: APuU4Z9jnBlwHl4S+V8dF5EyW+3ShIolE0bp39tCDep3uZ7baa+5AwFE
	hod8OBSY2Z82IwfpJVN3wrUkIfougES+3fam77w7st/77JjeRSamKPXV
X-Gm-Gg: AYBFou2zGqrNHHBY3TWuVzCRDYkEP2OGSAThUQ8SL6mEQSoF3lygMNT+a/wtV9IjwUd
	ph3cwWnm25S2HJMcHHDTKIuzjUZ74KB6gBWvOKIQvvrGVW019uBToOF2M1DN5Rm7d7K9qCL/Dnd
	EPbt4QWLTHc8zPY1msMUQnegi9/Ygu9Igy1IGJFWB+X8/JooHDA1snb/8fwK1K/hv4jX2O8kegt
	jrFupLQWO4ylhrLOW1cT0x3eTEGL74cO32IDMz1FzUElzT8Gc04H823CM6WyMA9uiv4m5uch1SN
	eeimenWVNPLqm3Z9TzwF9Spv6p3CUzjfmbFFU2jUrktSruFEmRRIFSGxwFEuRQx5uwC0m5WmYOm
	W7/PAkWs1mfFxkBhRKJGAxROC/QZq0duH8syjrW1kKcUbNA6lDsr8smNxDgfHFW3RMSIx0U6bhs
	M0U8aW7iOBnbMRNKfgrytV826m+tTaIvTdoEG7Xi7ujR1el46VdYqp2RhxoDskWCd7G9gXembZJ
	a1SQn0MYwqzJykvqhGhCPYSTyVNJFIlSardeMbZihamCUrux0L2/rSz947y7AlGg3f6lisd9hnx
	bDfHc0dhmm44pAyYyJ6IkEHDr0qrQLuhBqp5hkKqDri3aZ1HXHT0qmXBiGT0LGcCeGpKEk92bsh
	/KC9WysaYNOt1MurhtwJKvmfvIU0rnvHmc82LIcpLFa9N5VqKYk94qNYLMVzasrzTtE8MYO9nBm
	QBdJVYeK34tM4cRTnA2kPXEdk=
X-Received: by 2002:a05:6a21:6812:b0:3f9:9975:4287 with SMTP id adf61e73a8af0-4014db58a21mr4661368637.45.1795220813857;
        Fri, 20 Nov 2026 16:26:53 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:52 -0800 (PST)
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
Subject: [PATCH v3 17/22] ARM: dts: BCM5301X: WXR-1900DHP: specify switch
Date: Fri, 20 Nov 2026 16:25:57 -0800
Message-ID: <20261121002603.25254-18-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162655_320255_4AB19522 
X-CRM114-Status: GOOD (  10.49  )
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


