Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C372606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zhgRk01E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwPDdvU6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=; b=zhgRk01Ejr+xhO
	42dz4Ag88JicgZSMijXr/FvwknmKJIGEQviXNoHa3yRNqIodqcvBNyW14lK/QSngu0ETFo1wyaBfc
	e+OdtfF2RpeEJDdxZew0WpK1pByhthdxs6NRnNCMNe1bdKXaOr8sQoCXy0HvB7frXfwIGKU0Jnz1g
	L0/SZ668owHVMIYaNgTzdCeW4Mk2kAUjbW0Lvg+ZbMifenzMKq1j6TJie9LrfI/M996H1D9CjA++5
	KcMWZAxDxFE1/jfpvReTP98piY7FGos0of2XEHHJcUFjt9FMu1j4MjAnenJk6z2rodHYndLHMUa2S
	68uZy9WtoSUfHdCdDiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBU3-00000009hE7-0LCV;
	Wed, 25 Nov 2026 11:48:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBTu-00000009h7o-1DdB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:48:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49d05d51553so40631025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607289; x=1796212089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
        b=WwPDdvU6pCHv8nK/3/KUdIusHpBkf9jZAvpDAgOxLqt4spcvh7cat/wMAKWHoxLkvU
         LKkqiNB+PzUA2zoUKFVauxFSIvLQOXitEJorNHDkQ5ClwiOzW/j1/nnwiHUOktSN/NO+
         8Lv93heJwn3Ylfct8sBuFDa3G5Ym/gEOwfbB6WFW2GUxPgLPNOoZhgoWvHxCC5egsdqt
         zCcPyzDTBjbDIqvqkVCTvez9PvF9P8hwhR/2nYvUtiCT289l8oebJMLOzdPytQur11BX
         /zDh6y/uvoVfGkHdz138GUjCdNfL8kgggN7upkq+clpaqnffx+8ijJVHIgauEvwcc5Nu
         m4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607289; x=1796212089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
        b=E1YQNBUIA0+DoylESW/b8GfDq08UDFHclVt54FSpjFdHtaGVYwazbuR26YLQBKryMN
         D8ACF7tkJhsCxtfVeRfwiTiSUanIBFCkRJcDLLv8FqiQ9C5nquWY4kq8jwZYN+AnFsOm
         wG300JxChw3S7s7zzkLGAl5elJRz1vH2JU8xMMnuluEl+7k5QlSlqSXoGp2dJMYcLQ2j
         evEXNc6hORnE99r6e1VX0LIrzw8+Q+bykrau/xjSdBKxiqRSpl+4mUmVZVQF4j+FVeKr
         Eyblg/x0BC4NkP0OMFbg9T06323/8sibdnYRmbhkycfdcTPxUj3CODEnY2QYMYHSOEQR
         36MA==
X-Forwarded-Encrypted: i=1; AL+hErGKi/T7VWsr+e5aEQY3lJLmpGDmSUdnjYKXWumY6m9xDINr/zWLB4b0K7q347PHIbeDyQ35Kr6QQ3FOI0XL5hoa@lists.infradead.org
X-Gm-Message-State: APuU4Z9xUvt0ZbRmwivfHvtDbERV/G3cmkkoO3RWwwRWAO0nbkkdzo8Y
	p8eawSVGnLCFb8/R72MNeIeo5V5zs2eejo7vy6Kmk4qE64xL8oe03wUb
X-Gm-Gg: AZFdTZdvE6O4AFLtNh3lNekG+HrxwQpFL2zN/guDDCzPBE93nMAjKqNq04T9k9eugFL
	Cpxn+c5PBJe39dD7+qhS77YfHhCOl7d9q48/HEWymI0A+sTAA+QFfZUpuROIQ2miJ1uJ1xqiQ3z
	Y7PtVnBSjfkFuEE8e3UxNE22q2LE1BhcFfhZZmL1Q2fk4JCfZ83vEFW4pU34prUP1qpoagh3+UQ
	dJKenenNmfDhW/os0WgDMckVcd61t7+GV3sjf1OJAByD/Kf1RLgq+8orw0N0oJcl8ykjjQjfO5u
	1/w90L771krUovMfi57LcGzvgRHP7+2vr3O85gvFR7W6PyqN0mo7RC8Cs8ytyg/GJakh3gubjSB
	/8IvjXWUZSQvbfrPvKXiO0yB0F4AtqelwMgn7bockA115cVYV5ByYeswX38sIGhl7BAE5wBdymY
	NskfKc/7km09b8QJZ5oNtd3oMISp+fv5osJHLmOjTtZ9+6SMRfPj2RSOPf2PWWKkyYB1g6cfHs9
	e5oWroH5EYPSzwjfr3gni3ZecZDeVf5mqpD0iX6jTTJ6PwRvgv2tW+mqbI7VNUdWX96HZXyM8Js
	v2XGa8PY2DaNmb//+JsvjyyPvpNsqLE2f6/9vVngkVe2EreYPDtLbSLcrRBMxZi3pqagZmnHpDw
	9qnzzYsYAAo0fglMa4hk=
X-Received: by 2002:a05:600c:6748:b0:4bb:6a2d:b42d with SMTP id 5b1f17b1804b1-4bb88824e64mr347991015e9.31.1795607288615;
        Wed, 25 Nov 2026 03:48:08 -0800 (PST)
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm514068355e9.15.2026.11.25.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:48:08 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Firefly AIO-3588Q
Date: Wed, 25 Nov 2026 15:17:56 +0330
Message-ID: <20261125114757.654051-2-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125114757.654051-1-saeednourian82@gmail.com>
References: <20261125114757.654051-1-saeednourian82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034810_355655_A345210E 
X-CRM114-Status: GOOD (  10.98  )
X-Spam-Score: -1.9 (-)
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

The AIO-3588Q is an RK3588 board from Firefly built from an iCore-3588Q
SoM on a carrier board. Add its compatible next to the other boards
based on the iCore-3588Q module.

Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 744b364fb7..2fb93380dd 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -260,6 +260,7 @@ properties:
       - description: Firefly iCore-3588Q-based boards
         items:
           - enum:
+              - firefly,aio-3588q
               - mntre,reform2-rcore
           - const: firefly,icore-3588q
           - const: rockchip,rk3588
-- 
2.43.0


