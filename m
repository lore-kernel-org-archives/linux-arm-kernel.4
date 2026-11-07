Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43268606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eV0QhaW4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQIfEmjU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=; b=eV0QhaW4lkih0yFCEDRuGka5ss
	lAhau7sxJHPy0YORq3x0Hu4dJXh4EE6WvYY3o/Q/FHGULvuiusiuYuPKKzicmEVUoup1z+hpiOJgY
	6MLlBHN+Keb8Q8FeOkHla3sgd2zB6oTvNvIFlquewgD4Wle9nDdakNRNUw8UBO8nAma3b3QWzuchx
	kDPuhl6/aBAW8CdhlxBJci+70Lyj1WKC2yIr91/jX3dP6tOwrA9rZh2oBRURxfsaPD0Bmhz4KVKiH
	ylBAAdaiwZumQWu/AE7TkdbHnvugHJSUQdnhbriK8zIwB2xuLMXaZLvIhqmEkORS7bcuM2QAuHSYU
	XnoNuMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZW8-0000000EFpy-3vj1;
	Sat, 07 Nov 2026 06:03:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZW5-0000000EFpf-2Mhr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:03:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7393945ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 22:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794031384; x=1794636184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
        b=EQIfEmjUsdHf6nSiDlFJ903FuCKjTbcbqsIPihdpLeU8GStdYr0vR3kd7nTp2IEuKZ
         qf5SFyUZYsT5+4k2RoNAzg4mYTnIulTgYsXxZIrZx7Qat8U/Se5A0cS6kqy7IbsTdhq/
         li+fZ/26vYRvQvpiDJUvY1T+BmSl1GqjQa2ZwCOeQIcqFqApn01IUYB81YJPy9vM9OrF
         /kjTPecvxJfcJ8V0bBXBL44QlhApPsj55FOIowcUFtWinwiTOfU7VH0P7mxPijhwDJp8
         ieYCHL/ORHaxp6yqEi6laV9EQHntge2iv0Tq5k7YC1P4LU5/CmBPG2Ywsty1m76iG6yl
         vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794031384; x=1794636184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
        b=mN4zJScCvIbcv/X7+U1eazlFnV8+pTWJfT/weU9KMv2X9F6ZAxohugGW/iRFJ/Hp33
         uiHjZx780cfvLAlFCGhZwW3IdGdGcsz2VhWEMhLo08S8CC0mahQR0Rw6edbAjtOH/Ynx
         sfH2pdOviixIIeucD9jyjy43vtZemmd3r7WujcLcnT4il85w4kciGbDsLyyPynueOW5t
         59XXwDiplaCYxOVmRMa9Nc7wdqkmUFnjxHU30HFLva9Ag4iDnnWC7iKFLZWBGAYWWp3e
         0TpeCQni+soCXFwCMDf7lxhhYuTGTRoKedHW4EY4m1EwAdMBZ7Y93vNiwMcn9HIztORe
         6/aw==
X-Forwarded-Encrypted: i=1; AL+hErF9TCkl1f53MRA4hncTx9EJb0/ugfU/GzFkJDdQV39stOwTay9Y+vngV097guXFGWYYHO0h4EDHqMv06Slwgz7Z@lists.infradead.org
X-Gm-Message-State: APuU4Z87sHTrGUvf+szUNTgbs390kiUXzZ1jh11QJOruGaOIjnLnanVv
	+NNU2zmnY/NtyE9pzXb4EfV7y6TjYbnmpwmj+/SXR8R7T15XzZbl4SSEaPykkIiqu5M=
X-Gm-Gg: AYBFou2BzuhvLVwtJ8TeiSEEqxBwU5rkdenFJtSOfvhrO+oo11pP02hsab0TBA6Cq5d
	Ce8NipEM22dhKlkPR2W0ybabCm6JbGM1PqzTwnvmm8VXQr7k9IJRXIKL+mv4/Rgu+vpfINqJUbz
	M10isD0cXuLYDdWPsUeQsf5TC3OJ84/YgpSvJ1ULDivVPutd06lnbtLga1K75SJZAm+vPAKfUTj
	aNTIcFx0zaZyc1TYifg5rNwYOGwWn2M0tC508ZNWDsANn7F2FINpQhiO2s1bEynTOMVHL4AQvsX
	run590s8Ljz4C07H0f1610fWVQ4XLn/v9uPHNZ4fOGE6mikrB3jbPxDSP0OUEbKd+faaTHKzWX6
	7DJ8alfN+MC4f5DJlcGi8RDPpj0V1x/zSAEyvzA4GdhBuH8gAKnCYXt00QHBS4Y+Slpm6hPdu9y
	xge/UNXFn3n8qQjqFOufwHOkhSKy8LbBaO1tNViOTePkN044Ng/jG6F/4krxK3bQyruMquQEX8E
	DrYexuFAqI9WHBF5OELzIUP9cTKCG8+5lMpBmEDVJmBI9k8cdHwIOVk0dJUIKkVN3n1JPmt6JAP
	fg8pRJML+350WGZztLZN19eI26zIH5wyGBIfvtMzmR7TOeicf002DbWlRCcZk52I
X-Received: by 2002:a17:903:22c2:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2ed409890b5mr53794365ad.21.1794031383945;
        Fri, 06 Nov 2026 22:03:03 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm10488765ad.56.2026.11.06.22.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:03:03 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Sat,  7 Nov 2026 00:03:00 -0600
Message-ID: <20261107060300.597337-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_220305_615000_C2979E97 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
index 120784066..bca7f98df 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
@@ -55,7 +55,6 @@ properties:
       - items:
           - const: synology,ds212
           - const: synology,ds212pv10
-          - const: synology,ds212pv10
           - const: synology,ds212pv20
           - const: synology,ds213airv10
           - const: synology,ds213v10
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d..8b5af5122 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -14,7 +14,7 @@
 / {
 	model = "Synology DS212, DS212p v10, v20, DS213air v10, DS213 v10";
 	compatible = "synology,ds212", "synology,ds212pv10",
-		     "synology,ds212pv10", "synology,ds212pv20",
+		     "synology,ds212pv20",
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-- 
2.56.0


