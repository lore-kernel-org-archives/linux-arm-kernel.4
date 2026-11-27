Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CDB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rI1220v5;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a4FI3jym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=; b=rI1220v5leBUbl
	n0d33YcLtPv2PmQygR+hc1ryTKBB36BC3CHuOhDk8bZm4muO9AHwz5fqioLDshBjUznBCayd5DsBd
	Kxg0qWE19177HxU42fwA3bbkhi5zaaqXe5meEQgjtMG2gyS5KBHjdmp3dulR3x/eMgFimgLIONvZb
	LtKC8FAD3CQjsP7bzDunenlO5de2dExzewbADNMPmRlqkv0/1uQ48/yVOf1PhEN9oGxMYK3obovqf
	VTnC4+pTVNn8yQkW94MLYy/ahaXiRgfO2GdwozjwzNn+VS6gl/XXI2D9QPCK0kr7GEz5JEPt3XG16
	N4kBX/GKTlerpwiXJYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNe-0000000FdOQ-0Um9;
	Fri, 27 Nov 2026 10:40:40 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNT-0000000FdIy-0z0w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:40:28 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1990888a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776025; x=1796380825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
        b=a4FI3jym0q52MOMUaDW2vLd32S9+AzzFffSLYsr6x6xQHT7ZXkebrM120AS/gh15ap
         7BJGPmI63ta5u5I/XPkcG87I63D0BBMxz90kMKpMb0THQW9LKxXpAmLZIEB90YTjGQmp
         DmqJRPSPk+lt3kBEDMP/3kUrsk0onpAy+qr+rc89zw0y6SRS2LCP36+gZMLR8SrNlf8c
         hgl8PR8Ev1QkQ5r/LYR8b9ZLvuvkz7KhyfYkiFpW5enCcCYYswFGoVy6lqDDlewbGN74
         pOmyoWt26mT9RBO6hD2y6dXWLYflOtHiwfsZBSXskQbRSLInmOro1+jakdLoaLnVfonx
         BXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776025; x=1796380825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
        b=Vcp1GNGV3HxVu5RgskjroevnxUZ5aOgkEV/zOL/7CjWvMV/O6i9HwZEgXoR3ULxwqy
         1+xhv5AQgpUYMJlUZP3wSkIIwN1teMAUp8zpHncRg/FnNC5HjySGQhTk/xTDP0QFqiKI
         U4tIAdpPqjwDsL+gs9HZbdgmCwrTOdurYSb4bRzRI3J+Wk1eY+o62osiQ0bC2JxDaqBB
         ShVGxZM7OYqsoeEiOPXj7m3K4uR7avVrlVMDqlAOFZLrpX3zl7Ouoiskh8JmsXG+neYu
         10Z72L3aKYXxcHmjKZzuGo2KtsnAnlLbt+Mf9Y4y8CtXBNgN3yR24HZKH3mlKVCoM8Hu
         5YNA==
X-Forwarded-Encrypted: i=1; AL+hErHs8GXXAewdsds1vc3RLFRtpmxxGEFAj2KELErvrEzV5xWi1p1S4ylOVATbDzz/8xXPsPddz2toeMRpLZ2bi8iR@lists.infradead.org
X-Gm-Message-State: APuU4Z++pTAaVSLqwkqSbIQLyLwOZaPBD2J6f6kZLi+KZ6KMe0AJFFCk
	i8TFP39uTi5xjLi3POXnEKH6Yu/fIKagm8f6cSNxUjWTGR/ngHRxUtkqrNxkB0NHh5I=
X-Gm-Gg: AZFdTZc32GhQ4jjczSWS9VlYLpctzU9s4bNRESdsqNERUwWuj4iozF2E/f29+ybdz18
	yYJY9y9dtVi/lJFa2Jql5xL16V8Xl7O6c4jiwTCqmmOUKX3IKK5gclSX9RVICivsHieMNacEBIc
	g6LnUhPr8UfFaJfBt86LbATARONwdZhbD8iZZXtA08B3BufVLR29jhi/u+pXuSvhx+E5cyseU1+
	9c6bpl0xCu+zIkfHIQDHOfOJqLu+CpPSmZ02cMn92HllqvpRZl26hpb7tiW8M5T78fGucnTTTM4
	wzMA6+ejlxPTRJcYJOeArMwMSq3D0v31hoqmbXlVMwFkpMqNa81PSlyaSNteiwpLSFMq4ZND1gI
	n9dpby0+VP/GqWi2ffEfPn+x5qhUSykSk/EAJUIVINqMvd2+X0kk3s0YeWOIlFbv2L22j8aExAu
	bxoMnwLwJrySAnwBkdX4L2IqEvhLc+ITxfkVNz24TifNt8+9tg3aClMa8c+vwY41/6xmX9fJVhJ
	r1WpqxdfViqeMKZ9qlB/GaW5qD5BAx+UMXvJnJU0TmSxkJb2kF+4VbrTj2uj067Sb5z1qcYKNOu
	Y6D1WM+OplzUNa8s5KWTVFXdwGDjxdManFWrex1Q1yEujp7LFAYM2tegzc5ZDGDIkI6LOa9WdgG
	+E/4P30osp3ytIl6PE4LvZx8FKfW9mpNx9mVOccU=
X-Received: by 2002:aa7:d353:0:b0:6ba:22f7:189e with SMTP id 4fb4d7f45d1cf-6ba37d63cdbmr12166261a12.7.1795776025312;
        Fri, 27 Nov 2026 02:40:25 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 10:40:21 +0000
Subject: [PATCH 1/3] phy: samsung: gs101-ufs: terminate pre_pwr_hs config
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-gs101-ufs-phy-oob-v1-1-144b0e04c3a8@linaro.org>
References: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
In-Reply-To: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_024027_291571_B42DD8F4 
X-CRM114-Status: UNSURE (   9.89  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Booting a gs101 platform with KASAN triggers a global-out-of-bounds
read during UFS PHY calibration:

    BUG: KASAN: global-out-of-bounds in
     samsung_ufs_phy_calibrate+0x144/0x530
    Read of size 1 at addr ffff8000825a894d by task (udev-worker)/179
    Call trace:
     kasan_report+0xb0/0x108
     __asan_load1+0x98/0xa0
     samsung_ufs_phy_calibrate+0x144/0x530
     phy_calibrate+0x70/0xc0
     exynos_ufs_pre_pwr_mode+0x280/0x2b0 [ufs_exynos]
     exynos_ufs_pwr_change_notify+0x208/0x2b8 [ufs_exynos]
     ufshcd_change_power_mode+0x58/0xd0
     ufshcd_config_pwr_mode+0xf4/0x1f0
     ufshcd_post_device_init+0x2fc/0x4c8
     ufshcd_init+0x12bc/0x18a0
     ufshcd_pltfrm_init+0x200/0x3d0
     exynos_ufs_probe+0x48/0xa0 [ufs_exynos]
    The buggy address belongs to the variable:
     tensor_gs101_pre_pwr_hs_config+0x2d/0x40

samsung_ufs_phy_calibrate() iterates through each configuration table
with for_each_phy_cfg(), stopping only when cfg->id is 0.
tensor_gs101_pre_pwr_hs_config[] omits the END_UFS_PHY_CFG sentinel,
so the loop reads past the end of the two-element array into adjacent
memory (offset 0x2d is cfg[2].id).

Add the missing END_UFS_PHY_CFG terminator to
tensor_gs101_pre_pwr_hs_config[].

Fixes: c1cf725db106 ("phy: samsung-ufs: ufs: Add support for gs101 UFS phy tuning")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-gs101-ufs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index a15e1f453f7f..d4af94f3fed4 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -98,6 +98,7 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_pre_init_cfg[] = {
 static const struct samsung_ufs_phy_cfg tensor_gs101_pre_pwr_hs_config[] = {
 	PHY_TRSV_REG_CFG_GS101(0x369, 0x11, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_ANY),
+	END_UFS_PHY_CFG,
 };
 
 /* Calibration for HS mode series A/B */

-- 
2.56.1.839.g22a8290db9-goog


