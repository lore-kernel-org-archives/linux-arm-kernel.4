Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8153A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hcX/Opvk;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SspAqPIt;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=EHJ1w6Nt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BxIuQ0x+zM+x9HyEnukAMenKIXa8hWYpcEyJ67KKCCw=; b=hcX/OpvkGD8Pra4rXcqLDUz18m
	6WWkrQG029Bat4RrvrgN+nYeliM0/ktgwY8w3iawy/86W/Uhg8puL1yC8d/71XuzQTVdMBw9Mgp7U
	8JN14Pi9rCDgAf5aWuMNTXw+g0ZhdmJ0FYi0Ojjsygqm8ZKcXqx+YXM5aclVwN5aayh8z8Drf9WtR
	1knMPJyr6zL6l07fu+su6sGh9Ev1n4+0IVZnE0A+KsQQi+Ly+dllS2WM+C4ML6r2Ur0zu4xFC8VWK
	WtluXfc8eLEZPcYtkpPsm2m2kG48gQfywGKXnPdz/Ae+XMurJaKC2yuoRTvQyi07kMmC4WlBlphLM
	rTKpVSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9Vz-0000000DSai-1ctF;
	Thu, 19 Nov 2026 21:17:55 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9Vv-0000000DSZy-1rI8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 21:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795123069; bh=BxIuQ0x+zM+x9HyEnukAMenKIXa8hWYpcEyJ67KKCCw=;
 b=SspAqPItOXQbwfSifBYdKwM6LuzeRal6WQu708B4QMDGAutv/5yvm3StbGrJcgNSu68iZmv0A
 x9ABVEHkBmOMMRLTojjD1DDSR83enpFSIm5nmvkADSnI1wSYWcmfZLAIuZDsxDhpss5PFTPJO3O
 P4nvFcYBvs74NgDnRUPfYJ0nXDgj0KmMBPTd6f8IAMddUW7UiU6RslbhArBSFhPLboNEq1z8seb
 /ehrNbOR8YbdxZUlO5BSlTj24+3JkuS3ANXg/dsAo9mFp0nnvY2qH4g7UstingD8FVPvDQ8dWEY
 bsaecjMoazLju61Ch8SeZbC2OfI5Q40LgLogqVDdrwsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795123069; bh=BxIuQ0x+zM+x9HyEnukAMenKIXa8hWYpcEyJ67KKCCw=;
 b=EHJ1w6Ntrl1SjotUSbl7o/1gbXUaFeM60wK7VCHEsF+rsYJEtKvxgUoGqaDicOqpr1adWzTUi
 pX3vd5F9tNWJ0Hfj2QoFBJh4Tu/ZZJsuz/9nL7S+khgcb463R9YIoZa1TwMtxi5cCckDEe5a0gm
 76LZJjO62l20Yi1QbhmI2RU=
CFBL-Feedback-ID: 6aff677a2e4f08e3e6856b7d:717e687073dda47710113f537f5d096f
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff677a2e4f08e3e6856b7d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linusw@kernel.org>,
	Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: rockchip: Fix RK3506 pinctrl support
Date: Thu, 19 Nov 2026 21:17:39 +0000
Message-ID: <20261119211739.566874-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_131751_859276_7D3C8F34 
X-CRM114-Status: GOOD (  17.76  )
X-Spam-Score: -2.0 (--)
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

The pinctrl driver added in commit dbd2317d7b9f ("pinctrl: rockchip:
Add rk3506 pinctrl support") depends on a rockchip,ioc1 property not
documented in dt-bindings to work, i.e. it expects the pinctrl node to
look something like following:

  pinctrl {
	rockchip,pmu = <&gpio0_ioc>;
	rockchip,ioc1 = <&gpio1_ioc>;
	rockchip,grf = <&gpio234_ioc>;

	gpio0 { };
	gpio1 { };
	gpio2 { };
  };

With the commit 63113d4fce6c ("pinctrl: rockchip: Add RV1106 pinctrl
support") the driver gained support for using GPIO bank referenced IO
control register blocks using the rockchip,grf phandle of the bank node.

Change the driver to work with dt-bindings documented nodes and
properties, i.e. something like:

  pinctrl {
	rockchip,grf = <&gpio234_ioc>;

	gpio0 {
		rockchip,grf = <&gpio0_ioc>;
	};
	gpio1 {
		rockchip,grf = <&gpio1_ioc>;
	};
	gpio2 { };
  };

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
The initial devicetree submitted for RK3506 at [1] uses rockchip,grf
props in gpio0 and gpio1 nodes together with a rockchip,grf in the
pinctrl node to work as the fallback for gpio2, gpi3 and gpio4.

[1] http://patch.msgid.link/20261119152055.556266-3-jonas@kwiboo.se/
---
 drivers/pinctrl/pinctrl-rockchip.c | 49 ++++++++++++------------------
 drivers/pinctrl/pinctrl-rockchip.h |  1 -
 2 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index b78be7dd5342..563c3ffcfe4a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1335,12 +1335,8 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
-	if (ctrl->type == RK3506) {
-		if (bank->bank_num == 1)
-			regmap = info->regmap_ioc1;
-		else if (bank->bank_num == 4)
-			return 0;
-	}
+	if (ctrl->type == RK3506 && bank->bank_num == 4)
+		return 0;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -1492,12 +1488,8 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
-	if (ctrl->type == RK3506) {
-		if (bank->bank_num == 1)
-			regmap = info->regmap_ioc1;
-		else if (bank->bank_num == 4)
-			return 0;
-	}
+	if (ctrl->type == RK3506 && bank->bank_num == 4)
+		return 0;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -2568,9 +2560,13 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2584,7 +2580,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_DRV_GPIO1_OFFSET;
 		else
@@ -2592,7 +2587,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_DRV_GPIO2_OFFSET;
 		else
@@ -2600,7 +2594,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_DRV_GPIO3_OFFSET;
 		else
@@ -2608,7 +2601,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -2653,9 +2645,13 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2669,7 +2665,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_PULL_GPIO1_OFFSET;
 		else
@@ -2677,7 +2672,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_PULL_GPIO2_OFFSET;
 		else
@@ -2685,7 +2679,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_PULL_GPIO3_OFFSET;
 		else
@@ -2693,7 +2686,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -2739,9 +2731,13 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2755,7 +2751,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_SMT_GPIO1_OFFSET;
 		else
@@ -2763,7 +2758,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_SMT_GPIO2_OFFSET;
 		else
@@ -2771,7 +2765,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_SMT_GPIO3_OFFSET;
 		else
@@ -2779,7 +2772,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -5030,9 +5022,6 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the pmu syscon */
 	info->regmap_pmu = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,pmu");
 
-	/* try to find the optional reference to the ioc1 syscon */
-	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
-
 	if (ctrl->type == RK3308) {
 		ret = rk3308_soc_data_init(info);
 		if (ret)
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 553197f6dc69..b565f14254d8 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -468,7 +468,6 @@ struct rockchip_pinctrl {
 	int				reg_size;
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
-	struct regmap			*regmap_ioc1;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
-- 
2.56.1


