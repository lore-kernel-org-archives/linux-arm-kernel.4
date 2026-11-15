Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE23606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lvnz+BHU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knFwAKZp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=; b=Lvnz+BHUNx26Os
	CqYej7E5WM5/n4p8wyV2WXd877VdHmQN5MWT45T5TEmRtpavnd5bz6JsuUI8XcetaR0csvF1wD3wz
	DLIDvrJJ0PqkOoSaI7JElv0eQkrTY/PGL4Lgqr/ZjChxW8pLAFe8K9Jjfaf+1AQcqwOdB7T5IY97F
	/xfXW6IRWbks1KjEDdAM8DZ3h9Nd7dDU/2xGG/8d3e0OYZZXTYHE9eU4cnLO0h97i81GhfMMiNsLY
	iMBqN2wZygF3Uod7uL/38AFrerpdF9pMbzTvSKD9ycWlO7t3cGRiJj0t6+/jHHDBBL98fwFgkdBrX
	+fi4oNpmZfyPorqMoj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBm-0000000HYSY-2Ctu;
	Sun, 15 Nov 2026 13:22:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBd-0000000HYPe-1nZp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 13:22:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso5160575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748943; x=1795353743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=knFwAKZpD+Y4CpT/gYaQYHLXklrgyY7JcXWNMEhAAPYRM2oa/efKge2f3+W1ACk5Oy
         ph0YUw+C2TvrEILYzh8kvHX5F3KMkrF99W2hLhAO0s20M/7UQ8JkhnFFC3g8C/U7EgzF
         AFSxxEYu/zzhj4A8Pt4n7TWtPwpSMDF+VEUJR+hi1C8s0EBXTMp5rBVJHI8mnnzTMMbp
         UyCt/5qzB87hRhoZS4c+M/6XCZb8m2U1z/XZyHDton9pPeCgsAyV/mW+93WqI1g3OTji
         V1gIyXkOWmrGHkEHg+fallGNEUK+ZewhFqOUVzWCGV8ref0kHMJwBHpOceDwF72dnRhU
         E3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748943; x=1795353743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=vOHZj2TGSn8Wp19lrXizX5r6ASCsBoyBLrMGtK6tqrakagbCEB/MqhVNbHtV1MtCtN
         PNTr/ukHVFtWG+REluBWzgbaT6hArjYrQATnuw+DJvBkw95C8xpPz79W4Dt7yAv9VgCw
         GGgydzquui8av7A+HjOK/JSi3UDQOT/ktRVAsD6wcN0FDp93tB6IsY55nnCszMMbKPee
         rkuA+xBBAq/36dYU4/Ozc6j44qiDswx3wXH0DPShS1LxOQ3En4cwLl1R6boDY7UVDEIm
         6GuSY/WVLuo+lqSIZj9CNqG/znKxF7Ufp5TpaNV1b5gBO2rKy51f5FT0dZ7BPqVJZUhH
         LelA==
X-Forwarded-Encrypted: i=1; AL+hErF7qVShgu4Mz6hs/qRMpycq0776GtNPIPWoHrGbeyEhBW1zmWFpD/TD9mjjdEbEdv7uauruQcjeNs80cpVF3jn6@lists.infradead.org
X-Gm-Message-State: APuU4Z9R7TeyQF7VLG8OWEvMLLcPCg15u7fLThegn5YMhnvIcnlcsRuK
	x5VFsmZnC3cbIVLxEINQSA/aZyltwWxA0LkhSaFkcUQY08nGF6tnpgWF
X-Gm-Gg: AYBFou2FXLUld16UAacoekbV+JbThS9sNh+j1BLnWhRfsaxcXUH0lesVHVG+Sq4vjbs
	rYyXUJr+YmZpIz8m0axCT2qDn5alhU3Vg4dZlR9tMRNMuJ1h2u+hBGzsDII511b5TEzYzRpIsHA
	WUk0CuKqW7RBoQm9BpPsniqbGqZVw3f1EV7+kOaOBhpmQzbc7YAgQkC7J3mbWPhmiq7IEXytN27
	a4yuARyPEY/sQtqtquaKePQZJr2Nju7z5OzMjiC8jN/YIpfxB3FquUfsx5Q962eTCfLdvyAN0+M
	0ookewVa8n+5mWz/Vd3o/2R59MqW2bRKLfT5gYlbRpZSr21lAkSu+TAu2JV6jPddqyovwsRviVR
	5aYP1XaLWeOufYYuhtXpfuEZHHP6nIuhv8LfRTGUzF+34iVL/pm8hv8a0/WODHK65XVxh9eiN+O
	iDxFRiXxCefsS0t+MnE5UwYMVvjYEait54fTIB74Lsl7ZW1mkzR/1tE8kplsUQ+/I8V1CjxVrbk
	q236VTnDCeOJlGfddXtjrX5H9I39hW+hwB/TSbvwIKvqtDGQypV9XQO7mj8RB/+yx2ZHOULVp07
	Ijv21xLBrYnLUg636dnc3cQoqzZn3wi9nutgEvG5mgHdgSux5WLCCLMOQkdctI26TpfPFtxuzhx
	QYGzIGNkU10pbDSzTgShDBjKIKmGdO83aWp6Y3FDHze+WHIZEtUjJa1FesnyARyT+4kSNPZN8dQ
	pNJhk28yVFfgu+ji3CocyJrlqcKjMJhblGfu9tEX9rtvVCVAJtl2rdU0DVkg5wOuoXU3ZxVz1Sr
	BMb22IZeV7Q8g==
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr212058835e9.2.1794748943340;
        Sun, 15 Nov 2026 05:22:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
Date: Sun, 15 Nov 2026 14:22:12 +0100
Message-ID: <20261115132215.289236-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_052225_482286_7508C775 
X-CRM114-Status: GOOD (  11.95  )
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

The vdd-cpu and vdd-gpu regulators on the Orange Pi One Plus and Lite2
have no ramp delay, and the AXP805 driver provides none either. Once
DVFS is enabled, the OPP core would raise the clock rate right after
setting a higher voltage, before the regulator output has settled.

Add the same 2500 uV/us ramp delay that the other AXP805-based H6
boards use.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..cbe88ee6a487 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -202,6 +202,7 @@ reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};
 
@@ -209,6 +210,7 @@ reg_dcdcc: dcdcc {
 				regulator-enable-ramp-delay = <32000>;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-gpu";
 			};
 
-- 
2.43.0


