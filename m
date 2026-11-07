Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2628606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+zIM5YT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tA12445h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=; b=N+zIM5YTb1cBf6wpR1n1r131ll
	DFFkiA71IHZWSZwPYEnht/rOonrNeLo8vaVvOrVrNXhPuQNKaXSXlbqTtwhTe8vCWw/BNmqbBn9jx
	B10y7fBka3pBQA4lWX6GHBpTIqM9H6nXm0B1mg/No9dYh2WEIRAwISFh2zSmHWw0Q0M+NFbrpYxn+
	2IBW00aV+zS+hL4i5rwdm+H6ZMIsqSN8a9ScgWrn1dlE59ZgdiSDu+JUAYR4fnf4ORaG4SIVtXg6A
	DyrQdIIXqbMVK+W0ZZs3jy/SP1WyLasoTNWsoucwWZgAo/c9VR3Nrcwo8wMzhsEr3iPcBtWhRGPNi
	K85qoDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZYs-0000000EG2C-2ANX;
	Sat, 07 Nov 2026 06:05:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZYo-0000000EG1m-0mgS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:05:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8b271e573adso613064b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 22:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794031553; x=1794636353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
        b=tA12445hy7HzCyJBVoC1IT/o4nMGMDTyROtTb3KYoJBXFUu4A1Mvj5F+1AHxAxQb0b
         +ZFfWUcLbNrdgQ6p+VQ5ahA3l2HpY1yH26jWKB5K5E5/GLT10tBAGMaMUMSCoeYvHHy0
         yqQ5hyM9/RzNbrSEAR9+5CNoZ2wgKHSfIoY5DIS732MHIYPObWJeKQexwaiBne9B13GT
         itZc4HKdY+igLGNiGxg5T9tJIudIxaCEFuFQerX3rVVoV0w/vRC48Ni7J4oPa4NJ/7+K
         DBvpC974nexm/frH3CtF9y7ugWoO8yT04YdmAlWQyxGDPQGVC5fNdo5I+DnXPTV/lKGl
         YR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794031553; x=1794636353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
        b=C7V5TqKvZgvTV9QakpiRBLavbA9Jg99SttrohfBLyOtynEuAcStPBLCNvHAKF4pV/T
         K+UUbdyQ5bWf9zI7a+uJ4yxEh/QOK6xCDQEIKEBpVJJW9qCvc7OcpSGLohVY79/zjkp8
         bWYjEv2rqltMrt7/b6adxhIaxQPA29K1ql0DWkZ4uqaigGKvS9x8Es7FifspYq/nmJDJ
         Iph2XK3Cn5Eb4FE7p4vUeq4pD1HAbFC4Br+yPvhCn7jnuVmw+XAvTiBdASJg3jvFPzOd
         SgkNaQE95zEqLdw7iWQoTA+lXSnckjWN/6X4gMNS8USzZUt2d8IM75BkQaDnX3VIiKf0
         y6IA==
X-Forwarded-Encrypted: i=1; AKwUvBzqbp54Nzj2LT33YQ9jsiCr3OOgK4mdpiUnt8XGmSq5EbMev/AO7MnYI2PdQzU+4c3QaMSmpFHdzyAzrAX/pN0W@lists.infradead.org
X-Gm-Message-State: APuU4Z8Bl3tqzxe0Y3e2xrFoe5tAOF2Ewuc6BV1HcFkIm0X3r1oI5S5z
	mhyRzRrbHxPK3E9FWgnCkFrfopDjema9B0/evSVFltWEzVQDVYL5p4Ll
X-Gm-Gg: AYBFou0kF+UgMgK3m+vMuI3qBRuFrFMoD6zpmP0S0X6auwAIz68mPsoL7MXeHkyoqqb
	zST8QmutIZrl/RnTGV/LaK6erl947zDlqz+pLW+7I246DkyzjwnKt+DCHLUpR+sf3ZBG1D354Nd
	UpMS8gYR0Rz423QtH7LZTUvciMvNopil0yLi0oStD63L9C7J99zDvADaWFyjhfMOhno+D2W+bgq
	Db4byGhpazyy1mPBbToi3i1vs80c85iA1kxRPWDPC2qsUyioaXsYdYaijM4KUOXzcdBOqIvLWKN
	E5CSuAptAKbt1N0nsB19S8hxpfjXepqSQyW15TDNKwx/uANiebfNGgZu2gPIQWY2yiBCSZ6rP4l
	IvhyNI7PJgWMMcYY4v2szKbOl9Utmp/HDvZSkR8eND4H0H3gGozUeteUdGDVrjlzCrSslLh4e0N
	wldORCXCRion4p5Curit7FkO33IaF2/R/Otge5kQR0qZHF03wcM1QjRA8dtjo+LR7g86xyK8PQK
	CmdQT43iaxRRaho37VbmaPnZ85WcTSBEDPGSJj3RG1d2CyyfNBXVjJfAYHrw3JUBh0wie8/V2Kn
	7qkA6IgFsX0TgOc78yhiZHrcu/SzUUNnuAqWVRiBFyygG0Nl/117I2D/voLIqFFo
X-Received: by 2002:a05:6a00:4605:b0:8a0:6414:a54c with SMTP id d2e1a72fcca58-8b37b4781dfmr4725632b3a.32.1794031553173;
        Fri, 06 Nov 2026 22:05:53 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0539sm1176326b3a.31.2026.11.06.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:05:52 -0800 (PST)
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
Subject: [PATCH v2] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Sat,  7 Nov 2026 00:05:49 -0600
Message-ID: <20261107060549.598466-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_220554_225504_86D35174 
X-CRM114-Status: GOOD (  10.51  )
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

The Synology DS212 Device Tree lists "synology,ds212pv10" twice
in its compatible property. The corresponding Kirkwood binding
also repeats this entry.

Remove the duplicate from both the Device Tree and its binding
so that the documented compatible sequence contains only unique
identifiers.

The compatible ordering is otherwise unchanged.

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


