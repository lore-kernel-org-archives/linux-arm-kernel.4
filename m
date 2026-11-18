Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F81606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U59sgcE8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpasK7/e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CF3QnG0pChhA7KqQolo3HBzvxghNuVczu9hR7QXwJUQ=; b=U59sgcE8hFKzgV
	yyF1MLvPGI4DhP5zaVbPZSn7u7eoK0ZS7QF50g1ixgdBvnEVUCeueJbi7IAqZGCgZ27GF1qJb2R0Z
	8yDIQNlsb5tbQG7cqWZigz5Ihl1qZdqgFPwaePoFKhIVw6ndhLSg6ImwcP7P3y2EYepozqikpEwwd
	W/qwp6iCL7TmbP28z4WW7+DB4q21mz6IcBLQcaBxbTbJtcbRBgBOkVjoNdOF1ZJPVkG5legyeuYrn
	22GRP4rMBSt37i0oaV4rrI0tqDk5fg0QcANX/GEulFfre9id8nh6bkZi+FqwAalykf7s4x1GkT/H7
	VkmGorrFL8zpDCeH1VgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXY-00000007m7M-2Jg1;
	Wed, 18 Nov 2026 05:49:04 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX9-00000007lne-2tQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:40 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-38318d69173so235076eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980919; x=1795585719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CF3QnG0pChhA7KqQolo3HBzvxghNuVczu9hR7QXwJUQ=;
        b=rpasK7/esEcrI8SWgpmEGsXZOdZVnlKTORPOqY507AxFkLdXk/BbceJ8PRRMC4ZB6E
         7C8y+OW6BQSUEZPc/TaceRnb7ydehCPsmSiIinXL7nZk7WHOiQIB35QaM849G5qLDsl7
         +EyPNjb5NbxHEYHy7ogKN/24rlxcF5ereOaYIr/oCVAHa2Gwe5u3ooBVBoarAbNjlkeG
         2ipIuIHibBTUBDbkIYX84B/u/5qF9k13AuSl7fClhpHR5iDG5xMLF6GX3cvsk+772YCR
         7aVjs8EKFTYCEHq/kJbLVmkPF7D8q7AN6jzw3xNmxAOlTKrqnK26rE5mDbFFUmH93yPF
         onXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980919; x=1795585719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CF3QnG0pChhA7KqQolo3HBzvxghNuVczu9hR7QXwJUQ=;
        b=NwBoYPmONQtunSV7irdYJ2FLvbdqi5YJqpTRCOk1muxhOsAFYoGhO8ZhyycbGSvgJd
         EMcBLxaFrvDodTv+/Cvys5YH3xgq/TuAh6FI4TFayJxEizjqgBXb0Vq44f72wt1yOMsj
         zuRZVv70AsAcSOc/xGLveMMvapJ7phLQu3mN5XxwbIDN5OFThq4oPujaP3zukvcOm5tx
         R2sEtWfvMjWowP2nImK1SjfbJvXACCJ/nIWRGBN2Zt6BT5IrFaKCBiPqISZxHNiI0TPi
         tBPIaTRKGBQvmPBFWNs1Nxz/V9HOyaswrazw1m5mhTHFv+LkzW+7/vCWY67LaeDAoYUQ
         Dg5A==
X-Forwarded-Encrypted: i=1; AL+hErF7JrDDkHOilU5N6nA7w1mIi04mSFNFzAzei9VLU8A9DP1kWURtFz/QgzjKNhMbKcT6xKxvtBdBu16aD4Chy4jO@lists.infradead.org
X-Gm-Message-State: APuU4Z/9oNO3v7SeAVV6YgSRYqYfU1mCSdESr+LBQ/F3zblFEPsa2nF0
	KI6CTEUu7qU6L/yXQPXl5fk/HCiPhf2k1Tzj5tHdbzWeiNUKppONoDTw
X-Gm-Gg: AZFdTZfRvx+WBhJ4/3wuUIvaIBWvyUvOlukoPrIZJGMOdO1WjxWyEOoy2hqkkLZdyPj
	VM2gjwSiMpsTXIUBGexESud7GypnuSBgiMOGUCnpDv+uqtuPAZrfVabWrETvesP+DbYRDNL43/M
	d/+UGNia3L4jV3unD7nxgfI/cJ3T0foH0Tx2a5ZkmAslYFWqlpoZQPQS+gjH89UDo+lf9GDYBtz
	lnImLbgKOQxLV95JDoGRSfKXRGdwoi0fmnO64cwhtNeNgDx6p9+7W3yOTS7HLYVS5uu7nwRB/Hy
	DQHHON4LtWZL2MvndavuSYXBPT4CTUyO/TjKYMal9GuXD5/HBlT+V20Av7ZxQI4nO+AbklqTEd5
	g2t7SGM5XtKgV+hrTapUIcdnlPqQDMkaF4PbRoo1wKwFdLaiXMVhqwyxZkQS3iKIukhDFy0+I8C
	/LZ/MjqNRkFUOBQR/zOdyoq4QMk2fYOFGMjaw4Rr19KnBXnQ2iItHfEEdrZUXNw+SBxdVYoUpYb
	IJsi9ptaU1VFBXKjHEqjBripWSgyp2Z3F0d7bWm7KUet84GMuPHoP+NVbY9TghK/Outjyl2CpTi
	Uh91k85VCA7F7fzZ1J4Y8JyE1nsB0RAuax3sVpypFM47w7du3h6Yti8mX43m9EG/X8TiTXDdt8u
	dKNjLmCY+MJik1ygPIlwSrFE8l1fW60q9i7FcZnE+GVDtkFq0xfFZ2JduXtMe/YE7VqvAPzHYOd
	i15GgKBCpey+DCvxYe1/CF3xY=
X-Received: by 2002:a05:7301:714:b0:375:9a26:cbae with SMTP id 5a478bee46e88-3828121b85amr1544754eec.24.1794980919148;
        Tue, 17 Nov 2026 21:48:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:38 -0800 (PST)
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
Subject: [PATCH 16/17] ARM: dts: BCM5301X: BCM953012ER: use gmac2
Date: Tue, 17 Nov 2026 21:47:57 -0800
Message-ID: <20261118054758.132233-17-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214839_730151_696872E4 
X-CRM114-Status: GOOD (  11.19  )
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
Northstar SoCs. bcm-ns.dtsi already links port 8 to gmac2.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm953012er.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm953012er.dts b/arch/arm/boot/dts/broadcom/bcm953012er.dts
index d939ec9f4a9e..96b93b65536b 100644
--- a/arch/arm/boot/dts/broadcom/bcm953012er.dts
+++ b/arch/arm/boot/dts/broadcom/bcm953012er.dts
@@ -80,9 +80,7 @@ port@1 {
 		};
 
 		port@5 {
-			reg = <5>;
-			label = "cpu";
-			ethernet = <&gmac0>;
+			status = "disabled";
 		};
 
 		port@7 {
@@ -90,7 +88,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1


