Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7672D606A685
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdZhKYsv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=We+Vu6QT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=; b=JdZhKYsvK3IAny
	B6t1ipG5qJFQk9qfwBbzHcUDGBASYOMNslJjujvrx3gGVwIlzDvksr4DgWKkehQ0ANkFPxwNTfHLj
	sPOp4XDIkAcoKs/4rPaPw6PFDZP1rnZld19a1Yg44pmv/VtO8ncWN6KylWAjmstWfh4bOfvMRHdL8
	DwF776IU9a8g1kwinJsjFqjJIyo67bbrl6WZ+KB1X0j1YlW8vqw4Zbft4MhPWDAy1ENf3TldSQ6kb
	EVSOEkixHjfvSHiQRbGwHUBkWmwr1pNf3TWCHspaV3sJelyYIpC9rUeHLgy7UF1JGNhrLnB5H5VJ1
	1KDOOIifw2iz2Fdlbvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxW-0000000GVod-2Giw;
	Sat, 21 Nov 2026 00:28:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwS-0000000GVCo-3XNl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:59 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a05b210703so767153b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220816; x=1795825616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=We+Vu6QTUtwgRzA4ZCfJoxQor472g0vU+IF4tSVaJzizOAIJBRVU484Cpf1LmEbGSH
         k0isXbu5+873zOVt7nIpNLY1FEOOYWiKKrn3ZzWAmVWC1tvGeSwP4npx5gT2riI8WTMS
         zAMqQjLJXliVo8YpgBKpK8p33GzMg8m+PmanUam+qKjQUAYZAw4GFJZkL1zPGdQ+bILU
         CDz4bfLGw1+3BWjdKp2mrUeEP+sOddPphvZOprTW8JcZJK50xPiqSRF+P66vIPPt3k/W
         5IzZ69uDijujFIU7N3kPHSp+GLi1zN6/oqLp/jS0UTgn/UhOxgEieBIQkIpAtjk9M3YR
         /Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220816; x=1795825616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ME29+xQZGz12mwONLktprNkXxIOtWYgn6nvxtHK4HJ4=;
        b=cg4ZTl86bUjyv6JH4+HHY+e79i3i6jU/o/MsXddiNSuQIa7KyEf7h9ruPEkhVf4IFf
         ZDImX3GQ29v18P8t42OrtrchNSLTDwIf3RJAmAI7GQ5aK484F+yL7UayA8Ui4v/c1R6c
         gUtYhX4Lfm/C7P5JdsqqX+bpA+rjI4EmpmrfSukscb6DiWG0j08G+Xa+lvua707tDkHl
         g6fjy3fPUgrUh7fsGXHYbVq1fmvzI5VzpX51sAI12GiG2jh3i63FXN1MvWpMPztdhChb
         vDcxaZ5fBvq5yrK9CBKqFhlJtcD7lC3lXDgJ+b5siyUl+dLjI4gb+H/NAYEiSNCjPop0
         TOxg==
X-Forwarded-Encrypted: i=1; AL+hErFyD7BnAuRoHZz7R2yNNPF4OKyRRyhf9hnq9cYFUmVUx1FNXf+l0Y4IJuP3R6vhyo+1TlTQeN1qOYH2ctqunB15@lists.infradead.org
X-Gm-Message-State: APuU4Z962RAwzM7N3gToWWURB45EsDZdF4cZHcVrl6B9Qve1bsiQGfFi
	rstLQ3F4jFajh7KtLy7+sGtxyKeTbHRJwu34Y5IY+v2NFGkT3JF5Six6
X-Gm-Gg: AYBFou0uULQC/FTuKeH6NKAupKxfTNtZXGL3eZQCRxR5g6vt2iMUUgtDZU8/YnVX82Y
	bmt63zcj3W+2s+DoswKTpEJsD98Wv0208uOifXrk7MCigTUrQZUVCf0GfYt47jRRy0od+Np1nSM
	R5WU4E//9vzbNdhzz79NaluaMsrcgn9/LdxDYSYyXp0pVOBgBhlBmY0fzxYoi3piWVglqbZ/CyR
	75WrrI0at8CEw7beppdEpLWsGfYRIRBB60XrCbDBYVkwv38hybGxMyotUiO907GVgr5Lin8fHxI
	3bId/1j3h2KwB/g9SpMwfoRcuPTwVVQ8R+XJJL853Jwx5XqseSXWoVbNcH3RLSO/QWB6ZNbPS/s
	dgCttmqOVioBysEJGTd7u2nGJUDtT8miYJw7BdWUTI+M8V41V+rmVcpteDPnRvhHZzsUKyn3fgw
	bHFxAejg3eedBdTj8oMSIe8wK4m/wHzS7wPRKSxuC5ZRkIrjm3SfTatsKt9NiS2l70PyC9yeO4n
	V7E6sC2FB2H718GpDpTlfztIzhmNIB57GQ8yAceJ3aTWq4VIL/W4vcheeryx+Q3O58W0YJMkgaW
	QucNVsihiLy+AD7Ok5zhyHC+hYZxWogqa0IzNpNHD3JEyAK7Sw0jA/jVoaPOiCuI5zj+U+s62Wp
	Y+6ADQ1rOhpEmAJ4RIZef7mFyvTjYsgEtQbbirp4WF/kDsfbdc7pBjfqHbP9hq2osf7lk2Sf4ET
	xVxg==
X-Received: by 2002:a05:6a20:914a:b0:3dd:85aa:4526 with SMTP id adf61e73a8af0-4014b5645c4mr4868571637.33.1795220816130;
        Fri, 20 Nov 2026 16:26:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:54 -0800 (PST)
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
Subject: [PATCH v3 18/22] ARM: dts: BCM5301X: Archer C5 v2: specify switch
Date: Fri, 20 Nov 2026 16:25:58 -0800
Message-ID: <20261121002603.25254-19-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162657_361328_EA6FC13F 
X-CRM114-Status: GOOD (  10.33  )
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


