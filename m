Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE0606A6B7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dL42B9PQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNXMwyHH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=; b=dL42B9PQxQw95L
	9pzbZ9P28okpNW1FRqH6kiVBRHcpmpaJddWxXq63H9f1VOPmg/6G5ADbOvuqZ/BUwZs5yi7sqwP8b
	7VTJe1KTXsO43ahslY5QQl53PySqqdeK/293JeV1iD4ZrnkXZBNJjTJnmtlC7gwlZ7R2/VN/a/89H
	+iD95vhh1vtartzWkXRg2vr4L8v04/QUb0g7pAvjTEMZ90uav5OtmfQjKU4Jq4Kkplw/XiWCC+4Rj
	c8gwh9qVGUSvCXnGJ9OiNgZjdgJr1xk94yGrOJv4tD/2S+b5N1FwLcPfWql0QhD/gExyXxorwZJ1U
	cqYLRPb+DG47KY2YS7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxW-0000000GVpJ-3LWc;
	Sat, 21 Nov 2026 00:28:02 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwU-0000000GVDh-2EWo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:59 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso682369a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220817; x=1795825617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=qNXMwyHHfUHCwEIGJ7SWwbnrSIZHqpvpnduHJa/P9a1kQoWXV0SSTfemUPHpJ07sQn
         JXSvd1MD5zagF954VsB5K4O5HgoEHvFdYcrTxh6lcPtyhiEnF715/HPkejJldX4EbnOK
         7wQwCsCIfhD5fD8kjHve9tfl/KwHbfvbilAk10ZNA01FCfHGpVlKAWlkoWGUn9fiPNXK
         sJpFDN4qAJsw1M8S0REeFzfl7oVs190w+heKo3aKMCKYFAcFbN3rQu2UpBBmTJC82TX+
         lQv4heheF7x4zGohmM6IqBv16uOk5QPBi1ovgp2zHZPZHsvTwv4WKHEsVg5Xu5xtMRKM
         4nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220818; x=1795825618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec4Slu2w2ZyBCNm+74Zjdy/yuQjbQ8sVlIDSuyvPQ/c=;
        b=JY41Ju6scyc6RYwfa4pVg2QchxX8InR3qBUSwDn8yS1cktbOQzeOkCT3vBjwTm+AbQ
         UP7wUd+4DNn4EPvbE8X1RdZAqDUQfUDJCNEaevungpNminQwzjQGcUm24Z1DZCAky7Ct
         7F2qYVJjbsc/yTiJGieozhmoODGyoJrFZCt6pIIjo+jy+GusSs7baKFu+lrLQObAltIk
         HVbQKePd9JX6liohwxBBjMarDq7p2Gc9W8b3X5JsuzVTbfpekxRSNeZH3Qvy/73Tesj/
         gAxaimdp+IZxzH8d0EgOwX7FTQuWjzNpWzV0JYctH09uTakAEBIADRHFOxfHcvAwzxTn
         C0SA==
X-Forwarded-Encrypted: i=1; AL+hErFQ9Ne6uv1Znury6AAWfzq24yQrEsZZ6mRxql9cesTa45swFEIalqyP5Er6WLyiMPkeBs8Tg4E/u4Sjmze7iLUf@lists.infradead.org
X-Gm-Message-State: APuU4Z83Dqam2PqK6K1IHQ+uzIhUOgpHSv+2TIPOAW7bvf2c2w7mqFLw
	OXDbTCD8nTuZbZQOS3K/NCSeu1u3pmwrwg205ND0OtCKTKgqQRx+K3Mo
X-Gm-Gg: AZFdTZd2E/4K50qalcIMzmfgJg/ydc1HkucRYys6IAmo6vr0XZV4e1oNR7qxe06K/wP
	/g4WqShjNXyrf9V045RyQBHpXjw4BnyfSPqrF4WGUS76pMfci+6DUEgdjLVH+TNwZ0WzmIWcc1N
	wirRKiBJTtpF6jxfhSHGiyogslaqHifxZWcoz2WqwN5Q9bkesexvxDmTKXBiSXCVykJQGpbD9PF
	G2q/x+rZmcG14NgMpg4qmKeZV9MFjpvE6+PlbcuxUz2eRhLRjv12GlJ6TqWBqmfQ5TPebITFARA
	5X1zinBMcEbxkY0YHAUg8MSRMWLXC39rV4VbAtG0KDRwMFBVzggoTm20PLKlBO/V7tAg1OvaTsB
	gJlLbloTsOWgt/QhqcbCSVmOgsAHot1jXv0cqEMmF/ErBhnYzNf5vEh8qx5mHP10er3dkfD7lAM
	V3zerBz1uw3gEjv/cZjCEFizDxgUQxidj6+CTT7tLcMVGZAgj/ELOJIMKoKUGFNa/XH2WB/nx0P
	QKHcuVKAo2gvPMHN19Ni8lS4raI/60ZpjjAHb6YxD/ZTv4myOylxlGsOtURwyvx/RMw9RKIJaud
	RTW88dko2oUT9BkgV1evC3Ti5ODTWqD8v/2m1VicFwAK8fsDtWABBBFlQbVYjhBoeWw4Q/eRhiu
	HJnDc6/WGegH1TVGkHGEAuLcMkp6j8fRa90Vryn9fcjLN+IvtDg+Dkzuz5OePLvDB3+zkJ0a6OP
	vjWj0=
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b636:763c with SMTP id 98e67ed59e1d1-3b41c8fe33bmr4553827a91.22.1795220817531;
        Fri, 20 Nov 2026 16:26:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:56 -0800 (PST)
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
Subject: [PATCH v3 19/22] ARM: dts: BCM5301X: Archer C9 v1: specify switch
Date: Fri, 20 Nov 2026 16:25:59 -0800
Message-ID: <20261121002603.25254-20-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162658_788954_B4081B2E 
X-CRM114-Status: GOOD (  10.60  )
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
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index 5a8b2b1567e6..c38396ac1288 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -120,3 +120,41 @@ partition-file-system {
 &usb3_phy {
 	status = "okay";
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


