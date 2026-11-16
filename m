Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975FE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRwmKhIB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W872M/3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=; b=BRwmKhIBXMgyrE
	hv5zK3YgIFYfm7+QNjcg2W6fxYz1CcvRXbGsFoQ0vnasAu3nytRNeDKXs2wbPss/hl1VC3SE9Co0P
	aPw7z9Tkn+Fyp/tpAaw9hhVNzA0orEGpQ9cxdS4pBxL1VIjD4yDgSpnqToZ6mLnTmYN6vFxrUMvAq
	ub+RrqQ105cWQ9wA060WCPV2MhubGdY9qlxRPTL7ppKQ9rTpiqgn7C1y1mDWf7AYx6i6mopFdF4Eo
	6fZbTBqF9oeC4lU7h5aGqVhgQWNPXSbIizNBk69VTnm4f4f445347x15o1rSqulAu8uIEQgYLdQBA
	a4bmudTGayxCcd7c9k2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1jB-00000003dP7-2FnN;
	Mon, 16 Nov 2026 18:46:53 +0000
Received: from mail-oa2-x09.google.com ([2607:f8b0:4864:30::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1j2-00000003dJv-2kAt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:46:45 +0000
Received: by mail-oa2-x09.google.com with SMTP id 586e51a60fabf-4abbe52a747so1408819fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854803; x=1795459603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=W872M/3/TcyD1Bq6SpE+FB2KrCqfmq67pTI1wrECfbQFg23ahjFHNLGhAHH3uZ4e3M
         TdYKSu/opCqhhUdqSsftqaJacu4U1+LuurswDupawN1oeKjYR4Zf4vf9zumvaJCVMKTK
         OPErs/zy9CrJslB3qbZEHXZzrpOwTlA9WeqIyX5dDZi4CgJ8GZYeHz4bH87yA/Jl2h6R
         iy90Mdk3SWyncgFNcZJo+FOd5Cqz244remZ5SCb4KS4Oc99c5Wr7lDOmXLnaHAXJ8398
         y+h1UGCMKEzJvMPUmT7NwZi4mpTuLBhpyorMLNGFwolGPGfwPPRpO+Bq/mN7gjAIl6nm
         6YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854803; x=1795459603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=GNWyJfD2wC6QiYaLrf45ca6k45PxKY9SyQGWCNnZbFnkX86WXylZMRtiV3cSD/syK6
         81QgbGdBL0QX1M3JbUhtNiM+Yq4Ans7upOvKAjCbEK41Nxkk8TZb0a1MRvD0Iouw++BU
         PVrnsV2dSufxqTXW84+pkMQYbfexku0AhXfEuOzHNrE72BDV7MCjbXUIbaFkm3BjgclQ
         FZxXGUenzRdSOSIrBtsDaU8/uCfbXXzI7GhIZQd6bFt23AY6sxWOVWqYUi8lNW86fP0i
         uqZKVHwwmT4JtXnheKmnFpRPq47bPR0lWpKWnvaoLKhksMcXIwULQRVFpitviXm0rwM+
         FtUw==
X-Forwarded-Encrypted: i=1; AL+hErFDmpI6E5jvrSp6bzpUq4nYxyj2v3p348DAZodClNrIxcyrSKM4cCjwmX45FfBS3f2NXus91CIEoYId6yLkY2G/@lists.infradead.org
X-Gm-Message-State: APuU4Z/igDWH8GII5dS+vqXAGiWcw5C51YXBD7sTUCqcof2Nndb429MU
	77aZj8Q2l3XkMEcSR0610uUSlPzvHbudiJHdi+/9qFP7HHypLw8CTJR6
X-Gm-Gg: AYBFou3lFOx+YaRT7dPHPQ2PSTQ8KFghA22PZa/e85CoVIKkVs2Rp1oA8HKsE8St3rQ
	+Mh2Yb274mzsaTWELihVlr2mR9ZVosIXdNdePTFPx6kd1+DjBpHmpQm+EFnRFkoNRdASSXees3y
	KnmKBf/OqNbkTYVo0rj3ehXiq5B5BL/514u0/llbuZwjdCbyN4/YG03g71EPSb6lwt2Os0Z52Vf
	BAoZAWilxYAgx0aV5pe0nvoU/tQ6DBJbY2JLxSelReLRXusHeB5qHJ9rWzz4wwPVmurwOTDaWRM
	FiQGilR9D2jv00FsC91uro1eRaX/sxSOzlRo82IcwQRCcmyULqrQY+Rf/GJE3Yjp3BYNDyzzinh
	m26N0Elhw75pq3Rvt/92+9MfFnudCF5LAb7ATa5V1x0DdOvbkJor1RPLnnZiQixwvpgIaKsoMvJ
	WNZUBEYJ38mmaz1JbTbad9mPSAlj6ZDEDYVG5hKzdCrnYClJY9y+5jNBibdH0yJnSWCFgz7vqgC
	fkVkyvGc0YCF3uxfnF5Bzq0ms74sONCHAloLh8k4K61MrIQl7SBZ/OPhQPjxxEy4LcyG5gygNoS
	JJjBCqfwYYJY73JEmuhStxDpe4izv2cjRmMHIUjaNQU23IxiwSxGm7Em/07LFpWUGBxN5GMxHOf
	+kHSsluuZ4DwsqllfChI=
X-Received: by 2002:a05:6870:1794:b0:448:c946:9ae1 with SMTP id 586e51a60fabf-4afdf492de7mr9534453fac.18.1794854803469;
        Mon, 16 Nov 2026 10:46:43 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:34 -0600
Subject: [PATCH v3 2/2] rtc: mt6397: provide the 32 kHz output as a clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-2-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=4985;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5Ww9Gje6b1XRBnVHPbGKqTnDhZK8UEbEzy3EbOlGhe8=;
 b=0RKmfCD3eY+/9AN9a1rhsVOFhEDM/PpOvKN0oMv1Ca3hnbVA3HFzfLgmOVAArB7TAbJEd394l
 xnjgKaYm14uBsCI5inKdYxKpwUyUOaFw96x0xaydSQa3fLA0llXYaqC
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_104644_730407_2CB8CB05 
X-CRM114-Status: GOOD (  20.88  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RTC's 32 kHz output is gated by RTC_CON.F32KOB, which the vendor
kernel clears before it powers the Wi-Fi/Bluetooth combo chip. Mainline
never touches it, so on a board whose bootloader leaves it set, such a
chip has no sleep clock and does not come up.

Register the output as a clock when the RTC node has #clock-cells, so
the chip's power sequence can enable it.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 88 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 94 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5afdb707a5b5..d24f0ccc132c 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -318,6 +319,87 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap,
+				 rtc->addr_base + rtc->data->control_reg,
+				 RTC_CON_F32KOB, on ? 0 : RTC_CON_F32KOB);
+	if (!ret)
+		ret = mtk_rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
+static int mtk_rtc_clkout_prepare(struct clk_hw *hw)
+{
+	return mtk_rtc_clkout_set(hw, true);
+}
+
+static void mtk_rtc_clkout_unprepare(struct clk_hw *hw)
+{
+	mtk_rtc_clkout_set(hw, false);
+}
+
+static int mtk_rtc_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	u32 control;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->control_reg,
+			&control))
+		return 0;
+
+	return !(control & RTC_CON_F32KOB);
+}
+
+static unsigned long mtk_rtc_clkout_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	return 32768;
+}
+
+static const struct clk_ops mtk_rtc_clkout_ops = {
+	.prepare = mtk_rtc_clkout_prepare,
+	.unprepare = mtk_rtc_clkout_unprepare,
+	.is_prepared = mtk_rtc_clkout_is_prepared,
+	.recalc_rate = mtk_rtc_clkout_recalc_rate,
+};
+
+/* The 32 kHz output the PMIC drives to other chips, such as a combo chip */
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	struct clk_init_data init = {
+		.name = "mt6397-rtc-32k",
+		.ops = &mtk_rtc_clkout_ops,
+	};
+	int ret;
+
+	if (!of_property_present(dev->of_node, "#clock-cells") ||
+	    !rtc->data->control_reg)
+		return 0;
+
+	rtc->clkout.init = &init;
+
+	ret = devm_clk_hw_register(dev, &rtc->clkout);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &rtc->clkout);
+}
+#else
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	return 0;
+}
+#endif
+
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -381,6 +463,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -417,6 +504,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.write_trigger_reg = RTC_WRTGR_MT6397,
+	.control_reg = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 44d2b2cb1ff7..986b3aaaeb35 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_MFD_MT6397_RTC_H_
 #define _LINUX_MFD_MT6397_RTC_H_
 
+#include <linux/clk-provider.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
@@ -22,6 +23,9 @@
 #define RTC_WRTGR_MT6397       0x003c
 #define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
 
+#define RTC_CON_MT6397         0x003e
+#define RTC_CON_F32KOB         BIT(5)
+
 #define RTC_IRQ_STA            0x0002
 #define RTC_IRQ_STA_AL         BIT(0)
 #define RTC_IRQ_STA_LP         BIT(3)
@@ -72,6 +76,7 @@
 
 struct mtk_rtc_data {
 	u32                     write_trigger_reg;
+	u32                     control_reg;
 };
 
 struct mt6397_rtc {
@@ -83,6 +88,7 @@ struct mt6397_rtc {
 	int                     irq;
 	u32                     addr_base;
 	const struct mtk_rtc_data *data;
+	struct clk_hw           clkout;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
2.56.0


