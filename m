Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B5A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kCv0wTRK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M8LLNdAq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ImtLOtGTf11APrJzF3AKZQDnZTS9KPs5mJF1gZZY3Ts=; b=kCv0wTRKHd4yd+
	yKeRNTUEqSqB6aVvAWNZsAqdm6T6j5gv2rO4gvUYgajrOrZsAZSo0sKNO4r4bTHJXv/4Hqp23MDC+
	SDeaDnR9arL08BkIzJsz6RJW+boVFmQGccAuyJBWzDcm7M1D8CJ4ST8qOQqXcwaT+ZJcKgly+LP+J
	TIgRPdiMccntkbh7EODtYYxpQHdS/+wLl9a69eippfYDVSBt09MEY03TiRn+UqspvdMvYtKu1MTQ/
	Gts1ousRZZDw8Nx/3j81W3SvHakDtnGhBz0wk/iFmrkF05qhIxyrAvHNkyR83cs/e4ruGBoOPj55o
	hfnsslhCsU2LCe6GNx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXX-00000007m5O-2PIc;
	Wed, 18 Nov 2026 05:49:03 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX5-00000007lkL-3t7l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:37 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-382c3c9671fso516877eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980915; x=1795585715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImtLOtGTf11APrJzF3AKZQDnZTS9KPs5mJF1gZZY3Ts=;
        b=M8LLNdAq+KqEMi3SOPBsKaROxIH2ozq9fsM1kzuLY+HMvWV3njnPsvrTW2l81cG6C7
         o0txG8f6nvQow1XXrDTrcrDJaOdwrE8CFjPM/kBTYAJCOT6kQQFi0EZS9gqTwIp8+aeT
         JYsHRrlob9hnUZzISUrA63wRTLpTSY1hYyOQ2hBnPxELid3pMuGLbWYm3tWIH6xordiQ
         9avBdcsLM1HW0H8y12zQRIx1dsLvwbAwqxSZo1NeF62uPG3AyuTd7N4/EOOYHWjCsOg1
         TSt0McqXqo7Nldxv6H2x79mmzwluASnRbik2iIFpoLyU/9nzUI3YXwUssk3qW0b2+3iR
         DlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980915; x=1795585715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImtLOtGTf11APrJzF3AKZQDnZTS9KPs5mJF1gZZY3Ts=;
        b=Jg+xvStb9H1XhgpZVEeZ8BpthU+3dEvlvSHNWxsdLTd78mn1LGE4pH/KXXpjnklmtT
         byAw9gccm7VwftyeJyAszy7LQrG7yYoixbjZHghLdxHgHxwDclNC8dFAchzbyh46moxm
         XFJOyCPRagBYwo2jVhQTZOg2UgCm0NSyGg3jpGBcdlGi4pC81p6R0lBuvuiPmIGLarSF
         9ryICEo4jTxxf4IH/h6IQuzLFQm41BZnTx/V/SHX+LRWeyGEOBzRCAiGtyFzmQ65auu/
         hmbmFaF3Ppbx1pg8PyZVaU5mgYyPCR68Jd1TQ8QdtW+MLFEPm59z7TyQud0LH2KSOC/d
         WFhQ==
X-Forwarded-Encrypted: i=1; AL+hErFuKH6mRPOsDEeJiPI1aPlvnX9noL0MSRpSNh1ND4Otv+sjWPC22Q8bfeS5RjzDdIecgxsT+ESI5xzgElCYUpRo@lists.infradead.org
X-Gm-Message-State: APuU4Z9TCNExc48PEQcjRUTuVisb4vNIogYNjY+r5aYQxg6RC5dSR6t0
	+75BJyNLeREm6gm3Aa2LgRaQJHCYZlQjfC58ynPpOd2XvH+RipNYQKKM
X-Gm-Gg: AZFdTZfd7mTqiBRQWML+o6011JiRioLLHZtZFVR2QaxWxOhrTeH5QgSriow2kyztwVQ
	7tA3S88r0fx5cB8Wh3PYkjXVptqCr4aY2g0OjzZooky+Z0ctqF5w6Kl9dr9PaihrfYHP1QPNO9O
	8OQn8ZNqgwQCI0IXD8qhIID51DK//a6rU58kAyBPzwJB1nfhgRXvXJwBrR7d8ODcB41Z5nj+pKD
	5UXxHN/9KL0rK0hlC5rY+ma4ncLTCN091yX4W60wUtNBAqPML6OskI3sC0XwXBc9d+cXoioWTNp
	rwRUh15vLOViXya+7Mgv+m6NH3rUEZa44utorHSTjZVPTjb3G8fKkaexGtGSPgkc2rEVkMEWlQt
	U0OkVl9pU45okJym3bfzO3tSLGH1PUjqkMYP2q1jCXxdj/oyXVqInPAoCZcnP/saJ2RZFm7Dhgg
	MZr3I5CPBIppLMc2lXYVIpiYiYihPNAAw4CKlCzFP8QW35jaSEP3iGvXhG99L4/Ynk4aP5woXWh
	Oq2JtP5oSjMy8H/z0s2Kq3IG6YdBOQarHg3UWmwtpa7kCg3BGQLDnk0rBocCgODpp9+WPaWNzVq
	9349XcbdMiugTao20HCTz48PhI+LwX310haQEvJoHI/hZgCuZ/Db6i6rtDHnnGblxgnl4BgiYj2
	Rp60ZZDKsjxcE2Ha91Njk9hWQtBAmjnWv5emrP6UY8vKyBD+YYZiboMaOUM62SssFmerEv3DZ/3
	Q7mQ==
X-Received: by 2002:a05:693c:88d3:20b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3827fa88224mr1559279eec.11.1794980915134;
        Tue, 17 Nov 2026 21:48:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:34 -0800 (PST)
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
Subject: [PATCH 13/17] ARM: dts: BCM5301X: Buffalo: use gmac2
Date: Tue, 17 Nov 2026 21:47:54 -0800
Message-ID: <20261118054758.132233-14-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214835_968232_51B8A2CD 
X-CRM114-Status: GOOD (  11.64  )
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

Use switch port 8 as the CPU port instead of port 5 on the WZR-600DHP2,
WZR-1166DHP and WZR-1166DHP2. Port 8 is the switch's IMP port and
connects to gmac2, which is present on all Northstar SoCs.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi | 4 ++--
 arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..2f1d49733f09 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -179,7 +179,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -187,7 +187,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
index 192b8db5a89c..47670b9bfb79 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
@@ -143,7 +143,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -151,7 +151,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1


