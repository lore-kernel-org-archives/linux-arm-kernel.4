Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB92606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PNu3ZrbE;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WGoeTlto
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2c6Rb/UBk4azewF8bkRw1dkEc/rmGwcJQDMivDwr1lA=; b=PNu3ZrbEx8/A1XI28GX16LC1Ca
	/isYLNa++L9mNSu/LjEqAjm9C8zMEP7CoJThFPrDO3WOkuY150uPS42pHQUEmRiMX37mZCT/gd8Qz
	RD3zpm1Ise0b+ugVxk9JPOG5RQiHRu4JHSPX3XwxJ3j863n8fvnUd3WdscXiZ7222Cb5lAYVtwujV
	W/GCj7jw6JlsxGYLPMdGke4RW3nOq4vWp/24FI1JDfG958EqCJFuUxluxBe+R3dxQemvbu1Ckdoyv
	PXZVKEQhIzxRh3CVisK70Y5PNBRoFkTHV5GG7raUm4IZKtHkVraW42TkCV6dwEgCHSJvlm+ZSnLJu
	/CE8jWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNU-0000000FdLK-3Q4Y;
	Fri, 27 Nov 2026 10:40:28 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNS-0000000FdIW-1UAQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:40:27 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso6862980a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776024; x=1796380824; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2c6Rb/UBk4azewF8bkRw1dkEc/rmGwcJQDMivDwr1lA=;
        b=WGoeTltoARgq8Ql83ueeiDRdlIE0YH4tb+/MEjw58nqHCNQqOYtULVCcCN+H4/vvIL
         vHDOF+zPe2RFVZy3TPubQQL80hdCQN3htJC0qfqpT/PzGtbjvjPb07lufjVyp5CH01X2
         r11WvW86lw8AXTTVsnQVEoy1G9DDL3WzpV+nqxMy+sBkaEzbxe3vO8ZsDwMNzCXsmPuG
         Lt6zS4Y2kgXP1I8hBYNmzqY7NmkTb3jqgHnoqwDjpGqdS4ywqOIEopNG7mboEEmgp8cz
         HCiMH7Bvb1zZjhk+s/UhHdLgp2e8qiSaU/AZ5NdEKuA7fD9HLBThQYgGsUeyHwym+v3V
         WOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776024; x=1796380824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2c6Rb/UBk4azewF8bkRw1dkEc/rmGwcJQDMivDwr1lA=;
        b=JSx9m9Iae0z7RYwIiTascNxOmXQc9WNPtbOF5+QGAnOV5jWSuh65ewBItiDcisG3Dc
         jjx7HwZh6rba3aSjGoWLiRO3Flhg2pvFOWGtlWej6t+StzadKgrZDHcD/RU51wjThVhg
         iKsLxt3KBpgUUL7jGOd27JaPfjwFTrPrSaTT0aP9f9vbhWlWuOsFK0QbLOQFOJSk73Pm
         WXEEeUaIK3HS1uDq/qs0Y343GHeBORsJKtCOZkOqFAz4B+hCt+f33nRTmIeitZ6fjVrs
         7BIOm63Rn6HTxNMnnX82ZhwhUQL3fJ72Hzyqh2t85s0UEveqDZ0FEOZjlJGQjQugrQuq
         gtGw==
X-Forwarded-Encrypted: i=1; AL+hErH5FQ47TFUfGf3O736qH8QSYiu6qJv012M1BAyloA8x5Q+aTBFXBY2qRBVM+8M0eq8SeWEACksNBi/kQ5oP2VNh@lists.infradead.org
X-Gm-Message-State: APuU4Z9OlKUDqJdIycqhwy9i6LpMNUZ10j6VGaIYZD3ZIEJEQnZ43UQA
	ziqt4QbX1mY/9I8DZq3Dzk3MO+sUV3tjilrhCgs4cUbHNxXD2Jdj6RT9/S82kVg/cTY=
X-Gm-Gg: AZFdTZecD3y5qElTbia6TPVl0RH2OPbOZBVi7ozNB+51hPPjWjj/NeCC4+GHkx0Vanp
	nYPZMlnnh+AGW1CLOA0Sr2jAI8uicQ1DGw1I4KecxklvzmKziOQrtq3JjSoEVq/XLGvIrGID7x/
	o9Q3wyeGQUlOmIcQZfKoopCbO3CBVNuKV6EeJEthLDcASeP9MMclu2r2Q+uVDscX6Wg398tok+W
	o9KKHBlE2SVQHujLYMsDhlArK/2ADHmjjr1s5Eulld+zoCwJpywEGWXAYFqW3cgTOX9d1adNpYj
	590e1DWLuV+xepgukbKoTj+t78MMv2e/TCjsnIBgEyr9/8FYHTV3LTekMMM4FD8PmPYJ3En+EtZ
	rwF+C4gcSZao8+S1QL4HNnUXCM3mgo6P2PdWyQK9KsR4swczayAgT/Fh8GPN4a+S801buyHT+Cc
	PT9kaoIV2qz1ZWzF+Tp+qlHN+k48Kayfx6PNSMMuEzUnf9AcQKT+qQ36WYYbcU4TmggHQfM+xy9
	mPD0v3SlHOqH+YtL8d7dLpWgOjIbmYFAKQYFjCDtA0oiXNjb5jZZQYiaX9I1j0yX1lrIPMI3bMZ
	MM6mnMQcWbRaoQxvz+2zVnGvEztxeSumRYntnXymgqjikFscujXyyArXHFTsrtD/zEfXpUkp1IH
	3zyOhl9U0pgUfcZlubQ==
X-Received: by 2002:a05:6402:1492:b0:6b8:68fd:bf30 with SMTP id 4fb4d7f45d1cf-6ba37d5bf2dmr12996663a12.13.1795776024088;
        Fri, 27 Nov 2026 02:40:24 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] phy: samsung-ufs: fix gs101 OOB read and use counted
 config tables
Date: Fri, 27 Nov 2026 10:40:20 +0000
Message-Id: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABReCWsC/x3MSQqAMAxA0atI1gaaOiBeRVw4pG02VhoURby7x
 eVb/P+AchJW6IsHEp+iErcMKgtYwrR5RlmzwRrbEtkGvZIhPJziHm6MccbOVKaa2oZcPUPu9sR
 Orv85jO/7AcBI7qxjAAAA
X-Change-ID: 20261125-gs101-ufs-phy-oob-80303a651f4b
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
X-CRM114-CacheID: sfid-20261127_024026_423001_39A13F9E 
X-CRM114-Status: UNSURE (   9.04  )
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

Hi,

Booting a gs101 platform with generic KASAN enabled triggers a
global-out-of-bounds read during UFS PHY calibration because
tensor_gs101_pre_pwr_hs_config[] omits the END_UFS_PHY_CFG sentinel.

This series starts with the minimal fix suitable for backporting to
stable kernels, followed by two hardening patches to prevent missing
sentinels and out-of-bounds config table accesses in the future:

- Fix the global-out-of-bounds read on gs101 by adding the missing
  END_UFS_PHY_CFG terminator (tagged for stable).
- Embed the per-SoC config pointer arrays in struct
  samsung_ufs_phy_drvdata with fixed bounds and move them to .rodata.
- Replace END_UFS_PHY_CFG sentinel iteration with ARRAY_SIZE()-counted
  tables annotated with __counted_by_ptr().

On arm64 (non-debug build), the two refactor patches shrink
phy-exynos-ufs.o by 144 bytes overall (.text -160, .data -176,
.rodata +192).

Note that exynosautov9_ufs_phy.wait_for_cdr is never called (before or
after this series), because exynosautov9 defines neither a
CFG_POST_PWR_HS table nor hibern8 tables - this series preserves the
existing wait_for_cdr behaviour.

Tested on Pixel 6 (gs101) with generic KASAN and UBSAN_BOUNDS enabled,
including UFS hibern8 enter/exit cycles.

Cheers
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      phy: samsung: gs101-ufs: terminate pre_pwr_hs config
      phy: samsung-ufs: embed cfgs arrays in drvdata
      phy: samsung-ufs: use counted config tables

 drivers/phy/samsung/phy-exynos7-ufs.c        | 17 ++++------
 drivers/phy/samsung/phy-exynosautov9-ufs.c   | 14 +++-----
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 25 +++++++--------
 drivers/phy/samsung/phy-fsd-ufs.c            | 23 ++++++-------
 drivers/phy/samsung/phy-gs101-ufs.c          | 26 ++++++---------
 drivers/phy/samsung/phy-samsung-ufs.c        | 48 ++++++++++++++--------------
 drivers/phy/samsung/phy-samsung-ufs.h        | 26 ++++++++++++---
 7 files changed, 87 insertions(+), 92 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-gs101-ufs-phy-oob-80303a651f4b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


